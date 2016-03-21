class PagesController < ApplicationController
    def home
        @rooms = room.limit(3)
    end
    
    def search
        
    end
end