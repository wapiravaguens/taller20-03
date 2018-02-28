class TodosController < ApplicationController
    def index
        todos = Todo.all
        render json: todos, status: 200
    end
    def show
        todo = Todo.find(params[:id])
        render json: todo, status: 200
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
    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
    end
    
    
    private
    
    def params_todo
        params.permit(:name, :description, :duration)
    end
end
