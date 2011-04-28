namespace :test do

  Rake::TestTask.new(:extra => "test:prepare") do |t|
    t.libs << "test"
    t.pattern = 'test/extra/**/*_test.rb'
  end
  Rake::Task['test:extra'].comment = "Run the extra credit tests in test/extra"  

end
