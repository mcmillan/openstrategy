class StaticController < ActionController::Base
  def nope
    render layout: false, status: :gone
  end
end
