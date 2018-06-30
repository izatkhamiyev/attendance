class Api::V1::RequestsController < ApplicationController
 
  def create
  	token = Token.create()
  	render json: token, only: [:token]
  end

  def add
  	# user = User.new(params[:name, :surname, :token, :mac, :time], token_id: token.id)
  	nm = params[:name]
  	snm = params[:surname]
  	token = Token.find_by_token(params[:token])
  	mac = params[:mac]
  	time = params[:time]
  	user = User.new(name: nm, surname: snm, token: token, mac: mac, time: time, token_id: token.id)
  	# render json: user
  	# token = Token.find_by_token(user[:token])
  	if user.save && token
  		render json: user
  	else
  		render json: { errors: user.errors.full_messages }, status: :errors
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
