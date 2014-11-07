class ImageCollectionsController < ApplicationController
  before_action :set_image_collection, only: [:show, :edit, :update, :destroy]

  # GET /image_collections
  # GET /image_collections.json
  def index
    @image_collections = ImageCollection.all
  end

  # GET /image_collections/1
  # GET /image_collections/1.json
  def show
  end

  # GET /image_collections/new
  def new
    @image_collection = ImageCollection.new
  end

  # GET /image_collections/1/edit
  def edit
  end

  # POST /image_collections
  # POST /image_collections.json
  def create
    @image_collection = ImageCollection.new(image_collection_params)

    respond_to do |format|
      if @image_collection.save
        format.html { redirect_to @image_collection, notice: 'Image collection was successfully created.' }
        format.json { render :show, status: :created, location: @image_collection }
      else
        format.html { render :new }
        format.json { render json: @image_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_collections/1
  # PATCH/PUT /image_collections/1.json
  def update
    respond_to do |format|
      if @image_collection.update(image_collection_params)
        format.html { redirect_to @image_collection, notice: 'Image collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_collection }
      else
        format.html { render :edit }
        format.json { render json: @image_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_collections/1
  # DELETE /image_collections/1.json
  def destroy
    @image_collection.destroy
    respond_to do |format|
      format.html { redirect_to image_collections_url, notice: 'Image collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image_collection
    @image_collection = ImageCollection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_collection_params
    params.require(:image_collection).permit(:subject_id)
  end
end
