require "require_all"
require_all "lib"

thread = AutoGenerate::Pool.new(10)

thread.schedule(4) do
  puts "hello world"
end
# 4.times.each do
#   thread.schedule do
#     puts "Hello world:"
#   end
# end



thread.run