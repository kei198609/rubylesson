# ********5. フィボナッチ数列********

def fibonacci(n)
    return n if n <= 1
    fibonacci(n -1) + fibonacci(n - 2)
end

def fibonacci(num)
    return num if num <= 1  #0 または 1 の場合、そのまま num を返す
    fib= [0, 1]  #最初の2つのフィボナッチ数 0 と 1 を含む配列 fib を作成
    (2..num).each do |i|
        fib[i] = fib[i - 1] + fib[i - 2]  #フィボナッチ数列の次の数を計算し、配列 fib に追加します。
    end
    fib[num]  #計算が終わると、fib[num] を返します
end


# ********7. 最大公約数********
# 問題: 二つの数 a と b の最大公約数を求めます。

# 例:
# 入力: a = 54, b = 24
# 出力: 6

def gcd(a, b)
    return a if b == 0  # b が 0 になったら、a が最大公約数
    gcd(b, a % b)  # 再帰的に gcd 関数を呼び出す
end


# ********8. 数値のパリティ（奇数か偶数か）のチェック********
# 問題: 与えられた整数 n が奇数か偶数かを判断します。

# 例:
# 入力: n = 4
# 出力: "偶数"

def evenAdd(n)
    n % 2 == 0 ? "偶数" : "奇数"
end


# ********10. リニアサーチ********
# 問題: 配列 nums 内で target を検索し、そのインデックスを返します。存在しない場合は -1 を返します。

# 例:
# 入力: nums = [4,5,6,7,0,1,2], target = 6
# 出力: 2

def linierSearch(nums, target)
    nums.each_with_index do |num, index|
        return index if num == target
    end
end



# ********Fizz Buzz********

# answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
# answer[i] == "Fizz" if i is divisible by 3.
# answer[i] == "Buzz" if i is divisible by 5.
# answer[i] == i (as a string) if none of the above conditions are true.

# Example 1:
# Input: n = 3
# Output: ["1","2","Fizz"]

# Example 2:
# Input: n = 5
# Output: ["1","2","Fizz","4","Buzz"]

# Example 3:
# Input: n = 15
# Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

def fizz_buzz(n)
    answer = []
    (1..n).each do |i|
        if i % 15 == 0
            answer << "FizzBuzz"
        elsif i % 3 == 0
            answer << "Fizz"
        elsif i % 5 == 0
            answer << "Buzz"
        else
            answer << i.to_s
        end
    end
    answer
end




# ********Missing Number********
# Example 1:
# Input: nums = [3,0,1]
# Output: 2
# Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
# Example 2:
# Input: nums = [0,1]
# Output: 2
# Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
# Example 3:
# Input: nums = [9,6,4,2,3,5,7,0,1]
# Output: 8
# Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

def number(nums)
    n = nums.length
    total = (n * (n + 1)) / 2
    sum = nums.sum
    total - sum
end




# ********Reverse String********
# Example 1:

# Input: s = ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]
# Example 2:

# Input: s = ["H","a","n","n","a","h"]
# Output: ["h","a","n","n","a","H"]

def reverse(s)
    s.reverse!
end







# ********重複削除********
# Example 1:
# Input: nums = [1,1,2]
# Output: 2, nums = [1,2,_]
# Example 2:
# Input: nums = [0,0,1,1,1,2,2,3,3,4]
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]

def remove_duplicates(nums)
    nums.uniq!   # 重複を削除しながら、一意の要素のみを保持
    nums.length  # 重複を削除した後の配列の長さを返す
end



# 配列/文字列問題集

# ********Rotate Array********
# Example 1:

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
# Example 2:

# Input: nums = [-1,-100,3,99], k = 2
# Output: [3,99,-1,-100]
# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]

def rotate(nums)
    k = k % nums.length  # 3 を 7 で割った場合、商は 0 で、余りは 3 です。
    nums.rotate!(-k)
end
# nums.rotate!(-k):
# 配列を右に k ステップ回転させるために rotate! メソッドを使っています。引数に -k を指定することで、右に k ステップ移動させることができます。



# ********58. Length of Last Word********
# Example 1:
# Input: s = "Hello World"
# Output: 5
# Explanation: The last word is "World" with length 5.

# Example 2:
# Input: s = "   fly me   to   the moon  "
# Output: 4
# Explanation: The last word is "moon" with length 4.

# Example 3:
# Input: s = "luffy is still joyboy"
# Output: 6
# Explanation: The last word is "joyboy" with length 6.

def last_word(s)
    words = s.strip.split('')
    words.last.length
end

# ********28. Find the Index of the First Occurrence in a String********
# Example 1:
# Input: haystack = "sadbutsad", needle = "sad"
# Output: 0
# Explanation: "sad" occurs at index 0 and 6.
# The first occurrence is at index 0, so we return 0.
# Example 2:
# Input: haystack = "leetcode", needle = "leeto"
# Output: -1
# Explanation: "leeto" did not occur in "leetcode", so we return -1.

def str(haystack, needle)
    idx = haystack.index(needle)
    idx.nil? ? -1 : idx
end
# `index` メソッドを使用して `needle` の最初の出現位置を探す
# `needle` が `haystack` 内に存在しない場合、`index` メソッドは `nil` を返す
# そのため、`nil` の場合は -1 を返し、そうでなければ実際のインデックスを返す

# 例
# haystack = "hello world"
# needle = "world"
# index = haystack.index(needle)  # 6を返す

# この例では、"world"は"hello world"の6番目の位置（0から数えて）で最初に出現するので、indexは6を返します。



# ********169. Majority Element********
# Example 1:
# Input: nums = [3,2,3]
# Output: 3
# Example 2:
# Input: nums = [2,2,1,1,1,2,2]
# Output: 2

def majority_element(nums)
    nums.max_by { |n| nums.count(n) }
end
# max_byメソッドはRubyのEnumerableモジュールに含まれるメソッドの一つで、
# ブロックの評価結果が最大の要素を返します。max_byメソッドを使用すると、
# 配列やハッシュなどの各要素に対してブロックを評価し、その評価結果が最大の要素を簡単に取得できる



# Two Pointers
# ********125. Valid Palindrome********
# Example 1:
# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

# Example 2:
# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.

# Example 3:
# Input: s = " "
# Output: true
# Explanation: s is an empty string "" after removing non-alphanumeric characters.
# Since an empty string reads the same forward and backward, it is a palindrome.
def is_palindrome(s)
    filtered = s.gsub(/[^a-zA-Z0-9]/, '').downcase
    filtered == filtered.reverse
end

# 正規表現/[^a-zA-Z0-9]/は英数字以外の全ての文字にマッチし、英数字以外を空文字（''）に置換して取り除きます。
# gsubメソッドは、文字列内の全てのパターン（通常は正規表現を使用）にマッチする部分を
# 特定の別の文字列で置換するために使用されます。
# メソッド名のgsubは"global substitution"（全体置換）を意味します。
# 例
# 'cat'を'bat'に置換
# example = "The cat sat on the mat."
# result = example.gsub("cat", "bat")
# puts result  # => "The bat sat on the mat."


# Hashmap
# ********383. Ransom Note********
# Example 1:
# Input: ransomNote = "a", magazine = "b"
# Output: false
# Example 2:
# Input: ransomNote = "aa", magazine = "ab"
# Output: false
# Example 3:
# Input: ransomNote = "aa", magazine = "aab"
# Output: true
def ransom(ransomNote,magazine)
    ransomNote.each_char.all? { |char| ransomNote.count(char) <= magazine.count(char) }
end
# each_charとは？
# 例
# "hello".each_char { |char| puts char }
# このコードは以下の出力を生成します：
# h
# e
# l
# l
# o


# ********アナグラム********
# Example 1:

