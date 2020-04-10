def difference(m, hash, results)
  max = m.to_s.split(//).sort.reverse.join.to_i
  min_a = m.to_s
  if min_a.include?("0")
    min_a = min_a.delete("0")
  end
  min_a = min_a.to_s.split(//).sort.join.to_i

  # puts min_a
  # puts max
 
  dif = max - min_a
  # puts dif
  count = 0

  if results.include?(dif) 
    puts "OK"
    p hash.push(dif)
    results << hash.group_by{|e| e}.select{|k, v|v.size > 1}.map(&:first)
    p results
  else
    while count < 20 
      puts "NG"
      hash.push(dif)
      results = []
      difference(dif, hash.push(dif), results)
    end
      conunt += 1
  end
end



difference(1020, [], [])

# # //１桁に発生しえる数字（0〜9）
# numbers = (0..9).to_a
# p numbers
# # numrepeated_combination(14)　14桁の数字の組み合わせを全てをハッシュに入れる
# count = 0
# p numbers.repeated_combination(14){|c_arry|

#   # カプレカ数は9の倍数なので、９の倍数（各位の和が9）のみを抽出し、配列に入れる
#   if c_arry.inject(:+) % 9 == 0
#     count += 1
#   end
# }
# puts count






# def kapureka(m)
#   numbers = (0..14).to_a
#   numbers.repeated_combination(m){|c_ary|
#     # 後述のnが９の倍数ということはc_aryの和も９の倍数
#     if c_ary.inject(:+) % 9 == 0
#       min_ary = c_ary.clone
#       max = min_ary.reverse.join.to_i
#       # 最高位を0以外にする←カプレカ数との違い
#       i = 0
#       while min_ary[i] == 0
#         i += 1
#       end
#       min_ary[0], min_ary[i] = min_ary[i], min_ary[0]
#       min = min_ary.join.to_i
#       n = max - min
#       p [m, c_ary, n] if c_ary == n.to_s.split('').map(&:to_i).sort
#     end
#   }
# end

# (2..15).each{|m| kapureka(m)}

# def kapureka(m)
#   m = m.to_s
#   if m.include?("0")
#     m = m.delete("0")

#   end
#   puts m
# end

# kapureka(3990)

