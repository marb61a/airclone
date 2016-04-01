class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation
    
    def index
        
    end
    
    def create
        
    end
    
    private
        def set_conversation
            @conversation = Conversation.find(params[:conversation_id])
        end
        
        def message_params
            params.require(:message).permit(:content, :user_id)
        end
end