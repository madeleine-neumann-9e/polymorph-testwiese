class Button < ApplicationRecord
  # @Question: Wie kann ich auf die content_elements ein dependent: :destroy aufrufen?
  has_many :sections, as: :content_element
end
