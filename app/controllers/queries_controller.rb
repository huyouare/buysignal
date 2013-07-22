class QueriesController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :authenticate_user!, except: [:index]

  # GET /queries
  # GET /queries.json
  def index
    # @queries = Query.all
    @queries = current_user.queries.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @queries }
    end
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    @query = current_user.queries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @query }
    end
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
    @query = current_user.queries.(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url }
      format.json { head :no_content }
    end
  end

  def datasift_request
    @query = current_user.queries.find(params[:id])
    
    keyword = @query.keyword

    @query_text = "twitter.text contains \"#{keyword}\""

    user = DataSift::User.new("blahblah", "3441448ba7cb3426fe0f996cb88ba8e2")
    definition = user.createDefinition(@query_text)
    consumer = definition.getConsumer(DataSift::StreamConsumer::TYPE_HTTP)
    @interactionArr = Array.new
    count = 5
    consumer.consume(true) do |interaction|
      if interaction
        @interactionArr.push(interaction['interaction']['content'])
        count -= 1
        if count <= 0 
          consumer.stop()
        end
      end
    end
  end
end
