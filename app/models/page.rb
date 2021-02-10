class Page < ApplicationRecord
  has_many :content_elements, inverse_of: :page, dependent: :destroy
end
