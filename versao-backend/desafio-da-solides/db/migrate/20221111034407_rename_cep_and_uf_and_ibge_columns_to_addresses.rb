class RenameCepAndUfAndIbgeColumnsToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :CEP, :cep
    rename_column :addresses, :IBGE_code, :ibge_code
    rename_column :addresses, :UF, :uf
  end
end