# Input: s = "anagram", t = "nagaram"
# Output: true
# Example 2:

# Input: s = "rat", t = "car"
# Output: false

def anagram(s, t)
    return false if s.length != t.length
    s_count = s.each_char.tally
    t_count = t.each_char.tally
    s_count == t_count
end

# each_char.tallyメソッドを使って、各文字列の文字の出現回数をカウントします。
# 最後に、s_count == t_countで、これら2つのハッシュが等しいかどうかを確認します。
# これは、両方の文字列に同じ文字が同じ数だけ含まれているかどうかをチェックすることになります。


# Binary Tree General
# ********104. Maximum Depth of Binary Tree********
# Example 1:
# Input: root = [3,9,20,null,null,15,7]
# Output: 3
# Example 2:
# Input: root = [1,null,2]
# Output: 2

def max_depth(root)
    return 0 if root.nil?
    left_depth = max_depth(root.left)
    right_depth = max_depth(root.right)
    [left_depth, right_depth].max + 1
end
# [left_depth, right_depth].max + 1は、
# バイナリツリー内の特定のノードにおける左側の子ノードの最大深さ（left_depth）と
# 右側の子ノードの最大深さ（right_depth）を比較して、より大きい方を選び、その数値に1を加えるという意味です。

# return 0 if root.nil? の行は、再帰的な関数の基底条件として機能し、木が空（root が nil）の場合には深さ 0 を返します。
# これは、木にノードが存在しないことを意味し、そのため深さも 0 です。
# ここでの max_depth 関数は、木の各ノードを再帰的に訪問し、最大の深さを計算します。具体的には：
# root が nil の場合、すなわち木が空の場合、深さは 0 です。
# root が nil でない場合、関数は root.left と root.right （左の子と右の子）に対して自身を再帰的に呼び出し、それぞれの子の最大深さを計算します。

# ********100. Same Tree********
# Example 1:
# Input: p = [1,2,3], q = [1,2,3]
# Output: true
# Example 2:
# Input: p = [1,2], q = [1,null,2]
# Output: false
# Example 3:
# Input: p = [1,2,1], q = [1,1,2]
# Output: false
def same_tree(p, q)
    return true if p.nil? && q.nil? # 両方のノードがnilであれば、同じと見なす
    return false if p.nil? || q.nil? # 片方のノードのみがnilであれば、異なると見なす
    return false if p.val != q.val # ノードの値が異なる場合、異なると見なす
    # 左の子ノードと右の子ノードを再帰的に比較する
    same_tree(p.left, q.left) && same_tree(p.right, q.right)
end


# Bit Manipulationビット操作
# ********191. Number of 1 Bits********
# この問題では、正の整数が与えられ、その整数の二進数表現における「1」の数を
# 求める関数を実装することが求められています。以下に具体的な例を挙げて説明します。

# 例 1:
# 入力: n = 11
# 処理: 11 を二進数に変換すると 1011 になります。
# 出力: 1011 の中には「1」が3つ含まれています。したがって、出力は 3 です。
# 例 2:
# 入力: n = 128
# 処理: 128 を二進数に変換すると 10000000 になります。
# 出力: 10000000 の中には「1」が1つだけ含まれています。したがって、出力は 1 です。
# 例 3:
# 入力: n = 2147483645
# 処理: 2147483645 を二進数に変換すると 1111111111111111111111111111101 になります。
# 出力: 1111111111111111111111111111101 の中には「1」が30つ含まれています。したがって、出力は 30 です。
def number_bit(n)
    n.to_s(2).count(1)
end
# n.to_s(2)：このメソッドは整数 n を二進数形式の文字列に変換します。例えば、n = 11 の場合は "1011" という文字列になります。
# .count('1')：変換された文字列の中で、文字 '1' の出現回数をカウントします。


# ********136. Single Number********
# Example 1:
# Input: nums = [2,2,1]
# Output: 1
# Example 2:
# Input: nums = [4,1,2,1,2]
# Output: 4
# Example 3:
# Input: nums = [1]
# Output: 1
def single_number(nums)
    single = 0
    nums.each { |num| single ^= num }
    single
end

# ********9. Palindrome Number********
# Example 1:
# Input: x = 121
# Output: true
# Explanation: 121 reads as 121 from left to right and from right to left.
# Example 2:
# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:
# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

def is_palindrome(x)
    string = x.to_s
    string == string.reverse
end




# ********Merge Sorted Array********
# 例1
# 入力: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
# 説明:
# マージする配列は [1,2,3] (nums1の最初の3つの要素) と [2,5,6] (nums2) です。
# ソートしながらマージすると、結果は [1,2,2,3,5,6] になります。
# 出力: [1,2,2,3,5,6]
# 例2
# 入力: nums1 = [1], m = 1, nums2 = [], n = 0
# 説明:
# マージする配列は [1] (nums1の最初の1つの要素) と [] (nums2) です。
# 結果はそのまま [1] です。
# 出力: [1]
# 例3
# 入力: nums1 = [0], m = 0, nums2 = [1], n = 1
# 説明:
# マージする配列は [] (nums1に有効な要素はない) と [1] (nums2) です。
# 結果は [1] です。
# 出力: [1]
def merge(nums1, m, nums2, n)
    nums1.slice!(m, nums1.length - m )
    nums1.concat(nums2).sort!
end
# nums1の末尾にある余分なゼロを削除するために、slice!メソッドを使用してnums1の長さをmに調整します。
# slice!(m, nums1.length - m) は、配列 nums1 のインデックス m から始まり、その位置から最後までの要素を削除します。
# たとえば、nums1 が [1, 2, 3, 0, 0, 0] で m が 3 の場合：
# nums1.slice!(3, 3) となります（ここで nums1.length - m は 3 です）。
# インデックス 3 から始まり、3つの要素（[0, 0, 0]）が削除されます。
# nums1 は [1, 2, 3] になります。

# nums2をnums1に連結するためにconcatメソッドを使用します。
# 結合された配列をsort!メソッドでその場でソートします。


# ********Intersection of Two Arrays II********

# 問題:
# 2つの整数配列 nums1 と nums2 が与えられます。両方の配列に共通する要素の配列を返してください。
# 結果の各要素は、両方の配列に存在する回数だけ含まれている必要があります。結果の配列は順不同で構いません。

# 例:
# nums1 = [1, 2, 2, 1], nums2 = [2, 2]
# 出力: [2, 2]

# nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
# 出力: [4, 9] または [9, 4]

def intersect(nums1, nums2)

    count1 = Hash.new(0)
    count2 = Hash.new(0)
    # nums1の要素の出現回数を数える
    # nums2の要素の出現回数を数える
    nums1.each { |num| count1[num] += 1 }
    nums2.each { |num| count2[num] += 1 }

    result = []
    count1.each do |num, count|
        if count2[num] > 0
            [count,count2[num]].min.times { result << num }
        end
    end
    result
end

# if count2[num] > 0 について

# count2 に num が存在するかどうかをチェックします。
# count2[num] > 0 は、nums2 に num が1回以上存在することを意味します。
# もし nums2 にも num が存在する場合、この条件は真になります。


# [count, count2[num]].min.times { result << num } について

# count は nums1 における num の出現回数、count2[num] は nums2 における num の出現回数です。
# [count, count2[num]].min は、num が両方の配列に現れる最小の回数を計算します。
# min.times ループを使って、その最小回数だけ num を result 配列に追加します。







# ********paizaランクD********
# 10000 以上かつ 13 で割り切れるような最小の自然数を求めてください。

# 入力される値
# なし

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 答えを 1 行で出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

number = 10000
while number % 13 != 0
    number = number + 1
