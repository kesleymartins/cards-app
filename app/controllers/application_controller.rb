class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
end
