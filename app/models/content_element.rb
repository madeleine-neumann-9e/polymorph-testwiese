class ContentElement < ApplicationRecord
  belongs_to :page, inverse_of: :content_elements, touch: true
  belongs_to :content_element_type, inverse_of: :content_element, polymorphic: true, dependent: :destroy
end
