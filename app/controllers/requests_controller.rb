class RequestsController < ApplicationController
  
  def create
    @dell = Dellivary.new(params[:request][:width], 
    params[:request][:length],
    params[:request][:height], 
    params[:request][:weight], 
    params[:request][:start_point],
    params[:request][:finish_point])
    
    @request = Request.create(
      name: params[:request][:name],
      second_name: params[:request][:second_name],
      surname: params[:request][:surname],
      number: params[:request][:number],
      email: params[:request][:email],
      weight: params[:request][:weight],
      length: params[:request][:length],
      width: params[:request][:width],
      height: params[:request][:height],
      start_point: params[:request][:start_point],
      finish_point: params[:request][:finish_point],
      distance: @dell.put, price: @dell.red)

    redirect_to '/requests'
  end
  def update
    @request = Request.find(params[:id])
    @request.update(
      name: params[:request][:name],
      second_name: params[:request][:second_name],
      surname: params[:request][:surname],
      number: params[:request][:number],
      email: params[:request][:email],
      weight: params[:request][:weight],
      length: params[:request][:length],
      width: params[:request][:width],
      height: params[:request][:height],
      start_point: params[:request][:start_point],
      finish_point: params[:request][:finish_point]
    )  
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to '/requests'
  end
  
  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def index
  @request =Request.all
  end
end
