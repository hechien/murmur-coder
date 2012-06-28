class MurmursController < ApplicationController
  # GET /murmurs
  # GET /murmurs.json
  def index
    @murmurs = Murmur.order('id DESC').limit 20
    @murmur  = Murmur.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @murmurs }
    end
  end

  # POST /murmurs
  # POST /murmurs.json
  def create
    @murmur = Murmur.new(params[:murmur])

    respond_to do |format|
      if @murmur.save
        format.html { redirect_to root_path }
        format.json { render json: @murmur, status: :created, location: @murmur }
      else
        format.html { render action: "index" }
        format.json { render json: @murmur.errors, status: :unprocessable_entity }
      end
    end
  end

end
