class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス作成　ストロングパラメータからデータを取得
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    # 全ての投稿を取り出して表示
    @list = List.all
  end

  def show
    # 対象のデータをURL内のidから取得する
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    # 編集したデータの更新
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to todolists_path
  end
  # private ここから下はcontrollerの中でしか呼び出せない
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
