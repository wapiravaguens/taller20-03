class ItemsController < ApplicationController
    def index
        items = Item.all
        render json: items, status: 200
    end
    def show
        todo = Todo.find(params[:todo_id])
        item = todo.items.find(params[:id])
        render json: item, status: 200
    end 
    def create
        todo = Todo.new(params_todo)
        if todo.save
            render json: todo, status: 201
        else
            render json: todo.errors, status: 500
        end
    end
    def update
        todo = Todo.find(params[:id])
        todo.update(params_todo)
        if todo.save
            render json: todo, status: 201
        else
            render json: todo.errors, status: 500
        end
    end
    def params_todo
        params.require(:todo).permit(:name, :description, :duration)
    end
    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
    end
end
