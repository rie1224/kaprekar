def kaprekar(i, kaprekar_arry)
  # 1~9(数字の各桁)を配列に格納
  numbers = (0..9).to_a

  # c_ary= m桁のnumberのパターン全て。(順番が異なっても同一とみなす) 
  numbers.repeated_combination(i){|c_ary|
    # # カプレカ関数が9の倍数であることを利用
    if c_ary.inject(:+) % 9 == 0

    # 配列を数値に直す
      min = c_ary.join.to_i
      max = c_ary.reverse.join.to_i

    # dif=最大値を最小値の差
      dif = max - min
      
    # difを文字列に変換（splitはintegerにはできないため）。splitで、difの各位を配列の要素に変換。
    # difを数値に戻す（.map(&:to_i)）。c_aryの順番に合わせるため、昇順に変換（sort）
    kaprekar_arry.push(dif) if c_ary == dif.to_s.split('').map(&:to_i).sort
    
    end
    }

end

def create_kaprekar
  # iは桁数
  i = 1
  kaprekar_arry = []

  while  1 <= i && i<=  15
  kaprekar(i, kaprekar_arry)
  i += 1
  end
  return kaprekar_arry
end


def search_kaprekar(n)
  kaprekar_arry = create_kaprekar.sort
  kaprekar_arry.map{|kaprekar| 
  return kaprekar if n <= kaprekar
  }
end


puts "半角で数字を入力してください"
n = gets.to_i
puts "0 ≦ n ≦ 100,000,000,000,000のとき"
puts "n以上かつ、nに一番近い値のカプレカ数は、"
puts "（10秒ほどお待ちください）"
puts "#{search_kaprekar(n).to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')}　です"


