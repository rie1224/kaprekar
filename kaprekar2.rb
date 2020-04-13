# カプレカ数が9の倍数であることを利用しない場合（標準入力→出力までの速度は1分程です）

#  標準入力用メソッド
def input_search_num(kaprekar_arry)
  puts ""
  puts "0 ≦ n ≦ 100,000,000,000,000の範囲内で"
  puts "n（半角数字）を入力してください"
  n = gets.to_i
  if 0 <= n && n <= 100000000000000
    puts ""
    puts "n以上かつ、nに一番近い値のカプレカ数は・・"
    puts "（初回のみ1分程お待ちください）" if kaprekar_arry.empty?
    results = search_kaprekar(n, kaprekar_arry)
    puts "#{results[0].to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')}　です"
  else
    puts ""
    puts "0 ≦ n ≦ 100,000,000,000,000の範囲内で入力してください"
    input_search_num(kaprekar_arry)
  end
  return results
end


# 標準入力を元に条件にあうカプレカ数を調べ、カプレカ数が入った配列とセットで値を返す（カプレカ配列を再利用する）
def search_kaprekar(n, kaprekar_arry)
  kaprekar_arry = create_kaprekar.sort if kaprekar_arry.empty?

  kaprekar_arry.map{|kaprekar| 
  return [kaprekar, kaprekar_arry] if n <= kaprekar
  }
end


# カプレカ数が入った配列を作成用メソッド（初回の標準入力のみで使用）
def create_kaprekar
  kaprekar_arry = []
  for i in 1..15
    # 1~9(数字の各桁)を配列に格納
    numbers = (0..9).to_a

    # n_arry= i桁のnumberのパターン全てを列挙。(順番が異なっても同一とみなす) 
    numbers.repeated_combination(i){|n_arry|

        # 最大値と最小値を求め、配列を数値に戻す(join.to_i)
        min = n_arry.join.to_i
        max = n_arry.reverse.join.to_i

        # dif=最大値を最小値の差
        dif = max - min
        
        # カプレカ数の配列を作る
        # difを文字列に変換（splitはintegerにはできないため）。splitで、difの各位を配列の要素に変換。
        # difを数値に戻す（.map(&:to_i)）。n_arryの順番に合わせるため、昇順に変換（sort）
        kaprekar_arry.push(dif) if n_arry == dif.to_s.split('').map(&:to_i).sort
      }
  end
  return kaprekar_arry
end


# 2回目以降、続けてカプレカ数を検索するか、システムを終了するか選択（続けて検索する場合は、初回で作成したカプレカ数配列を再利用）
def menu_for_searh_again(results)
  # resultsからカプレカ数配列のみ取り出し、変数に格納
  kaprekar_arry= results[1]
  puts ""
  puts "半角で、0か1を入力してください"
  puts "[0]:続けてカプレカ数を検索する　[1]:終了"
  input = gets.to_i
  case input
    when 0
      input_search_num(kaprekar_arry)
      menu_for_searh_again(results)
    when 1
      exit
    else
      menu_for_searh_again(results)
  end
end


kaprekar_arry = []
# input_search_numメソッドの返り値を変数resultsに格納。resultsは配列で、1番目の要素は標準入力値に一番近いカプレカ数、2番目の要素はカプレカ数の配列が格納されている。
results = input_search_num(kaprekar_arry)
menu_for_searh_again(results)