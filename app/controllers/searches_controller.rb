class SearchesController < ApplicationController
  
  def new
    @search = Search.new
    @addresses = Location.uniq.pluck(:address)
    @location_types = Location.uniq.pluck(:location_type)
  end
  
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
  end
  
  private 
    def search_params
      params.require(:search).permit(:keywords, :location_type, :address, :address2, :city, :postal_code, :country, :reception_phone)
    end  
  
end
