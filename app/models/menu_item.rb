class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :menu_group, optional: true

  validates_presence_of :name, :price
  validates_uniqueness_of :name


  delegate :restaurant_id, to: :menu

  # An approach to validate name uniqueness based on the restaurant. Or perhaps validate it through a validates uniqueness via scope.
  # private

  # def name_uniqueness_within_restaurant
  #   return unless menu && name.present?

  #   if MenuItem.joins(:menu).where(name: name, menus: { restaurant_id: menu.restaurant_id }).where.not(id: id).exists?
  #     errors.add(:name, "must be unique within the same restaurant")
  #   end
  # end
end
