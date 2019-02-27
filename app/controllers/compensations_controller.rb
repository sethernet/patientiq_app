class CompensationsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit]
  before_action :load_employee
  before_action :authenticate_user!

  def index
    @compensation = @employee.compensation
  end

  def show
    if !@employee.compensation
      @employee.create_compensation
    end
    @compensation = @employee.compensation
  end

  def new
    @compensation = @employee.build_compensation
  end

  def edit
    @compensation = @employee.compensation
  end

  def create
    @compensation = @employee.build_compensation(compensation_params)

    respond_to do |format|
      if @compensation.save
        format.html { redirect_to [@employee, @compensation], notice: 'Compensation was successfully created.' }
        format.json { render :show, status: :created, location: @compensation }
      else
        format.html { render :new }
        format.json { render json: @compensation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @compensation = @employee.compensation

    respond_to do |format|
      if @compensation.update(compensation_params)
        format.html { redirect_to [@employee, @compensation], notice: 'Compensation was successfully updated.' }
        format.json { render :show, status: :ok, location: @compensation }
      else
        format.html { render :edit }
        format.json { render json: @compensation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @compensation = @employee.compensation.find(params[:id])
    @compensation.destroy
    respond_to do |format|
      format.html { redirect_to compensations_url, notice: 'Compensation was successfully destroyed.' }
      format.html { redirect_to employees_compensations_path(@employee) }
      format.json { head :no_content }
    end
  end

  private

    def compensation_params
      params.require(:compensation).permit(:salary, :bonus, :employee_id, :id)
    end

    def load_employee
      @employee = Employee.find(params[:employee_id])
    end

end
