class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:create], raise: false

  # GET /users
  def index
    @users = User.all

    pretty_printed = "[\n"

    @users.each do |a_user|
      pretty_printed += "{\n"
      name = a_user.name
      username = a_user.username
      email = a_user.email

      pretty_printed += "#{name}\n#{username}\n#{email}\n"
      pretty_printed += "},\n"
    end

    pretty_printed += "]"

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :username, :email, :password)
    end
end
