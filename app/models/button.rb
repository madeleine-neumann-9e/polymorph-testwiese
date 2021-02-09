class Button < ApplicationRecord
  has_many :sections, as: :content_elements
end
