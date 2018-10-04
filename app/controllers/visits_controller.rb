class VisitsController < ApplicationController
  def unique
    visits = Visit.all.group(:user).count.length
    render json: visits
  end
  def loyal
    visits = Visit.all.group(:user).count.length
    render json: visits
  end
end