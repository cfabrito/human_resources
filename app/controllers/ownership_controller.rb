class OwnershipController < ApplicationController
  before_action -> { require_ownership params[:user_id].to_i }

  private
    def require_ownership(id)
      if id != current_user.id
        flash[:alert] = "You may not visit that section"
        redirect_to home_path
      end
    end
end
