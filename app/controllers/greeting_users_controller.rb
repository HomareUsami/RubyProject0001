class GreetingUsersController < ApplicationController
  def new
    @user = GreetingUser.new
  end

  def create
    puts "ユーザー登録処理開始"
    @user = GreetingUser.new(user_params)
    if @user.save
      puts "ユーザー登録成功"
      redirect_to login_path, notice: "ユーザー登録成功"
    else
      puts "ユーザー登録失敗"
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー更新成功"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to login_path, notice: "ユーザー削除成功"
  end

  def user_params
    params.require(:greeting_user).permit(:name, :user_id, :password, :password_confirmation)
  end
end
