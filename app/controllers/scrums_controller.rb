class ScrumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :show]
  respond_to :html,:json,:xml,:js

  def show
    if params[:scrum]  #after selecting date
      @date =  params[:scrum][:date]
      @first_time = "no"
    else        #before selecting date
      @date = Date.today
      @first_time = "yes"
    end
    if Scrum.exists?(user_id: current_user.id, date: @date)
      @scrum = current_user.scrums.where(date: @date).first
      @action = "update"
    else
      @scrum = Scrum.new
      @action = "create"
    end
  end
  
  def create
    @scrum = current_user.scrums.build(scrum_params)
    if @scrum.save
      flash[:success] = "Successfully saved!"
    else
      flash[:alert] = "Sorry! Could not be saved!"
    end
    respond_with(@scrum) do |format|
      format.js
    end
  end
  
  def update
    @scrum = Scrum.find(params[:id])
    if @scrum.update_attributes(scrum_params)
      flash[:success] = "The scrum-sheet has been updated"
    else
      flash[:alert] = "The scrum-sheet could not be updated"
    end
    respond_with(@scrum) do |format|
      format.js
    end
  end
  
  private
    def scrum_params
      params.require(:scrum).permit(:date, :yesterday, :blockers, :today)
    end

end