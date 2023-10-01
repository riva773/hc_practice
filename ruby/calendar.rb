require 'date'
#optparseはコマンドラインのオプションを取り扱うためのライブラリ
require 'optparse'

# ２月２０２２年の部分を出力

first_day = Date.new(2023,9,1)
last_day = Date.new(2023,9,-1)


#月、年を出力
p "9月 2023"
#曜日を出力
p "月 火 水 木 金 土 日"
#日付の一覧を出力

(first_day..last_day).each do |days|
    p days
end