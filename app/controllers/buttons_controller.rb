class ButtonsController < ApplicationController
  before_action :set_button, only: %i[ show edit update destroy ]

  # GET /buttons or /buttons.json
  def index
    @buttons = Button.all
  end

  # GET /buttons/1 or /buttons/1.json
  def show
  end

  # GET /buttons/new
  def new
    @button = Button.new
    @section = Section.new
  end

  # GET /buttons/1/edit
  def edit
  end

  # POST /buttons or /buttons.json
  def create
    @page = Page.find_by(id: params[:page_id])

    @button = Button.new(button_params)

    @section = Section.new(
      page_id: @page.id,
      content_element: @button
    )

    ActiveRecord::Base.transaction do
      @button.save!
      @section.save!
    end

    redirect_to page_path(@page)

  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = (@button.errors.full_messages + @section.errors.full_messages).to_sentence
    render :new
  end



  # PATCH/PUT /buttons/1 or /buttons/1.json
  def update
    respond_to do |format|
      if @button.update(button_params)
        format.html { redirect_to @button, notice: "Button was successfully updated." }
        format.json { render :show, status: :ok, location: @button }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buttons/1 or /buttons/1.json
  def destroy
    @button.destroy
    respond_to do |format|
      format.html { redirect_to buttons_url, notice: "Button was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_button
      @button = Button.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def button_params
      params.require(:button).permit(:title, :button_type)
    end
end
