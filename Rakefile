$LOAD_PATH << '.'
require 'config'

task default: :test

task :test do
  exec("rspec spec")
end

task :fredwina do
  puts Fredwina.move(ENV['FILE_NAME'])
end