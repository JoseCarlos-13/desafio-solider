class PeopleController < ApplicationController
  before_action :person, only: %i[show update]

  def index
    people = Person.all

    render json: people, 
           each_serializer: People::Index::PeopleSerializer,
           status: :ok
  end

  def show
    render json: person,
           serializer: People::Show::PeopleSerializer,
           status: :ok
  end

  def create
    person = Person.new(person_params)

    if person.save
      render json: person, 
             serializer: People::Create::PeopleSerializer,
             status: :created
    else
      render json: { errors: person.errors }, status: :unprocessable_entity
    end
  end

  def update
    person.update(person_params)

    head :no_content
  end

  private

  def person
    person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:full_name, :cpf, :cns, :email,
                                   :birth_date, :phone_number, :status,
                                   address_attributes: [:cep, :public_place,
                                   :district, :city, :ibge_code, :uf])
  end
end
