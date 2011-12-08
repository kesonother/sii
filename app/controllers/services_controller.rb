class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services = current_user.pro.services#Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = current_user.pro.services.find(params[:id])#Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    #@service = Service.find(params[:id])
    @service = current_user.pro.services.find(params[:id])
    if current_user.pro.services.exists?
      @services = current_user.pro.services
    end
  end

  # POST /services
  # POST /services.json
  def create
    #@service = Service.new(params[:service])
    @service =current_user.pro.services.new(params[:service])
    
    respond_to do |format|
      if @service.save
        @services = current_user.pro.services
        
        format.html { redirect_to(edit_services_url(:id => current_user.pro), :notice => 'Service was successfully created.') }
        #format.html { redirect_to @service, notice: 'Service was successfully created.' }
        #format.json { render json: @service, status: :created, location: @service }
        format.js
      else
        format.html { render :template => 'pros/services' }
        #format.html { render action: "new" }
        #format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    #@service = Service.find(params[:id])
    @service = current_user.pro.services.find(params[:id])
    
    respond_to do |format|
      if @service.update_attributes(params[:service])
        #format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.html { redirect_to(edit_services_url(:id => current_user.pro), :notice => 'Service mis &agrave; jour avec succ&egrave;s.')}
        format.json { head :ok }
        #format.js   { render :nothing => true } 
      else
        #format.html { render action: "edit" }
        format.html { redirect_to(pros_services_path)}
        format.json { render json: @service.errors, status: :unprocessable_entity }
        #format.js   { render :nothing => true } 
      end
    end
    
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    #@service = Service.find(params[:id])
    @service = current_user.pro.services.find(params[:id])
    @service.destroy

    respond_to do |format|
      #format.html { redirect_to services_url }
      format.html { redirect_to(pros_services_path, :notice => 'Service mis &agrave; jour avec succ&egrave;s.')}
      format.json { head :ok }
    end
  end
end
