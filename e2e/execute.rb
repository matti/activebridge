require_relative "../lib/active_bridge"

status, took, value = execute do
  sleep 0.2
  [1, 2, 3]
end

puts "status: #{status.inspect}"
puts "took: #{took}"
puts "value: #{value.inspect}"

status, took, value = execute timeout: 0.1 do
  sleep 0.2
  [1, 2, 3]
end

puts "status: #{status.inspect}"
puts "took: #{took}"
puts "value: #{value.inspect}"
