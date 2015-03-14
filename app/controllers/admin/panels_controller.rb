class Admin::PanelsController < ApplicationController
  before_action :authenticate_admin_user!

end
