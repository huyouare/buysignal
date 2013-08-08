class QueriesController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :authenticate_user!, except: [:index]

  # GET /queries
  # GET /queries.json
  def index
    # @queries = Query.all
    # @queries = current_user.queries.all
    # @new_query = current_user.queries.new

    @query = current_user.queries.first
    redirect_to action: "show", id:@query.id

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @queries }
    # end
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    @query = current_user.queries.find(params[:id])
    # @queries = current_user.queries.all

  end

  # GET /queries/new
  # GET /queries/new.json
  def new
    @query = current_user.queries.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @query }
    end
  end

  # GET /queries/1/edit
  def edit
    @query = current_user.queries.find(params[:id])
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = current_user.queries.new(params[:query])

    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render json: @query, status: :created, location: @query }
      else
        format.html { render action: "new" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /queries/1
  # PUT /queries/1.json
  def update
    @query = current_user.queries.find(params[:id])

    respond_to do |format|
      if @query.update_attributes(params[:query])
        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query = current_user.queries.find(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url }
      format.json { head :no_content }
    end
  end

  def datasift_request
    @query = current_user.queries.find(params[:id])

    keyword = @query.keyword

    # @query_text = "twitter.text contains \"#{keyword}\""

    # user = DataSift::User.new("blahblah", "3441448ba7cb3426fe0f996cb88ba8e2")
    # definition = user.createDefinition(@query_text)
    # consumer = definition.getConsumer(DataSift::StreamConsumer::TYPE_HTTP)
    # @interactionArr = Array.new
    # count = 1
    # consumer.consume(true) do |interaction|
    #   if interaction
    #     @interactionArr.push(interaction['twitter']['id'])
    #     count -= 1
    #     if count <= 0 
    #       consumer.stop()
    #     end 
    #   end
    # end

    # require 'net/http'

    # @tweetArr = Array.new

    # @interactionArr.each do |id|
    #   urlString = "https://api.twitter.com/1/statuses/oembed.json?id=#{id}&align=center"
    #   uri = URI(urlString)
    #   res = Net::HTTP.get_response(uri)
    #   if response.code == "200"
    #     result = JSON.parse(res.body)
    #     @tweetArr.push(result['html'])
    #   end
    # end
  end

  def twitter_request
    @query = current_user.queries.find(params[:id])

    # keyword = @query.keyword

    # require 'tweetstream'

    # TweetStream.configure do |config|
    #   config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
    #   config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
    #   config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
    #   config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
    #   config.auth_method        = :oauth
    # end

    # @statuses = []

    # puts "Twitter Request Active"

    # # This will pull a sample of all tweets based on
    # # your Twitter account's Streaming API role.
    # TweetStream::Client.new.track('buy', 'buying') do |status, client|
    #   result = @query.results.new(:json => status.attrs, :text => status.text)
    #   result.save
    #   @statuses << status.text
    #   puts status.text
    #   client.stop if @statuses.size >= 10
    # end

    # puts "Twitter Request Done"
  end
end
