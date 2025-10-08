class Restaurant < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :menus
  accepts_nested_attributes_for :menus

  def to_s
    "Restaurant: #{name}. #{menus.map(&:to_s).join("; ")}."
  end
end
