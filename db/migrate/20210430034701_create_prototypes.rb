class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :name,        null: false
      t.string     :concept,     null: false
      t.text       :text,        null: false
      t.integer    :genre_id,    null: false
      t.integer    :platform_id, null: false
      t.integer    :publish_id,  null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
