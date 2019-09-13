
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# $PATH
export PATH=/usr/local/Cellar:$PATH

export PATH=/Applications/MAMP/bin/php/php5.6.32/bin:$PATH
# プロンプトのカラー表示を有効
# root は赤に　それ以外は緑
autoload -U colors
colors

case ${UID} in
0)
    PROMPT="%B%{$fg[red]%}%n#%{$reset_color%}%b "
    PROMPT2="%B%{$fg[red]%}%n#%{$reset_color%}%b "
    SPROMPT="%B%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%}%b "
    RPROMPT="[%{$fg[red]%}%~%{$reset_color%}]"
    ;;
*)
    PROMPT="%{$fg[green]%}%n%# %(?!(*'-') <!(*>_<%)? <)%{$reset_color%} "
    PROMPT2="%{$fg[green]%}%n%# >%{$reset_color%} "
    SPROMPT="%{$fg[green]%}(*'~'%)? < もしかして %r ? [そう!(y), 違う!(n),a,e]%{$reset_color%} "
    RPROMPT="[%{$fg[green]%}%~%{$reset_color%}]"
    ;;
esac

# 文字コード設定
export LANG=ja_JP.UTF-8

# ls のカラー
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# alias
alias ls="ls -G" # 色反映
alias ll="ls -la"
alias la="ls -a"
alias va="defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder"
alias ha="defaults write com.apple.finder AppleShowAllFiles -boolean false && killall Finder"
alias zrc="vim ~/.dotfiles/zsh/.zshrc"
alias vrc="vim ~/.dotfiles/vim/.vimrc"

setopt auto_pushd           # cd 時に Tab 補完
setopt auto_menu            # 補完キー連打で順に補完候補
setopt pushd_to_home        # pushd を引数無しで実行した時に pushd ~ とする
setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除
setopt no_beep              # beep音を無効に
setopt print_eight_bit      # 日本語ファイル名を表示可能に
setopt auto_cd              # ディレクトリ名だけで移動できる
setopt hist_ignore_all_dups # ヒストリの重複は古い方を削除
setopt list_packed          # lsで一度にたくさん表示される
setopt correct              # もしかして？
#setopt complete_in_word     # 語の途中でもカーソル位置で補完
setopt always_last_prompt   # カーソル位置は保持したままファイル名一覧をその場で表示
setopt globdots             # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt interactive_comments # #以降をコメントとして扱う
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt transient_rprompt    # 最新行だけにRPROMPTを表示

# 補完機能を有効にする
autoload -Uz compinit
compinit

# コマンド予測機能を有効にする
#autoload predict-on
#predict-on
# auto-fu とかの方がいいかも

# style
zstyle ':completion:*' menu select=1                  # カーソルによる補完候補の選択を有効化
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # 補完の色指定に LS_COLORS を使用
zstyle ':completion:*' group-name ''                  # 種別を別々に表示させるため, グループを空白に
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # ディレクトリ名を大文字小文字問わず
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' remote-access true             # リモートディレクトリも補完
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history

# vcs_info
# gitディレクトリで現在の状態を表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%K{yellow} !"
zstyle ':vcs_info:git:*' unstagedstr "%K{red} +"
zstyle ':vcs_info:*' formats " %K{green}%c%u %b %k"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# vi
bindkey -v

# ヒストリの前方一致
bindkey '[A' history-beginning-search-backward
bindkey '[B' history-beginning-search-forward

#memo
function memo() { RPROMPT="$1 "$RPROMPT }


#phpの単語一括検索機能↲
pf () { find . -name '*.ctp' -type f -print -or -name '*.php' -type f -print | xargs grep -n $1}

#自作関数テス
testss (){
 find ~/Dev/orbintra/app -name '*.ctp' -type f -print -or -name '*.php' -type f -print | xargs grep -n $*
}

   # export PATH="/usr/local/opt/php@7.1/bin:$PATH"
   # export PATH="/usr/local/opt/php@7.1/sbin:$PATH" 
	 #
	 #cakephp3.80を使用するときはこのコメントアウトを削除する
#export PATH=/Applications/MAMP/bin/php/php7.2.1/bin:$PATH
#
#