end
puts number
# number を10000に初期化します。
# whileループで、numberが13で割り切れるかどうかを確認します。
# number % 13 != 0 の条件が成立する限り、numberを1ずつ増やします。
# numberが13で割り切れるとき、ループを抜けてその値を出力します。


# ********ある数字までの出力********
# 正の整数 N が与えられます。
# 1 ~ N の整数を 1 から順に改行区切りで出力してください。

# 入力される値
# N
# ・ 正の整数 N が 1 行で与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 1 〜 N の整数を 1 から順に改行区切りで出力してください。
# 出力の末尾には改行を入れてください。
# 1
# 2
# ...
# N-1
# N
n = gets.chomp.to_i
(1..n).each do |x|
    puts x
end


# ********占い********
# 箱の中に 1~9 までのいずれかの数字が書かれている玉を取り出し、その玉に書かれている数字から運勢を占います。
# 玉に書かれている数字が 7 の時は大吉となります。
# 占いで取り出した玉に書かれている数字が 1 つ与えられます。大吉かどうかを判定してください。

# 入力される値
# n
# ・ 1 行目に取り出した玉に書かれている数字 n が入力されます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 大吉の場合は「Yes」、そうでない場合は「No」と 1 行に出力してください。

n = gets.chomp.to_i
if n == 7
    puts "YES"
else
    puts "NO"
end

# n.include?(7)はダメ？
# include? メソッドは文字列や配列に対して使用するもので、ここでは整数の比較を行うために適していません。
# 単純に条件式を使って n が7であるかどうかをチェックします。

# ********数値演算結果で分岐********
# 整数 A, B, C が与えられます。式 A × B ≦ C が成立している場合はYESを、そうではない場合はNOを出力してください。
# 入力される値
# A B C
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# YESまたはNOを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# YES
# または
# NO
a, b, c = gets.chomp.split.map {|x|x.to_i}

if a * b <= c
    puts "YES"
else
    puts "NO"
end

# ********数値の分岐********
# 整数Nが与えられます。Nが 100 以下の場合はYESを、そうではない場合はNOを出力してください。
# 入力される値
# N
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# YESまたはNOを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# YES
# または
# NO
n = gets.chomp.to_i
if n <= 100
    puts "YES"
else
    puts "NO"
end

# ********単純な条件分岐********
# 文字列Sが与えられます。Sがpaizaと一致する場合はYESを、一致しない場合はNOを出力してください。

# 入力される値
# S
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# YESまたはNOを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# YES
# または
# NO

S = gets.chomp
if S == paiza
    puts "YES"
else
    puts "NO"
end

# ********乗客人数********
# ある電車に a 人が乗っています。駅に到着した時に b 人が降りて新たに c 人が乗車する時、電車に乗っている乗客人数を求めてください。

# 入力される値
# a b c
# ・ 1 行目に 整数 a,b,c がそれぞれ半角スペース区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 電車に乗っている乗客人数を出力してください。

a, b, c = gets.chomp.split.map { |x| x.to_i }
result = a - b + c
puts result


# ********代入演算 2********
# 整数 A, B, C が与えられます。以下のアルゴリズムを実行してください。
# 変数 N を 0 で初期化する
# N に A を足した値を N へ代入する
# N に B をかけた値を N へ代入する
# N を C で割ったあまりを N へ代入する
# N を出力する

# 入力される値
# A B C
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 計算結果 N を一行で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# N

A, B, C = gets.chomp.split.map {|x|x.to_i}
N = 0
N += A
N *= B
N %= C
puts N


# ********引き算・掛け算********
# 整数 A, B が与えられます。A と B の差 D と積 P を半角スペース区切りで出力してください。
# 入力される値
# A B
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 期待する結果 D と P を半角スペース区切り一行で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# D P

A, B = gets.chomp.split.map {|x|x.to_i}
D = A - B
P = A * B
puts "#{D} #{P}"

# ********半角スペース区切りの 2 つの入力********
# 文字列 s_1, s_2 が半角スペースで区切られて 1 行で与えられます。
# 各文字列を出力するごとに改行し 2 行で出力してください。

# 入力される値
# 以下の形式で標準入力によって与えられます。
# 半角スペースで区切られた文字列 s_1, s_2 が 1 行で与えられます。
# s_1 s_2
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 入力された文字列 s_1, s_2 をそれぞれ改行区切りで出力してください。
# また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
# s_1
# s_2

#例: 入力が "hello world" の場合、s_1 は "hello"、s_2 は "world" となります。
# split(' ') で、空白で区切られた2つの部分に分割します。
s_1, s_2 = gets.chomp.split(' ')
puts s_1
puts s_2


# ********累乗********
# 整数 A = 202、B = 134、C = 107 とします。  ((A+B)*C)^2を計算した結果を出力してください。
A = 202
B = 134
C = 107
result = (( A + B ) * C ) ** 2
puts result

# ********割り算********
# 整数 A = 437,326、 B = 9,085 とします。以下の二つの演算の結果を半角スペース区切りで出力してください。
# 1. A を B で割った商
# 2. A を B で割った余り
A = 437326
B = 9085
X = A / B
Y = A % B
puts "#{X} #{Y}"


# ********複数行にわたる出力********
# 整数 n が与えられるので、 n 回、改行区切りで paiza と出力してください。
# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# 整数 n が 1 行で与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます


# 期待する出力
# n 回 paiza と改行区切りで出力してください。
# paiza
# ...
# paiza
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i
n.times do
    puts "paiza"
end


# ********入力の配列による保持********
# 整数 n と n 個の数 a_1, ..., a_n が改行区切りで与えられます。与えられた a_1, ..., a_n の中で最も大きい数を出力してください。
# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1
# ...
# a_n
# 1 行目には整数 n が与えられ、 2 行目から (n + 1) 行目にかけては n 個の整数 a_1, ..., a_n が改行区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a_1, ..., a_n の中で最も大きい数を出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i
numbers = []
n.times do
    numbers << gets.chomp.to_i
end

max_number = numbers.max
puts max_number


# ********半角スペース区切りでの出力********
# 整数 n が与えられるので、n 回、半角スペース区切りで paiza と出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# 1行目に整数nが与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# paiza と n 回、半角スペース区切りで出力してください。最後の paiza の後には半角スペースは入れず、
# 改行を入れ、余計な文字、空行を含んではいけません。
# paiza paiza ... paiza


# Array.new(n, "paiza") を使って、"paiza" を n 回格納した配列を作成します。
# join(" ") を使って、配列内の要素をスペースで結合し、一つの文字列にします。
n = gets.chomp.to_i
puts Array.new(n, "paiza").join(' ')



# ********改行区切りでの出力********
# 整数 n が与えられ、その後に n 個の整数 a_1, ..., a_n が半角スペース区切りで与えられるので、
# a_1, ..., a_n をそのままの順番で改行区切りで出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1 a_2 ... a_n
# 1 行目には整数 n が与えられ、2 行目には半角スペース区切りの n 個の数 a_1, ..., a_n が 1 行で与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# a_1, ..., a_n をそのままの順番で改行区切りで出力してください。
# a_1
# ...
# a_n
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
n = gets.chomp.to_i
a = gets.chomp.split.map {|x|x.to_i}
a.each do |i|
    puts i
end


# ********paizaランクC********
# ********標準入出力********
# 毎年 5 月 1 日に、自分が運営している会社の社員一覧表を作成しています。表は年度ごとに更新され、社員の名前と年齢が載っています。
# ところで、会社のメンバーは昨年度から全く変わらず、社員の誕生日は全員 7 月 7 日だったので、
# 前年度の一覧表の年齢欄をそれぞれ +1 するだけで今年度の表が作れることにパイザ君は気づきました。

