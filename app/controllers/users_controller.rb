class UsersController < ApplicationController
  before_action :set_user
  include LinkHelper


  def show
    if @user.authorized?(params[:random])
      @date = DateTime.now
    else
      render plain: "USER NOT AUTHORIZED"
    end
  end

  def get_data
    if request.xhr?
      date = params[:date] ? DateTime.parse(params[:date]) : DateTime.now
      range = params[:range]
      direction = params[:direction]
      render json: @user.get_data(date, range, direction), layout:false
    end
  end

  def get_day_data
    if request.xhr?
      date = params[:date]
      range = params[:range]
      direction = params[:direction]
      render json: @user.get_data(date, range, direction), layout:false
    end
  end

  def get_week_data
    puts "I MADE IT INTO WEEK DATA"
    if request.xhr?
      date = params[:date]
      range = params[:range]
      direction = params[:direction]
      render json: @user.get_data(date, range, direction), layout:false
    end
  end

  def get_month_data
    if request.xhr?
      date = params[:date]
      range = params[:range]
      direction = params[:direction]
      render json: @user.get_data(date, range, direction), layout:false
    end
  end

  def get_day_meals
    if request.xhr?
      puts "I JSUT HIT THIS BITCH"
      @date = params[:date] ? DateTime.parse(params[:date]) : DateTime.now
      if params[:direction]
        if params[:direction].include?('forward')
          @date += 1
        elsif params[:direction].include?('back')
          p "HITTING THIS OTHER BITCH"
          @date -= 1
        end
      end
      @meals = @user.get_all_meals(@date)
      render partial: 'get_day_meals', layout: false, locals: { meals: @meals}
    end
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end


end
