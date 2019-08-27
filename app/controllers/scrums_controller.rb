class ScrumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :show]
  
  def show
    if params[:scrum]  #after selecting date
      @date = params[:scrum][:date]
      @first_time = "no"
    else               #before selecting date
      @date = Date.today
      @first_time = "yes"
    end
    if Scrum.exists?(user_id: current_user.id, date: @date)
      @scrum = current_user.scrums.where(date: @date).first
    else
      @scrum = Scrum.new
    end
  end
  
  def create
    @scrum = current_user.scrums.build(scrum_params)
    if @scrum.save
      respond_with(@scrum) do |format|
        format.js { render action: "toastr.success(saved)", layout: false }
      end
    else
      redirect_to scrum_path
    end
  end
  
  def update
    @scrum = Scrum.find(params[:id])
    if @scrum.update_attributes(scrum_params)
      respond_with(@scrum) do |format|
        format.js
      end
    else
      redirect_to scrum_path
    end
  end
  
  private
    def scrum_params
      params.require(:scrum).permit(:date, :yesterday, :blockers, :today)
    end

end