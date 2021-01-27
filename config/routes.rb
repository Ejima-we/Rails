Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "top" => "homes#top"
  # postはデータベースを変更するアクション　データが空の場合使用
  post "todolists" => "todolists#create"
  get "todolists" => "todolists#index"
  get "todolists/:id" => "todolists#show",as: "todolist"
  get "todolists/:id/edit" =>"todolists#edit", as: "edit_todolist"
  # patchは既存データがある場合に使用 (編集)
  patch "todolists/:id" => "todolists#update", as: "update_todolist"
  # 削除の場合は delete を使用
  delete "todolists/:id" => "todolists#destroy", as: "destroy_todolist"
end

