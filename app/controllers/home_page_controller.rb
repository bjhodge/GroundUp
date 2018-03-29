class HomePageController < ApplicationController
	before_action :set_home_page, only: [:index, :contact_us, :edit, :update, :destroy]
  def index
  end

  def contact_us
  end

  def new
  	@home_page = HomePage.new
  end

  def edit
  	
  end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_home_page
	  @home_page = HomePage.first
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def home_page_params
	  params.require(:home_page).permit({pictures:[]})
	end
end
