class MessagesController < ApplicationController
  def inbox
  end
  
  def show
     @copy = current_user.request_copies.find(params[:id])
     @replies = current_user.request_replies.where(:request_copy_id => @copy.id)
  end
  
  def create
    #if current_user.nil?
      @reply = RequestReply.new(params[:request_reply])
    #else
    # @reply = RequestCopy.request_reply.new(params[:request_reply]) #Request.new(params[:request])    
    #end
    respond_to do |format|
      if @reply.save
        format.html { redirect_to(inbox_url(), :notice => 'Reply was successfully send.') }
        format.json { render json: @reply, status: :created, location: @request }
      else
        format.html { render action: "" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def sent
    
    @messages = current_user.requests.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

end
