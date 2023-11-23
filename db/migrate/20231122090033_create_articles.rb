class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title,               null: false
      t.date :check_in,              null: false
      t.date :check_out,             null: false
      t.integer :partner_id,             null: false
      t.integer :price,              null: false
      t.integer :travel_site_id,        null: false
      t.text :content,               null: false
      t.references :user,            null:false, foreign_key: true
      t.references :prefecture,      null:false, foreign_key: true
      t.timestamps
    end
  end
end