# 昨年度の一覧表が与えられるので、今年度の一覧表を出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# N
# s_1 a_1
# ...
# s_N a_N
# 1 行目には社員の数を表す整数 N が与えられ、2 行目 〜 (N + 1) 行目の各行では、
# 社員の名前を表す文字列 s_i とその社員の昨年度の年齢を表す整数 a_i が半角スペース区切りで与えられます（1 ≤ i ≤ N）。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 入力された通りの順番で、社員 s_i の名前と、その社員の今年度の年齢を半角スペース区切りでN行出力してください。
# s_1 (a_1 + 1)
# ...
# s_N (a_N + 1)
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 1
# Yamada 30

# 出力例1
# Yamada 31

# 入力例2
# 3
# Tanaka 18
# Sato 50
# Suzuki 120

# 出力例2
# Tanaka 19
# Sato 51
# Suzuki 121

# 社員の数 N を取得
n = gets.chomp.to_i
employees = []
# 各社員の情報を取得
n.times do
    name, age = gets.chomp.split
    age = age.to_i + 1
    employees << [name, age]
end
# 結果を出力
employees.each do |name, age|
    puts "#{name} #{age}"
end

# ********paizaランクD********
# ********整数と文字列********
# 整数 n と、 n 個の整数 a_1, ..., a_n が改行区切りで与えられるので、
# 各 a_i (1 ≤ i ≤ n) の文字列としての長さを改行区切りで出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1
# ...
# a_n
# 1 行目には整数 n が与えられ、 2 行目から (n + 1) 行目には n 個の整数 a_1, ..., a_n が改行区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 各 a_i (1 ≤ i ≤ n) の文字列としての長さを改行区切りで出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。


n = gets.chomp.to_i
numbers = []
# n 回のループで各整数を取得し、配列に格納
n.times do
    numbers << gets.chomp #to_iはつけない。入力を文字列として読み取り、配列に格納する必要があります。to_i を使用すると、整数に変換されるため、文字列の長さを計算することができなくなります。
end
# 各整数の文字列としての長さを計算して出力
numbers.each do |x|
    puts x.length
end


# ********部分文字列********
# 文字 a と文字列 S が与えられるので、 S に a が含まれているかどうか判定し、含まれている場合には “YES” を、そうでない場合には “NO” を出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# a
# S
# 1 行目に文字 a が、 2 行目に文字列 S が与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます

# 期待する出力
# S に a が含まれている場合には “YES” を、そうでない場合には “NO” を出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

a = gets.chomp
S = gets.chomp
if S.include?(a)
    puts "YES"
else
    puts "NO"
end



# ********数字の文字列操作********
# 0 ~ 9 の数字が 4 つ並んだ文字列 S が与えられます。
# 左から 1 番目の数と 4 番目の数を足し合わせたものを a とし、 2 番目の数と 3 番目の数を足し合わせたものを b とします。
# 文字列としての a の末尾に文字列としての b を結合したものを出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# S
# 1 行目に文字列 S が与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 文字列としての a の末尾に文字列としての b を結合したものを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

s = gets.chomp
a = s[0].to_i + s[3].to_i
b = s[1].to_i + s[2].to_i
result = a.to_s + b.to_s
puts result

# ********数字の文字列操作（0埋め）********
# 0 ~ 999 の整数 n が与えられます。 n が 3 桁の数である場合には n をそのまま出力し、 n が 2 桁の数である場合には n の先頭に 0 をひとつ、 1 桁の数である場合には n の先頭に 0 をふたつ加えたものを出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# 1 行目に整数 n が与えられます。
# n
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# n を 3 桁で 0 埋めしたものを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。



n = gets.chomp # ここでは、n を文字列として保持します。to_i を使用しないのは、後で文字列操作を行うためです。

if n.length == 1 # 文字列 n の長さが1（つまり1桁の数）の場合
    puts "00" + n # 先頭に "00" を追加して3桁にします。
elsif n.length == 2
    puts "0" + n
else
    puts n
end

# ********数字の文字列操作（時刻1）********
# 時刻を表す長さ 5 の文字列 S が “XX
# ” の形式で与えられます。入力された時刻を時と分に分け、時、分の順番で改行区切りで出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# S
# 1 行目に文字列 S が与えられます。
# S
# S は “XX
# ” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、十の位は 0 で埋められます。また、 00:00 から 23:59 までの 24 時間表記を採用しています。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# 入力された時刻を時と分に分け、時、分の順番で改行区切りで出力してください（2行出力する）。その際、入力値の十の位が 0 である場合には一の位だけ出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

s = gets.chomp
hour, minute = s.split(':')
puts hour.to_i
puts minute.to_i




# ********数字の文字列操作（時刻2）********
# 時刻を表す長さ 5 の文字列 S が “XX
# ” の形式で与えられます。与えられた時刻の 30 分後の時刻を同じ形式で出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# S
# 1 行目に文字列 S が与えられます。
# S は “XX
# ” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、十の位は 0 で埋められます。また、 00:00 から 23:59 までの 24 時間表記を採用しています。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# 与えられた時刻の 30 分後の時刻を "XX
# " の形式で出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。


s = gets.chomp
# 時と分に分割
hour, minute = s.split(':').map {|x|x.to_i}
# 30分後の時刻を計算
minute += 30
# 分が60以上になった場合、時間を繰り上げ
if minute >= 60
    hour += 1
    minute -= 60
end
# 時間が24以上になった場合、0に戻す
hour = hour % 24
# 時と分を2桁の文字列に変換して出力
puts format('%02d:%02d', hour, minute)

# formatメソッドの中で使われているフォーマット指定子 %02d は、対応する引数に適用されます。
# 具体的には、左側の %02d は hour に対応し、右側の %02d は minute に対応しています。



# ********3の倍数のカウント********
# 正整数 n と、 n 個の整数 a_1, ..., a_n が半角スペース区切りで与えられます。
# 与えられた整数の中に 3 の倍数がいくつあるかを数え、出力してください。
# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1 a_2 ... a_n
# 1 行目に正整数 n が、 2 行目に n 個の整数 a_1, ..., a_n が半角スペース区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 与えられた整数の中に3の倍数がいくつあるかを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 2
# 4 3
# 出力例1
# 1
# 入力例2
# 3
# 1 6 9
# 出力例2
# 2

n = gets.chomp.to_i
a = gets.chomp.split.map {|x|x.to_i}
count = 0
a.each do |num|
    if num % 3 == 0
        count += 1
    end
end
puts count


# ********フラグ管理********

# 正整数 n と n 個の整数 a_1, ..., a_n が改行区切りで与えられるので、
# 各 a_i (1 ≤ i ≤ n) が 7 であるか判定し、 a_1, ..., a_n の中に 7 がひとつでも含まれていた場合には
# "YES" を、そうでない場合（7 がひとつも含まれていなかった場合）には "NO" を出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1
# ...
# a_n
# 1 行目には正整数 n が与えられ、 2 行目から (n + 1) 行目には n 個の整数 a_1, ..., a_n が改行区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a_1, ..., a_n の中に 7 がひとつでも含まれていた場合には "YES" を、そうでない場合には "NO" を出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 2
# 7
# 1
# 出力例1
# YES
# 入力例2
# 3
# 4
# 11
# 35
# 出力例2
# NO

n = gets.chomp.to_i
a = []
n.times do
    a << gets.chomp.to_i
end

if a.include?(7)
    puts "YES"
else
    puts "NO"
end



