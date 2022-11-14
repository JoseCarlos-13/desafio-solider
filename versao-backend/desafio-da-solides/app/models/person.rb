class Person < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  has_one_attached :photo

  validates :full_name, presence: true
  validates :cpf, presence: true, length: { maximum: 11 }
  validates :cns, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :status, presence: true

  enum status: { active: 0, inactive: 1 }

  scope :search_person, -> (full_name) { 
    where('full_name like ?', "%#{full_name}") if full_name.present?
  }

  def image_url
    photo_url = rails_blob_path(self.photo, only_path: true)

    "#{ENV['BASE_URL']}#{photo_url}" if self.photo.attached?
  end
end
