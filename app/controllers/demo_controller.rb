class DemoController < ApplicationController
  
  layout false

  def index
  end

  def other_index
    redirect_to(action:index)
  end
end
