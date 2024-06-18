class AddStatusToHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :histories, :status, :string
  end
end
