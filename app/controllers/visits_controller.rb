class VisitsController < ApplicationController
  def unique
    if request.query_string.present?
      h = Hash.new
      h[:os] = params[:os].presence.try(:split, ",")
      h[:device] = params[:device].presence.try(:split, ",")
      visits = Visit.all.group(:user, :id).where(h.reject { |k, v| v.nil? }).count.length
      render json: {"count":visits}
    else
      visits = Visit.all.group(:user).count.length
      test2 = {"count":visits}
      render json: test2
    end
  end
  def loyal
    if request.query_string.present?
      h = Hash.new
      h[:os] = params[:os].presence.try(:split, ",")
      h[:device] = params[:device].presence.try(:split, ",")
      visits = Visit.all.group(:user).where(h.reject { |k, v| v.nil? }).count.reject{ |k, v| v<10 }.length
      render json: {"count":visits}
    else
      visits = Visit.all.group(:user).count.reject{|k,v| v<10}.length
      test2 = {"count":visits}
      render json: test2
    end
  end
end