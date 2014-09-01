task :default => :test

desc "Run tests through Minitest"
task :test do
  require 'minitest'
  require 'minitest/autorun'

  Dir.glob('test/{test_helper,*_test}.rb').each { |f| require_relative(f) }
end

namespace :web do
  require 'opal/minitest/rake_task'
  Opal.append_path('opal')
  Opal::Minitest::RakeTask.new(:test)
end

Dir.glob(File.dirname(__FILE__) + '/tasks/*.rb').each do |file|
  load file
end
