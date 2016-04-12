
class Ruler
  attr_accessor :length

  def display
    puts length
  end
end
ruler = Ruler.new
ruler.length = 30
puts ruler.display
