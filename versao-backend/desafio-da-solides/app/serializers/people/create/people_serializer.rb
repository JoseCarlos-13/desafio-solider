class People::Create::PeopleSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :cns, :email, :birth_date, :phone_number,
             :status, :address
  
  def address
    {
      id: object.address.id,
      cep: object.address.cep,
      public_place: object.address.public_place,
      district: object.address.district,
      city: object.address.city,
      uf: object.address.uf,
      ibge_code: object.address.ibge_code
    }
  end
end
