class Admins::ChargesController < ApplicationController
  def new
  	@charge = Charge.new
  end

  def create
  	@charge = Charge.new(charge_params)
    if @charge.save
      flash[:success] = 'charge was successfully created.'
      redirect_to admins_users_path
    else
      redirect_to admins_users_path
    end
  end

  def edit
  end

  private
    def charge_params
   	  params.require(:charge).permit(:name)
    end
end
