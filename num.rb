# MAX = 10
# STEP = 4
# def move(a, b)
#   return 0 if a > b
#   return 1 if a == b
#   cnt = 0
#   (1..STEP).each do |au|
#     (1..STEP).each do |bd|
#       cnt += move(a + au, b - bd)
#     end
#   end
#   cnt
# end
# puts move(0, MAX)


# cnt = 0
# (0..9).to_a.permutation do |r, e, a, d, w, i, t, l, k, s|
#   next if r == 0 or w == 0 or t == 0 or s == 0
#   read = r * 1000 + e * 100 + a * 10 + d
#   write = w * 10000 + r * 1000 + i * 100 + t * 10 + e
#   talk = t * 1000 + a * 100 + l * 10 + k
#   skill =  s * 10000 + k * 1000 + i * 100 + l * 10 + l
#
#   if read + write + talk == skill
#     cnt += 1
#     puts "#{read} + #{write} + #{talk} = #{skill}"
#   end
# end
# puts cnt

# expression = "READ + WRITE+ TALK == SKILL"
# nums = expression.split(/[^a-zA-Z]/)
# chars = nums.join().split("")
# head = nums.map{ |num| num[0]}
# cnt = 0
# (0..9).to_a.permutation(chars.size) do |i|
#   is_zero_first = false
#   if i.include?(0)
#     is_zero_first = head.include?(chars[i.index(0)])
#   end
#   if !is_zero_first
#     e = expression.tr(chars.join(), i.join())
#     if eval(e)
#       puts e
#       count += 1
#     end
#   end
# end
# puts cnt





# magic_square = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]
# sum = Hash.new(0)
# 1.upto(magic_square.size) do |i|
#   magic_square.combination(i) do |set|
#     sum[set.inject(:+)] += 1
#   end
# end
# puts sum.max{ |x,y| x[1] <=> y[1]}
# magic_square = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]
# sum_all = magic_square.inject(:+)
# # 133個の空の配列を作成する.最後のカッコで０を設置する
# sum = Array.new(sum_all + 1){0}
# sum[0] = 1
# magic_square.each do |i|
#   (sum_all - i).downto(0).each do |n|
#     puts sum[n + i] += sum[n]
#   end
# end
# puts sum.find_index(sum.max)
# n = 16
# pair = Array.new(n / 2 + 1)
# pair[0] = 1
#
# 1.upto(n/2) do |i|
#   pair[i] = 0
#   i.times do |n|
#     pair[i] += pair[n] * pair[i - n - 1]
#   end
# end
# puts pair[n / 2]


def f(n)
  @count  ||= Hash.new(0)
  @count[n] += 1
  return n if n <= 1
  return f(n-1) + f(n-2)
end

puts f(10)
puts @count

def f_memo(n)
  @cache ||= Array.new
  @count_memo ||= Hash.new(0)
  @count_memo[n] += 1
  return n if n <= 1
  @cache[n] ||= f_memo(n-1) + f_memo(n-2)
  return @cache[n]
end
puts f_memo(7)
puts @cache
puts @count_memo
