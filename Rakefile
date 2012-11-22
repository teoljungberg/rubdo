#!/usr/bin/env rake
require "bundler/gem_tasks"

task :default => :spec
desc 'Run all tests' do
  task :spec do
    `rspec --color --format nested spec/*`
  end
end
