# mikuaka_bb

## 概要
Docker内部に構築したRailsを用いて作成したシンプルな掲示板。

本来の目的は掲示板の作成ではなく、AWS上の様々な機能を用いてこの掲示板を動作させることであるため、掲示板自体の機能は適当。。

## 構成
### 使用したAWSサービス一覧
![](https://i.imgur.com/Dpqz1Ff.png)

### テスト環境
docker-compoesによって管理されたRailsアプリとDB。

### 本番環境
#### データフロー
![](https://i.imgur.com/u2g8zaT.png)

#### ユーザアクセス
- U-①
ユーザが名前解決(mikuaka.takunoko.com -> AAA.BBB.XXX.YYY)の変換を行う。
- U-②
HTTPアクセス。通常のWebアクセス。
- U-③
RailsがDBにアクセス。

#### 開発者
- D-①
作成したイメージをECRにアップロード
- D-②
ECSで新しいタスクを実行するとECRのイメージを使用してタスクが実行される。

#### AWSの自動作業
- A-①
ECSでの実行ログが記録される。(うまくやれば解析しやすい形で記録できるはず)
- A-②
CloudWatchから毎日0時にLamda関数が呼び出される(cron的な)
- A-③
Lambda関数により、24時間分のログ内容がS3バケットに追加される

こんな感じ。


## 今後
まだまだ使いたいAWSサービスがあるので盛り込んでいきたい。