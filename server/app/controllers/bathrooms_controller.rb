class BathroomsController < ApplicationController
  def add
    
    @bathroom = Bathroom.create
    
    @bathroom.isHandicapAccessible = params[:isHandicapAccessible]
    @bathroom.isPublic = params[:isPublic]
    @bathroom.isFamily = params[:isFamily]
    @bathroom.isGreen = params[:isGreen]
    @bathroom.isUnisex = params[:isUnisex]
    @bathroom.isHandsFree = params[:isHandsFree]
    @bathroom.hasProductDispenser = params[:hasProductDispenser]
    @bathroom.hasAttendent = params[:hasAttendant]
    @bathroom.hasSignage = params[:hasSignage]
    @bathroom.hasWifi = params[:hasWifi]
    
    @bathroom.save  
    
    render :json => { 'id' => @bathroom.id } 
    # http://something.com/bathroom/add?name=Test&address=Blah&
  end

  def fetch
    #https://something.com/bathroom/fetch?id=23
    @id = params[:id]
  end

  def update
  end

  def delete
  end
end
