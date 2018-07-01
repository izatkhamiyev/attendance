class Api::V1::RequestsController < ApplicationController
 
  def create
  	token = Token.create()
  	render json: token#, only: [:token]
  end

  def calc_sec(time)
    min = time.strftime("%M")
    sec = time.strftime("%S")
    total_sec = Integer(min)*60 + Integer(sec)
  end

  def add
  	nm = params[:name]
  	snm = params[:surname]
  	token = Token.find_by_token(params[:token])
    if token 
    	mac = params[:mac]
    	time = params[:time]
      a = time.split(':')
      user_sec = Integer(a[0])*60 + Integer(a[1])
      token_sec = calc_sec(token.created_at)
    	user = User.new(name: nm, surname: snm, token: token, mac: mac, time: time, token_id: token.id)

      if token_sec <= user_sec && user_sec <= token_sec + 10
         if user.save
      		  render json: user
      	  else
      		  render json: { errors: user.errors.full_messages }, status: :errors
          end
      else
        render json: { errors: ["time is up"]}, status: :errors
      end
    else
        render json: { errors: ["token doesn't exist"]}, status: :errors
    end
  end

  def show
  	token = Token.find_by_token(params[:token])
  	if token.users.count > 0 
  		render json: token.users, only: [:name, :surname]
  	end
  	token.destroy!
  end

  private 
  def user_params
  	params.permit(:name, :surname, :token, :mac, :time, :token_id)
  end

end
