class SentController < ApplicationController
  layout "mailbox_layout"
  def index
     @requests = current_user.requests#.paginate (:per_page => 10, :page => params[:page], :order => "created_at DESC")
  end

  def show
    @message = current_user.requests.find(params[:id])
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])
    
    if @message.save
      flash[:notice] = "Message sent."
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
end
