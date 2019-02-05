class VoodooController < ApplicationController
	before_action :set_voodoo, only: [:show, :edit, :update, :destroy]
	def index
    @voodoo = Voodoo.all
    user = User.all
    
  end
 
  def show
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voodoo
      @voodoo = Voodoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voodoo_params
      params.fetch(:voodoo, {})
    end
end
