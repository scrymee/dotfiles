# bashrc作成時に発生したエラーについて

新しいパソコンで`.bashrc`を作成した後に、再度起動したら下記のWARNINGが表示された

```bash
WARNING: Found ~/.bashrc but no ~/.bash_profile, ~/.bash_login or ~/.profile.

This looks like an incorrect setup.
A ~/.bash_profile that loads ~/.bashrc will be created for you.
```

ざっと和訳すると「.bashrcはあるのに、.bash_profileなどがないから、作ったよ！」ということらしい。

そもそも.bashrcについていまいち理解していなかった。
「bash起動時に自動で読み込まれるファイル」程度の認識だったので、再確認。

# bashrcについて

そもそも、.bashrcと.bash_profileの違いだが、そのまえにbashなどについて整理したい。

## ログインシェルについて

ログインシェルとは、普段何気なく使っているコマンドを実行するときに使用するシェルの総称。
Vscodeではターミナル起動時にbashが自動で選択されたり、WindowsにはGit Bashがあるため使用する際には気にならない。
ただ、実際のフローとしては、下記のようなフローになっているようだ。

1. ターミナルなどを起動する（これ単体ではプログラムを実行できない）
2. プログラムを実行するためのプログラム（ログインシェル）の選択（bashやzshなど）
3. ログインシェルにログイン

[ログインシェル (login shell)とは｜「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典](https://wa3.i-3-i.info/word11274.html)
[Bash: .bashrcと.bash_profileの違いを今度こそ理解する｜TechRacho by BPS株式会社](https://techracho.bpsinc.jp/hachi8833/2021_07_08/66396)

つまり、.bash_profileも.bashrcも、bashのログインシェルを読み込む際に最初に読み込まれるファイル（init的な？）という知見を得た。
とはいえ、それらの明確な使い分けについてわからないのでさらに深堀する

## 対話シェル

さらに調べたところ
.bashrcは、**対話**モードのbashを起動したときに読み込まれるという記述があった。
対話モードとは、ざっくりいうと、**ユーザーの入力を受け付けて反応を返却する**処理のこと。

こちらでよい例があった
[bashでユーザのキーボード入力を対話的に受け取るbashスクリプト - Qiita](https://qiita.com/na0AaooQ/items/f2759c9b2c49d2210265)


```bash
function ConfirmExecution() {

  echo "----------------------------"
  echo "スクリプトを実行しますか?"
  echo "  実行する場合は yes、実行をキャンセルする場合は no と入力して下さい."
  read input

  if [ -z $input ] ; then

    echo "  yes または no を入力して下さい."
    ConfirmExecution
    
    ...（省略）
  fi
}
```
こういうユーザーの入力を受け入れてそれに応じた処理を返却する場合は、これを書くのだろう。
※余談だが、.bashrcには、**標準出力や標準エラーに何も出力してはいけない**というルールがあるようだ。

[~/.bashrcは何も出力してはいけない（するならエラー出力に） - None is None is None](https://doloopwhile.hatenablog.com/entry/2014/11/04/124725)
```
原因：~/.bashrcでechoしている
上のログに "~/.bashrc loaded" という行があります。これが原因です。.bashrc*1の最後の行で"echo"していました。もちろん、echo以外でも、何かしらの出力をしてしまうとscpやrsyncはコケます。
```

えっ、じゃあ対話とかできなくないか？と思ったけど、そもそもbash起動時に何か出力することなんてないだろう。。。
もちろん、ほかのシェルスクリプトでは使用するけど、わざわざbashrcに記載する理由はないよね。。。

ん～～～。全部.bash_profileに書いてよいんじゃないの？と思うけど、
それはアンチパターンらしい。その理由がいまいちピンとこないので保留。
