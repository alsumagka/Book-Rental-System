class AddStatusToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :string, default: "available"
  end
end
