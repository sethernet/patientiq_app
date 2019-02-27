require 'apartment/tenant'

class CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @companies = Company.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to :companies, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :show }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    Apartment::Tenant.drop('tenant_name')
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find_by_subdomain(request.subdomain)
    end

    def company_params
      params.require(:company).permit(:name, :subdomain)
    end
end
