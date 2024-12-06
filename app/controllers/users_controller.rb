class UsersController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show] 
 
end
