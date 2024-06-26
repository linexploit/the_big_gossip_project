class GossipsController < ApplicationController
  before_action :set_gossip, only: %i[ show edit update destroy ]

  # GET /gossips or /gossips.json
  def index
    @gossips = Gossip.all
  end

  # GET /gossips/1 or /gossips/1.json
  def show
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
  end

  # GET /gossips/1/edit
  def edit
  end

  # POST /gossips or /gossips.json
  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(id: session[:user_id])

    respond_to do |format|
      if @gossip.save
        format.html { redirect_to gossip_url(@gossip), notice: "Gossip was successfully created." }
        format.json { render :show, status: :created, location: @gossip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /gossips/1 or /gossips/1.json
  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to gossip_url(@gossip), notice: "Gossip was successfully updated." }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1 or /gossips/1.json
  def destroy
    @gossip.destroy!

    respond_to do |format|
      format.html { redirect_to gossips_url, notice: "Gossip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gossip_params
      params.require(:gossip).permit(:title, :content, :user_id, :city_id)
    end
end
