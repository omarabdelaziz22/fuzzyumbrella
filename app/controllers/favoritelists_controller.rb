class FavoritelistsController < ApplicationController
  before_action :set_favoritelist, only: [:show, :edit, :update, :destroy]

  # GET /favoritelists
  # GET /favoritelists.json
  def index
    @favoritelists = Favoritelist.all
  end

  # GET /favoritelists/1
  # GET /favoritelists/1.json
  def show
  end

  # GET /favoritelists/new
  def new
    @favoritelist = Favoritelist.new
  end

  # GET /favoritelists/1/edit
  def edit
  end

  # POST /favoritelists
  # POST /favoritelists.json
  def create
    @favoritelist = Favoritelist.new(favoritelist_params)

    respond_to do |format|
      if @favoritelist.save
        format.html { redirect_to @favoritelist, notice: 'Favoritelist was successfully created.' }
        format.json { render :show, status: :created, location: @favoritelist }
      else
        format.html { render :new }
        format.json { render json: @favoritelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favoritelists/1
  # PATCH/PUT /favoritelists/1.json
  def update
    respond_to do |format|
      if @favoritelist.update(favoritelist_params)
        format.html { redirect_to @favoritelist, notice: 'Favoritelist was successfully updated.' }
        format.json { render :show, status: :ok, location: @favoritelist }
      else
        format.html { render :edit }
        format.json { render json: @favoritelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritelists/1
  # DELETE /favoritelists/1.json
  def destroy
    @favoritelist.destroy
    respond_to do |format|
      format.html { redirect_to favoritelists_url, notice: 'Favoritelist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favoritelist
      @favoritelist = Favoritelist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favoritelist_params
      params.require(:favoritelist).permit(:name, :user_id)
    end
end
