class Section < ApplicationRecord
  belongs_to :page
  belongs_to :content_elements, polymorphic: true
end
