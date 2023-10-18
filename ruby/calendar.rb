require 'date'
require 'optparse'

# OptionParserインスタンスを作成し、入力オプションによって表示する値を変更する
opt = OptionParser.new
# OptionParserクラスのonメソッドで、コマンドラインのオプションを定義
# 初期値を設定することで、オプションがなかった時に、現在の月を表示するように設定
options = {year: Date.today.year,month: Date.today.month}
# OptionParserクラスでは、オプションの型を第二引数で指定できる
opt.on('-m :month', Integer) do |v| 
    v = v.to_i
    if v.between?(1, 12)
        options[:month] = v
        puts "#{v}月 #{options[:year]}年"
    else
        puts "#{v} is neither a month number (1..12) nor a name"
    end
end
# コマンドラインから提供された引数を解析
opt.parse!(ARGV)

day_of_week = ["月", "火", "水", "木", "金", "土", "日"]
puts day_of_week.join(" ")

# その年、その月の初日を取得
date = Date.new(options[:year], options[:month], 1)

# 初日の曜日を特定する
# wdayメソッドは曜日を返す(0→日)
first_wday = date.wday
# 月曜日始まりにする
# 日曜日が０で土曜日が６から日曜日を７に変換
# 三項演算子を使ってコードを簡潔にする
first_wday = date.wday.zero? ? 7 : first_wday
# 最終日をDateクラスの日付の部分-1で取得
# last_dayには最終日の日付を入れたいから.dayで月の日を返す
last_day = Date.new(options[:year], options[:month], -1).day

# 初めの出力の前に初めの週の空白を出力
print "   " * (first_wday - 1)



(1..last_day).each do |day|
    # 右揃え幅２の出力+スペース
    print day.to_s.rjust(2) + " "
    # 日曜日の後に改行する
    # +1をしてインクリメントしていく
    first_wday = (first_wday % 7) + 1
    puts if first_wday == 1
end
