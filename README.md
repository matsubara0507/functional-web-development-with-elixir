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

#### 2. Model Data and Behavior

#### 3. From Data To State

#### 4. Manage State with a State Machine

### Part II — Add OTP for Concurrency and Fault Tolerance

#### 5. Wrap It Up In a GenServer

#### 6. Process Supervision For Recovery

### Part III — Add a Web Interface With Phoenix

#### 7. Generate a New Web Interface With Phoenix

#### 8. Create Persistent Connections With Phoenix Channels

### A1. Testing

### A2. Installing System Dependencies
