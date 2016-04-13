class ReservationsController < ApplicationController
    before_action :authenticate_user!,  except: [:notify]
    
    def preload
        
    end
    
    def preview
        
    end
    
    def create
        @reservation = current_user.reservations.create(reservation_params)
    end
    
    protect_from_forgery except[:notify]
        def notify
            
        end
    
    protect_from_forgery except[:your_trips]
        def your_trips
            
        end
        
        def your_reservations
            
        end
    
    private
        def is_conflict(start_date, end_date)
            
        end
        
        def reservation_params
            params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
        end
end