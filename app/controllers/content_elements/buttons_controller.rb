module ContentElements
  class ButtonsController < BaseController

    protected
      def content_element_type_params
        params.require(:button).permit(:title, :button_type)
      end

      def set_content_element_type
        @content_element_type = Button.find(params[:id])
      end

      def set_content_element_types
        @content_element_types = @page.content_elements.where(content_element_type: "Button")
      end

      def set_new_content_element_type
        @content_element_type = Button.new()
      end
  end
end
