class HomepageController < ApplicationController
  def show
    @flicks = Flick.order(year: :desc)
  end
end