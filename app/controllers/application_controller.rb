class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  
  rescue_from ActiveRecord::RecordNotFound, :with => :response_not_found
  
  def response_not_found
      render plain: 'not found', status: 404
  end
end
