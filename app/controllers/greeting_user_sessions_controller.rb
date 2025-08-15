class GreetingUserSessionsController < ApplicationController
  def new
    # loginページ
    puts "ログインページを表示します"
  end

  def create
    user = GreetingUser.find_by(user_id: params[:user_id])

    # passwordのチェック
    if user&.authenticate(params[:password])
      puts "ユーザー認証成功"
      puts user.name
      puts user.password
      token = user.generate_remember_token
      cookies.permanent.encrypted[:remember_token] = { value: token, expires: 30.days }
      puts "ログイン成功時のトークン: #{token}"

      # ブラウザをつけている間はセッションを保持する
      session[:user_id] = user.id

      # 30日間保持するためのCookie情報
      cookies.encrypted[:user_id] = { value: user.id, expires: 30.days }

      # remember_tokenも併せて保持する。
      cookies.encrypted[:remember_token] = { value: user.generate_remember_token, expires: 30.days }

      # Greetings Pathにリダイレクト
      redirect_to greetings_path, notice: "ログインしました"
    else
      # 各種処理情報を消去
      destroySession

      redirect_to login_path, alert: "ログインIDまたはパスワードが間違っています"
    end
  end

  def destroy
    destroySession

    # loginページを再表示
    redirect_to login_path, notice: "ログアウトしました"
  end

  def destroySession
    session.delete(:user_id) if session[:user_id]
    cookies.delete(:user_id) if cookies.encrypted[:user_id]
    cookies.delete(:remember_token) if cookies.encrypted[:remember_token]
  end
end
