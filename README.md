# RubyProject0001
RubyのRails用検証用Project

## 参考書籍
Ruby ふりがなプログラミングを参考にしながら詰まった部分などを対処して動作確認するためのProject
https://note.com/light_coyote380/n/n1884bb622863

## 詰まったポイント
- MySQLの登録
  - https://zenn.dev/iranorih/articles/0fdc568052245e
- 見た目の差異
  - [_greeting.html.erb](app/views/greetings/_greeting.html.erb)のままだと
  書籍通りの見た目にならなかったので、[_greeting_row.html.erb](app/views/greetings/_greeting_row.html.erb)
  を用意して対処
- 削除確認について
  - confirmでは、確認がされなかったためturbo_confirmを使用することで対処。
- Rails独自の記法が多く慣れることに難儀。
  - ChatGPTやGoogleで調べることで調査と知識吸収。

## やれそうなことと調べている内容
- [パスワードのハッシュ化とデータベースの登録](https://qiita.com/ryosuketter/items/805452b7e6bf9637cb57)
- [Herokuでの公開](https://www.sejuku.net/blog/8178)
- UIでのアニメーションなど（おそらくCSSとerb上でのHTML風記法で大体のことは網羅できそう）
- Macの場合、Sqlite3での対処になることが多そうなため挑戦したい。
- SQLの検索
  - ユーザー名とパスワードによるログイン等はSQLに登録されているデータと一致するかどうかで検索をしていそう。
    - where
  - ユーザー名はこの時一意にする必要がある。（もしくはメールアドレスなど別の情報で一意にしておく必要がある、ログインする際にどのデータを見るべきかがわからなくなってしまうため。）
    - データベース側のマイグレーション経由で一意にするようにできそう（unique）。
- スマホアプリ経由でのRailsのサーバーサイドとの連携による情報の取得及びデータベース登録など。
- api　url経由の処理
- Discord botとDB連携。（Discord Bot部分は完全独立Rubyである必要がありそうではあるが、サーバー自体との連携は可能そう。RubyでのDiscord Bot実装も可能そう。）[HerokuでのDiscord Bot](https://mssp160.netlify.app/2021-07/d1)