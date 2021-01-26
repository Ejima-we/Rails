class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス作成
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
    # URL内のidをコントローラで受け取る
    @list = List.find(params[:id])
  end
  
  def 
  # private ここから下はcontrollerの中でしか呼び出せない
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
