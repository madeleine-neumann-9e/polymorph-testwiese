class Button < ApplicationRecord
  has_many :sections, as: :content_element
end
