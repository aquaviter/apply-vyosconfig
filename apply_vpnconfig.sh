#!/bin/bash

USAGE(){
    echo "Usage: ./apply_vpnconfig.sh <ssh key path> <FQDN> <config file>"
    echo "Note! configuration file for vpn is available on your management console."
	exit 1
}

[ "$#" -eq 0 ] && USAGE >&2

key_path=$1
hostname=$2
config_file=$3

#// vyos上で実行するスクリプトファイルをvyosのカレントディレクトリにコピー
echo "Copying script files."
scp -i $key_path vyos_scripts/* vyos@$hostname:~

#// AWSからダウンロードしたコンフィグレーションファイルをvyosのカレントディレクトリにコピー
echo "Copying a configuration file."
scp -i $key_path $config_file vyos@$hostname:~

#// コンフィグレーションの適用
echo "Applying configuration."
ssh -i $key_path vyos@$hostname "./setcommand.sh $config_file"

#// コンフィグレーションの確認
echo "Showing configuration."
ssh -i $key_path vyos@$hostname "./showconfig.sh"


