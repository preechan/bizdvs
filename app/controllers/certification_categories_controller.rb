class CertificationCategoriesController < ApplicationController
  before_action :set_certification_category, only: [:show, :edit, :update, :destroy]

  respond_to :html
  load_and_authorize_resource
  def certification
    @certification_categories = CertificationCategory.where(contractor_id: params[:contractor_id]).order("created_at DESC")
  end


   def import
    @tradesMenu = Trade.all
    CertificationCategory.import(params[:file])
    redirect_to root_url, notice: "Certification Categories imported."
  end

  def index
    @certification_categories = CertificationCategory.all
    respond_with(@certification_categories)
  end

  def show
    respond_with(@certification_category)
  end

  def new
    @certification_category = CertificationCategory.new
    respond_with(@certification_category)
  end

  def edit
  end


  def create
    @certification_category = CertificationCategory.new(certification_category_params)
    @certification_category.contractor_id = params[:contractor_id]
    @certification_category.save
    respond_with(@certification_category)
  end

  def update
    @certification_category.update(certification_category_params)
    respond_with(@certification_category)
  end

  def destroy
    @certification_category.destroy
    respond_with(@certification_category)
  end

  private
    def set_certification_category
      @certification_category = CertificationCategory.find(params[:id])
    end

    def certification_category_params
      params.require(:certification_category).permit(:certificationCategory, :microDiscount)
    end
end
