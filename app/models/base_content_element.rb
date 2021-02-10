class BaseContentElement < ApplicationRecord
  # Sorgt dafür, dass beim Vererben der Class der Tablename in den Erbenden Classes richtig gesetzt wird
  self.abstract_class = true

  has_many :sections, as: :content_element
end
