require "bundler/gem_tasks"
require 'rake/testtask'


Rake::TestTask.new do |t|
      t.libs << "test"
      t.libs << "test/sort_tests"
      t.libs << "lib"
      t.libs << "lib/ruby_algorithms/sort"
      t.test_files = FileList['test/**/*_test.rb']
      t.verbose = true
end
