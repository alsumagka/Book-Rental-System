class AddStatusToPending < ActiveRecord::Migration[7.0]
  def change
    add_column :pendings, :status, :string, default: "Pending"
  end
end
