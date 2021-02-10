class HeadlinesController < ApplicationController
  include ManageContentElements

  protected
    def content_element_type_params
      params.require(:headline).permit(:title, :title_type)
    end

    def set_content_element_type
      @content_element_type = Headline.find(params[:id])
    end

    def set_content_element_types
      @content_element_types = @page.content_elements.where(content_element_type: "Headline")
    end

    def set_new_content_element_type
      @content_element_type = Headline.new()
    end
end

