def bil
  rent = 22500
  puts '水道代を入れてください'
    water_bil = gets.to_i
  puts '電気代を入れてください'
    electric_bil = gets.to_i
  puts 'ガス代を入れてください'
    gas_bil = gets.to_i
  puts '家賃は22500円です'
  sleep 2
  sum = (water_bil - 750) + (electric_bil - 1100) + (gas_bil - 1000) + rent
  puts "合計は#{sum}円です"


end
bil
