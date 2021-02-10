class ButtonsController < ApplicationController
  before_action :set_button_and_page, only: %i[ show edit update destroy ]

  def index
    @buttons = Button.all
  end

  def show
  end

  def new
    @button = Button.new
    @section = Section.new
  end

  def edit
  end

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

  def destroy
    @button.destroy
    respond_to do |format|
      format.html { redirect_to buttons_url, notice: "Button was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_button_and_page
      @button = Button.find(params[:id])
      @page = @button.section.page
    end

    def button_params
      params.require(:button).permit(:title, :button_type)
    end
end