# ********インデックス取得********
# 1 から n まで番号が付けられた人々がいます。
# i 番目の人の財産は a_i 円です。金額 k が与えられるので（k は a_1, ..., a_n のいずれか）、
# 財産が k 円である人の番号を出力してください。ただし、そのような人が複数いる場合には、そうした人々の中で最も小さい番号を出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1
# ...
# a_n
# k
# 1 行目には正整数 n 、 2 行目から (n + 1) 行目には n 個の整数 a_1, ..., a_n が改行区切りで与えられ、 (n + 2) 行目には整数 k が与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 財産が k 円である人の番号を出力してください。ただし、そのような人が複数いる場合には、そうした人々の中で最も小さい番号を出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 2
# 5
# 6
# 6
# 出力例1
# 2
# 入力例2
# 4
# 9
# 8
# 2
# 2
# 2
# 出力例2
# 3

n = gets.chomp.to_i
a = []
n.times do
    a << gets.chomp.to_i
end

k = gets.chomp.to_i

index = nil
a.each_with_index do |value, i|
    if value == k
        index = i + 1
        break
    end
end
puts index


# ********多重ループ********

# m 個の文字 c_1, ..., c_m と、 n 個の文字列 S_1, ..., S_n が与えられます。
# 各 c_i （1 ≤ i ≤ m） について、各 S_j （1 ≤ j ≤ n） に c_i が出現するかをそれぞれ調べ、
# 出現する場合は "YES" を、そうでない場合には "NO" を、そのつど出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# m
# c_1
# ...
# c_m
# n
# S_1
# ...
# S_n
# 1 行目に正整数 m が、 2 行目から (m + 1) 行目では文字 c_1, ...,c_m が、
# (m + 2) 行目に正整数 n が、 (m + 3) 行目から ( m + n + 2) 行目では文字列 S_1, ..., S_n が、
# それぞれ改行区切りで与えられます（入力は全部で (m + n + 2) 行）。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# c_1 が S_1 に出現するかどうか、 c_1 が S_2 に出現するかどうか、 ... 、 c_1 が S_n に出現するかどうか、
# c_2 が S_1 に出現するかどうか、 c_2 が S_2 に出現するかどうか、 ... 、 c_2 が S_n に出現するかどうか、
# ... 、 c_m が S_1 に出現するかどうか、 c_m が S_2 に出現するかどうか、 ... 、 c_m が S_n に出現するかどうか、という順番で m * n 回出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 1
# a
# 2
# paiza
# kyoko
# 出力例1
# YES
# NO
# 入力例2
# 2
# c
# d
# 2
# cat
# dog
# 出力例2
# YES
# NO
# NO
# YES

m = gets.chomp.to_i
c = []
m.times do
    c << gets.chomp
end

n = gets.chomp.to_i
s = []
n.times do
    s << gets.chomp
end

c.each do |ci|
    s.each do |sj|
        if sj.include?(ci)
            puts "YES"
        else
            puts "NO"
        end
    end
end


# ********paizaランクC********
# forループ
# 正整数 M が発表され、参加者は手元の紙に M 個、好きな数字を書きます。このとき、紙に書く数のそれぞれは 1 以上 M 以下であり、同じ数字を何度書いても構いません。
# その後、 1 以上 M 以下の数 K が発表され、各参加者は自分の紙に数字 K を書いた数だけポイントをもらい、ポイントの高い順に景品が配られます。
# 忘年会の参加者の人数 N と、数 M , K が与えられ、各参加者が書いた紙が与えられるので、それぞれの参加者の得点を計算して出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# N M K
# a_{1,1} ... a_{1,M}
# ...
# a_{N,1} ... a_{N,M}
# 1 行目には上で説明した数 N, M, K が半角スペース区切りで与えられ、 2 行目から (N + 1) 行目までには各参加者が紙に書いた数字が M 個ずつ半角スペース区切りで、 N 回与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 入力された通りの順番で、各参加者の得点をN回、改行区切りで出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 3 2 1
# 2 2
# 1 2
# 1 1
# 出力例1
# 0
# 1
# 2
# 入力例2
# 4 5 2
# 1 3 4 4 5
# 2 2 2 2 2
# 1 2 3 4 5
# 1 1 1 1 1
# 出力例2
# 0
# 5
# 1
# 0

n, m, k = gets.chomp.split.map {|x|x.to_i}
n.times do
    numbers = gets.chomp.split.map{|x|x.to_i}
    score = numbers.count(k)
    puts score
end


# ********昇順ソート********
# n 個の数 a_1, … , a_n が与えられます。与えられた数を小さい順に改行区切りで出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1
# ...
# a_n
# 1 行目に正整数 n が、 2 行目から (n + 1) 行目には整数 a_1, ..., a_n が改行区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a_1, ..., a_n を小さい順に並べ替え、改行区切りで n 行、順に出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 2
# 4
# 3
# 出力例1
# 3
# 4
# 入力例2
# 3
# 2
# 3
# 1
# 出力例2
# 1
# 2
# 3

n = gets.chomp.to_i
a = []
n.times do
    a << gets.chomp.to_i
end

result= a.sort
result.each do |x|
    puts x
end

# ********降順ソート********
n = gets.chomp.to_i
a = []
n.times do
    a << gets.chomp.to_i
end
result = a.sort.reverse
result.each do |x|
    puts x
end




# ********辞書式ソート********
# 正整数 n が与えられ、数のペアが n 個与えられます。各ペアの最初の数はりんごの個数を、
# その次の数はバナナの個数を表しています。これらの数のペアを以下の規則に従って、偉い順に並び替えてください。

# 1. ふたつのペアのりんごの数が異なる場合、りんごの数が多い方が偉い（この際、バナナの数は関係ない）。
# 2. りんごの数が同じである場合、バナナの数が多い方が偉い。


# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a_1 b_1
# ...
# a_n b_n
# 1 行目に正整数 n が、 2 行目から (n + 1) 行目には半角スペース区切りの数のペア a_1 b_1, ..., a_n b_n が、それぞれ改行区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# ペアを偉い順に並べ替え、改行区切りで n 行、順に出力してください。
# 出力の各行は入力と同じく、 "a_i b_i" のように、りんごの個数とバナナの数が、この順に、半角スペースで区切られているものとします。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i

pairs = []
n.times do
    a, b = gets.chomp.split.map {|x|x.to_i}
    pairs << [a, b]
end

sorted_pairs = pairs.sort do |pair1, pair2|
    if pair1[0] != pair2[0]
        pair2[0] <=> pair1[0]
    else
        pair2[2] <=> pair1[1]
    end
end

sorted_pairs.each do |a, b|
    puts "#{a} #{b}"
end



# pairs.sort do |pair1, pair2|

#     ・pairs 配列をソートします。sort メソッドはブロックを受け取ります。このブロック内で、2つのペア (pair1 と pair2) を比較する方法を定義します。
#     ・pair1 と pair2 は比較対象の2つの要素（ペア）です。各ペアは [りんごの数, バナナの数] の形式です。

# if pair1[0] != pair2[0]

#     ・まず、りんごの数を比較します。pair1[0] は pair1 のりんごの数、pair2[0] は pair2 のりんごの数です。
#     ・pair1[0] != pair2[0] の条件が true であれば、りんごの数が異なることを意味します。

# pair2[0] <=> pair1[0]

#     ・りんごの数が異なる場合、りんごの数で降順にソートします。<=> 演算子は、Rubyの宇宙船演算子と呼ばれ、2つの値を比較します。pair2[0] <=> pair1[0] は pair2 のりんごの数が pair1 のりんごの数よりも多い場合に正の値を返し、少ない場合に負の値を返し、等しい場合に0を返します。
#     ・ここで pair2[0] <=> pair1[0] とすることで、りんごの数が多いペアが前に来るようにします。

# else
#     りんごの数が同じ場合に実行されます。

# pair2[1] <=> pair1[1]

