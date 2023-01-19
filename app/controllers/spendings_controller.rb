 class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: %i[edit update destroy]
  include Filterable
  # GET /spendings or /spendings.json
  def index
    @spendings = Spending.all
  end

  def list
    spendings = filter!(Spending)
    render(template: "spendings/_spendings", locals: { spendings: spendings })
  end

  # GET /spendings/1 or /spendings/1.json
  def show
  end

  # GET /spendings/new
  def new
    #@spending = Spending.new
    @spending = current_user.spending.build()
  end

  # GET /spendings/1/edit
  def edit
  end

  # POST /spendings or /spendings.json
  def create
    #@spending = Spending.new(spending_params)
    @spending = current_user.spending.build(spending_params)

    respond_to do |format|
      if @spending.save
        format.html { redirect_to spending_url(@spending), notice: "Spending was successfully created." }
        format.json { render :show, status: :created, location: @spending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spendings/1 or /spendings/1.json
  def update
    respond_to do |format|
      if @spending.update(spending_params)
        format.html { redirect_to spending_url(@spending), notice: "Spending was successfully updated." }
        format.json { render :show, status: :ok, location: @spending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spendings/1 or /spendings/1.json
  def destroy
    @spending.destroy
    respond_to do |format|
      format.html { redirect_to spendings_url, notice: "Spending was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @spending = current_user.spending.find_by(id: params[:id])
    redirect_to spendings_path, notice: "Not Authorized to edit this spending" if @spending.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending
      @spending = Spending.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spending_params
      params.require(:spending).permit(:description, :category, :amount, :user_id)
    end
end
