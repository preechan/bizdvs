class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

def export_email
 if params[:contractor_ids]
    @contractors = Contractor.find(params[:contractor_ids])
    contractor_csv = CSV.generate do |csv|
      csv << ["Name", "Email"]
      @contractors.each do |contractor|
        csv << [contractor.name, contractor.email]  
      end   
    end   
        send_data(contractor_csv, :type => 'text/csv', :filename => 'contractors-Email.csv')
  else 
    redirect_to action: 'index', status: 303
  end 
end

def export_database
if params[:contractor_ids]
    @contractors = Contractor.find(params[:contractor_ids])
    if params[:commit] == "Export Database"
        respond_to do |format|
          format.html
          format.csv do
             headers['Content-Disposition'] = "attachment; filename=\"contractors-Database\""
            headers['Content-Type'] ||= 'text/csv'
          end
        end
  else 
     contractor_csv = CSV.generate do |csv|
      csv << ["Name", "Email"]
      @contractors.each do |contractor|
        csv << [contractor.name, contractor.email]  
      end   
    end   
      send_data(contractor_csv, :type => 'text/csv', :filename => 'contractors-Email.csv')
  end

else 
    redirect_to action: 'index', status: 303
end
end



def tradeFilter
   @contractors = Contractor.joins('LEFT OUTER JOIN contractors_trades ON contractors_trades.contractor_id = contractors.id').where('contractors_trades.trade_id' => params[:trade_id])
   @contractors.each do |contractor|
    @contractor_trades = ContractorsTrades.where('contractor_id' => contractor[:id])
        @trades = Array.new
        @contractor_trades.each do |ct|
          #@trade = Trade.find(ct["trade_id"])
          @trades  << Trade.find(ct["trade_id"])
        end
    end
    @tradesMenu = Trade.all
end 
  # GET /contractors
  # GET /contractors.json
  def index
    if(params[:search])
     @contractors = Contractor.search(params[:search]).order("contractors.name ASC")
   else
    @contractors = Contractor.order('contractors.name ASC').where("city like 'SF' OR city like 'San Francisco'" )
   end
    @contractors.each do |contractor|
    @contractor_trades = ContractorsTrades.where('contractor_id' => contractor[:id])
        @trades = Array.new
        @contractor_trades.each do |ct|
          #@trade = Trade.find(ct["trade_id"])
          @trades  << Trade.find(ct["trade_id"])
        end
    end
    @tradesMenu = Trade.all
  end

   def import
    @tradesMenu = Trade.all
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
         @tradesMenu = Trade.all
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
         @tradesMenu = Trade.all
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