#     りんごの数が同じ場合は、バナナの数を比較します。pair2[1] <=> pair1[1] で、バナナの数で降順にソートします。


# 宇宙船演算子 <=> について
# <=> はRubyの宇宙船演算子と呼ばれ、2つの値を比較して次のような結果を返します：
# 左側の値が右側の値より小さい場合： -1
# 左側の値が右側の値より大きい場合： 1
# 左側の値と右側の値が等しい場合： 0


# ********ソート paizaランク C********
# N 人の人々がおり、それぞれの人は金と銀を何キログラムか持っています。
# 今は金の方が銀よりも価値が高いですが、ある日金と銀の価値が逆転して、人々の財産の多さは次のように決定されるようになりました。
# 1. 持っている銀が多い方が財産が多い。
# 2. 持っている銀が同じなら、持っている金が多い方が財産が多い。
# それぞれの人が持っている金と銀のキログラム数が与えられるので、この規則にしたがって、財産を多い順に並び替えて出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# N
# g_1 s_1
# ...
# g_N s_N
# 1 行目には人々の数を表す整数 N が与えられ、
# 2 行目から (N + 1) 行目には、人々が持っている金の量 g_i と銀の量 s_i がそれぞれ半角スペース区切りで N 行与えられます （1 ≤ i ≤ N）。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 上の規則に従って人々の財産を並び替え、入力と同じ形式で、各 g_i, s_i を半角スペース区切りで、財産が多い順に N 行出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i
people = []
n.times do
    g, s = gets.chomp.split.map { |x| x.to_i }
    people << [g, s]
end

sorted_people = people.sort do |person1, person2|
    if person1[1] != person2[1]
        person2[1] <=> person1[1]
    else
        person2[0] <=> person1[0]
    end
end

sorted_people.each do |g, s|
    puts "#{g} #{s}"
end


# ********辞書の基本 paizaランク C********

# n 人の人に関して、それぞれの人の名前と財産が与えられます。
# その後に人名 S が与えられるので （S は最初に与えられた名前のうちのいずれか） 、 S の財産を表す整数を出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# s_1 a_1
# ...
# s_n a_n
# S
# 1 行目には正整数nが与えられ、
# 2 行目から (n + 1) 行目には、人々の名前と財産が “s_i a_i” という
# フォーマット （s_i は人の名前を表す文字列、 a_i はその人の財産を表す整数、半角スペース区切り）で与えられます。
# (n + 2) 行目には人名 S が与えられます (S は 2 行目から (n + 1) 行目にかけて与えられた人名のいずれか）。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# S の財産を出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i
# 名前と財産を格納するハッシュ
people = {}
# n回のループで名前と財産を取得し、ハッシュに格納
n.times do
    name, wealth = gets.chomp.split
    people[name] = wealth.to_i  #要素を追加する場合は、ハッシュ[] = 値 の構文。name がハッシュのキーとなり、wealth.to_i がその値として格納されます。
end

s = gets.chomp
puts people[s]




# ********辞書のデータ更新 paizaランク C********
# n 人の人の名前 s_1, ..., s_n が与えられたのち、 m 回の「攻撃」に関する情報が与えられます。
# 各行は “p_i a_i” というフォーマットで与えられ、 p_i はダメージを受けた人の名前 （s_1, ..., s_n のいずれか） 、
# a_i は p_i が受けたダメージ数を表す数です。

# 最後に人名 S が与えられるので （S は s_1, ..., s_n のいずれか） 、 S が受けたダメージの合計を出力してください。
# なお、一度もダメージを受けていない人の合計ダメージは 0 とします。

# 入力される値
# 入力は以下のフォーマットで与えられます。

# n
# s_1
# ...
# s_n
# m
# p_1 a_1
# ...
# p_m a_m
# S

# 1 行目には正整数 n が与えられ、 2 行目から (n + 1) 行目には人の名前 s_1, ..., s_n が改行区切りで与えられます。
# (n + 2) 行目には正整数 m が与えられ、 (n + 3) 行目から (n + m + 2) 行目には人の名前 p_i （s_1, ..., s_n のいずれか） と
# その人が受けたダメージ a_i が "p_i a_i" という半角スペース区切りのフォーマットで m 行与えられます。
# (n + m + 3) 行目には s_1, ..., s_n の中のいずれかの人名 S が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます

# 期待する出力
# S の受けた合計ダメージを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 2
# Kirishima
# Kyoko
# 2
# Kyoko 1
# Kyoko 2
# Kyoko

# 出力例1
# 3

# 入力例2
# 3
# paiiza
# paiza
# paiiiza
# 2
# paiiza 2
# paiiiza 3
# paiza

# 出力例2
# 0


n = gets.chomp.to_i
# 名前を読み取ってハッシュを初期化する
damage = {}
n.times do
    name = get.chomp
    damage[name] = 0 # ダメージの初期値を0に設定
end
# 攻撃情報を読み取ってダメージを記録する
m = gets.chomp.to_i
m.times do
    target, dmg = gets.chomp.split
    dmg = dmg.to_i #dmg はダメージ数を表す文字列として取得されるので、to_i メソッドを使って整数に変換
    damege[target] += dmg #damage[target] に dmg を加算して、ターゲットが受けた累積ダメージを更新
end

# 最後に調べる名前 s を取得し、その人の合計ダメージをハッシュから取得して出力します。
s = gets.chomp
puts damege[s]




# ********辞書データの順序 paizaランク C********
# n 人の人の名前 s_1, ..., s_n が与えられたのち、 m 回の「攻撃」に関する情報が与えられます。
# 各行は “p_i a_i” というフォーマットで与えられ、
# p_i はダメージを受けた人の名前 （s_1, ..., s_n のいずれか） 、
# a_i は p_i が受けたダメージ数を表す数です。
# なお、一度もダメージを受けていない人の合計ダメージは 0 とします。
# それぞれの人が受けた合計ダメージを、人の名前のアルファベットの辞書順に出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# s_1
# ...
# s_n
# m
# p_1 a_1
# ...
# p_m a_m

# 1 行目には正整数 n が与えられ、 2 行目から (n + 1) 行目には
# 人の名前 s_1, ..., s_n が改行区切りで与えられます。 (n + 2) 行目には正整数 m が与えられ、
# (n + 3) 行目から (n + m + 2) 行目には人の名前 p_i （s_1, ..., s_n のいずれか）
# とその人が受けたダメージ a_i が "p_i a_i" という半角スペース区切りのフォーマットで m 行与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# それぞれの人が受けたダメージを、人の名前のアルファベットの辞書順に n 行出力してください（出力するのはダメージだけです）。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.chomp.to_i
damage = {}
n.times do
    name = gets.chomp
    damage[name] = 0
end
m = gets.chomp.to_i
m.times do
    target, dmg = get.chomp.split
    dmg = dmg.to_i
    damage[target] += dmg
end
# 名前をアルファベット順にソートし、ダメージを出力
damage.keys.sort.each do |name|
    puts damage[name]#name はここでキーを指し、damage[name] は対応するダメージを出力します。
end
# damage.keys は、ハッシュ damage のすべてのキー（名前）の配列を取得します。
# damage.keys.sort は、取得したキー（名前）の配列をアルファベット順にソートします。
# sort メソッドはデフォルトで昇順（アルファベット順）に並べ替えます。



# ********シミュレーションの練習 paizaランク C********
# パイザ君と霧島京子は最初どちらも数 1 をもっています。
# パイザ君は自分の番が来ると、自分のもっている数の a 倍を霧島京子の数に足してあげます。
# 霧島京子は自分の番が来ると、自分のもっている数を b で割った余りをパイザ君の数に足してあげます。
# この手続きをパイザ君の番から始めて、霧島京子の数がnより大きくなるまで繰り返します。

