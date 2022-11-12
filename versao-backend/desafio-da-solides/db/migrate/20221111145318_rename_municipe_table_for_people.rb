class RenameMunicipeTableForPeople < ActiveRecord::Migration[6.1]
  def change
    rename_table :municipes, :people
  end
end
