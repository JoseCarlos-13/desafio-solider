class RenameCpfAndCnsColumnToMunicipes < ActiveRecord::Migration[6.1]
  def change
    rename_column :municipes, :CPF, :cpf
    rename_column :municipes, :CNS, :cns
  end
end
