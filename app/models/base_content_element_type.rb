class BaseContentElementType < ApplicationRecord
  # Sorgt dafür, dass beim Vererben der Class der Tablename in den Erbenden Classes richtig gesetzt wird
  self.abstract_class = true

  has_one :content_element, inverse_of: :content_element_type, as: :content_element_type, dependent: :destroy
end
