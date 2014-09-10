class OwnershipController < ApplicationController
  before_action :require_login
  before_action -> { require_ownership params[:user_id].to_i if user_signed_in? }

  private
    def require_login
      unless user_signed_in? or admin_signed_in?
        flash[:alert] = "You need to sign in to access that section"
        redirect_to home_path
      end
    end

    def require_ownership(id)
      if id != current_user.id
        flash[:alert] = "You may not visit that section"
        redirect_to home_path
      end
    end
end
