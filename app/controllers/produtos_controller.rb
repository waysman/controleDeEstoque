class ProdutosController < ApplicationController

  def index
    @produtos = Produto.order :nome
  end

  def new
    @produto = current_user.produtos.build
  end

  def create

    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco
    @produto = current_user.produtos.build valores
    if @produto.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end

  end
  def edit
    id = params[:id]
    @produto = Produto.find(id)
    render :alterar
  end
  def update
    id = params[:id]
    @produto = Produto.find(id)
    valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
    if @produto.update valores
      flash[:notice] = "Produto atualizado com sucesso"
      redirect_to root_url
    else
      render :alterar
    end
  end
  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end
  def busca
    nome = params[:nome]
    @produtos = Produto.where "nome like ?", nome
  end


end
