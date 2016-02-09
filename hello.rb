class Processor
  def process
    protected_process
  end
  def protected_process
    private_process
  end
  protected :protected_process

  def private_process
    puts 'succsecc'
  end
  private :private_process
end

a = Processor.new
a.protected_process
