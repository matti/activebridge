# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

task default: %i[spec standard]

task "e2e" do
  Dir.glob("e2e/*") do |path|
    sh "ruby #{path}"
  end
end
