# ApplicationControllerクラスを作成しています。これはウェブアプリケーションのコントローラーと呼ばれるもので、基本的な機能を提供します。
class ApplicationController < ActionController::Base
  # ユーザー登録や認証に関連する操作を行う場合、特別な設定をする必要があります。それを行う前にこのメソッドを呼び出すように設定しています。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # プライベートメソッドを定義しています。これは他の部分からは呼び出せないメソッドです。
  def configure_permitted_parameters
    # ユーザーの登録情報を設定しています。これはユーザーがアプリに登録する際に入力できる情報です。
    # 名前、プロフィール、ポジション、職業などの情報を受け入れることを許可しています。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
  end
end
