module ManageContentElements
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    base.before_action :set_page
    base.before_action :set_content_element_type, only: [:show, :edit, :update, :destroy]
    base.before_action :set_content_element_types, only: [:index]
    base.before_action :set_new_content_element_type, only: [:new, :create]
  end

  module ClassMethods
  end

  module InstanceMethods
    def create
      @content_element_type.assign_attributes(content_element_type_params)

      @content_element = ContentElement.new(
        page_id: @page.id,
        content_element_type: @content_element_type
      )

      ActiveRecord::Base.transaction do
        @content_element_type.save!
        @content_element.save!
      end

      redirect_to page_path(@page)

    rescue ActiveRecord::RecordInvalid
      flash.now[:error] = (@content_element_type.errors.full_messages + @content_element.errors.full_messages).to_sentence
      render :new
    end

    def destroy
      @content_element_type.destroy
      redirect_to page_path(@page)
    end

    protected

    def set_page
      @page ||= Page.find(params[:page_id])
    end

    def content_element_type_params
      raise("params are not implemented")
    end

    def set_content_element_type
      raise("before_action is not implemented")
    end

    def set_content_element_types
      raise("before_action is not implemented")
    end

    def set_new_content_element_type
      raise("before_action is not implemented")
    end
  end
end
