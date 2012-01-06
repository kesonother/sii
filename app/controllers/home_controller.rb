class HomeController < ApplicationController
  
    def index
      @ip = request.remote_ip  
    end
    
    def search
      @pros = Pro.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pros }
      end
    end
      
    def paris
      
    end

end
