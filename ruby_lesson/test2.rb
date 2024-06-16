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