# functional-web-development-with-elixir
書籍「Functional Web Development with Elixir, OTP, and Phoenix」の読書進捗管理用リポジトリ

演習の解答などを置いてく．

## About Book

[Elixir](https://elixir-lang.org) と，その Web フレームワーク [Phoenix](http://phoenixframework.org) を用いて関数型プログラミング的な Web 開発を行うことをテーマにした書籍(OTP とは，乱暴な言い方をすれば， [Erlang](https://www.erlang.org) のライブラリ群のようなもの)．

まだ Beta 版で，下記ホームページにて電子書籍でしか販売されてない．

## Links

- [書籍のホームページ](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix)
- [他の Elixir に関する書籍](https://github.com/sger/ElixirBooks)

## Contents

公式サイトのは少し古いのかな？
ちょっと違う．

中身を全部ちゃんと読んだわけではないので間違いがあるかも．

#### 1. Mapping Our Route

本書の構成について書いてある．
[この章](https://media.pragprog.com/titles/lhelph/route.pdf)だけは無料で読めるようになっている．

全体としては，Elixir や Phoneix を Web 開発に用いる優位性について感じるために， *Island* という名前のゲームを作成していく．
Part I では，純粋に Elixir のみでゲームを作る．
ただし，(おそらく) Part I では関数型プログラミングの話に重点があって， Elixir の醍醐味である並行性(*Concurrency*)は出てこない．
並行性については Part II の OTP の話で導入するそうだ．
Part III では，Phoenix を使ったもので作り直す(直すかどうかは分からない)．
ただし，[Ecto](https://hexdocs.pm/phoenix/ecto.html)は使わないらしい．

あと，*Island* の説明と，本書のタイトルにもある ***Functional Web Development*** について書いてあった．
これ良いこと書いてあります．
無料で読めるので引用して翻訳(意訳)しとく．

> 関数型プログラミングの最も特徴的なパターンのひとつは(関数)合成です．
> 関数合成では，大きく複雑な仕事を機能に焦点を当てて小さく切り離し，これらの関数を連鎖(合成)させて完全な振る舞いを再現する．
> こうすることで，それぞれの関数が小ささが振る舞いの理解を助け，保守を簡単にする．

本書では，この関数プログラミングの考え方を Elixir を用いて Web 開発に適用するそうだ．

### Part I — Define the Functional Core in Elixir

前述したとおり，第一部ではまず，純粋に Elixir のみを使ってゲームを作成する(Phoenixを使わない)．
アプリケーション(ゲーム)の本質を，*data* と *behavior* を用いて定義する(data と behavior が [Elixir の機能](https://elixir-lang.org/getting-started/typespecs-and-behaviours.html)を指しているのか，値や型のデータと振る舞いという一般用語を指してるのかは，まだよくわからない...)．
また，モジュールと関数のみを使って，*逐次的 (Sequential)* な Elixir でアプリケーションの作成を行う(Sequential とは 並行 *Concurrency* の対義語を意味していて，並行に関する機能は使わないという意図だと思う)．

#### 2. Model Data and Behavior

本章ですること
- Elixir のデータ型としてドメインの要素をモデル化する
- データ変換として(アプリケーションの)振る舞いを定義する

**(この段落は個人的な主張で少し脱線です)** ○○プログラミングとは結局のところ，プログラムやアプリケーションをどのようにモデル化するかという考え方で，関数型プログラミング(スタイル)は，数学的な関数としてモデル化する．
数学的な関数には入力の集合と出力の集合があり，プログラミングではその集合をデータ型として表現する．
また，複雑な関数は，より小規模でシンプルな関数(データ変換)へ分割し，その関数を合成して複雑な振る舞いを表現する．

本章では，それを Elixir でどう行うかを説明してくれる(らしい)．

#### 3. From Data To State

本章ですること
- 一時的なプロセスの生成(spawn)
- 長寿命で状態を持つようなプロセスの生成
- 状態を保持し変更できるようなエージェントを作成
- 状態を保持し変更できるような [GenServer](https://elixir-lang.org/getting-started/mix-otp/genserver.html) を作成

第1部では，並行に関する機能は出てこないと思ったが....？？？
でも，この章はまだ未完成(“Content to be supplied later.” とのこと)なのでよくわかりません．

ちなみに，本書(もとい Elixir 関連のドキュメント)での *プロセス(process)* という単語は，OS 由来のプロセスでなく，ErlangVM のプロセスを指してると思われる．

#### 4. Manage State with a State Machine

本章ですること
- ステートマシンの仕組みの概要を知る
- 状態とトランジションとしてアプリケーションの規則をモデル化する
- 規則を具体化するためにステートマシンを構築する

今日の Web 開発において，イベントハンドリングや状態の変化は非常に重要なトピックで，これらを Elixir (もとい関数型プログラミング)でどのように表現するか．
その方法のひとつ(?)がステートマシン，という話っぽいです(読んでみないとよくわからない)．

ちなみに，Elixir ではプロセスで保持するデータのことを *state* と呼ぶらしいが，本章では一般的な意味合いで state という単語を用いているらしい．

### Part II — Add OTP for Concurrency and Fault Tolerance

第一部でアプリケーションのコアとなる部分を完成させた．
そのため，第二部ではいよいよ， *並行性(concurrency)* と *並列性(parallelism)* の世界へと足を踏み入れる．
OTPは，並行処理のために *GenSrever* を構築し，[フォールトトレランス](http://e-words.jp/w/%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%83%88%E3%83%88%E3%83%AC%E3%83%A9%E3%83%B3%E3%82%B9.html)とリカバリーのために *Supervisor* を追加することで，その道へ導く．

#### 5. Wrap It Up In a GenServer

本章ですること
- ゲームロジックの GenServer を実装する
- ゲームサーバーのプロセスのパブリックなインターフェースを定義する
- OTP Behaviour における共通パターンを実践する
- GenServer を正しい状態で初期化する
- 個々のゲームに名前を付けるためにプロセスの登録を使用する

#### 6. Process Supervision For Recovery

本章ですること
- プロセスを開始する様々な方法をより深く見てみる
- プロセスを監査するための様々な戦略を検討する
- 粒度のための Supervisor のツリーを構築する

### Part III — Add a Web Interface With Phoenix

第一部，第二部でゲームエンジンが完成した．
そのため，ここからはロジックと Web を介してやり取りをするインターフェースを提供しよう．
Phoenix はこの要件に対して素晴らしい役割を果たす．
新しく Phoenix アプリケーションを作成し，ゲームエンジンを依存関係として追加する．
私たちのゲームエンジンは状態を持つため，Phoenix Channels が提供する永続的な多重接続を利用するのが理想的である．

[Phoenix Channels](https://hexdocs.pm/phoenix/channels.html) は Phoenix が提供する WebSocket のようなステートフルなリアルタイム通信を簡単に扱う機能です(単純な WebSocket ラッパーではなく，それ以上の機能を持ち，WebSocket を使う必要もな無いらしい)．
Phoenix の目玉機能の一つだそうだ．

#### 7. Generate a New Web Interface With Phoenix

本章ですること
- 新しい Phoenix アプリケーションの作成(ただし Ecto は抜きで)
- 依存関係として作成したゲームエンジンを持ち込む
- Web インターフェイスの監視ツリーにゲームエンジンを組み込む

Ecto 抜きの理由は分からない(読めばわかる？)

#### 8. Create Persistent Connections With Phoenix Channels

本章ですること
- GenSrver と直接通信する Channel を作成する
- ひとつの GenServer に通信を集中させるために [“topic:subtopic” 規約](https://hexdocs.pm/phoenix/channels.html#topics)を使用する
- 各ゲームコマンドごとに別々の `handle_in` イベントを定義する — `new game`, `join game`, `fire shot`, などなど
- コンソールで私たちの Channel とやり取りして動作するようにする

### A1. Testing

### A2. Installing System Dependencies
