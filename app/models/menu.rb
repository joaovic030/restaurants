class Menu < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :name
end
