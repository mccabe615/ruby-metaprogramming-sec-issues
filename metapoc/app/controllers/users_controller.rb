class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.name = params[:user][:name]
		@user.ssn = params[:user][:ssn]
		@user.email = params[:user][:email]
		@user.standing = params[:user][:standing]
		@user.save

		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	def update
	end

	def destroy
	end
end
