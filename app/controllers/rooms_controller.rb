class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]
    
    def index
        @rooms = current_user.rooms
    end
    
    def show
        @photos = @room.photos
        
    end
    
    def new
        @room = current_user.rooms.build
    end
    
    def create
        @room = current_user.rooms.build(room_params)
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
        
        def set_room
            @room = Room.find(params[:id])
        end
        
        def room_params
            params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, 
                                        :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, 
                                        :is_heating, :is_internet, :price, :active)
        end
    
end