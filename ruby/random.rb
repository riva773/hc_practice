group = ('A'..'F').to_a

#sampleメソッドは、配列からランダムに１つを選んで抽出
#sampleメソッドは、引数の数値だけランダムに抽出
group1 = group.sample([2,3,4].sample).sort
#配列は配列-配列の形で残りの要素だけの別の配列を作成できる
group2 = group - group1  

p group1
p group2


