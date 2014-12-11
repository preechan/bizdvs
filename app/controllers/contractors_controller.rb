class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]


  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.order('contractors.name ASC').all
    @contractors.each do |contractor|
    @contractor_trades = ContractorsTrades.where('contractor_id' => contractor[:id])
        @trades = Array.new
        @contractor_trades.each do |ct|
          #@trade = Trade.find(ct["trade_id"])
          @trades  << Trade.find(ct["trade_id"])
        end
    end
  end

   def import
    Contractor.import(params[:file])
    redirect_to root_url, notice: "Contractors imported."
  end

  # GET /contractors/1
  # GET /contractors/1.json
  def show
        @contractor_trades = ContractorsTrades.where('contractor_id' => params[:id])
        @trades = Array.new
        @contractor_trades.each do |ct|
          #@trade = Trade.find(ct["trade_id"])
          @trades  << Trade.find(ct["trade_id"])
        end
  end

  # GET /contractors/new
  def new
    @contractor = Contractor.new
   
  end

  # GET /contractors/1/edit
  def edit
     @trades = Trade.all
      @contractor_trades = ContractorsTrades.where('contractor_id' => params[:id])
        @selectedtrades = Array.new
        @contractor_trades.each do |ct|
          #@trade = Trade.find(ct["trade_id"])
          @selectedtrades  << Trade.find(ct["trade_id"])
        end
  end

  # POST /contractors
  # POST /contractors.json
  def create
    @contractor = Contractor.new(contractor_params)
    @trades = Trade.where(:id => params[:trade_id])
    @contractor.trades << @trades 
#associate the selected trades to the contractors and create records in the join table
    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)    
      @contractor = Contractor.find(params[:id])
      @trades = Trade.where(:id => params[:trade_id])
      @contractor.trades.destroy_all   #disassociate the already added organizers
      @contractor.trades << @trades 
      #associate the selected organizers to the event and create records in the join table
        format.html { redirect_to @contractor, notice: 'Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url, notice: 'Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:name, :licenseNo, :licenseClass, :bondingcapacity, :firstname, :lastname, :address, :city, :state, :zipcode, :phone, :email, :trade, :comments, :logo, :fax, :certificationType, :ownershipType, :sfCertificationNumber, :sfVendorNumber, :firmSize)
    end
end
