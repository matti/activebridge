require_relative "../lib/active_bridge"

3.times do
  started_at = Time.now

  sleep amount = rand
  throttled = throttle started_at, 1

  sum = amount + throttled
  puts "amount: #{amount}, throttled: #{throttled}, sum: #{sum}"
end