# 手続きが終わったときのパイザ君の操作回数を求めてください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# n
# a b
# 1 行目には整数 n が与えられ、 2 行目には a, b が半角スペース区切りで与えられます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 答えを行で出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 入力例1
# 6
# 3 2

# 出力例1
# 2

# 入力例2
# 10
# 2 3

# 出力例2
# 3


n = gets.chomp.to_i
a, b =gets.chomp.split.map {|x|x.to_i}
paiza = 1
kirishima = 1
count = 0
while kirishima >= n #霧島京子の数がnより大きくなるまで繰り返します
    # パイザ君の操作
    kirishima += paiza * a #パイザ君は自分の番が来ると、自分のもっている数の a 倍を霧島京子の数に足してあげます。
    count += 1
    break if krishima > n # 霧島京子の数が n を超えたら終了

    # 自分のもっている数を b で割った余りをパイザ君の数に足してあげます。
    paiza += kirshima % b

end
puts count





# ********構造体の作成********
# クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を送ってもらうよう依頼しました。

# 名前 年齢 誕生日 出身地

# 送ってもらったデータを使いやすいように整理したいと思った paiza 君はクラス全員分のデータを次の形式でまとめることにしました。

# User{
# nickname : 名前
# old : 年齢
# birth : 誕生日
# state : 出身地
# }


# クラスメートの情報が与えられるので、それらを以上の形式でまとめたものを出力してください。

# 入力される値
# N
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N


# ・ 1 行目では、paiza君のクラスの人数 N が与えられます。
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が順に半角スペース区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# User{
# nickname : n_1
# old : o_1
# birth : b_1
# state : s_1
# }
# User{
# nickname : n_2
# old : o_2
# birth : b_2
# state : s_2
# }
# ...
# User{
# nickname : n_N
# old : o_N
# birth : b_N
# state : s_N
# }

# 番号が若い順に各クラスメートの情報を以上の形式でを出力してください。


# 入力例1
# 1
# koko 23 04/10 tokyo

# 出力例1
# User{
# nickname : koko
# old : 23
# birth : 04/10
# state : tokyo
# }

# 入力例2
# 3
# mako 13 08/08 nara
# megumi 14 11/02 saitama
# taisei 16 12/04 nagano

# 出力例2
# User{
# nickname : mako
# old : 13
# birth : 08/08
# state : nara
# }
# User{
# nickname : megumi
# old : 14
# birth : 11/02
# state : saitama
# }
# User{
# nickname : taisei
# old : 16
# birth : 12/04
# state : nagano
# }


n  = gets.chomp.to_i
# クラスメートの情報を格納するための配列を初期化
classmates = []
# n行分のデータを読み取る
n.times do
    # 各行を読み取って、スペースで分割して配列に格納
    data = gets.chomp.split
    # ハッシュ形式で情報を格納
    classmate = {
        nickname: data[0],
        old: data[1],
        birth: data[2],
        state: data[3]
    }
    classmates << classmate
end

# 途中の p classmates の出力は次のようになります
# [
#   {:nickname=>"koko", :old=>"23", :birth=>"04/10", :state=>"tokyo"},
#   {:nickname=>"mako", :old=>"13", :birth=>"08/08", :state=>"nara"}
# ]
# 配列にハッシュを格納し、以下のように必要な形式で出力することができます。

classmates.each do |x|
    puts "User{"
    puts "nickname : #{x[:nickname]}"#{x[:nickname]}の:nicknameはシンボル。
    puts "old : #{x[:old]}"
    puts "birth : #{x[:birth]}"
    puts "state : #{x[:state]}"
    puts "}"
end


# ********構造体の検索********
# クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を送ってもらうよう依頼しました。

# 名前 年齢 誕生日 出身地

# 送ってもらったデータを使いやすいように整理したいと思った paiza 君はクラス全員分のデータを次のような構造体でまとめることにしました。

# student{
#     name : 名前
#     old : 年齢
#     birth : 誕生日
#     state : 出身地
# }


# 年齢ごとの生徒の名簿を作る仕事を任された paiza 君はクラスメイトのうち、決まった年齢の生徒を取り出したいと考えました。
# 取り出したい生徒の年齢が与えられるので、その年齢の生徒の名前を出力してください。

# 入力される値
# N
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N
# K


# ・ 1 行目では、paiza君のクラスの人数 N が与えられます。
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、
# i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が順に半角スペース区切りで与えられます。
# ・ N + 2 行目では、検索したい生徒の年齢 K が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 年齢が K である生徒の名前を 1 行で出力してください。

# 条件
# ・ 1 ≦ N ≦ 10
# ・ n_i , s_i (1 ≦ i ≦ N) は 1 文字以上 20 文字以下の文字列
# ・ b_i (1 ≦ i ≦ N) はMM/DD 形式の文字列（例 1月2日 → 01/02 12月31日 → 12/31)
# ・ 1 ≦ o_i , K ≦ 100
# ・ 年齢が K であるような生徒はクラスに 1 人

# 入力例1
# 1
# koko 23 04/10 tokyo
# 23

# 出力例1
# koko

# 入力例2
# 3
# mako 13 08/08 nara
# megumi 14 11/02 saitama
# taisei 16 12/04 nagano
# 14

# 出力例2
# megumi


n = gets.chomp.to_i
students = []
n.times do
    data = gets.chomp.split
    student = {
        name: data[0],
        old: data[1].to_i, #年齢を整数として比較する必要があるのでto_iを使用。
        birth: data[2],
        state: data[3]
    }
    students << student
end
k = gets.chomp.to_i
students.each do |x|
    if x[:old] == k
        puts x[:name]
        break
    end
end


# ********構造体の整列********
# クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を送ってもらうよう依頼しました。

# 名前 年齢 誕生日 出身地

# 送ってもらったデータを使いやすいように整理したいと思った paiza 君はクラス全員分のデータを次の形式でまとめることにしました。

# User{
#     nickname : 名前
#     old : 年齢
#     birth : 誕生日
#     state : 出身地
# }


# この情報を扱いやすくするために、年齢が昇順になるようにデータを並び替えることにしました。
# クラスメートの情報が与えられるので、並び替えた後のデータを出力してください。
# 入力される値
# N
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N


# ・ 1 行目では、paiza君のクラスの人数 N が与えられます。
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が
# 順に半角スペース区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N


# 各クラスメートの情報を年齢が昇順になるように整列したのち、入力と同様の形式で出力してください。

# 入力例1
# 1
# koko 23 04/10 tokyo

# 出力例1
# koko 23 04/10 tokyo

# 入力例2
# 3
# mako 13 08/08 nara
# taisei 16 12/04 nagano
# megumi 14 11/02 saitama

# 出力例2
# mako 13 08/08 nara
# megumi 14 11/02 saitama
# taisei 16 12/04 nagano


n = gets.chomp.to_i
students = []
n.times do
    data = gets.chomp.split
    student = {
        nickname: data[0],
        old: data[1].to_i,
        birth: data[2],
        state: data[3]
    }
    students << student
end
# 年齢でソート
sort_students = students.sort_by { |x|x[:old] }
# ソート後のデータを出力
sort_students.each do |x|
    puts "#{x[:nickname]} #{x[:old]} #{x[:birth]} #{x[:state]}"
end



# ********構造体の更新********
# クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を送ってもらうよう依頼しました。

# 名前 年齢 誕生日 出身地

# 送ってもらったデータを使いやすいように整理したいと思った paiza 君はクラス全員分のデータを次の形式でまとめることにしました。

# User{
#     nickname : 名前
#     old : 年齢
#     birth : 誕生日
#     state : 出身地
# }


