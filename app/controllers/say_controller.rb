class SayController < ApplicationController
  def hello
    @yo = 'YO seiya'
    @now = Time.now
  end

  def goodbye
  end

  def something
  end
end
