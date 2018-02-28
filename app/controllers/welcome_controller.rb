class WelcomeController < ApplicationController
    def index
        render plain: 'Welcome to the todos api', status: 200
    end
end
