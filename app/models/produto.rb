class Produto < ApplicationRecord

  belongs_to :user

  validates :quantidade, presence: true
  validates :preco, presence: true

  validates :nome, length: {minimum: 5}
  validates :descricao, length: {minimum: 10}
end
