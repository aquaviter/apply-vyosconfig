#!/bin/vbash

#
# setcommand.sh 
#   set configuration commands into vyos
#

vyatta_sbin=/opt/vyatta/sbin
cmd_wrapper=$vyatta_sbin/vyatta-cfg-cmd-wrapper

config_file=$1
tmp_file=`mktemp tmp.XXXXX`

. /etc/bash_completion

#// !やスペースの行を削除し、一時ファイルに書き出し
grep -v -e '^\s*!' -e '^\s*$' $config_file > $tmp_file

#// 設定モード開始
$cmd_wrapper begin

#// １行ごとに設定を流し込んでいく
while read line; do
    eval $cmd_wrapper $line
done < $tmp_file

#// 設定をコミット
$cmd_wrapper commit

#// 設定モード終了
$cmd_wrapper end

#// 一時ファイル削除
rm $tmp_file
