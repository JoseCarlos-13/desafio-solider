class RenameMunicipeReferenceForPersonReference < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :municipe_id, :person_id
  end
end
