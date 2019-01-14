class DocsController < ApplicationController
    
    before_action :find_params, only: [:show, :edit, :update, :destroy]
    
    def index
      @docs = Doc.where(user_id: current_user) 
    end
    
    def new
        @doc = current_user.docs.build
    end
    
    def create
        @doc = current_user.docs.build(doc_params)
        if @doc.save
          redirect_to docs_path
        else
          render 'new'
        end
    end
    
    def edit
    end
    
    def show
       
    end
    
    def update
        if @doc.update(doc_params)
            redirect_to doc_path(@doc)
        else
            render 'edit'
        end
    end
    
    def destroy
      @doc.destroy
      redirect_to docs_path
    end
    
    private
    
    def doc_params
        params.require(:doc).permit(:title, :content)
    end
    
    def find_params
         @doc = Doc.find(params[:id])
    end
end
