require "bundler/gem_tasks"
require 'rake/testtask'


Rake::TestTask.new do |t|
      t.libs << `find test -type d`.split("\n")
      t.test_files = FileList['test/**/*_test.rb']
      t.verbose = true
end



