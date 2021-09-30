class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true #データ不整合を防ぐ
      t.string :name, null: false
      t.text :comment, null: false #空にできない

      t.timestamps
    end
  end
end
