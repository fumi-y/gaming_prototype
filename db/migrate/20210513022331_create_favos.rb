class CreateFavos < ActiveRecord::Migration[6.0]
  def change
    create_table :favos do |t|
      t.integer :iine_id, null: false
      t.references :user,      foreign_key: true
      t.references :prototype, foreign_key: true

      t.timestamps
    end
  end
end
