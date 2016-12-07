class ProdutosController < ApplicationController

  def index
    @produtos = Produto.order :nome
  end

  def create

    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco
    produto = Produto.create valores
    redirect_to root_url
  end
  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end

end
