class HomeController < ApplicationController
  
    def index
      @ip = request.remote_ip  
    end
    
    def show_pro

    @pro = Pro.find_by_business_name(params[:business_name])
    @address = @pro.address
    
    if @pro.pictures.exists?
      @pictures = @pro.pictures.first()  
    end
    
    if @pro.services.exists?
      @services = @pro.services
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pro }
    end
    end

end
