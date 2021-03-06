# algo:
# - init a value to 0
# - init a multiplier to 0
# - forever
#   - if the value is 0
#     - set the value to 1
#   - else
#     - set the value to the value times the multiplier
#   - store the result in a yielder (an arr ?)
#   - incr the muliplier

# factorial = Enumerator.new do |yielder|
#   value = 0
#   mult = 0
#   loop do
#     value = value == 0 ? 1 : value * mult
#     yielder << value
#     mult += 1
#   end
# end

factorial = Enumerator.new do |yielder|
  f0 = f1 = 1
  loop do
    yielder << f0 # save the f0 value
    f0, f1 = f0 * f1, f1 + 1
  end
end

p factorial.take(7) # => [1, 1, 2, 6, 24, 120, 720]

7.times do
  puts factorial.next # external iteration
end

# factorial.rewind # reset the enum sequence # not needed here ...

# ... 'each'-type methods start iteration at the beginning of the sequence
factorial.each_with_index do |fac, ndx| # internal iteration
  break if ndx >= 7
  puts fac
end
