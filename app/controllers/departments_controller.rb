class DepartmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def summary

    sql = "SELECT
              d.name AS department_name,
              e1.name AS employee_name,
              c1.salary AS salary
            FROM employees AS e1
            INNER JOIN departments d
            ON e1.department_id = d.id
            INNER JOIN compensations c1
            ON e1.id = c1.employee_id
            WHERE 3 > (
                       SELECT COUNT(DISTINCT salary)
                       FROM compensations AS c2
                       INNER JOIN employees e2
                       ON e2.id = c2.employee_id
                       WHERE c2.salary > c1.salary
                       AND e1.department_id = e2.department_id
                      )
            ORDER BY
            department_name ASC,
            salary DESC;"

    @summary = ActiveRecord::Base.connection.exec_query(sql)
  end

  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name)
    end

end
