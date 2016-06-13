class NewsController < ApplicationController

  before_action :require_user, except: [:index, :show]
  before_action :find_news , only: [:show, :edit, :update, :destroy]

  def index
    @newses = News.order('created_at DESC').page params[:page].per(3)
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      flash[:notice] = "News created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to @news, notice: "Pin was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @news.destroy
    redirect_to root_path
  end

  private
    def news_params
      params.require(:news).permit(:title, :description, :photo)
    end

    def require_user
      if !user_signed_in? 
        flash[:notice] = "You must Login/Signup to use all the facilities!"
        redirect_to root_path
      elsif current_user.is_admin == false 
        flash[:notice] = "You must be admin!"
        redirect_to root_path
      end
    end

    def find_news
      @news = News.find(params[:id])
    end
        
end
