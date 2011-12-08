class ProsController < ApplicationController
  # GET /pros
  # GET /pros.json
  def index
    #@pros = Pro.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @pros }
    #end
    @pro = current_user.pro
    @address = @pro.address
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pro }
    end
  end

  # GET /pros/1
  # GET /pros/1.json
  def show
    @pro = Pro.find(params[:id])
    @address = @pro.address
    
    if current_user.pro.pictures.exists?
      @pictures = current_user.pro.pictures.first()  
    end
    
    if current_user.pro.services.exists?
      @services = current_user.pro.services
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pro }
    end
  end

  # GET /pros/new
  # GET /pros/new.json
  def new
    @pro = Pro.new
    @address = Address.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pro }
    end
  end

  # GET /pros/1/edit
  def edit
    #@pro = Pro.find(params[:id])
     @pro = current_user.pro
     
     if @pro.nil?
        @pro = Pro.new
        @address = Address.new
     elsif
       @address = @pro.address
     end
  end

  # POST /pros
  # POST /pros.json
  def create
    #@pro = Pro.new(params[:pro])
    @pro =current_user.build_pro(params[:pro])
    
    respond_to do |format|
      if @pro.save
        format.html { redirect_to @pro, notice: 'Pro was successfully created.' }
        #format.html { redirect_to(:action => "index") }
        format.json { render json: @pro, status: :created, location: @pro }
      else
        format.html { render action: "edit" }
        format.json { render json: @pro.errors, status: :unprocessable_entity }
      end
    end   
  end

  # PUT /pros/1
  # PUT /pros/1.json
  def update
    #@pro = Pro.find(params[:id])
    @pro = current_user.pro
    
    respond_to do |format|
      if @pro.update_attributes(params[:pro])
        format.html { redirect_to @pro, notice: 'Pro was successfully updated.' }
        format.json { head :ok }
        #format.js 
      else
        format.html { render action: "edit" }
        format.json { render json: @pro.errors, status: :unprocessable_entity }
      end
    end
    
  end

 def services
    @service = Service.new
    
    if current_user.pro.services.exists?
      @services = current_user.pro.services
    end
    
    respond_to do |format|
      format.html # edit_service.html.erb
      format.json { head :ok }#format.xml  { render :xml => @services }
    end
 end

 def photos
     @picture = Picture.new
    
    if current_user.pro.pictures.exists?
      @pictures = current_user.pro.pictures.first()  
    end
    
    respond_to do |format|
      format.html # edit_service.html.erb
      format.json { head :ok }#format.xml  { render :xml => @avatars }
    end
 end
 
def edit_photo
     @picture = Picture.new
    
    if current_user.pro.pictures.exists?
      @pictures = current_user.pro.pictures.first()  
    end
    
    respond_to do |format|
      format.html # edit_service.html.erb
      format.json { head :ok }#format.xml  { render :xml => @avatars }
    end
 end
  # DELETE /pros/1
  # DELETE /pros/1.json
  def destroy
    @pro = Pro.find(params[:id])
    @pro.destroy

    respond_to do |format|
      format.html { redirect_to pros_url }
      format.json { head :ok }
    end
  end
end
