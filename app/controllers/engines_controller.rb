class EnginesController < ApplicationController
    
    before_action :set_engine, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @engines = current_user.engines
    end
    
    def new
        @engine = current_user.engines.build
    end
    
    def create
        @engine = current_user.engines.build(engine_params)
        if @engine.save
            if params[:images]
                params[:images].each do |i|
                    @engine.photos.create(image: i)
                end
            end
            @photos = @engine.photos
            redirect_to edit_engine_path(@engine), notice:"Votre moteur à bien étais enregistrer."
        else
            render :new
        end
    end
    
    def show
        @photos = @engine.photos
    end
    
    def edit
        @photos = @engine.photos
    end
    
    def update
        if @engine.update(engine_params)
            if params[:images]
                params[:images].each do |i|
                    @engine.photos.create(image: i)
                end
            end
            @photos = @engine.photos
            redirect_to edit_engine_path(@engine), notice:"Modification enregistrée..."
        else
            render :edit
        end
    end
    
    private
        
        def require_same_user
            if current_user.id != @engine.user_id
                flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
                redirect_to root_path
            end
        end
        
        def set_engine
            @engine = Engine.find(params[:id])
        end
          
        def engine_params
            params.require(:engine).permit(:engine_name, :engine_description, :engine_identity, :engine_define)
        end
    
end