# 途中で名前が変わった際にいちいちデータを修正するのが面倒だと思ったあなたは、生徒の構造体と新しい名前を受け取り、その名前を修正する関数 changeName を作成し、それを用いて生徒の名前を更新することにしました。

# クラスの人数と全員の情報、更新についての情報が与えられるので、入力に従って名前を更新した後のクラスのメンバーの情報を出力してください。

# 入力される値
# N K
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N
# a_1 nn_1
# ...
# a_K nn_K


# ・ 1 行目では、paiza君のクラスの人数 N と名前更新の回数 K が与えられます。
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が順に半角スペース区切りで与えられます。
# ・ 続く K 行では、名前を更新する生徒の番号 a_i と、その人の新しい名前 nn_i が空白区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# n_1 o_1 b_1 s_1
# ...
# n_N o_N b_N s_N


# 名前の更新を全て終えた後の各クラスメートの情報を生徒番号の小さい順に入力と同様の形式でまとめたものを出力してください。

# 入力例1
# 1 1
# koko 23 04/10 tokyo
# 1 nana

# 出力例1
# nana 23 04/10 tokyo

# 入力例2
# 3 2
# mako 13 08/08 nara
# taisei 16 12/04 nagano
# megumi 14 11/02 saitama
# 2 taihei
# 3 megu

# 出力例2
# mako 13 08/08 nara
# taihei 16 12/04 nagano
# megu 14 11/02 saitama

n, k = gets.chomp.split.map {|x|x.to_i}
students = []
# クラスメイトのデータを取得して構造体に格納
n.times do
    data = gets.chomp.split
    student = {
        nickname: data[0],
        old: data[1],
        birth: data[2],
        state: data[3]
    }
    students << student
end
# 名前変更の処理
k.times do
    index, new_name = gets.chomp.split
    index = index.to_i - 1 # 配列のインデックスは0から始まるので調整
    students[index][:nickname] = new_name
end

students.each do |x|
    puts "#{x[:nickname]} #{x[:old]} #{x[:birth]} #{x[:state]}"
end




# ********クラスの作成********
# エンジニアであり、社員を管理を管理する立場にあるあなたは、効率的に社員を管理するために、
# 各社員の社員番号 number と名前 name を持ち、加えて情報を返す関数を持つような構造体、
# すなわち次のようなメンバ変数とメンバ関数を持つ社員クラス class employee を作成することにしました。

# メンバ変数

# number : 整数
# name : 文字列


# メンバ関数
# getnum(){
#     return number;
# }
# getname(){
#     return name;
# }


# 入力で make number name と入力された場合は変数に number , name を持つ社員を作成し、
# getnum n と入力された場合は n 番目に作成された社員の number を、
# getname n と入力された場合は n 番目に作成された社員の name を出力してください。



# 入力される値
# N
# S_1
# ...
# S_N


# ・ 1 行目では、与えられる入力の回数 N が与えられます。
# 続く N 行では、次のいずれかの形式の入力が与えられます。
# ・ make number name
# ・ getnum n
# ・ getname n

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 入力に応じた出力をしてください。
# 各入力に対する出力の末尾には改行を入れてください。

# 入力例1
# 3
# make 1 nana
# getnum 1
# getname 1

# 出力例1
# 1
# nana

# 入力例2
# 7
# make 2742 mako
# getnum 1
# make 2782 taisei
# getname 2
# make 31 megumi
# getname 1
# getname 3

# 出力例2
# 2742
# taisei
# mako
# megumi


class Employee
    attr_reader :number, :name

    def initialize(number, name)
        @number = number
        @name = name
    end

    def getnum
        @number
    end

    def getname
        @name
    end
end

n = gets.chomp.to_i
employees = []

n.times do
    input = gets.chomp.split
    command = input[0]

    case command
    when 'make'
        number = input[1].to_i
        name = input[2]
        employees << Employee.new(number, name)
    when 'getnum'
        index = input[1].to_i - 1 #整数に変換して1を引きます（0ベースのインデックスに変換するため）
        puts employees[index].getnum
    when 'getname'
        index = input[1].to_i - 1
        puts employees[index].getname
    end
end



# ユーザーが make number name という形式で入力すると、この入力は gets.chomp.split によって分割されます。
# 例えば、"make number name" という入力は、input 配列として ["make", "number", "name"] になります。
# command = input[0]   ここでは "make" が格納される
# case 文で command が 'make' かどうかをチェックします。

# input[1]は"number"
# input[2]は"name"





# ********クラスのメンバの更新********
# エンジニアであり、社員を管理する立場にあるあなたが勤める会社には、効率的に社員を管理するために、次のようなメンバ変数とメンバ関数を持つ社員クラス class employee が存在しています。

# メンバ変数
# 整数 number, 文字列 name

# メンバ関数

# getnum(){
#     return number;
# }
# getname(){
#     return name;
# }


# しかし、この社員クラスについて、社員番号や名前が変わった際にいちいち手動で更新するのは面倒だと感じたあなたは、引数に元の社員番号と新しい社員番号を指定すれば、新しい社員番号に更新してくれる関数 change_num と 引数に元の名前と新しい名前を指定すれば、新しい名前に更新してくれる関数 change_name を作成することにしました。

# 入力で make number name と入力された場合は変数にnumber, nameを持つ社員を作成し、getnum nと入力された場合は n 番目に作成された社員の number を、getname n と入力された場合は n 番目に作成された社員の name を出力してください。

# また、 change_num n newnum と入力された場合は、n 番目に作成された社員の number を、 newnum に変更し、 change_name n newname と入力された場合は、n 番目に作成された社員の name を、 newname に変更してください。

# 入力される値
# N
# S_1
# ...
# S_N


# ・ 1 行目では、与えられる入力の回数 N が与えられます。
# ・ 続く N 行では、次のいずれかの形式の入力が与えられます。
# ・ make number name
# ・ getnum n
# ・ getname n
# ・ change_num n newnum
# ・ change_name n newname

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 入力に応じた出力をしてください。
# 各入力に対する出力の末尾には改行を入れてください。

# 入力例1
# 4
# make 3 nana
# getnum 1
# change_num 1 5
# getnum 1

# 出力例1
# 3
# 5

# 入力例2
# 12
# make 2742 makoto
# getnum 1
# make 2782 taro
# getname 1
# getname 2
# change_num 2 9927
# change_name 1 mako
# getnum 2
# make 31 meu
# change_name 3 meumeu
# getnum 3
# getname 1

# 出力例2
# 2742
# makoto
# taro
# 9927
# 31
# mako



class Employee
    attr_reader :number, :name

    def initialize(number, name)
        @number = number
        @name = name
    end

    def getnum
        @number
    end

    def getname
        @name
    end

    def change_num(new_number)
        @number = new_number
    end

    def change_name(new_name)
        @name = new_name
    end

end

n = gets.chomp.to_i
employees = []
n.times do
    input = gets.chomp.split
    command = input[0]
    case command
    when 'make'
        number = input[1].to_i
        name = input[2]
        employees << Employee.new(number, name)
    when 'getnum'
        index = input[1].to_i - 1 #["getnum" "n"] と入力される。[1]なのでn
        puts employees[index].getnum
    when 'getname'
        index = input[1].to_i - 1 #["getname" "n"] と入力される。[1]なのでn
        puts employees[index].getname
    when 'change_num'
        index = input[1].to_i - 1 #["change_num" "n" "newnum"] と入力される。[1]なのでn
        new_number = input[2].to_i
        employees[index].change_num(new_number)
    end
    when 'change_name'
        index = input[1].to_i - 1  #["change_name" "n" "newname"] と入力される。[1]なのでn
        new_name = input[2]
        employees[index].change_name(new_name)
    end
end