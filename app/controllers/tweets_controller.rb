class TweetsController < HomeController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = current_user.tweets.order("tweets.updated_at DESC").paginate(page: params[:page], per_page: 10)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = "Tweet was successfully created."
      redirect_to root_path
    else
      flash[:error] = @tweet.errors.full_messages
      render "new"
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    if @tweet.update(tweet_params)
      flash[:success] = "Tweet was successfully updated."
      redirect_to @tweet
    else
      flash[:error] = @tweet.errors.full_messages
      render "edit"
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    if @tweet.destroy
      flash[:success] = "Tweet was successfully destroyed."
      redirect_to tweets_url
    else
      flash[:error] = @tweet.errors.full_messages
      render @tweet
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:twett_content)
  end
end
