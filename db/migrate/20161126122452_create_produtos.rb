class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.integer :quantidade
      t.decimal :preco
      t.integer :id
      t.timestamps
    end
  end
end
