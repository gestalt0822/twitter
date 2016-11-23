class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
       redirect_to tweets_path, notice: "新規投稿しました！"
     else
       render 'new'
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
  
end
