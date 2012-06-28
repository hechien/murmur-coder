class MurmursController < ApplicationController
  # GET /murmurs
  # GET /murmurs.json
  def index
    @murmurs = Murmur.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @murmurs }
    end
  end

  # GET /murmurs/1
  # GET /murmurs/1.json
  def show
    @murmur = Murmur.find_by_generated_url(params[:generated_url])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @murmur }
    end
  end

  # GET /murmurs/new
  # GET /murmurs/new.json
  def new
    @murmur = Murmur.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @murmur }
    end
  end

  # GET /murmurs/1/edit
  def edit
    @murmur = Murmur.find(params[:id])
  end

  # POST /murmurs
  # POST /murmurs.json
  def create
    @murmur = Murmur.new(params[:murmur])

    respond_to do |format|
      if @murmur.save
        format.html { redirect_to @murmur, notice: 'Murmur was successfully created.' }
        format.json { render json: @murmur, status: :created, location: @murmur }
      else
        format.html { render action: "new" }
        format.json { render json: @murmur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /murmurs/1
  # PUT /murmurs/1.json
  def update
    @murmur = Murmur.find(params[:id])

    respond_to do |format|
      if @murmur.update_attributes(params[:murmur])
        format.html { redirect_to @murmur, notice: 'Murmur was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @murmur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /murmurs/1
  # DELETE /murmurs/1.json
  def destroy
    @murmur = Murmur.find(params[:id])
    @murmur.destroy

    respond_to do |format|
      format.html { redirect_to murmurs_url }
      format.json { head :no_content }
    end
  end
end
