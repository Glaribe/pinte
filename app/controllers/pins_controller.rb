class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :upvote]

  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new
  end

  def create
    pin = Pin.new(pin_params)
    pin.user = current_user
    if pin.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @pin = Pin.destroy
    redirect_to root_path
  end

  def upvote 
    @pin.upvote_by current_user
    redirect_to root_path
  end


  private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end
end