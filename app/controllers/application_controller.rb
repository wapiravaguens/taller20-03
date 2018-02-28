class ApplicationController < ActionController::API
  
  
  
  rescue_from ActiveRecord::RecordNotFound, :with => :response_not_found
  
  def response_not_found
      render plain: 'not found', status: 404
  end
end
