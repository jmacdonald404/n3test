class VisitsController < ApplicationController
  def unique
    visits = Visit.group(:user).where(params_filter).count.length

    render json: {count: visits}
  end

  def loyal
    visits = Visit.group(:user).where(params_filter).count.reject{ |k, v| v < 10 }.length

    render json: {count: visits}
  end

  private

  def params_filter
    filter = Hash.new
    filter[:os] = params[:os].split(',') if params[:os]
    filter[:device] = params[:device].split(',') if params[:device]
    filter
  end
end