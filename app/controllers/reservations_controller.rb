class ReservationsController < ApplicationController
    before_action :authenticate_user!,  except: [:notify]
    
    def preload
        room = Room.find(params[:room_id])
        today = Date.today
        reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

		render json: reservations
    end
    
    def preview
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[end_date])
        
        output ={
            conflict: is_conflict(start_date, end_date)
        }
        
        render json: output
    end
    
    def create
        @reservation = current_user.reservations.create(reservation_params)
    end
    
    protect_from_forgery except[:notify]
        def notify
            
        end
    
    protect_from_forgery except[:your_trips]
        def your_trips
            @trips = current_user.reservations.where("status = ?", true)
        end
        
        def your_reservations
            @rooms = current_user.rooms
        end
    
    private
        def is_conflict(start_date, end_date)
            room = Room.find(params[:room_id])
            
            check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
            check.size > 0? true : false
        end
        
        def reservation_params
            params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
        end
end