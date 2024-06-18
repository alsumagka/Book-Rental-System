class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :desc
      t.string :genre
      t.string :price
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
