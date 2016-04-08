class PagesController < ApplicationController
    def home
        @rooms = room.limit(3)
    end
    
    def search
        if params[:search].present? && params[:search].strip != ""
            session[:loc_search] = params[:search]
        end
  	    
  	    if session[:loc_search] && session[:loc_search] != ""
  	        @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
  	    else
  	        @rooms_address = Room.where(active: true).all
  	    end
  	    
  	    @search = @rooms_address.ransack(params[:q])
      	@rooms = @search.result
    
      	@arrRooms = @rooms.to_a
  	    
    end
end