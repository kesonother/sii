class MailboxController < ApplicationController
  def index
    
    @folder = current_user.inbox
    show
    render :action => "show"
  end

  def show
    @folder ||= current_user.folders.find(params[:id])
    @requests = @folder.request_copies
  end

end
