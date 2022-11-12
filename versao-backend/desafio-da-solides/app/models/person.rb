class Person < ApplicationRecord
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  # scope :search_person -> () { self.joins(:address).where('people.name = :name, name: params[:filter]).where('addresses.cep', cep: params[:filter]') } 

  validates :full_name, presence: true
  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  validates :status, presence: true

  enum status: { active: 0, inactive: 1 }
end
