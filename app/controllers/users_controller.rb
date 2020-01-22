class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    return render json: { error_description: 'no users' }, status: 403 if @users.empty?
    render json: @users, each_serializer: UserSerializer
  end

  # GET /users/1
  def show
    render json: @user, serializer: UserSerializer
  end

  # POST /users
  def create
    @user = User.new(user_params)
    return render json: { error_description: 'needs name '}, status: 401 if !user_params[:name]

    if @user.save
      render json: @user, status: :created, location: @user, serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
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
      params.require(:user).permit(:name, :age, :is_tall, :email)
    end
end
