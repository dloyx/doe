class SavesController < ApplicationController

    before_action :authenticate_user!

    def create
        @save = current_user.saves.create(save_params)       
        redirect_to @save.engine, notice: "Votre page a bien été sauvegarder."
    end
 
  
    private
        def save_params         
            params.require(:save).permit(:start_date, :engine_id)     
        end
    
end