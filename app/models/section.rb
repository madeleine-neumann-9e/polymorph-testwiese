class Section < ApplicationRecord
  belongs_to :page
  belongs_to :content_element, polymorphic: true
end
