class VisitsController < ApplicationController
  def unique
    # visits = Visit.group(:user).where(params_filter).count.length
    visits = Rails.cache.fetch('visits', :expires_in => 24.hours) { Visit.distinct.where(params_filter).count('user') }

    render json: {count: visits}
  end

  def loyal
    visits = Rails.cache.fetch('visits', :expires_in => 24.hours) { Visit.group(:user).having('COUNT(*) > 9').where(params_filter).count.length }

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