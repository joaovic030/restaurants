class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_items

  validates_presence_of :name

  accepts_nested_attributes_for :menu_items

  def to_s
    "Menu: #{name} and menu_items: #{menu_items.map(&:name)}"
  end
end
