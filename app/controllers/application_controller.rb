class ApplicationController < ActionController::Base
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CartsHelper
end
