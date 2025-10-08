class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :menu_group

  validates_presence_of :name, :description, :price, :cost
end
