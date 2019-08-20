class ScrumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :index, :show]

  def show
    @scrum = Scrum.new
    if params[:scrum]
      @date = params[:scrum][:date]
      respond_to do |format|
        # format.html { redirect_to scrum_path }
        format.js
      end
    else
      @date = Date.today
    end
    # if current_user.scrums.where(date: @date).exists?
    #   @purpose = "edit"
    #   @scrum = params[:scrum]
    # else
    #   @purpose = "new"
    #   @scrum = Scrum.new
    # end
  end

  def new
    
  end
  
  def create
    @scrum = current_user.scrums.build(scrum_params)
    flash[:success] = "its working"
    if @scrum.save
      flash[:success] = "The scrum details have been saved!"
    else
      respond_to do |format|
        format.html { redirect_to scrum_path }
        format.js
      end
    end
    redirect_to scrum_path
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