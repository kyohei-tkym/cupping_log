class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value)
  end

  private

  def search_for(model, value)
    #-------------------ユーザー名部分一致検索----------------------
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    #-------------------投稿タイトル部分一致検索--------------------
    elsif model == 'log'
      Log.where("coffee_name LIKE ?", "%#{value}%")
    end
  end
end
