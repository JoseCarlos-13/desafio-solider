class CreateMunicipes < ActiveRecord::Migration[6.1]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.string :CPF
      t.string :CNS
      t.string :email
      t.date :birth_date
      t.string :phone_number
      t.integer :status

      t.timestamps
    end
  end
end
