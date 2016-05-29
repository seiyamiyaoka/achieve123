def fizzbuzz(num)
  return :fizzbuzz if num % 15 == 0
  return :fizz if num % 5 == 0
  return :buzz if num % 3 == 0
  num
end
fizz_buzz = []
(1..100).each do |num|
  fizz_buzz << fizzbuzz(num)
end
fizz_buzz.each do |i|
 puts i
end
