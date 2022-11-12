class Address < ApplicationRecord
  belongs_to :person

  validates :cep, presence: true
  validates :public_place, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :uf, presence: true
end
