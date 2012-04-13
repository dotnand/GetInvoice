class HomesController < ApplicationController
  def index
    #@homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(params[:home])
    if @home.save
      redirect_to @home, :notice => "Successfully created home."
    else
      render :action => 'new'
    end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    if @home.update_attributes(params[:home])
      redirect_to @home, :notice  => "Successfully updated home."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_url, :notice => "Successfully destroyed home."
  end
end
