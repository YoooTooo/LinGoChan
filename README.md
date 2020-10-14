0, 目次
---

1,【コンセプト】

2,【概要】

3,【本サービスのターゲットとなるユーザー】

4,【サービス内容】

5,【他サービスとの比較】

6【追記及び注記】

7, 言語等

8, インフラ/開発環境等

9, 機能一覧

10, 代表的な使用gem等

11, 開発エディター

12,【サービスの使い方(詳細)】

-----------------------------------------------------

1, 【コンセプト】
---

![LinGoChanの使い方](https://github.com/YoooTooo/LinGoChan/blob/master/app/assets/images/LinGoChan.png)

日本語学習者向けの日本語学習サービス

-----------------------------------------------------

2,【概要】
---

昨今、教育業界ではアクティブラーニングが主流になりつつあります。

アクティブラーニングとは生徒主体の授業(学習)のことを言います。

従来の教師が講義し生徒が受動的に聞くという形式から、生徒自身が主体的に考え、発言し、他の生徒に教えるといった形式にシフトしてきているということです。

このアクティブラーニングは教育的には従来の形式よりも効果的で、これはラーニングピラミッドで説明することが出来ます。

ラーニングピラミッドは(この概念自体の賛否はありますが)学習者が物事を習得する際、「講義を聞く」よりも「視聴覚体験をする」方が習得率が高く、それよりも「グループディスカッションに参加」する方がより高くなり、「実践したり、他の人に教える」と習得率が最高になるというものです。

この点を踏まえて作成されたのが本サービス『LinGoChan』です。

学習者のみで完結するようになっているというのが最大の特徴です。

-----------------------------------------------------

3,【本サービスのターゲットとなるユーザー】
---

・非日本語母語話者の日本語学習者

-----------------------------------------------------

4,【サービス内容】
---

本サービスは、3種類の投稿手段を駆使し、語学学習ができます。(詳細はREADME最下部#12にて)

I,   画像による、お題投稿

II,  お題に対するコメント

III, コメントに対するフィードバック。

全ての投稿を日本語学習者が行います。

つまり、

ユーザーAが、「画像」としてお題を投稿

ユーザーB, Cなどが、その「画像」に対して学習した日本語を駆使して何とかコメントをする。

そして、

ユーザーD, E, F, G…などがそのコメントの文法的ミスや、もっと良い言い回しをフィードバックしてあげる

といった使い方を期待しています。

すなわち、上述のラーニングピラミッドでの説明の通り、学習者が問題を主体的に提起し、別の学習者がそれに答え、されに別の学習者が教育するというモデルをサービス内で実現させているのです。

このような、アクティブラーニング的な過程を経ることによって、学習者の語学的成長を科学的に促せることが本サービスの望むところであります。

-----------------------------------------------------

5,【他(語学学習)サービスとの比較】
---

・学習者で完結する点(教師や母語話者が介入しない！)

・友達機能を廃止しました。

→これは作成者が他の語学学習サービスを使って外国語を学習していた際に、友達関係により「教える」「教えられる」の関係が膠着してしまい、新規参入に壁を感じたからです。

→友達関係がない分、なれ合いが発生しないので手軽に学習ができます。

・文字数制限により、長々とした文章を添削するリスクがない点

→他人の文や文章の添削には責任が伴うため、かなりの労力が伴いますが、文字数制限を行うことにより、手軽に学習ができます。

・お題投稿、コメント返信、フィードバックという流れの性質上、遊び感覚で学習ができ、語学学習に対する敷居が低くなります。

-----------------------------------------------------

6【追記及び注記】
---

1, 本アプリ『LinGoChan』の名前の由来は

lingo(英) :  [名詞] 外国語、術語、専門語

から来ています

2, 学びのピラミッドは教育現場において概ね支持されているものですが、否定意見も散見されます。

詳しくは以下を参考にしてください。

https://acrlog.org/2014/01/13/tales-of-the-undead-learning-theories-the-learning-pyramid/

ただし、能動的で多角的な学びが学習者の学習効率を促進させることは教育者が支持する意見であるという観点に基づき、筆者は本概念が全く根拠のない虚構であるとは考えていません。

==============================================================================

7, 言語等
---

☆バックエンド

・ruby 2.6.6

・Rails 6.0.3.2

☆フロントエンド

・webpacker (node.js 10.21.0, yarn 1.22.5, node-sass 4.9.0, nmp 6.14.8...)

・html

・SCSS

・bootstrap 4.3.1

・JavaScript, jQuery 3.5.1

-----------------------------------------------------

8, インフラ/開発環境等
---

・WSL2

・AWS

→ VPS, RDS, EC2, ALB, Route 53, S3, ACM CloudWatch

・nginx 1.18.0

・unicorn

・Docker Desktop for Windows

・Circle CI

・Capistrano

・tera term

・mysql 5.7

・git version 2.9.0

-----------------------------------------------------

9, 機能一覧
---

・サインアップ/ 名前、メールアドレス、パスワード、パスワード確認

・ログイン/ メールアドレス、パスワード、パスワード確認

・Remember me

・承認メールでのアカウント有効化

・パスワードリセット

・ページネーション

・ユーザプロフィールの編集、削除

・画像投稿

・画像投稿への返信

・画像投稿への返信への返信

・画像投稿への返信への返信

・画像投稿への返信への返信の編集

・各投稿の削除

・簡単ログイン

・タグ機能(画像投稿時のタグ付け、削除機能)

・タブ

・パンくずリスト

---------------------------------------------------

10, 代表的な使用gem等
------

・Rspec (rspec-rails)

・Capybara

・Rubocop

・byebug

・webdrivers

・factory_bot_rails

・rails-i18n

・kaminari

・letter_opener_web

・pry-byebug

・carrierwave

・mini_magick

・fog-aws

・gretel

・unicorn

・dotenv-rails

・capistrano

-----------------------------------------------------

11, 開発エディター
--------

・atom

-----------------------------------------------------

12, 【サービスの使い方(詳細)】
--------

![LinGoChanの使い方](https://github.com/YoooTooo/LinGoChan/blob/master/app/assets/images/about_page.png)
