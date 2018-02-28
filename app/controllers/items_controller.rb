class ItemsController < ApplicationController
    
    before_action :set_todo
        
    def index
        items = @todo.items
        render json: items, status: 200
    end
    def show
       item = @todo.items.find(params[:id])
        render json: item, status: 200
    end 
    def create
        item = @todo.items.new(params_item)
        if item.save
            render json: item, status: 201
        else
            render json: item.errors, status: 500
        end
    end
    def update
        item = @todo.items.find(params[:id])
        item.update(params_item)
        if @todo.save
            render json: item, status: 201
        else
            render json: item.errors, status: 500
        end
    end
    def destroy
        item = @todo.items.find(params[:id])
        item.destroy
        head :no_content
    end
    
    private 
    
    def params_item
        params.permit(:name, :description)
    end
    def set_todo
        @todo = Todo.find(params[:todo_id])
    end
end
