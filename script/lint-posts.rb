#!/usr/bin/env ruby
# frozen_string_literal: true

# Enforces the editorial contract that /write/ and /formatting/ describe in prose.
#
# The rules were already written down; they were just not executable. Every check
# below corresponds to a line in the contributor docs, and the error message names
# the page it comes from, so a failing build tells you what to read.
#
#   ruby script/lint-posts.rb            # lint _posts and _drafts
#   ruby script/lint-posts.rb _posts/x.md
#
# Exit status 0 = clean, 1 = at least one error.

require "yaml"
require "date"

# --- the contract ------------------------------------------------------------

SECTIONS = %w[Exposure Policy Method Data Comment].freeze

TAGS = %w[pm2.5 life-expectancy india policy data global].freeze

REQUIRED = %w[title section author standfirst].freeze

# /write/ — "It does not preview what the piece will 'explore', 'examine',
# 'look at' or 'dive into'."
HEDGES = ["explore", "examine", "look at", "looks at", "dive into", "delve into"].freeze

FILENAME = /\A(\d{4})-(\d{2})-(\d{2})-[a-z0-9]+(?:-[a-z0-9]+)*\.(md|markdown)\z/.freeze

MAX_STANDFIRST_WORDS = 45

# --- plumbing ----------------------------------------------------------------

class Linter
  Problem = Struct.new(:file, :message, :doc)

  def initialize
    @problems = []
  end

  attr_reader :problems

  def error(file, message, doc)
    @problems << Problem.new(file, message, doc)
  end

  def lint(path)
    name = File.basename(path)
    # Explicit encoding: posts contain µ, β and en dashes, and Ruby would
    # otherwise read them under whatever LANG happens to be set to.
    raw = File.read(path, encoding: "UTF-8")

    unless raw.start_with?("---")
      error(path, "no YAML front matter", "/formatting/")
      return
    end

    # Split on the closing fence only, so "---" inside the body is safe.
    _, front, body = raw.split(/^---\s*$\n/, 3)

    begin
      meta = YAML.safe_load(front, permitted_classes: [Date, Time], aliases: false) || {}
    rescue Psych::SyntaxError => e
      error(path, "front matter is not valid YAML: #{e.message}", "/formatting/")
      return
    end

    check_filename(path, name)
    check_required(path, meta)
    check_section(path, meta)
    check_tags(path, meta)
    check_standfirst(path, meta)
    check_place_pair(path, meta)
    check_pm25(path, meta)
    check_hardcoded_constants(path, meta, body.to_s)
  end

  private

  def check_filename(path, name)
    return if path.include?("_drafts")

    unless name =~ FILENAME
      error(path, "filename must be YYYY-MM-DD-lowercase-slug.md", "/formatting/")
      return
    end

    y, m, d = Regexp.last_match(1), Regexp.last_match(2), Regexp.last_match(3)
    begin
      date = Date.new(y.to_i, m.to_i, d.to_i)
    rescue ArgumentError
      error(path, "filename date #{y}-#{m}-#{d} is not a real date", "/formatting/")
      return
    end

    if date > Date.today
      error(path, "dated #{date} — Jekyll will not build a post dated in the future", "/formatting/")
    end
  end

  def check_required(path, meta)
    REQUIRED.each do |key|
      value = meta[key]
      if value.nil? || value.to_s.strip.empty?
        error(path, "missing required front matter: #{key}:", "/formatting/")
      end
    end
  end

  def check_section(path, meta)
    section = meta["section"]
    return if section.nil?

    unless SECTIONS.include?(section)
      error(path,
            "section: #{section.inspect} is not one of #{SECTIONS.join(', ')}",
            "/formatting/")
    end
  end

  def check_tags(path, meta)
    tags = meta["tags"]
    return if tags.nil?

    unless tags.is_a?(Array)
      error(path, "tags: must be a list, e.g. [pm2.5, india]", "/formatting/")
      return
    end

    if tags.empty?
      error(path, "tags: is empty — the post will appear under no topic", "/topics/")
    end

    tags.each do |tag|
      next if TAGS.include?(tag.to_s)

      error(path,
            "tag #{tag.to_s.inspect} is not on the topics list (#{TAGS.join(', ')}) " \
            "— it will appear nowhere and do nothing",
            "/topics/")
    end
  end

  def check_standfirst(path, meta)
    standfirst = meta["standfirst"].to_s
    return if standfirst.empty?

    words = standfirst.split(/\s+/).size
    if words > MAX_STANDFIRST_WORDS
      error(path,
            "standfirst is #{words} words — it should be one or two sentences",
            "/write/")
    end

    found = HEDGES.select { |h| standfirst.downcase.include?(h) }
    return if found.empty?

    error(path,
          "standfirst previews rather than reports (#{found.map(&:inspect).join(', ')}) " \
          "— say what the piece found",
          "/write/")
  end

  def check_place_pair(path, meta)
    place = meta["place"]
    pm25  = meta["pm25"]

    if place && pm25.nil?
      error(path, "place: is set but pm25: is not — the ruler needs both", "/formatting/")
    elsif pm25 && (place.nil? || place.to_s.strip.empty?)
      error(path, "pm25: is set but place: is not — the ruler mark would be unlabelled", "/formatting/")
    end
  end

  def check_pm25(path, meta)
    pm25 = meta["pm25"]
    return if pm25.nil?

    unless pm25.is_a?(Numeric)
      error(path, "pm25: must be a bare number in µg/m³, not #{pm25.inspect}", "/formatting/")
      return
    end

    if pm25.negative?
      error(path, "pm25: #{pm25} is negative", "/formatting/")
    elsif pm25 > 300
      error(path, "pm25: #{pm25} µg/m³ is implausibly high — check the units", "/formatting/")
    end
  end

  # /formatting/ — "Never type the WHO guideline or the coefficient. Reference them."
  def check_hardcoded_constants(path, meta, body)
    return unless meta["place"]

    # Strip Liquid and fenced code first: referencing the constant is the
    # correct behaviour, and documenting it is not a violation either.
    prose = body.gsub(/\{%.*?%\}/m, "").gsub(/\{\{.*?\}\}/m, "").gsub(/```.*?```/m, "")

    if prose.match?(/\b0\.098\b/)
      error(path,
            "the coefficient 0.098 is typed into the prose — " \
            "use {{ site.aqli_coefficient }} so it cannot go stale",
            "/formatting/")
    end
  end
end

# --- run ---------------------------------------------------------------------

paths =
  if ARGV.empty?
    Dir.glob("_posts/*.{md,markdown}") + Dir.glob("_drafts/*.{md,markdown}")
  else
    ARGV
  end

linter = Linter.new
paths.sort.each { |path| linter.lint(path) }

if linter.problems.empty?
  puts "editorial lint: #{paths.size} file#{'s' unless paths.size == 1} checked, no problems"
  exit 0
end

by_file = linter.problems.group_by(&:file)
by_file.each do |file, problems|
  puts "\n#{file}"
  problems.each { |p| puts "  ✗ #{p.message}\n    see #{p.doc}" }
end

puts "\neditorial lint: #{linter.problems.size} problem(s) in #{by_file.size} file(s)"
exit 1
