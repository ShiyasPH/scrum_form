class ScrumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :index, :show]
  
  def show
    @date = params[:scrum] ? params[:scrum][:date] : Date.today
    @date = @date.to_date
    if current_user.scrums.where(date: @date).exists?
      @purpose = "edit"
      @scrum = Scrum.find(params[:id])
    else
      @purpose = "new"
    end
  end

  def create
    @scrum = current_user.scrums.build(scrum_params)
    if @scrum.save
      flash[:success] = "The scrum details have been saved!"
    else
      flash[:alert] = "The scrum details could not be saved!"
    end
    redirect_to(scrum_path)
  end
  
  def edit
    @scrum = Scrum.find(params[:id])
  end

  def update
    @scrum = Scrum.find(params[:id])
    if @scrum.update_attributes(scrum_params)
      flash[:success] = "The scrum details have been updated"
    else
      flash[:success] = "The scrum details could not be updated"
    end
    redirect_to(scrum_path)
  end

  private
    def scrum_params
      params.require(:scrum).permit(:date, :yesterday, :blockers, :today)
    end

end