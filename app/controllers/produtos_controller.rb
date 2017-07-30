class ProdutosController < ApplicationController
  before_action :authenticate_user!


  def index
    user = current_user
    @produtos = Produto.where "user_id" == user.id

  end

  def new
    @produto = current_user.produtos.build
  end

  def create

    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco
    @produto = current_user.produtos.build valores
    if @produto.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to produtos_path
    else
      render :new
    end

  end

  def edit
    user = current_user
    id = params[:id]
    @produto = Produto.find(id)
    if user.id == @produto.user_id
      render :alterar
    else
      head :forbidden
    end
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
    user = current_user
    @nome = params[:nome]
    @produtos = Produto.where(["nome like ?", "%#{@nome}%"]).where "user_id" == user.id
  end


end
