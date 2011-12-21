class BidController < ApplicationController
  def show
    @request = current_user.requests.where(params[:request_id]).first
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end 
  end

end
