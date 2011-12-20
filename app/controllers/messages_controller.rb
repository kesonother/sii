class MessagesController < ApplicationController
  def inbox
  end
  
  def show
     @message = current_user.request_copies.find(params[:id])
  end
  
  def sent
    
    @messages = current_user.requests.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

end
