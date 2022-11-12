require 'rails_helper'

RSpec.describe 'People', type: :request do
  describe 'GET#index' do
    context 'list all People' do
      let(:person1) do 
        person = create(:person)
        create(:address, person_id: person.id)
      end

      before do
        person1

        get '/people'
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the first person attributes' do
        expect(json_body[0]).to include(:id, :full_name, :cpf, :cns, :email,
                                        :birth_date, :phone_number, :status,
                                        :address)
      end

      it 'must return the address of the first person' do
        expect(json_body[0][:address]).to include(:id, :cep, :public_place,
                                                  :ibge_code, :city, :uf,
                                                  :district)
      end
    end
  end

  describe 'GET#show' do
    context 'select a person' do
      let(:person) { create(:person) }
      let(:address) { create(:address, person_id: person.id) }

      before do
        get "/people/#{address.person.id}"
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the person attributes' do
        expect(json_body).to include(:id, :full_name, :cpf, :cns, :email,
                                     :birth_date, :phone_number, :status,
                                     :address)
      end

      it 'must return the address of the person' do
        expect(json_body[:address]).to include(:id, :cep, :public_place,
                                               :ibge_code, :city, :uf,
                                               :district)
      end
    end
  end

  describe 'POST#create' do
    context 'create a person' do
      let(:person_attributes) do 
        attributes_for(:person, full_name: 'John doe', cpf: '12312312312',
                          email: 'johndoe@gmail.com', cns: '123123', status: 'active',
                          birth_date: '12-12-2022', phone_number: '82955552222',
                          address_attributes: { 
                                                cep: '54098132', public_place: 'home',
                                                ibge_code: '093451223', city: 'chicago',
                                                uf: 'illinois', district: 'lalaland'
                                              })
      end

      before do

        post '/people', params: { person: person_attributes }
      end

      it 'must return 201 created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return the person attributes' do
        expect(json_body).to include(:id, :full_name, :cpf, :cns, :email,
                                     :birth_date, :phone_number, :status,
                                     :address)
      end

      it 'must return the address of the person' do
        expect(json_body[:address]).to include(:id, :cep, :public_place,
                                               :ibge_code, :city, :uf,
                                               :district)
      end
    end

    context 'create a person with invalid data' do
      let(:person_attributes) do 
        attributes_for(:person, full_name: nil, cpf: nil,
                        email: nil, cns: nil, status: nil,
                        birth_date: nil, phone_number: nil,
                        address_attributes: { 
                                              cep: nil, public_place: nil,
                                              ibge_code: nil, city: nil,
                                              uf: nil, district: nil
                                            })
      end

      before do

        post '/people', params: { person: person_attributes }
      end

      it 'must return 201 created status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        expect(json_body).to include(:errors)
      end
    end
  end

  describe 'PUT#update' do
    context 'update a person' do
      let(:person) { create(:person) }
      let(:address) { create(:address, person_id: person.id) }
      let(:person_attributes) do 
        attributes_for(:person, full_name: 'John doe', cpf: '12312312312',
                        email: 'johndoe@gmail.com', cns: '123123', status: 'active',
                        birth_date: '12-12-2022', phone_number: '82955552222',
                        address_attributes: { 
                                              cep: '54098132', public_place: 'home',
                                              ibge_code: '093451223', city: 'chicago',
                                              uf: 'illinois', district: 'lalaland'
                                            })
      end

      before do

        put "/people/#{address.person.id}", params: { person: person_attributes }
      end

      it 'must return the 204 status no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
