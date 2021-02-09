class Section < ApplicationRecord
  belongs_to :page, touch: true
  belongs_to :content_element, polymorphic: true
end
