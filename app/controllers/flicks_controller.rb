class FlicksController < ApplicationController
  def new
    @flick = Flick.new
  end

  def create
    @flick = Flick.new(
      name: params[:flick][:name],
      year: params[:flick][:year],
      synopsis: params[:flick][:synopsis]
    )

    if @flick.save
      redirect_to root_path
    else
      # if params[:flick][:year].to_i == 0
      #   @flick.errors[:base] << "Year is not a number"
      # end
      # if params[:flick][:year] == ""
      #   @flick.errors[:base] << "Year can't be blank"
      # end
      render :new
    end
  end

end