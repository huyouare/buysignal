class FiltersController < ApplicationController
	before_filter :authenticate_user!

  # GET /filters
  # GET /filters.json
  def index
    redirect_to queries_path

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @filters }
    # end
  end

  # GET /filters/1
  # GET /filters/1.json
  def show
    @filter = current_user.filters.find(params[:id])
    # @filters = current_user.filters.all
    respond_to do |format|
      format.html
      format.json { render json: @filter }
    end
  end

  # GET /filters/new
  # GET /filters/new.json
  def new
		@query = current_user.queries.find(params[:query_id])
		@filter = @query.filters.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filter }
    end
  end

  # GET /filters/1/edit
  def edit
    @filter = current_user.queries.find(params[:query_id]).filters.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @filter }
    end
  end

  # POST /filters
  # POST /filters.json
  def create
  	@query = current_user.queries.find(params[:query_id])
    @filter = current_user.queries.find(params[:query_id]).filters.new(params[:filter])

    respond_to do |format|
      if @filter.save
        format.html { redirect_to @query, notice: 'Filter was successfully created.' }
        format.json { render json: @filter, status: :created, location: @filter }
      else
        format.html { render action: "new" }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /filters/1
  # PUT /filters/1.json
  def update
    @filter = current_user.queries.find(params[:query_id]).filters.find(params[:id])
    @query = current_user.queries.find(params[:query_id])

    respond_to do |format|
      if @filter.update_attributes(params[:filter])
        format.html { redirect_to @query, notice: 'Filter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filters/1
  # DELETE /filters/1.json
  def destroy
    @filter = current_user.queries.find(params[:query_id]).filters.find(params[:id])
    @filter.destroy

    respond_to do |format|
      format.html { redirect_to queries_path }
      format.json { head :no_content }
    end
  end
end