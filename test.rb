require "open-uri"

html = open("http://diveintocode.jp/").read;
file = File.open('seiya.text','w')
file.puts "#{html}"
file.close
