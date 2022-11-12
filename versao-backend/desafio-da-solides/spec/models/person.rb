require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
