class AddStatusToApproved < ActiveRecord::Migration[7.0]
  def change
    add_column :approveds, :status, :string
  end
end
