class ConsumersController < ApplicationController
  def index
    @consumers = Consumer.all
  end

  def new
    @consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(params[:consumer])
    
    if @consumer.save
      flash[:notice] = "Consumer added"
      redirect_to consumers_url 
    else
      render :new
    end
  end

  def destroy
    @consumer = Consumer.find(params[:id])
    @consumer.destroy
    redirect_to consumers_url
  end

end
