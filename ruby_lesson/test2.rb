# メモ
# gets.chomp.split(' ').map {|x|x.to_i}
# このコードは、1行で複数の整数がスペースで区切られている場合に使うもので、改行で区切られた入力には適していません。
# ちな、入力が改行で区切られている場合（例：複数行にわたって値が入力される場合）は、
# 以下のように、gets.chomp で取得した各行を順に処理する必要があります。
# n = gets.chomp.to_i
# a = []
# n.times do
#     a << gets.chomp.to_i
# end

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
    return -1  # 見つからなかったら -1 を返す
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
    words = s.strip.split(' ')
    words.last.length
end

# strip: 前後の空白を除去

# split(' '): 空白で「単語」に分割
# split('')だと["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d"] みたいに分割してしますので注意


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

# max_byメソッドの基本的な使い方
# array = [1, 5, 3, 9, 2]
# max = array.max_by { |n| n }
# puts max  # => 9

# words = ["apple", "banana", "grape", "watermelon"]
# longest = words.max_by { |word| word.length }
# puts longest  # => "watermelon"

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
# ransomNote の各文字が magazine に十分あるかどうかを確認しています。
# all? は「すべての文字について条件が true かどうか」をチェックします。
# count(char) を使って、文字の出現回数を比較しています。

# ransomNote.count(char)はransomNote の中に、文字 char が何回出てくるかを数えます。
# magazine.count(char)はmagazine の中に文字 char が何回出てくるかを数えます。
# ransomNote.count(char) <= magazine.count(char)は
# magazine の中に、ransomNote で必要な文字が足りてるかどうかを判定するという意味


# each_charとは？
# 例
# "hello".each_char { |char| puts char }
# このコードは以下の出力を生成します：
# h
# e
# l
# l
# o

# each_char は 文字列の1文字ずつに対して処理を行うためのメソッド

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

# each_char：1文字ずつ処理
# tally：出現回数をハッシュにしてくれる
# 例：
# "anagram".each_char.tally
# => {"a"=>3, "n"=>1, "g"=>1, "r"=>1, "m"=>1}

# "nagaram".each_char.tally
# => {"n"=>1, "a"=>3, "g"=>1, "r"=>1, "m"=>1}



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
    single = 0 # XOR を始めるための「初期値」
    nums.each { |num| single ^= num }
    single
end

# ^= の意味
# a ^= b は a = a ^ b と同じ意味です。
# ^（XOR演算）は、対応するビットが異なる場合に1を返す演算です。
# a	b	a ^ b
# 0	0	0
# 0	1	1
# 1	0	1
# 1	1	0

# 動作原理
# 配列内の 偶数回出現する数はすべて打ち消される。
# 1回だけ出現する数が残る。


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
# != は「等しくない」ことを意味する比較演算子です。
# このコードでは number % 13 != 0 の条件が成立する間（つまり、number が 13 で割り切れない間）、
# number を 1 ずつ増やし続けます。
# そして、number が 13 で割り切れるようになったらループを抜け、その値を出力します。


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

# 例: 入力が "hello world" の場合、s_1 は "hello"、s_2 は "world" となります。
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


# Array.new(n, "paiza")
# "paiza" を n 回格納した配列を作成
# 例：n = 3 → ["paiza", "paiza", "paiza"]
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
# なぜ to_i を使わないの？
"00123".length	#5（文字列としての長さ）
"00123".to_i	#123 に変換されて 3 桁に
# to_i を使うと「桁数が削れてしまう」可能性があるので、文字列のまま扱う必要があるんです。


# ********部分文字列********
# 文字 a と文字列 S が与えられるので、 S に a が含まれているかどうか判定し、
# 含まれている場合には “YES” を、そうでない場合には “NO” を出力してください。

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
# 0 ~ 999 の整数 n が与えられます。 n が 3 桁の数である場合には n をそのまま出力し、
# n が 2 桁の数である場合には n の先頭に 0 をひとつ、 1 桁の数である場合には n の先頭に 0 をふたつ加えたものを出力してください。

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
# 時刻を表す長さ 5 の文字列 S が “XX” の形式で与えられます。入力された時刻を時と分に分け、時、分の順番で改行区切りで出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# S
# 1 行目に文字列 S が与えられます。
# S
# S は “XX” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、十の位は 0 で埋められます。
# また、 00:00 から 23:59 までの 24 時間表記を採用しています。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# 入力された時刻を時と分に分け、時、分の順番で改行区切りで出力してください（2行出力する）。
# その際、入力値の十の位が 0 である場合には一の位だけ出力してください。
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
# S は “XX” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、十の位は 0 で埋められます。
# また、 00:00 から 23:59 までの 24 時間表記を採用しています。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# 与えられた時刻の 30 分後の時刻を "XX" の形式で出力してください。
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
        break #最初に見つかった人でループ終了
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
# 1 行目には上で説明した数 N, M, K が半角スペース区切りで与えられ、
# 2 行目から (N + 1) 行目までには各参加者が紙に書いた数字が M 個ずつ半角スペース区切りで、 N 回与えられます。
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

# n.times do は「N人分の入力を1人ずつ処理する」ためのループです。
# 各参加者の得点を個別に計算して出力するには、人数分だけ処理を繰り返す必要がある




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


# 参考 間違った書き方

a.each do |x|
    puts x.sort
end

# x は a の中の1つ1つの要素（つまり整数）
# .sort は 配列にしか使えないメソッド
# だから、x.sort を呼ぼうとすると エラーになります

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

#     ・りんごの数が異なる場合、りんごの数で降順にソートします。<=> 演算子は、Rubyの宇宙船演算子と呼ばれ、2つの値を比較します。
#       pair2[0] <=> pair1[0] は pair2 のりんごの数が pair1 のりんごの数よりも多い場合に正の値を返し、
#       少ない場合に負の値を返し、等しい場合に0を返します。

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
    name, zaisan = gets.chomp.split # 名前と財産を空白区切りで読み取り
    people[name] = zaisan.to_i  #要素を追加する場合は、ハッシュ[] = 値 の構文。name がハッシュのキーとなり、wealth.to_i がその値として格納されます。
end

s = gets.chomp # 検索対象の名前 s を読み取り
puts people[s] # 該当人物の財産を出力




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
    damage[target] += dmg #damage[target] に dmg を加算して、ターゲットが受けた累積ダメージを更新
end

# 最後に調べる名前 s を取得し、その人の合計ダメージをハッシュから取得して出力します。
s = gets.chomp
puts damage[s]




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
    target, dmg = gets.chomp.split
    dmg = dmg.to_i
    damage[target] += dmg
end
# 名前をアルファベット順にソートし、ダメージを出力
damage.keys.sort.each do |name|
    puts damage[name]#name はここでキーを指し、damage[name] は対応するダメージを出力します。
end
# damage.keys は、ハッシュ damage のすべてのキー（名前）の配列を取得します。
# damage.keys.sort は、取得したキー（名前）の配列をアルファベット順にソートします。
# damage.keys.sort は、ハッシュのキー（name たち）を アルファベット順 にソートした配列
# sort メソッドはデフォルトで昇順（アルファベット順）に並べ替えます。



# 3人の名前をキーとして登録、ダメージを 0 に初期化

# damage = {
#   "Alice" => 0,
#   "Bob" => 0,
#   "Charlie" => 0
# }

# 最終的な damage の中身
# damage = {
#   "Alice" => 25,  # 10 + 15
#   "Bob" => 5,     # 5
#   "Charlie" => 8  # 8
# }


# コード実行時の target と dmg の値
# ループ回数	gets.chomp.split の入力	    target の値	    dmg の値（整数）	damage[target] の変化
# 1回目	    "Alice 10"	                "Alice"	            10	             damage["Alice"] += 10 → 10
# 2回目	    "Bob 5"	                    "Bob"	            5	             damage["Bob"] += 5 → 5
# 3回目	    "Alice 15"	                "Alice"	            15	             damage["Alice"] += 15 → 25
# 4回目	    "Charlie 8"	                "Charlie"	        8	             damage["Charlie"] += 8 → 8


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
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、
#   i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が
#   順に半角スペース区切りで与えられます。

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
    puts "nickname : #{x[:nickname]}" #{x[:nickname]}の:nicknameはシンボル。
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


# 途中で名前が変わった際にいちいちデータを修正するのが面倒だと思ったあなたは、生徒の構造体と新しい名前を受け取り、
# その名前を修正する関数 changeName を作成し、それを用いて生徒の名前を更新することにしました。

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
    students[index][:nickname] = new_name #index 番目の :nickname の値を new_name に更新。
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
# エンジニアであり、社員を管理する立場にあるあなたが勤める会社には、効率的に社員を管理するために、
# 次のようなメンバ変数とメンバ関数を持つ社員クラス class employee が存在しています。

# メンバ変数
# 整数 number, 文字列 name

# メンバ関数

# getnum(){
#     return number;
# }
# getname(){
#     return name;
# }


# しかし、この社員クラスについて、社員番号や名前が変わった際にいちいち手動で更新するのは面倒だと感じたあなたは、
# 引数に元の社員番号と新しい社員番号を指定すれば、新しい社員番号に更新してくれる関数 change_num と 引数に元の名前と新しい名前を指定すれば、
# 新しい名前に更新してくれる関数 change_name を作成することにしました。

# 入力で make number name と入力された場合は変数にnumber, nameを持つ社員を作成し、getnum nと入力された場合は n 番目に作成された
# 社員の number を、getname n と入力された場合は n 番目に作成された社員の name を出力してください。

# また、 change_num n newnum と入力された場合は、n 番目に作成された社員の number を、 newnum に変更し、
# change_name n newname と入力された場合は、n 番目に作成された社員の name を、 newname に変更してください。

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
    when 'change_name'
        index = input[1].to_i - 1  #["change_name" "n" "newname"] と入力される。[1]なのでn
        new_name = input[2]
        employees[index].change_name(new_name)
    end
end





# ********偶奇の判定 (paizaランク D 相当)********

# 長さ N の数列Aが与えられます。この数列に含まれる偶数の要素の個数と、奇数の要素の個数を答えてください。

# 入力される値
# N
# A1 A2 ... AN

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 偶数の要素の個数Eと、奇数の要素の個数Oを半角スペース区切りで出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# E O


# 入力例1
# 5
# 1 2 3 4 5

# 出力例1
# 2 3

# 入力例2
# 1
# 1

# 出力例2
# 0 1


n = gets.chomp.to_i #最初の入力行から整数 n を取得しています。この n は数列 A の長さを示しています。
a = gets.chomp.split.map {|x|x.to_i}

even_count = 0
odd_count = 0

a.each do |x|
    if x.even?
        even_count += 1
    else
        odd_count += 1
    end
end
puts "#{even_count} #{odd_count}"

# a = gets.chomp.split.map(&:to_i)がどのように動作するか
# 入力が 5 10 15 20 だとすると、
# gets は入力を文字列として取得します。この場合、gets は "5 10 15 20\n" という文字列を返します。
# chomp は文字列の末尾から改行文字を削除します。したがって、"5 10 15 20\n" が "5 10 15 20" になります。
# split は空白文字で文字列を分割し、分割された要素を配列にします。この場合、"5 10 15 20" が ["5", "10", "15", "20"] という配列になります。
# map(&:to_i) は配列の各要素に対して to_i メソッドを呼び出し、文字列を整数に変換します。したがって、["5", "10", "15", "20"] が [5, 10, 15, 20] という整数の配列になります。
# a に整数の配列が格納されることで、配列の各要素に対して計算や判定を行うことが容易になります。Ruby では、配列に対して繰り返し処理を行うメソッドが豊富に用意されているため、偶数や奇数のカウントも簡単に行えます。
# each メソッドを使うと、配列の各要素に対して処理を簡単に適用できます。





# ********曜日の判定 (paizaランク D 相当)********
# ある月の 1 日は日曜日、 2 日は月曜日...です。X日は何曜日でしょう。

# 入力される値
# X

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 答えとなる曜日Sを短縮した表記で出力してください。
# 具体的に、日曜日の場合はSun、月曜日の場合はMon、火曜日の場合はTue、水曜日の場合はWed、
# 木曜日の場合はThu、金曜日の場合はFri、土曜日の場合はSatを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# S

# 入力例1
# 1

# 出力例1
# Sun

# 入力例2
# 11

# 出力例2
# Wed

x = gets.chomp.to_i
days_of_week = ["Sun", "Mon" ,"Tue" ,"Wed" ,"Thu" ,"Fri" ,"Sat"]
index = (x - 1) % 7
puts days_of_week[index]


# day_index = (x - 1) % 7 で7で割る理由は、曜日が7日周期で繰り返されるから
# 1日目 (x = 1): (1 - 1) % 7 = 0 → days_of_week[0] → Sun
# 2日目 (x = 2): (2 - 1) % 7 = 1 → days_of_week[1] → Mon
# 3日目 (x = 3): (3 - 1) % 7 = 2 → days_of_week[2] → Tue
# 8日目 (x = 8): (8 - 1) % 7 = 0 → days_of_week[0] → Sun
# 15日目 (x = 15): (15 - 1) % 7 = 0 → days_of_week[0] → Sun



# ********けた数の測定 (paizaランク D 相当)********
# 整数Nが与えられます。Nのけた数を出力してください。

# 入力される値
# N

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N のけた数Dを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
# D

# 入力例1
# 5

# 出力例1
# 1

# 入力例2
# 100

# 出力例2
# 3

n = gets.chomp #整数に対してlengthメソッドは存在しないのでto_iは不要。文字列のままでよい。
digit_count = n.length
puts digit_count



# ********足したり引いたり (paizaランク C 相当)********
# 整数N, A, B ( - 99 ≦ N, A, B ≦ 100 ) があります。
# 以下の 2 つの操作をそれぞれ 1 回ずつおこなったとき、Nを 0 にできる場合はYESを、
# できない場合はNOを出力してください。
# 1. NにAを足す、またはNからAを引く
# 2. NにBを足す、またはNからBを引く

# 入力される値
# N A B

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# YESまたはNOを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

# YES
# または
# NO

# 入力例1
# -10 8 2

# 出力例1
# YES

# 入力例2
# 11 1 2

# 出力例2
# NO

n, a, b = gets.chomp.split.map {|x|x.to_i}
# 4つの組み合わせの結果を計算する
result1 = n + a + b
result2 = n - a + b
result3 = n + a - b
result4 = n - a - b

# いずれかが0であればYES
if result1 == 0 || result2 == 0 || result3 == 0 || result4 == 0
    puts "YES"
else
    puts "NO"
end


# ********同値判定 (paizaランク C 相当)********

# 整数N, 2 つの数列A, B が与えられます。
# 1 ≦ i ≦ N を満たす整数 i のうち、A_i と B_i が等しくなるような i の個数を求めてください。

# 入力される値
# N
# A_1 A_2 ... A_N
# B_1 B_2 ... B_N

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# A_i == B_iである要素の個数Cを求めてください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

# C


# 入力例1
# 5
# 1 2 3 4 5
# 1 20 30 4 5

# 出力例1
# 3

n = gets.chomp.to_i
# a, b = gets.chomp.split.map {|x|x.to_i} ←この書き方はaとbが単一の整数配列にならず、aとbの両方に1つの値しか入らない可能性が
a = gets.chomp.split.map {|x|x.to_i}
b = gets.chomp.split.map {|x|x.to_i}

count = 0
n.times do |x|
    if a[x] == b[x]
        count += 1
    end
end
puts count





# ********終了判定 2 (paizaランク C 相当)********

# 2 以上の整数N, Kが与えられます。
# 「Nを 2 倍した数でNを更新する」という操作を何度か繰り返すことを考えます。
# このとき, ちょうどある回数 M で N の値は K 以上になります。この時点で操作の繰り返しを終了することにします。

# この繰り返しの回数Mを求めてください。(Mは 0 でも構いません)

# 例えば、Nを 2 、Kを 18 とします。
# 上記の操作を 3 回繰り返すと、N = 16 となります。
# 4 回くりかえすと、N = 32 となり、N >= K が成立します。ここで操作を終了し、最終的な操作の回数Mは 4 となります。

# 入力される値
# N K

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます

# 期待する出力
# 答えとなる数値Sを 1 行で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。


# S

# 入力例1
# 2 18

# 出力例1
# 4

n, k = gets.chomp.split.map {|x|to_i}
m = 0
# NがK以上になるまで2倍する操作を繰り返す
while n < K
    n *= 2
    m += 1
end

puts m


# split を使って配列にする理由は、入力が複数の数値である場合、その数値を分割して個別に処理するためです。
# 具体的には、このコードでは次のような入力を想定しています：
# 2 18
# この場合、gets.chomp.split.map(&:to_i) を使うと、
# 2 と 18 という2つの数値をそれぞれ別々に n と k に割り当てることができます。
# split で配列にする理由は、標準入力から受け取った複数の数値を個別に処理するためです。
# この方法を使うと、複数の数値を簡単に取得し、それらをそれぞれの変数に割り当てて操作することができます。




# ********崖に落ちるか判定 (paizaランク C 相当)********
# 直線上の道があり、最初は X = 0 の地点にいます。この道はX = T + 0.1 の地点で崖になっています。
# また、 1 歩でX軸方向にK進むことができます。崖に落ちずにN歩進むことはできるでしょうか。

# 入力される値
# N K T
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 崖に落ちずにN歩進むことができる場合はYESを、そうではない場合はNOを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# YES
# または
# NO

# 入力例1
# 2 5 10

# 出力例1
# YES

# 入力例2
# 4 2 7

# 出力例2
# NO

n, k, t = gets.chomp.split.map {|x|x.to_i}

if n * k < t + 0.1
    puts "YES"
else
    puts "NO"
end

# n * kはN歩進んだ後の位置を計算
# N * K が T + 0.1 未満であれば崖に落ちません。



# ********タイルの敷き詰め (paizaランク C 相当)********
# 高さH、幅Wの箱( 0 ≦ H, W ≦ 10^9 )があります。
# この箱を 1 つ以上の高さ 2 、幅 2 の四角いタイルで敷き詰めます。
# 箱に隙間なくタイルを敷き詰めることはできますか？

# 入力される値
# H W
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 箱に隙間なくタイルを敷き詰めることができる場合はYESを、そうではない場合はNOを出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# YES
# または
# NO

# 入力例1
# 6 2

# 出力例1
# YES

# 入力例2
# 6 5

# 出力例2
# NO

h, w = gets.chomp.split.map { |x|x.to_i }

# 高さと幅の両方が2で割り切れるかを確認
if h % 2 == 0 && w % 2 == 0
    puts "YES"
else
    puts "NO"
end
# タイルは2x2の正方形であり、箱全体がこれにフィットするためには、箱の高さと幅の両方が2の倍数でなければなりません。





# ********ある数をある回数表示 1 (paizaランク D 相当)********
# 3 を 8 回、改行区切りで出力してください。
# 出力の末尾には改行を入れてください。


# 3
# 3
# 3
# 3
# 3
# 3
# 3
# 3


8.times do
    puts 3
end


# ********ある数をある回数表示 2 (paizaランク D 相当)********
# 入力される値
# N K
# ・ 1 行目に整数 N, K が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N を K 回、改行区切りで出力してください。
# 出力の末尾には改行を入れてください。

# 入力例1
# 3 8

# 出力例1
# 3
# 3
# 3
# 3
# 3
# 3
# 3
# 3

n, k = gets.chomp.split.map {|x|to_i}
k.times do
    puts n
end





# ********数列の A 番目から B 番目までの和 (paizaランク D 相当)********
# 長さ N の数列 a (a_1, a_2, ..., a_N) と、整数 A, B が与えられます。
# この数列の a_A から a_B までの和を計算し、出力してください。

# 入力される値
# N A B
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N, A, B が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 数列の A 番目から B 番目までの和を計算し、出力してください。
# 出力の末尾には改行を入れてください。

# 入力例1
# 5 1 3
# 1 2 3 4 5

# 出力例1
# 6

# 入力例2
# 10 5 10
# 1 2 3 4 5 6 7 8 9 10

# 出力例2
# 45

# 入力例3
# 6 1 1
# 8 1 3 8 1 3

# 出力例3
# 8

n, a, b = gets.chomp.split.map { |x|x.to_i }
number = gets.chomp.split.map { |x|x.to_i }
# 指定された範囲の和を計算する
sum = number[a - 1..b - 1].sum
puts sum

# Ruby の配列スライス（[start..end]）を使って、A 番目から B 番目までの部分配列を取り出し、.sum で合計値を算出



# ********数列の値を全部 * 2 して出力 (paizaランク D 相当)********
# 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
# この数列の全ての要素を 2 倍し、改行区切りで出力してください。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

n = gets.chomp.to_i
number = gets.chomp.split.map { |x|x.to_i }
number.each do |x|
    result = x * 2
    puts result
end








# ********数列同士の引き算 (paizaランク D 相当)********
# 長さ N の数列 a (a_1, a_2, ..., a_N) と b (b_1, b_2, ..., b_N) が与えられます。
# a の各要素から b の各要素を引いた結果 (a_1 - b_1, a_2 - b_2, ..., a_N - b_N) を、改行区切りで出力してください。

# 入力される値
# N
# a_1 a_2 ... a_N
# b_1 b_2 ... b_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。
# ・ 3 行目に長さ N の数列 b が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a の各要素から b の各要素を引いた結果を、改行区切りで出力してください。
# 出力の末尾には改行を入れてください。


# a_1-b_1
# a_2-b_2
# ...
# a_N-b_N

# 入力例1
# 5
# 1 2 3 4 5
# 5 4 3 2 1

# 出力例1
# -4
# -2
# 0
# 2
# 4

# 入力例2
# 10
# 2 3 4 5 6 7 8 9 10 11
# 1 2 3 4 5 6 7 8 9 10

# 出力例2
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1

n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

n.times do |i|
    puts a[i] - b[i]
end

# n.each do |i| は配列やレンジオブジェクトに対して使う方法であり、n が整数の場合は使用できません。
# 代わりに、n 回のループを実行するためには n.times do |i| を使用します。



# a, b = gets.chomp.split.map { |x|x.to_i }
# これは 「a と b に1つずつ値を代入」するだけなので、数列がすべて入るわけではありません。
# → a には最初の1個、b には次の1個だけが入ってしまいます。

# ********数列の反転 (paizaランク D 相当)********

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 数列の要素を逆順に、改行区切りで出力してください。
# 出力の末尾には改行を入れてください。

# a_N
# a_(N-1)
# ...
# a_1

n = gets.chomp.to_i
a = gets.chomp.split.map {|x|x.to_i}
a.reverse.each do |x|
    puts x
end



# ********九九の表示 1 (paizaランク D 相当)********

result = (1..9).map {|x|x * 8}
puts result.join(' ')
# map を使う理由は、1から9までの各数に対して特定の計算を行い、その結果を新しい配列としてまとめるためです。
# each を使って同じことを行う場合、次のように書けますが、少し冗長になります。
result = []
(1..9).each do |i|
  result << 8 * i
end
puts result.join(" ")




# ********九九の表示 2 (paizaランク D 相当)********
# 整数 N が与えられます。
# 九九の N の段を半角スペース区切りで出力してください。

# 入力される値
# N


# ・ 1 行目に整数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 九九の N の段を半角スペース区切りで出力してください。
# 出力の末尾には改行を入れてください。


# N*1 N*2 ... N*9

# 入力例1
# 1

# 出力例1
# 1 2 3 4 5 6 7 8 9

# 入力例2
# 5

# 出力例2
# 5 10 15 20 25 30 35 40 45
n = gets.chomp.to_i
result = (1..9).map { |x| x * n }
puts result.join(' ')




# ********2 の累乗を表示 (paizaランク D 相当)********
# 整数 N が与えられます。
# 2 の 1 乗から 2 の N 乗までを改行区切りで出力してください。

# 入力される値
# N


# ・ 1 行目に整数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 2 の 1 乗から 2 の N 乗までを改行区切りで出力してください。
# 出力の末尾には改行を入れてください。


# 2^1
# 2^2
# ...
# 2^N


# 入力例1
# 2

# 出力例1
# 2
# 4

# 入力例2
# 5

# 出力例2
# 2
# 4
# 8
# 16
# 32

# 入力例3
# 10

n = gets.chomp.to_i
# 2 の 1 乗から 2 の N 乗までを計算して出力
(1..n).each do |i|
    puts 2 ** i
end


# ********数列の最大値 (paizaランク D 相当)********
# 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
# この数列の最大値を出力してください。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 数列の最大値を出力してください。
# 出力の末尾には改行を入れてください。

# 入力例1
# 5
# 1 2 3 4 5

# 出力例1
# 5

# 入力例2
# 5
# 1 5 4 3 2

# 出力例2
# 5

# 入力例3
# 6
# 8 1 3 8 1 3

# 出力例3
# 8

n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
max_value = a.max
puts max_value




# 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
# この数列の何番目に 1 があるか出力してください。
# 数列の 1 つ目の要素を 1 番目とし、数列には必ず 1 がひとつだけ含まれることとします。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。
# ・ 数列 a には必ず 1 がひとつだけ含まれる。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 数列の何番目に 1 があるか出力してください。
# 出力の末尾には改行を入れてください。

# 入力例1
# 5
# 5 4 3 2 1

# 出力例1
# 5

# 入力例2
# 5
# 5 1 4 3 2
n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
index_of_one = a.index(1) # 1の位置を見つける
puts index_of_one + 1 # インデックスは0から始まるので、1を加算して結果を出力


# 別解（each_with_index 使用）
a.each_with_index do |val, i|
    if val == 1
        puts i + 1
        break
    end
end






# 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
# この数列の中に 1 が何個あるか出力してください。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に長さ N の数列 a が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 数列の中に 1 が何個あるか出力してください。
# 出力の末尾には改行を入れてください。

# 入力例1
# 5
# 1 1 1 1 1

# 出力例1
# 5
n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
count_of_ones = a.count(1) #配列 a の中で、値が1である要素の個数を数る。
puts count_of_ones



# ********未知数個の数の受け取り (paizaランク D 相当)********
# 長さがわからない数列 a が入力されます。
# -1 が入力されるまで、受け取った数を改行区切りで出力してください。

# 入力される値
# a_1 a_2 ... -1


# ・ 数列 a が 1 行で与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# -1 が入力されるまで、受け取った数を改行区切りで出力してください。
# 出力の末尾には改行を入れてください。


# a_1
# a_2
# ...
# -1

# 入力例1
# 1 2 3 4 5 -1

# 出力例1
# 1
# 2
# 3
# 4
# 5
# -1

a = gets.chomp.split.map { |x| x.to_i }
a.each do |number|
    puts number
    break if number == -1
end



# ********未知数個の文字列の受け取り (paizaランク D 相当)********
# 複数の文字列が入力されます。文字列の数はわかりません。
# EOF が入力されるまで、受け取った文字列を改行区切りで出力してください。

# 入力される値
# s_1 s_2 ... EOF


# ・ 複数の文字列が 1 行で与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# EOF が入力されるまで、受け取った数を改行区切りで出力してください。
# 出力の末尾には改行を入れてください。


# s_1
# s_2
# ...
# EOF

# 入力例1
# abc def ghi jkl EOF

# 出力例1
# abc
# def
# ghi
# jkl
# EOF

# 入力例2
# as haj jsjda fj sklkf jklfjs s fhf sjhf EOF

# 出力例2
# as
# haj
# jsjda
# fj
# sklkf
# jklfjs
# s
# fhf
# sjhf
# EOF


s = gets.chomp.split
s.each do |x|
    puts x
    break if x == "EOF"
end





# ********奇数だけ出力 (paizaランク D 相当)********
# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# この N 個の整数のうち、a_1 から順に奇数か偶数か判定し、奇数の場合のみ改行区切りで出力してください。
# また、N 個の整数には奇数が少なくとも 1 つ含まれています。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N 個の整数のうち、a_1 から順に奇数か偶数か判定し、奇数の場合のみ改行区切りで出力してください。

# 入力例1
# 5
# 1 2 3 4 5

# 出力例1
# 1
# 3
# 5

# 入力例2
# 5
# 1 3 5 7 9

n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
a.each do |num|
    puts num if num.odd?
end


# 少し冗長だけどif elseでも書ける。
a.each do |x|
    if x.even?
        puts x
    else
        # 奇数のときは何もしない
    end
end


# ********割り切れる数だけ出力 (paizaランク D 相当)********
# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# この N 個の整数のうち、a_1 から順に 3 で割り切れるか判定し、割り切れる場合のみ改行区切りで出力してください。
# また、N 個の整数には 3 で割り切れる数が少なくとも 1 つ含まれています。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N 個の整数のうち、a_1 から順に 3 で割り切れるか判定し、割り切れる場合のみ改行区切りで出力してください。

# 入力例1
# 6
# 1 2 3 4 5 6

# 出力例1
# 3
# 6

# 入力例2
# 5
# 3 6 9 12 15

n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
a.each do |num|
    puts num if num % 3 == 0
end



# ********偶奇の判定 (paizaランク D 相当)********

# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# この N 個の整数について、a_1 から順に 奇数か偶数か判定し、奇数なら odd 、偶数なら even を改行区切りで出力してください。


# 入力例
# 4
# 1 2 3 4


# 出力例
# odd
# even
# odd
# even

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます

# 期待する出力
# N 個の整数について、a_1 から順に 奇数か偶数か判定し、奇数なら odd 、偶数なら even を改行区切りで出力してください。
n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
a.each do |num|
    if num % 2 == 0
        puts "even"
    else
        puts "odd"
    end
end


# ********カウント変数を使った計算 (paizaランク D 相当)********
# N 個の整数 M_1, M_2, ..., M_N があります。
# i 番目の M を M_i とするとき、M_i * i を改行区切りで出力してください。
# 例えば、M_5 が 3 の場合、3 * 5 = 15 となります。

# 入力される値
# N
# M_1 M_2 ... M_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に N 個の整数 M_1, M_2, ..., M_N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# i 番目の M を M_i とするとき、M_i * i を改行区切りで出力してください。


# M_1 * 1
# M_2 * 2
# ...
# M_N * N

# 入力例1
# 5
# 1 2 3 4 5

# 出力例1
# 1
# 4
# 9
# 16
# 25

# 入力例2
# 5
# 5 4 3 2 1

# 出力例2
# 5
# 8
# 9
# 8
# 5

# 1番目の要素 5 を 1 と掛け算: 5 * 1 = 5
# 2番目の要素 4 を 2 と掛け算: 4 * 2 = 8
# 3番目の要素 3 を 3 と掛け算: 3 * 3 = 9
# 4番目の要素 2 を 4 と掛け算: 2 * 4 = 8
# 5番目の要素 1 を 5 と掛け算: 1 * 5 = 5

n = gets.chomp.to_i
m = gets.chomp.split.map { |x| x.to_i }
m.each_with_index do |value, index|
    puts value * (index + 1) #各要素をそのインデックス番号（1 から始まる）と掛け算し、その結果を出力します。
end

# each_with_index を使って、配列 m の各要素 value とそのインデックス index を同時に取得。



# ********2 で何回割れる？ (paizaランク D 相当)********
# 整数 N が与えられます。
# N が何回 2 で割れるかを求め、出力してください。

# 入力される値
# N


# ・ 1 行で整数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N が何回 2 で割れるかを求め、出力してください。

# 入力例1
# 4

# 出力例1
# 2

# 入力例2
# 16

# 出力例2
# 4

n = gets.chomp.to_i
# 割れる回数を数えるためのカウンタを初期化
count = 0
# n が 2 で割り切れる間ループを回す
while n % 2 == 0
    n /= 2
    count += 1
end
puts count

# n /= 2は、n を 2 で割って、次のチェックに備えて更新している。
# もし n /= 2 を書かなかったら無限ループになります

# ********10 進数から 2 進数に変換 (paizaランク D 相当)********
# 10 進数で表された整数 N が与えられます。
# N を 2 進数に変換して出力してください。

# 入力される値
# N


# ・ 1 行で整数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N を 2 進数に変換して出力してください。

# 入力例1
# 4
# 出力例1
# 100

# 入力例2
# 6
# 出力例2
# 110

# 入力例3
# 10
# 出力例3
# 1010

n = gets.chomp.to_i
puts n.to_s(2)
# n.to_s(2) は、整数 n を2進数の文字列に変換するメソッド




# ********毎日増加するお金 (paizaランク D 相当)********
# 現在所持金を A 円持っています。
# 所持金が毎日 10% ずつ増えるとき、何日後に B 円を超えるか出力してください。
# また、増加するお金は小数点以下切り捨てで考えることとします。
# 例として、所持金が 831 円 のとき、10% は 83.1円 ですが、増加するお金は 83 円 です。

# 入力される値
# A B


# ・ 1 行で整数 A B が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 所持金が毎日 10% ずつ増えるとき、何日後に B 円を超えるか出力してください。

# 入力例1
# 10 15
# 出力例1
# 6

# 入力例2
# 10 100
# 出力例2
# 29

# 入力例3
# 813 10000
# 出力例3
# 27

a, b = gets.chomp.split.map { |x| x.to_i }
day = 0
money = a
while money < b #money が b を超えるまでループが続きます。
    money = (money * 1.1).floor
    day += 1
end
puts day




# ********加算された数列の最大値 (paizaランク D 相当)********

# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# a_i に i を足したとき、a_1 , ... , a_N の最大値を出力してください。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 1 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a_i に i を足したとき、a_1 , ... , a_N の最大値を出力してください。

# 入力例1
# 5
# 1 2 3 4 5

# 出力例1
# 10

# 入力例2
# 5
# 5 4 3 2 1

# 出力例2
# 6

n = gets.chomp.to_i # 要素数 n を取得
a = gets.chomp.split.map { |x| x.to_i } # 数列を整数配列に変換

result = a.each_with_index.map do |val, index|
    val + index + 1
end.max
puts result
# ブロックの箇所は一行でも書ける
result = a.each_with_index.map {|val, index| val + index + 1}.max



# ********1 はどこにある？ (paizaランク D 相当)********

# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# a_1, a_2, ..., a_N のうち、1 がある位置を先頭から順に改行区切りで出力してください。
# a_1 を 1 番目とし、a_1, a_2, ..., a_N には少なくとも 1 個は 1 が含まれます。

# 入力される値
# N
# a_1 a_2 ... a_N


# ・ 1 行目に整数 N が与えられます。
# ・ 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
# ・ a_1, a_2, ..., a_N には少なくとも 1 個は 1 が含まれます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# a_1, a_2, ..., a_N のうち、1 がある位置を先頭から順に改行区切りで出力してください。

# 入力例1
# 5
# 5 3 1 3 5
# 出力例1
# 3

# 入力例2
# 5
# 1 5 5 5 1
# 出力例2
# 1
# 5

n = gets.chomp.to_i
a = gets.chomp.split.map { |x| x.to_i }
# 1 の位置を記録する配列
positions = []
# 数列を走査して、1 の位置を記録する
a.each_with_index do |val, index|
    if val == 1
        positions << index + 1
    end
end
# 位置を出力する
positions.each do |i|
    puts i
end


# ********約数の個数 (paizaランク D 相当)********

# 整数 N が与えられます。
# N の約数の個数を出力してください。
# 約数とは、N を割り切る整数のことを指します。

# 入力される値
# N


# ・ 1 行で整数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# N の約数の個数を出力してください。

# 入力例1
# 10
# 出力例1
# 4

# 入力例2
# 100
# 出力例2
# 9

n = gets.chomp.to_i
count = 0 # count = []と書くと、count += 1 は「配列に数値を足す」という意味になり、型エラーになります。
(1..n).each do |x|
    if n % x == 0
        count += 1
    end
end
puts count




# 二分探索関連アルゴリズムメニュー
# ********中間値 (paizaランク D 相当)********

# 最も基本的な二分探索では、現在の探索範囲の中間値を求め、その値を利用して判定をおこないます。
# では、与えられた区間の中間値を求めるプログラムを作成してみましょう。

# 整数 l と r が与えられるので、(l + r) / 2 を計算して小数で出力してください。

# 入力される値
# l r

# ・ 1 行目に、区間の左端を表す整数 l と区間の右端を表す整数 r がこの順に半角スペース区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 答えの小数を 1 行で出力してください。
# 相対誤差または絶対誤差が 10^-6 以下であれば正解とみなします。

# 入力例1
# 3 6

# 出力例1
# 4.5

l, r = gets.chomp.split.map { |x| x.to_i }
# (l + r) / 2 を計算し、小数として出力します。
mid = (l + r) / 2.0
puts mid


# ********相乗平均 (paizaランク D 相当)********
# 二分探索では、現在の探索範囲の中間値を求め、その値を利用して判定をおこないます。
# このとき、中間値として l × r の正の平方根 √(l × r) を利用すると、探索の回数を減らせる場合があります。

# 整数 l と r が与えられるので、√(l × r) を計算して小数で出力してください。

# 入力される値
# l r

# ・ 1 行目に、区間の左端を表す整数 l と区間の右端を表す整数 r がこの順に半角スペース区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# 答えの小数を 1 行で出力してください。
# 相対誤差または絶対誤差が 10^-6 以下であれば正解とみなします。

# 入力例1
# 3 27

# 出力例1
# 9

l, r = gets.chomp.split.map { |x| x.to_i }
result = Math.sqrt(l * r)
pust result

# Math.sqrt メソッドを使うことで、与えられた数値の平方根を計算できます。
# 平方根は、ある数値を2乗して元の数値になる数のことです。
# Math.sqrt(4) の結果は 2 です。なぜなら、 2 * 2 = 4 だからです。
# Math.sqrt(9) の結果は 3 です。なぜなら、 3 * 3 = 9 だからです。
# 今回の問題では、l と r の積の平方根を計算するために Math.sqrt(l * r) を使用しています。具体的な計算の流れは以下の通りです。

# たとえば、l = 3 と r = 27 の場合を考えます。

# l * r を計算します。

# 3 * 27 = 81
# Math.sqrt(81) を計算します。

# Math.sqrt(81) は 9 です。
# したがって、出力は 9 になります。




# メソッドの理解
# ********RPGの攻撃シーンを作ろう********
# RPGの攻撃シーンを表示するプログラムで、teamのメンバーが順番にattackメソッドを呼び出します。
# さらに、teamのメンバーが攻撃した後に、敵の体力(enemy_hp)を表示するようになっています。敵の最初の体力は標準入力によって入力されます。

# ここに、teamのメンバーが攻撃した分だけ、敵の体力をマイナスするコードを追加してください。
# teamのメンバーの攻撃力は、あらかじめteamに定義されています。
# 敵の体力は、450以上とします。

# プログラムを実行して、正しく出力されれば演習課題クリアです！

def attack(person)
    puts "#{person}はスライムを攻撃した"
end

def output_ememy_hp(enemy_hp)
    puts "敵のHPは残り#{enemy_hp}です"
end

enemy_hp = gets.to_i
team = {"勇者" => 200, "戦士" => 150, "魔法使い" => 100}
team.each do |person, power|
    attack(person)
    # 以下に、敵の体力を減少させるコードを書く
    enemy_hp = enemy_hp - power
    output_ememy_hp(enemy_hp)
end




# 敵のHPが0以下になったら“スライムを倒した！”と表示してループを終了する
def attack(person)
    puts "#{person}はスライムを攻撃した"
end

def output_ememy_hp(ememy_hp)
    puts "敵のHPは残り#{ememy_hp}です"
end

ememy_hp = gets.to_i
team = {"勇者" => 200, "戦士" => 150, "魔法使い" => 100}
team.each do |person, power|
    attack(person)
    ememy_hp -= power
    if ememy_hp > 0
        output_ememy_hp(ememy_hp)
    else
        puts "スライムを倒した！"
        break
    end
end







# ********メソッドの記法を理解しよう********
def say_hello(msg)
    puts("hello #{msg}")
end

name = "paiza"
say_hello(name)
# メソッド呼び出しとして使用するには変数を引数として渡す必要があります。
# say_hello メソッドが name 変数の値 "paiza" を引数として受け取り、"hello paiza" を出力します。


# ********RPGの戦闘シーン********
# RPGの攻撃シーンを表示するプログラムで、enemiesの要素に順番に、「戦士はxxxと戦った」と表示するようになっています。
enemies = ["スライム", "モンスター", "ドラゴン"]
player = "勇者"

enemies.each {|enemy|
    puts "#{player}は、#{enemy}と戦った。"
}

puts "#{player}は、すべての敵を倒した。"

# 出力値
# 勇者は、スライムと戦った。
# 勇者は、モンスターと戦った。
# 勇者は、ドラゴンと戦った。
# 勇者は、すべての敵を倒した。



# ********引数のデフォルト値********
# say_helloメソッドが、デフォルト値を持った引数として定義してあります。
# このメソッドを呼び出して、「hello paiza」と表示させる。
def say_hello(target = "paiza")
    puts "hello #{target}"
end
say_hello()

# say_hello("勇者")   # hello 勇者
# say_hello()        # hello paiza


# ********スコープ********
# スコープとは、変数の有効範囲が決まっていることです。
# Rubyでは、メソッド定義の中と外ではローカル変数は分離しています。同じ名前の変数があっても、独立して利用できます。


msg = "paiza" # この外部の msg はメソッドの外で定義された変数で、メソッドの引数として渡されることで、メソッド内の msg として使用されます。
def say_hello(msg)
    puts "hello #{msg}"
end

say_hello(msg)
# 出力結果
# hello paiza

# スコープのポイント
# メソッドの中で定義された変数は、外からアクセスできない。
# メソッドの外で定義された変数も、中では使えない（使うには引数で渡す必要あり）。
# 同じ名前の変数があっても、スコープが違えば完全に別のもの。

# たとえば、こうしても外の msg は変わらない：
def say_hello(msg)
    msg = "world"
    puts "hello #{msg}"
end

msg = "paiza"
say_hello(msg)
puts msg  # ← これは "paiza" のまま

# 出力はこうなります：
# hello world
# paiza
# メソッド内で msg を変更しても、外の msg には影響なしです。



# ********キーワード引数********
# コードには、introduceメソッドが、キーワード引数として定義してあります。
# このメソッドを呼び出して、「私は、村人です。」と表示してください。

def introduce(name: "私は", role: "村人です")
    puts "#{name}、#{role}。"
end

# この下にメソッド呼び出しを記述する
introduce
# 以下のようにキーワード引数を明示的に渡して呼びだしてもよい。
# introduce(name: "私は", role: "村人です")



# ********九九の表********
# 九九の表を作成してみよう

# 期待する出力値
# 1, 2, 3, 4, 5, 6, 7, 8, 9
# 2, 4, 6, 8, 10, 12, 14, 16, 18
# 3, 6, 9, 12, 15, 18, 21, 24, 27
# 4, 8, 12, 16, 20, 24, 28, 32, 36
# 5, 10, 15, 20, 25, 30, 35, 40, 45
# 6, 12, 18, 24, 30, 36, 42, 48, 54
# 7, 14, 21, 28, 35, 42, 49, 56, 63
# 8, 16, 24, 32, 40, 48, 56, 64, 72
# 9, 18, 27, 36, 45, 54, 63, 72, 81

def multi(x, y)
    return x * y
end

(1..9).each do |i|
    result = (1..9).map { |j| multi(i, j) }.join(", ")
    puts result
end

# 外側のループ (i) は段を表し、内側のループ (j) はその段の各要素を表します。




# ********クラス********
# ********インスタンスを実体化しよう********
# インスタンス変数は、実体化したインスタンスが持つ変数です。インスタンス変数は、インスタンスがある限りデータが保持されます。

class Greeting
    def initialize(name)# 初期化メソッド
        @name = name
    end

    def say_hello()
        puts "hello #{@name}"
    end
end

# この下に、インスタンスを実体化し、メソッド呼び出しを記述する
hoge = Greeting.new("paiza") # オブジェクトを生成
hoge.say_hello() # オブジェクトのメソッドを呼び出す




# ********RPGの攻撃シーン********

class Player
    def initialize(name)
        @name = name
    end

    def attack(enemy)
        puts  "#{@name}は#{enemy}を攻撃した"
    end
end

team = []
team.push(Player.new("勇者"))
team.push(Player.new("戦士"))
team.push(Player.new("魔法使い"))

team.each do |person|
    person.attack("スライム")
end

# initialize メソッドは、クラスのインスタンスが作成されるときに呼び出される特別なメソッドです。
# このメソッドの目的は、インスタンスの初期設定を行うことです。
# initialize(name) メソッドは、1つの引数 name を受け取ります。
# この引数は、Player.new("勇者") から渡された "勇者" です。
# メソッド内で @name = name とすることで、受け取った name の値をインスタンス変数 @name に代入します。
# これにより、作成された Player オブジェクトの @name には "勇者" がセットされます。


# ********クラスで、引数と戻り値のあるメソッドを作ろう********
class Gakusei
    def initialize(kokugo, sansu)
        @kokugo = kokugo
        @sansu = sansu
    end

    # この下に、合計得点を戻り値として返すsumメソッドを記述する
    def sum()
        @kokugo + @sansu
    end
end

yamada = Gakusei.new(70, 43)
puts "合計は#{yamada.sum()}点です"




# ********あらかじめ用意されているメソッドを理解しよう********
# 標準入力から文字列を取得して出力します。
# この文字列をカンマで区切って配列として出力してください。
# なお、次のメソッドを利用すると良いでしょう。

# p ：指定されたテキストを出力する
# chomp ：末尾の余分なコードを削除する
# split(",") ：引数で指定した記号で文字列を分割して配列にする

# 入力される値
# スライム,モンスター,ドラゴン,魔王
# 期待する出力値
# ["スライム", "モンスター", "ドラゴン", "魔王"]
line = gets
p line.split(",")




# ********クラスを継承する********
# Greetingクラスにインスタンス変数@msgと@targetが定義されており、Greetingクラスを継承したHelloクラスが定義されています。
# このコードでは、Helloクラスのsay_helloメソッドを呼び出していますが、メソッドが記述されていません。
# 以下の変数でメッセージを表示するよう、say_hello()メソッドを追加してください。
# 期待する出力値
# hello paiza

class Greeting
    def initialize()
        @msg = "hello"
        @target = "paiza"
    end
end

class Hello < Greeting
    # この下に、say_helloメソッドを記述する
    def say_hello()
        puts "#{@msg} #{@target}"
    end
end

player = Hello.new()
player.say_hello()






# ********メソッドをオーバーライドしよう********
# Greetingクラスに、say_helloメソッドが定義されており、
# Greetingクラスを継承したHelloクラスが定義されています。

# このHelloクラスで、say_helloメソッドをオーバーライドして、メソッド呼び出しの引数をターゲットとして表示してください。
# たとえば、引数に「ruby」を渡した場合、「hello ruby」と表示します。
# 期待する出力値
# hello ruby
class Greeting
    def initialize()
        @msg = "hello"
        @target = "paiza"
    end

    def say_hello()
        puts "#{@msg} #{@target}"
    end
end

class Hello < Greeting
    # ここにオーバライドするメソッドを記述する
    def say_hello(target)
        puts "#{@msg} #{target}"
    end

end

player = Hello.new()
player.say_hello("ruby")

# 実行結果
# hello ruby


# ********RPGのPlayerクラスを継承で記述するその2********
# RPGの攻撃シーンを表示するプログラムで、teamのメンバーが順番にattackメソッドを呼び出します。
# 下記の期待する出力値が出力されるように、右のコードの足りない部分を補ってください。
# 期待する出力値
# 勇者はスライムを攻撃した
# 魔法使いはスライムを攻撃した
# 戦士はスライムを猛攻撃した！
class Player
    def initialize(name)
        @name = name
    end

    def attack(enemy)
        puts  "#{@name}は#{enemy}を攻撃した"
    end
end

class Warrior < Player
    def attack(enemy)
        puts  "#{@name}は#{enemy}を猛攻撃した！"
    end
end


team = []
team.push(Player.new("勇者"))
team.push(Player.new("魔法使い"))
team.push(Warrior.new("戦士"))

team.each do |person|
    person.attack("スライム")
end



# ********クラスの中のメソッドを呼び出す********
# Greetingクラスの中に、say_helloメソッドとsay_yeahメソッドを定義しています。
# say_helloメソッドを呼び出すと「hello paiza」と表示されて、
# say_yeahメソッドを呼び出すと「YEAH YEAH YEAH!」と表示されます。

# 「hello paiza」に続けて、「YEAH YEAH YEAH!」と表示されるようコードを書き換えてください。
# 期待する出力値
# hello paiza
# YEAH YEAH YEAH!
class Greeting
    def initialize()
        @msg = "hello"
        @target = "paiza"
    end

    def say_hello()
        puts "#{@msg} #{@target}"
        say_yeah() #ここを追記
    end

    private

    def say_yeah()
        puts "YEAH YEAH YEAH!"
    end
end

player = Greeting.new()
player.say_hello()


# say_yeah メソッドは private になっているので、
# クラスの外から player.say_yeah() のように呼ぼうとすると → エラーになります
# でも、クラスの内部から（=say_helloの中など）呼び出すのは → OKです
# もし以下のようなことをすると…
# player = Greeting.new
# player.say_yeah  # エラーになります！


# ********親クラスのメソッドを呼び出す********
# Greetingクラスでsay_helloメソッドを定義して、Helloクラスでsay_helloメソッドをオーバーライドしています。

# Helloクラスでsay_helloメソッドを書き換えて、「hello paiza」に続けて、「YEAH YEAH YEAH!」と表示されるようにください。
# 期待する出力値
# hello paiza
# YEAH YEAH YEAH!

class Greeting
    def initialize()
        @msg = "hello"
        @target = "paiza"
    end

    def say_hello()
        puts "#{@msg} #{@target}"
    end
end

class Hello < Greeting
    def say_hello()
        super #ここを追記
        puts "YEAH YEAH YEAH!"
    end
end

player = Hello.new()
player.say_hello()

# オーバーライドされたメソッドがあった場合、
# スーパークラスのではなくサブクラスのメソッドの方が呼び出されますが、
# オーバーライドされたメソッドの中で super と記述すると、
# スーパークラスの同じ名前のメソッドを呼び出すことができます。

# super を使わなかったら？
# puts "#{@msg} #{@target}" は実行されず、 "YEAH YEAH YEAH!" だけが表示されます。
# だから、スーパークラスの処理も残したい場合には super は必須です。


# ********クラスメソッドを呼び出そう********

class Greeting
    def self.say_hello()
        puts "hello paiza"
    end
end

# この下で、クラスメソッドを呼び出す
Greeting.say_hello()

# クラスメソッドでは、メソッド名にselfを付けて定義します。
# クラスメソッドを呼び出す時には、クラス名に続けて、メソッドを記述します。




# ********モジュールのメソッドを呼び出す********

module Greeting
    def say_paiza()
        puts "hello paiza"
    end

    module_function :say_paiza
end

# この下で、メソッドを呼び出す
Greeting.say_paiza()


# モジュール内で定義したメソッドをモジュール名から直接呼び出すためには、module_function が必要
# モジュールの外から呼び出せるクラスメソッド」として使えるようにするということ

# ********モジュールとMix-in********
# Enemyクラスを定義して、slimeオブジェクトとして実体化しています。
# このEnemyクラスにActionモジュールを組み込んでください。
# 期待する出力値
# スライムは、勇者を攻撃した！
module Action
    def attack(target)
        puts "#{@name}は、#{target}を攻撃した！"
    end
end

class Enemy
    # この下にモジュールを組み込む
    include Action

    def initialize(name)
        @name = name
    end
end

slime = Enemy.new("スライム")
slime.attack("勇者")



# ********条件分岐、比較演算子を学ぶ********
# ********わからなかった箇所メモ********
# ********西暦年から昭和年を計算する********
# seireki の中には、西暦年として 1926~1988 までの数字がランダムで
# 代入されます。
# 入力された西暦年を昭和年に変換し「西暦19○○年は、昭和○○年です。」と
# 出力してください。

# 昭和元年（1年）は1926年です。1926年が与えられた場合、
# 「西暦1926年は昭和1年です。」と表示してください。

seireki = rand(1926..1988)	# 西暦年
print "西暦#{seireki}年は"

# 昭和年を計算する
showa = seireki - 1925

# 昭和年を出力する
puts "昭和#{showa}年です。"



# ********
# 実行するたびに、1から10までの数値をランダムに生成して、順位として表示します。
# ここにif文を追加して、2位から5位の時には「あと少し！」と表示するようにしてください。
# 順位に合わせてメッセージを表示する
number = rand(1..10) # 1〜10の整数をランダムに1つ生成
puts "あなたの順位は#{number}位です"

# 2位から5位の時に「あと少し！」と表示する
if number >= 2 && number <= 5
    puts "あと少し！"
end


# より読みやすく書くなら
# Rubyには「ある範囲内にあるか？」をチェックする between? メソッドがあります
number = rand(1..10)
if number.between(2, 5)
    puts "あと少し！"
end



# ********
# 1から30までの数値をランダムに生成して、距離として表示します。
# ここにif文を追加して、1から9メートルか、21から30メートルの時に「セーフ！」と表示するようにしてください。

# 距離に合わせてメッセージを表示する
distance = rand(1..30)
puts "あなたの距離は#{distance}メートルです"

# 1から9メートルか、21から30メートルの時に「セーフ！」と表示する
if (distance >= 1 && distance <= 9) || (distance >= 21 && distance <= 30)
    puts "セーフ！"
end



# ********
# 「0.08」を文字として表示します。このnumber変数の値を数値に変換して出力してください。
# 期待する出力値
# 0.08

number = "0.08"
p number.to_f

# ********
# 数値を0から15まで表示する
# while命令を使って、0から15まで、数値を一行ずつ表示するプログラムを作成してください。
count = 0
while count <= 15
    puts count
    count += 1
end

# ********
# whileを使って、1から10までの偶数を一行ずつ表示するプログラムを作成してください。
i = 2 # 2から開始（最初の偶数）
while i <= 10
    puts i
    i += 2 # 2ずつ増やすので常に偶数だけ出力される
end


# ********
# whileを使って、5から1まで、数値を一行ずつカウントダウン表示するプログラムを作成してください。
count = 5
while count >= 1
    puts count
    count -= 1
end



# ********
# 標準入力から整数が1つ与えられます。for inを使って、
# その整数回分「スライムがあらわれた」と出力するプログラムを作成してください。

# 入力される値
# 8

# 期待する出力値
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# スライムがあらわれた
# 標準入力から整数を取得
count = gets.chomp.to_i

# for in を使って、その整数回分「スライムがあらわれた」と出力
for i in 1..count
    puts "スライムがあらわれた"
end


# for i in 1..count の i は、ループの中で使える「カウンター変数」です。
# もしカウントも表示したいなら：
# for i in 1..count
#     puts "#{i}回目: スライムがあらわれた"
# end

# 出力結果
# 1回目: スライムがあらわれた
# 2回目: スライムがあらわれた
# 3回目: スライムがあらわれた

# ********
# 標準入力で2つの整数が2行で与えられます。
# 1つ目の数値から２つ目の数値までを、1ずつ増加させながら、
# 1行ずつ順番に出力するプログラムを作成してください。たとえば、3と5という数値が与えられた場合、次のように出力します。

# 3
# 4
# 5

# 入力される値
# 3
# 5

# 期待する出力値
# 3
# 4
# 5

# 1つ目の整数を取得
start_num = gets.chomp.to_i

# 2つ目の整数を取得
end_num = gets.chomp.to_i

# start_numからend_numまでを1ずつ増加させながら出力
for i in start_num..end_num
    puts i
end



# ********
# 西暦年と昭和年の対応表を作成してください。
# 対応表は、「西暦XXXX年は、昭和YY年です」と表示します。
# なお、昭和年は、西暦1926年から西暦1988年までの期間で、「西暦年 - 1925」で求めることができます。

# 期待する出力値
# 西暦1926年は、昭和1年です。
# 西暦1927年は、昭和2年です。
# 西暦1928年は、昭和3年です。
# ...
# 西暦1988年は、昭和63年です。

(1926..1988).each do |year|
    showa_year = year - 1925
    puts "西暦#{year}年は、昭和#{showa_year}年です。"
end

# for inで書く場合は以下
for year in 1926..1988
    showa_year = year - 1925
    puts "西暦#{year}年は、昭和#{showa_year}年です。"
end



# ********
# 入力エリアから複数行データとして読み込みます。
# 読み込んだデータをすべて一つの配列に格納し、最後にpメソッドでそのまま出力してください。

# 入力される値
# スライム
# モンスター
# ゾンビ
# ドラゴン
# 魔王


# 期待する出力値
# ["スライム", "モンスター", "ゾンビ", "ドラゴン", "魔王"]

# 標準入力から読み込んだ複数行を配列に格納しよう

array = []
while line = gets # 1行ずつ標準入力を読み込む
    line.chomp! # 改行を削除
    array << line
end

p array

# Rubyらしく書くなら
array = readlines.map(&:chomp)
p array

# readlines：すべての行を一括で読み込む
# .map(&:chomp)：各行の改行を取り除く


# &:（「シンボル to Proc 変換」）は、ブロックを簡潔に書くための省略記法です
# array.map { |x| x.chomp }
# これを &:chomp で書くと
# array.map(&:chomp)



# ********
# ループでハッシュのキーと値を出力しよう
# 期待する出力値
# 戦士
# 100
# 200
# 380

skills = {"職業" => "戦士", "体力" => 100, "魔法力" => 200, "ゴールド" => 380}
# この下で、ハッシュの値をループで出力してみよう
skills.each_value do |i|
    puts i
end

# 他の書き方
# each でキーと値の両方を使う
skills.each do |key, value|
    puts "#{key}: #{value}"
end

# ********
# 数学テストの得点がハッシュに格納されています。
# このハッシュを 値 でソートして、pメソッドで 配列 として出力してください。

# 期待する出力値
# [["いいだ", 12], ["あだち", 40], ["えんどう", 99]]


# ハッシュを値で昇順にソートする
math = {"あだち" => 40, "いいだ" => 12, "えんどう" => 99}
# この下で、ハッシュを値でソートして出力しよう
sorted_math = math.sort_by { |key, value| value }
p sorted_math


# よりRubyらしく（省略記法）

sorted_math = math.sort_by(&:last)
p sorted_math
# math の各要素は [key, value] の配列（例：["あだち", 40]）
# .last はその中の value（=末尾要素） を指す
# &:last は |pair| pair.last と同じ意味




# ********
# RPGの敵が、enemies配列で定義されています。
# この配列から要素を順に取り出して、「A番目のBが現れた!」と出力してください。
# Aには、配列のインデックス + 1の値が入ります。
# Bには、配列の要素が入ります。
# 期待する出力値
# 1番目のスライムが現れた!
# 2番目のモンスターが現れた!
# 3番目のゾンビが現れた!
# 4番目のドラゴンが現れた!
# 5番目の魔王が現れた!

enemies = ["スライム", "モンスター", "ゾンビ", "ドラゴン", "魔王"]
# ここに、要素をループで表示するコードを記述する
enemies.each_with_index do |enemy, index|
    puts "#{index + 1}番目の#{enemy}が現れた!"
end



# ********
# 各要素を3倍にして新しい配列を作成する
numbers = [12, 34, 56, 78, 90]
# ここに、各要素を3倍にして新しい配列を作成するコードを記述する
numbers2 = numbers.map do |i|
    i * 3
end
p numbers2


# ********
# Array.newとmapメソッドを使って、次のような2次元配列を作成して、pメソッドで出力してください。

# ・要素数は、5個
# ・[7,7,7,7]という配列を要素にする

# 期待する出力値
# [[7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7]]

numbers = Array.new(5).map { Array.new(4, 7) }
p numbers




# ********
# 「A」という文字が、leter_Aという2次元配列で定義されています。
# この配列から要素を順に取り出して、ドットで文字を出力してください。
# この時、要素が1だったら「@」(半角アットマーク)、ゼロだったら「 」(半角スペース)を出力します。
# 期待する出力値
#   @@
#  @  @
# @    @
# @@@@@@
# @    @
# @    @

# ドットで文字を出力しよう

letter_A = [[0,0,1,1,0,0],
            [0,1,0,0,1,0],
            [1,0,0,0,0,1],
            [1,1,1,1,1,1],
            [1,0,0,0,0,1],
            [1,0,0,0,0,1]]

# ここに、ドットを表示するコードを記述する
letter_A.each do |row|
    row.each do |cell|
        if cell == 1
            print "@"
        else
            print " "
        end
    end
    puts ""
end
# puts "" は、行末に改行を追加するために使われます。
# puts ""を書かない場合、出力は次のようになります：
# @@    @  @@    @@@@@@@    @@    @
# したがって、各行の出力後に改行を追加するための puts "" が必要です。







# ********
# あなたはカジノにやってきました。
# カジノで使われるチップは 1 ドルのもの 5 ドルのもの 10 ドルのものがあるようです。

# 各チップの枚数が 1 ドル, 5 ドル, 10 ドルの順で改行区切りで与えられるので合計で何ドルかを出力してください。

# 入力例 1 の場合

# 1
# 5
# 2


# 1 ドルが 1 枚、 5 ドルが 5 枚、 10 ドルが 2 枚なので 1 + 5 × 5 + 10 × 2 = 46 となり
# 46
# と出力して下さい。


# 入力は標準入力にて以下のフォーマットで与えられます。

# 入力は以下のフォーマットで与えられます。

# a
# b
# c

# ・1 行目に a 与えられます。
# ・2 行目に b 与えられます。
# ・3 行目に c 与えられます。
# ・入力は合計で 3 行となり、末尾に改行が 1 つ入ります。


# 以下の形式で、出力してください。

# 各チップの枚数が 1 ドル, 5 ドル, 10 ドルの順で改行区切りで与えられるので合計で何ドルかを出力してください。

# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# 入力を3行で受け取り、それぞれ整数に変換
a = gets.to_i  # 1ドルチップの枚数
b = gets.to_i  # 5ドルチップの枚数
c = gets.to_i  # 10ドルチップの枚数

# 合計金額を計算
total = a * 1 + b * 5 + c * 10

# 出力（末尾に改行、余計な文字なし）
puts total








# ********
# あなたは裏路地にある扉を開けようとしています。
# 扉は n 個あり各扉は順不同に数字が書かれています。
# 最も大きな扉の数字を出力してください。

# 入力例 1 の場合

# 3
# 123
# 813
# 321


# 3 つの扉があり最も大きいのは 813 なので
# 813
# と出力して下さい。


# 入力は標準入力にて以下のフォーマットで与えられます。

# n
# m_1
# m_2
# ...
# m_n

# ・1 行目に扉の個数 n 与えられます。
# ・2 行目から n 行目に扉に書かれている数字 m_i ( 1 ≦ i ≦ n ) が与えられます。
# ・入力は合計で n + 1 行となり、末尾に改行が 1 つ入ります。
n = gets.to_i
doors = []
n.times do
    doors << gets.to_i
end
puts doors.max






# ********
# ネオン街のクラブには英数字の形を模したクッキーが売られていました。

# クッキーは紙の箱に入っており、外からは中身を見ることができません。
# あなたは一つの箱に何種類の英数字が入っているか気になり、購入して調べてみることにしました。

# クッキーの数と一列に並べたクッキーの形が文字列として与えられます。

# クッキーの形が何種類あるか出力してください。

# 入力例 1 では aAcC677998 の 10 個のクッキーが並んでいます。
# 英字の小文字と大文字は区別するので、同じ種類の文字の種類は 8 種類となります。
# よって 8 と出力してください。




# 入力は標準入力にて以下のフォーマットで与えられます。

# N
# S

# ・1 行目にクッキーの数を表す整数 N が与えられます。
# ・2 行目に長さ N のクッキーの形を表す文字列 S が与えられます。
# ・入力は合計で 2 行となり、末尾に改行が 1 つ入ります。



# 以下の形式で、出力してください。

# クッキーの形が何種類あるか出力してください。

# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# 入力

# 10
# aAcC677998

# 出力

# 8


n = gets.to_i       # クッキーの数（使わなくてもOK）
s = gets.chomp      # クッキーの並びを文字列として取得

puts s.chars.uniq.size

# s.chars	文字列を1文字ずつ配列に変換（例: "aA" → ["a", "A"]）









# ********
# ピクセルアートを壁に描き残しています。
# N × N のグリッドを黒と白で塗ったピクセルアートに左右対称のものがありそれはあるギャングの縄張りという話を聞きました。
# ピクセルアートが左右対称かどうか判定してください。
# 入力例 1 では 5×5 のピクセルアートが与えらえます。
# このピクセルアートは左右対称になっているので Yes と出力してください。

# 入力は標準入力にて以下のフォーマットで与えられます。
# N
# b_{1,1} b_{1,2} ... b_{1,N}
# b_{2,1} b_{2,2} ... b_{2,N}
# ...
# b_{N,1} b_{N,2} ... b_{N,N}
# ・1 行目にピクセルアートの大きさを表す整数 N が半角スペース区切りで与えられます。
# ・続く 2 行目から N+1 行目まで位置 (i, j) (1 ≦ i, j ≦ N) のピクセルの色 b_{i, j} (1 ≦ i, j ≦ N) が与えられます。
# ・入力は合計で N+1 行となり、末尾に改行が 1 つ入ります。



# 以下の形式で、出力してください。
# ピクセルアートが左右対称なら Yes をそうでないなら No を 1 行に出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。



# 入力
# 5
# 0 0 1 0 0
# 0 1 1 1 0
# 1 1 1 1 1
# 0 1 0 1 0
# 0 0 1 0 0

# 出力
# Yes

n = gets.to_i
grid = []
n.times do
    grid << gets.split.map(&:to_i)
end
symmetric = grid.all? { |row| row == row.reverse }
puts symmetric ? "Yes" : "No"


# n.times do ... end:
# n 回ループして、各行のピクセル配列を grid に追加。

# row == row.reverse：
# 例：[0, 1, 0, 1, 0] == [0, 1, 0, 1, 0] →  true（左右対称）
# 例：[0, 1, 1, 0, 1] != [1, 0, 1, 1, 0] →  false（左右非対称）
# all? は、すべての行が true（= 左右対称）なら true を返す。

# symmetric ? "Yes" : "No"
# symmetric が true なら "Yes" を出力、false なら "No" を出力。








# ********
# 広告と判定するワード S と、N 件のメールのタイトルが与えられるので、
# それぞれのメールについて、広告と判定されるときは Yes と、そうでないときは No と出力するプログラムを作成してください。
# 広告と判定するワードが含まれているかの判定では、大文字と小文字を区別してください。

# 広告と判定されるワードは英数字からなりますが、メールタイトルには英数字と記号 " ", "!", "?", "$", ":" が含まれます。
# 特に、半角スペースが入力のタイトル中に含まれる可能性があることに注意してください。




# 入力される値
# 入力は以下のフォーマットで与えられます。

# S
# N
# T_1
# ...
# T_N
# ・1 行目に広告と判定するワード S が与えられます。
# ・2 行目にメールの件数 N が与えられます。
# ・続く N 行の i 行目 (1 ≦ i ≦ N)には、i 番目のメールのタイトル T_i が与えられます。
# ・入力は合計で N+2 行からなり、入力値最終行の末尾に改行が 1 つ入ります。


# 期待する出力
# 各メールのタイトルが広告と判定されたか否かを、次の形式で出力してください。
# R_1
# ...
# R_N
# ・期待する出力は N 行からなります。
# ・R_i (1 ≦ i ≦ N) は i 番目のメールに対応し、各メールのタイトルが広告と判定されたとき、R_i を "Yes" とし、広告と判定されなかったときは "No" としてください。


s = gets.chomp
n = gets.to_i

n.times do
    title = gets.chomp
    puts title.include?(s) ? "Yes" : "No"
end







# ********
# あなたはスーパーで N 個の商品を購入しました。それぞれの商品の価格は u_i 円です。

# あなたは 1 枚の半額クーポンを持っています。
# 半額クーポンは L 円以上の商品があれば、その中でもっとも高額な 1 つの商品に自動的に適用されます。
# お会計の合計金額を出力してください。

# 図1

# たとえば、入力例 1 では 1292円, 1274円, 1546円 の3つの商品を購入します。
# クーポンが適用できるのは 703円 以上からなので、購入するすべての商品にクーポンを適用可能です。

# 購入する商品の中でもっとも高額な商品は 1546円 の商品なので、この商品にクーポンを適用して 773円 で購入します。
# このときの合計金額は 3339円 となります。



# 入力される値
# 入力は以下のフォーマットで与えられます。
# N L
# u_1 u_2 ... u_N
# ・1 行目に購入した商品の数を表す整数 N とクーポンの適用可能価格の下限を表す整数 L が半角スペース区切りで与えられます。
# ・2 行目に購入した商品の価格を表す N 個の整数 u_i (1 ≦ i ≦ N) が 半角スペース区切りで与えられます。
# ・入力は合計で 2 行となり、末尾に改行が 1 つ入ります。

# それぞれの値は文字列で標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# お会計の合計金額を出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ N ≦ 100
# ・2 ≦ u_i ≦ 2,000 (1 ≦ i ≦ N)
# ・2 ≦ L ≦ 2,000
# ・u_i は偶数


n, l = gets.split.map(&:to_i)
prices = gets.split.map(&:to_i)

# クーポン適用可能商品の中で最大の価格を取得（なければ nil → 0 に）
discount_target = prices.select { |price| price >= l }.max || 0

# 合計から、クーポンによる割引（半額）を引いた値を出力
puts prices.sum - (discount_target / 2)



# 解説
# prices.select { |price| price >= l }
# これは prices 配列の中から、「L円以上の価格」だけを抜き出す 処理です。

# 例：prices = [1000, 1800, 500, 1900]
# l = 1500
# ⇒ 結果は [1800, 1900]

# .max
# これは上で抜き出した配列の中から 最大の値（＝最も高い価格）を取り出す ものです。
# 上の例なら [1800, 1900].max ⇒ 1900

#  || 0
# これは 「万が一対象がひとつもなかった場合」に備えて、0を代わりに使う」 という処理です。
# たとえば prices = [100, 200, 300] で l = 500 の場合、select の結果は []（空配列）になります。
# .max を空配列に対して使うと nil が返ります。
# そのとき || 0 によって、最終的に 0 を使うようになります。








# ********
# 入力される値
# 入力は以下のフォーマットで与えられます。

# N
# A_1 B_1
# A_2 B_2
# ...
# A_N B_N
# ・1 行で過去に行われたじゃんけんの回数を表す整数 N が与えられます。
# ・続く N 行のうちの i 行目 (1 ≦ i ≦ N) には、(i 回目のじゃんけんにおいてアリスさんが出した手)、(i 回目のじゃんけんにおいてボブさんが出した手) を表す文字列 A_i, B_i がこの順で半角スペース区切りで与えられます。
# ・入力は合計で N + 1 行となり、末尾に改行が 1 つ入ります。
# ・じゃんけんの手は「グー」、「チョキ」、「パー」の 3 種類のみであり、それぞれ順番に 'G', 'C', 'P' というアルファベット 1 文字によって表現されます。


# 期待する出力
# 過去に行われたアリスさんとボブさんのじゃんけんの記録を元に、過去にアリスさんがボブさんに何回勝ったかを 1 行で出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# 入力例1
# 6
# G C
# C G
# P G
# G C
# P P
# P C
# 出力例1
# 3

n = gets.to_i
alice_win = 0

n.times do
    alice_hand, bob_hand = gets.split

    if (alice_hand == "G" && bob_hand == "C") ||
        (alice_hand == "P" && bob_hand == "G") ||
        (alice_hand == "C" && bob_hand == "P")
        alice_win = alice_win + 1
    end
end




# ********
# 特定のワード S がタイトルに含まれるメールを全て広告と判定して、自動で削除することにしました。
# 広告と判定するワード S と、N 件のメールのタイトルが与えられるので、
# それぞれのメールについて、広告と判定されるときは Yes と、そうでないときは No と出力するプログラムを作成してください。
# 広告と判定するワードが含まれているかの判定では、大文字と小文字を区別してください。
# 広告と判定されるワードは英数字からなりますが、メールタイトルには英数字と記号 " ", "!", "?", "$", ":" が含まれます。
# 特に、半角スペースが入力のタイトル中に含まれる可能性があることに注意してください。



# 判定ワード S が 大文字小文字を区別して メールタイトルに含まれているかを調べる。
# 含まれていれば Yes、含まれていなければ No。
# タイトルにはスペースや記号 !, ?, $, : などが含まれるが、 .include? はそれも問題なく対応。

s = gets.chomp         # 判定ワード S を取得
n = gets.to_i          # 件数 N を取得
n.times do
    title = gets.chomp   # メールタイトル T_i を1行ずつ取得
    puts title.include?(s) ? "Yes" : "No"  # S が含まれていれば Yes、そうでなければ No
end






# ********
# インターネットのとあるサービスで利用するためのハンドルネームを作ることにしました。
# そのハンドルネームは名前の文字列から母音を取り除いて子音のみを連結して生成します。

# ただし、ここで母音とは "a", "e", "i", "o", "u" の 5 つのアルファベットの
# 小文字( "a", "e", "i", "o", "u" )、大文字( "A", "E", "I", "O", "U" )を指し、
# 子音とはそれ以外のアルファベットを意味します。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# S
# ・名前を表す文字列 S が 1 行で与えられ、末尾に改行が 1 つ入ります。
# それぞれの値は文字列で標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください

# 期待する出力
# ハンドルネームを文字列で出力してください。


s = gets.chomp
vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
# 母音でない文字を選んで連結
handle_name = s.chars.reject { |c| vowels.include?(c) }.join
puts handle_name

# 解説
# s.chars
# 文字列 s を1文字ずつ分解し、配列に変換します。
# 例： "Torvalds" → ["T", "o", "r", "v", "a", "l", "d", "s"]

# .reject { |c| vowels.include?(c) }
# reject は 条件に一致する要素を除外します。
# この場合、vowels.include?(c) が true の文字（= 母音）を除外します。
# つまり、母音以外（= 子音）だけを残します。

# .join
# reject によって残された子音の配列を、文字列として再連結します。







# ********
# 今日は PAIZA 6 というくじの当選番号の公表日です。

# PAIZA 6 の購入者は 1 から 100 までの好きな数字を 6 つ選びます。
# 抽選では同様に 6 つの当選番号が発表され、購入したくじの数字と一致していた数字の数に応じて賞金が当たります。

# あなたは、先日 N 枚のくじを購入しました。
# プログラマーであるあなたは、N 枚の宝くじそれぞれについて、 当選番号と一致した数字の数について調べるプログラムを書くことにしました。

# ここで、くじの購入例を見てみましょう。


# 上の N = 3 の例では、当選番号と一致した数字は赤で表されており、 上から順に、3 個、1 個、0 個となっています。
# なお、例から分かる通り、くじの数字は昇べきの順に並んでいるとは限りません。

# 評価ポイント
# 10回のテストケースで、正答率、実行速度、メモリ消費量をはかり得点が決まります。
# より早い回答時間で提出したほうが得点が高くなります。
# 複数のテストケースで正しい出力がされるか評価（+50点）
# 解答までの速さ評価（+50点）
# 入力される値
# 入力は以下のフォーマットで与えられます。

# a_0 b_0 c_0 d_0 e_0 f_0
# N
# a_1 b_1 c_1 d_1 e_1 f_1
# a_2 b_2 c_2 d_2 e_2 f_2
# ...
# a_N b_N c_N d_N e_N f_N
# ここで、1 行目はくじの当選番号 6 つ、2 行目の N はあなたの購入したくじの枚数を表す整数とします。
# a_i, b_i, c_i, d_i, e_i, f_i (1 ≦ i ≦ N) は i 番目のくじの数字です。

# それぞれの値は文字列で標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# それぞれのくじについて、当選番号と一致する数字の数を答えてください。

# 最後は改行し、余計な文字、空行を含んではいけません。
# 条件
# すべてのテストケースで以下の条件を満たします。

# ・1 ≦ N ≦ 100
# ・1 ≦ a_i, b_i, c_i, d_i, e_i, f_i ≦ 100

# a_i, b_i, c_i, d_i, e_i, f_i (0 ≦ i ≦ n) は全て異なる整数

# 入力例1
# 1 2 3 4 5 6
# 3
# 1 5 4 2 3 6
# 9 6 2 7 1 5
# 32 9 87 33 41 60
# 出力例1
# 6
# 4
# 0
# 入力例2
# 72 2 90 84 57 85
# 3
# 36 70 1 72 54 82
# 36 2 40 12 3 58
# 25 11 90 57 85 99
# 出力例2
# 1
# 1
# 3



require 'set'

# 当選番号を読み込み、Setにする（検索を高速にするため）
winning_numbers = gets.split.map(&:to_i).to_set

# 購入したくじの枚数
n = gets.to_i

# 各くじについて照合処理
n.times do
    ticket_numbers = gets.split.map(&:to_i).to_set
    match_count = (ticket_numbers & winning_numbers).size
    puts match_count
end


# gets：文字列として1行取得（例: "1 2 3 4 5 6\n"）
# .split：空白で区切って配列に変換（例: ["1", "2", ..., "6"])
# .map(&:to_i)：すべての要素を整数に変換（例: [1, 2, 3, 4, 5, 6])
# .to_set：それを集合（Set）に変換 → 重複なし、検索高速
# 結果：当選番号が Set[1, 2, 3, 4, 5, 6] のように格納される




# ticket_numbers & winning_numbers：
# A & B → Set同士の積集合（共通部分）を生成
# Ruby の Set クラスでは & 演算子は「積集合（共通部分）」を返すように定義されています。

# .size は Set の要素数を返す







# ********
# 半径r のお気に入りのボールを手に入れたあなたは、それを収納することができる箱を探しています。

# 今、n 個の箱があり、i (1 ≦ i ≦ n) 番目の箱は高さh_i、幅w_i、奥行きd_i です。
# 各箱においてボールの直径が、箱の高さ、幅、奥行きの3つの長さのうち最も短いもの以下であれば、無事にボールを収納することができます。
# ボールの半径と箱の情報が与えられるので、ボールを収納することができる箱の番号を昇順にすべて答えてください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n r     箱の数n, ボールの半径r 表す整数
# h_1 w_1 d_1     1個目の箱の高さ、幅、奥行きを表す整数
# h_2 w_2 d_2     2個目の箱の高さ、幅、奥行きを表す整数
# ...
# h_n w_n d_n     n個目の箱の高さ、幅、奥行きを表す整数
# それぞれの値は文字列で標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# ボールを収納することができる箱の番号を昇順にすべて、改行区切りで出力してください。

# 最後は改行し、余計な文字、空行を含んではいけません。
# 条件
# すべてのテストケースで以下の条件を満たします。

# ・ 1 ≦ n ≦ 100
# ・ 1 ≦ r ≦ 100
# ・ 1 ≦ h_i, w_i, d_i ≦ 200

# 少なくとも1つはボールを収納できる箱が存在します
# 入力例1
# 4 2
# 6 6 6
# 4 6 4
# 6 1 1
# 4 4 4
# 出力例1
# 1
# 2
# 4

n, r = gets.split.map(&:to_i)  # 箱の数とボールの半径を取得
diameter = r * 2              # ボールの直径を計算
(1..n).each do |i|
    h, w, d = gets.split.map(&:to_i)
    min_dimension = [h, w, d].min          # 3辺のうち一番短い辺を選びます（直径がこの長さ以下でなければ入らないため）
    puts i if diameter <= min_dimension    # ボールの直径が最も短い辺以下なら、その箱の番号 i を出力。
end





# ********
# Q. 下記のJSONから、ユーザー名（"name"）と、最初のロール（roles[0]）を取得せよ

# {
#   "user": {
#     "id": 123,
#     "name": "john",
#     "email": "john@example.com",
#     "roles": ["admin", "editor"]
#   }
# }

require 'json' # Ruby で JSON を扱うための標準ライブラリを読み込みます
# 文字列としての JSON データを json_text に代入
json_text = '{
    "user": {
        "id": 123,
        "name": "john",
        "email": "john@example.com",
        "roles": ["admin", "editor"]
    }
}'
data = JSON.parse(json_text)
name = data["user"]["name"]
first_role = data["user"]["roles"][0]
puts "#{name},#{first_role}"


# JSON.parse(json_text)は
# - `json_text` を Ruby のハッシュ形式に変換（パース）しています。
# - 結果：
#   {
#     "user" => {
#       "id" => 123,
#       "name" => "john",
#       "email" => "john@example.com",
#       "roles" => ["admin", "editor"]
#     }
#   }

# name = data["user"]["name"]は
# - `data["user"]` はユーザー情報のハッシュを指す。
# - その中の `"name"` の値（"john"）を取り出して `name` に代入。

# first_role = data["user"]["roles"][0]は
# "roles" は配列：["admin", "editor"]
# [0] は配列の1番目（0番目）の要素なので "admin" を取り出して代入。






# ********
# 次の JSON 文字列に含まれる products の各商品名（name）を1行ずつ出力してください。
# {
#   "products": [
#     { "id": 1, "name": "Laptop" },
#     { "id": 2, "name": "Mouse" },
#     { "id": 3, "name": "Keyboard" }
#   ]
# }

require 'json'

json_text = '{
    "products": [
        { "id": 1, "name": "Laptop" },
        { "id": 2, "name": "Mouse" },
        { "id": 3, "name": "Keyboard" }
    ]
}'

data = JSON.parse(json_text)
data["products"].each do |product|
    puts product["name"]
end

# 出力
# Laptop
# Mouse
# Keyboard




# ********
#次の JSON はユーザーの配列です。
# "age" が 30 以上のユーザーの "name" をすべて1行ずつ出力してください。

# {
#   "users": [
#     { "name": "Ken", "age": 25 },
#     { "name": "Naoko", "age": 33 },
#     { "name": "Taro", "age": 40 },
#     { "name": "Yui", "age": 28 }
#   ]
# }

require 'json'
json_text = '{
    "users": [
        { "name": "Ken", "age": 25 },
        { "name": "Naoko", "age": 33 },
        { "name": "Taro", "age": 40 },
        { "name": "Yui", "age": 28 }
    ]
}'

data = JSON.parse(json_text)
data["users"].each do |user|
    puts user["name"] if user["age"] >= 30
end

# 出力
# Naoko
# Taro




# ********
# 次のJSONから、投稿（posts）のうち、likes が10以上の投稿の title を出力してください。

# {
#   "user": {
#     "name": "John",
#     "posts": [
#       { "title": "First Post", "likes": 5 },
#       { "title": "Second Post", "likes": 12 },
#       { "title": "Third Post", "likes": 30 }
#     ]
#   }
# }

require 'json'

json_text = '{
    "user": {
        "name": "John",
        "posts": [
            { "title": "First Post", "likes": 5 },
            { "title": "Second Post", "likes": 12 },
            { "title": "Third Post", "likes": 30 }
        ]
    }
}'

data = JSON.parse(json_text)
data["user"]["posts"].each do |i|
    puts i["likes"] if i["likes"] >= 10
end




# ********
# 次のJSONはレビュー情報です。
# 評価（rating）が4以上のレビューの件数を出力してください。
# {
#   "reviews": [
#     { "user": "Ken", "rating": 5 },
#     { "user": "Naoko", "rating": 3 },
#     { "user": "Taro", "rating": 4 },
#     { "user": "Yui", "rating": 2 }
#   ]
# }

require 'json'

json_text = '{
    "reviews": [
        { "user": "Ken", "rating": 5 },
        { "user": "Naoko", "rating": 3 },
        { "user": "Taro", "rating": 4 },
        { "user": "Yui", "rating": 2 }
    ]
}'

data = JSON.parse(json_text)
count = 0
data["reviews"].each do |i|
    count += 1 if i["rating"] >= 4
end

puts count





# ********
# 次のJSONは複数のユーザーが属しているチーム情報です。
# すべての team 名のうち、重複を除いたユニークな名前を出力してください（昇順）。
# {
#   "members": [
#     { "name": "A", "team": "Red" },
#     { "name": "B", "team": "Blue" },
#     { "name": "C", "team": "Red" },
#     { "name": "D", "team": "Green" }
#   ]
# }

require 'json'

json_text = '{
    "members": [
        { "name": "A", "team": "Red" },
        { "name": "B", "team": "Blue" },
        { "name": "C", "team": "Red" },
        { "name": "D", "team": "Green" }
    ]
}'

data = JSON.parse(json_text)
teams = data["members"].map do |i|
    i["team"]
end
puts teams.uniq.sort

# または

data = JSON.parse(json_text)
teams = data["members"].map { |i| i["team"] }.uniq.sort
puts teams




# ********
# 各ユーザーの最新ログイン時刻を出力せよ

# {
#   "users": [
#     { "name": "Alice", "logins": ["2023-01-01", "2023-01-05"] },
#     { "name": "Bob", "logins": ["2023-01-02", "2023-01-04"] }
#   ]
# }

require 'json'
json_text = '{
    "users": [
        { "name": "Alice", "logins": ["2023-01-01", "2023-01-05"] },
        { "name": "Bob", "logins": ["2023-01-02", "2023-01-04"] }
    ]
}'
data = JSON.parse(json_text)
data["users"].each do |u|
    latest = u["logins"].max
    puts "#{u["name"]}: #{latest}"
end





# ********
# あなたはくじの当選通知を行う担当者です。

# くじはユーザーが投票期間中に 0 から 9999 までの数を 1 つだけ選んで投票する方式です。投票した数字のことを投票番号と言います。
# 投票には 1 から順に連番で投票 ID が与えられます。ユーザーは自分の投票 ID と投票番号を知ることができます。

# 投票期間終了時に運営が 0 から 9999 までの当選番号をランダムに N 個選びます。
# N 個の当選番号の中に自分の投票番号と 1 つでも同じ番号があれば当選となります。

# N 個の当選番号と、K 個の投票番号が 投票 ID が 1 のものから順に与えられます。
# 当選した投票の ID をすべて出力してください。
# 当選した投票がなかった場合、-1 を出力してください。


# 要件のまとめ：
# 当選番号 w_1〜w_N（N個）
# 投票番号 v_1〜v_K（K個）← 投票ID 1〜Kに対応
# 各投票番号が当選番号の中に含まれているかをチェックし、
# 当選していれば 投票ID（1始まり） を出力
# 1つも当選していなければ -1 を出力

# 入力の読み取り
n, k = gets.split.map(&:to_i)
winning_numbers = gets.split.map(&:to_i)
voting_numbers = gets.split.map(&:to_i)

# 当選した投票IDを格納
result = []

voting_numbers.each_with_index do |vote, index|
    if winning_numbers.include?(vote)
        result << index + 1  # 投票IDは1から始まる
    end
end

# 出力
if result.empty?
    puts -1
else
    puts result
end




# ********
# Leet と呼ばれるインターネットスラングがあります。
# Leet ではいくつかのアルファベットをよく似た形の他の文字に置き換えて表記します。 Leet の置き換え規則はたくさんありますが、ここでは次の置き換え規則のみを考えましょう。

# 置き換え前	置き換え後
# A	4
# E	3
# G	6
# I	1
# O	0
# S	5
# Z	2
# 文字列が入力されるので、これを Leet に変換して出力するプログラムを書いてください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# s
# s は Leet に変換する前の文字列を表します。

# それぞれの値は文字列で標準入力から渡されます。


# 期待する出力
# s を Leet に変換した文字列を１行に出力してください。

# 最後は改行し、余計な文字、空行を含んではいけません。

# 入力例1
# PAIZA
# 出力例1
# P4124
# 入力例2
# ALANTURING
# 出力例2
# 4L4NTUR1N6

leet_map = {
    "A" => "4",
    "E" => "3",
    "G" => "6",
    "I" => "1",
    "O" => "0",
    "S" => "5",
    "Z" => "2"
}
s = gets.chomp
leet = s.chars.map { |c| leet_map.fetch(c, c) }.join
puts leet



# leet_map: 変換ルールをハッシュ（連想配列）で定義

# s.chars: 文字列を1文字ずつ配列に変換

# .map { |c| leet_map.fetch(c, c) }:
# 変換ルールがあれば変換後の文字を返す
# なければそのままの文字を返す（fetch の第2引数）
# c がキーにある → 対応する値、ない → c 自身を返す

# .join: 配列を文字列に戻す






# ********
# C093:【キャンペーン問題】下桁ルール
# ボブとアリスは期末テストの点数で勝負をすることにしました。しかし、ボブとアリスでは普段の成績に差があり、まともな勝負になりません。
# そこで、期末テストの点数の各位の数を足した数の一の位で勝負することにし、大きい方が勝ちとしました。
# つまり、85 点であれば 8 + 5 = 13 で、13 の一の位の 3 となります。
# 二人の期末テストの点数が入力されるので、どちらが勝ったか、あるいは引き分けたかを出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# X Y
# ・ボブの期末テストの点数を表す整数 X とアリスの期末テストの点数を表す整数 Y がこの順で入力されます。
# ・入力は 1 行となり、末尾に改行を１つ含みます。

# それぞれの値は文字列で標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# ボブが勝った場合は "Bob"、アリスが勝った場合は "Alice"、引き分けの場合は "Draw" と出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・0 ≦ X, Y ≦ 100
# 入力例1
# 75 81
# 出力例1
# Alice
# 入力例2
# 100 91
# 出力例2
# Bob
# 入力例3
# 69 87
# 出力例3
# Draw



x, y = gets.split.map(&:to_i)

# 各桁の和を求めて、その1の位を抽出
x_sum = x.digits.sum % 10
y_sum = y.digits.sum % 10

# 勝敗を判定
if x_sum > y_sum
    puts "Bob"
elsif y_sum > x_sum
    puts "Alice"
else
    puts "Draw"
end



# .split	空白で区切って配列に変換
# 例: ["75", "81"]

# .map(&:to_i)	各要素を to_i メソッドで整数に変換
# 例: [75, 81]


# 75.digits  # => [5, 7]
# [5, 7].sum  # => 12
# % 10は、合計値の1の位（下1桁）を取り出します。
# 12 % 10  # => 2

# x = 75
# x.digits.sum % 10  # => 2






# ********
# あなたの手元には、とあるスーパーマーケットのレシートの山があります。

# スーパーマーケットにはポイントカードが導入されていて、
# 買い物をするたびに購入金額に応じたポイントがたまります。
# 加算されるポイントは次の 3 つのルールに従って決定されます。

# 1. 通常は購入金額の 1 ％（小数点以下切り捨て）とする
# 2. ただし、3 のつく日は購入金額の 3 ％（小数点以下切り捨て）とする
# 3. ただし、5 のつく日は購入金額の 5 ％（小数点以下切り捨て）とする

# あなたはポイントカードに、今、何ポイントたまっているのかが気になりました。
# レシートの数が多いので、手で計算するのは大変です。

# 早速、これを計算するプログラムを書きましょう。 ただし、今月のはじめには全くポイントがたまっておらず（0 ポイント）、
# また、今月中ポイントは消費されなかったものとします。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# N　　　　#各レシートの数
# d_1 p_1　#1枚目のレシートの日付 d_1 日, 購入金額 p_1 円
# d_2 p_2　#2枚目のレシートの日付 d_2 日, 購入金額 p_2 円
# ...
# d_N p_N　#N枚目のレシートの日付 d_N 日, 購入金額 p_N 円



# 期待する出力
# 今月末にポイントカードにたまっているポイントの値を１行に出力してください。

# 最後は改行し、余計な文字、空行を含んではいけません。


# 入力例1
# 3
# 1 1024
# 11 2048
# 21 4196

# 出力例1
# 71

# 入力例2
# 1
# 30 340

# 出力例2
# 10


n = gets.to_i
total_points = 0

n.times do
    d, p = gets.split.map(&:to_i)

    if d % 10 == 5
        rate = 5
    elsif d % 10 == 3 || d == 30
        rate = 3
    else
        rate = 1
    end

  total_points += (p * rate) / 100
end

puts total_points


# a % b は、「a を b で割った余り」を意味します。
# 15 % 10  # => 5
# 25 % 10  # => 5
# 5 % 10   # => 5

# 「5 のつく日」を判定するために、
# 下1桁が 5 であれば該当するので、d % 10 == 5が使われているのです。

# 「3 のつく日」を判定するために、
# d % 10 == 3 が使われているのです。
# d % 10 == 3 は下1桁が3のとき（= 3, 13, 23）






# ********C166
# あなたは X 円の商品を、手持ちの小銭だけでちょうど支払う必要があります。

# 小銭の種類は：
# 500, 100, 50, 10, 5, 1円

# 各硬貨は無限にあるとして、
# できるだけ少ない枚数で X 円を支払うときの 硬貨の枚数の合計を出力する。


# 高額硬貨から順にできるだけ多く使う → 残りの金額を小さくしていく

# 例）X = 733

# 500円：1枚（残り 233）

# 100円：2枚（残り 33）

# 10円：3枚（残り 3）

# 1円：3枚
# → 合計 9 枚

x = gets.to_i

coins = [500, 100, 50, 10, 5, 1]
count = 0

coins.each do |coin|
    count += x / coin
    x %= coin
end

puts count


# count += x / coin：
# x / coin は、「この硬貨を何枚使えるか」を求めています。
# 例：x = 733、coin = 500 → 733 / 500 = 1 → 500円硬貨を1枚使える。
# それを count に加算します。

# x %= coin：
# 使用した硬貨分だけ、支払う金額から減らします。
# 例：x = 733、500円硬貨を1枚使う → x = 733 % 500 = 233





# ********
# C055:ログのフィルター
# プログラムを作って、重要な文字列を含むログだけ抽出する事にしました。

# 例えば、入力例 2 では、ログは上から順に "pizza"、 "paiza"、 "aizu"、 "ai"、 "sai" の 5 つです。
# この 5 つのログに対して、重要な文字列 "ai" が含まれているのは "pizza" 以外の 4 つです。
# 結果として "pizza" だけが除かれ、 "paiza"、 "aizu"、 "ai"、 "sai" がこの順に抽出されます。

# このように、ログと重要な文字列が与えられたとき、
# 重要な文字列が含まれているログを抽出して出力するプログラムを作成してください。
# 重要な文字列が含まれていない場合は "None" と出力してください。

# 入力される値
# 入力は以下のフォーマットで与えられます。

# N
# G
# S_1
# ...
# S_N
# ・1 行目には、文字列の数 N が整数で与えられます。
# ・2 行目には、抽出する対象の重要な文字列 G が与えられます。
# ・3 行目から続く N 行のうち i 行目 (1 ≦ i ≦ N)には、ログの内容である文字列 S_i が与えられます。
# ・入力は合計 N + 2 行であり、最終行の末尾に改行が 1 つ入ります。

# 期待する出力
# 与えられたログに対して、上から順に重要な文字列が含まれているログを出力してください。
# 重要な文字列が含まれていない場合は "None" と出力してください。

# 出力の最後に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.to_i # ログの数
g = gets.chomp # 重要な文字列

logs = Array.new(n) {gets.chomp}

filtered = logs.select { |log| log.include?(g) } # Gを含むログだけ抽出
if filtered.empty?
    puts "None"
else
    puts filtered
end



# Array.new(n)
# これは 長さ n の配列を作るという意味です。
# 例えば、Array.new(3) は [nil, nil, nil] を作ります。

# { gets.chomp }
# ブロック（{} の中）は Array.new の各要素をどう作るかを指定しています。
# gets は1行の入力を読み取る
# chomp はその入力の 末尾の改行 \n を取り除く
# つまり、gets.chomp は「改行なしの1行文字列」を返します。

# Array.new(n) { gets.chomp }
# この組み合わせによって、以下の処理が行われます：
# gets.chomp を n 回繰り返し、
# 各回の結果（文字列）を配列の要素として保存

# なぜ配列に入れるの？
# ログを順番に処理したいから
# 後で "重要文字列が含まれているか" を1個ずつチェックしたい
# そのためには、ログ全体を保存しておく必要があります
# 例えば以下のように繰り返し処理するためには、配列にしておくのが最も自然です。
logs.each do |log|
    puts log if log.include?("ai")
end





# ********
# C013:嫌いな数字

# あなたは運悪く病気にかかってしまい入院しなくてはいけなくなりました。
# しかし、嫌いな数字があり、その数字が含まれる部屋番号の病室に入ると治療がうまく行かないのでは無いかと不安になってしまいます。
# そこで、部屋番号のどの桁にも嫌いな数字が含まれていない病室をリストアップして入院先に伝えることにしました。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n #嫌いな数字
# m #病室の総数
# r_1 #1個目の部屋番号
# r_2 #2個目の部屋番号
# ...
# r_m #m個目の部屋番号


# 期待する出力
# 希望する病室をそれぞれ1行に、入力された順番を崩すことなくすべて出力してください。
# もし希望する部屋が1つもなければ"none" と出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。・1行目に嫌いな数字 n (0から9までの1桁の数字)
# ・2行目に病室の総数 m
# ・3行目以降に各病室の部屋番号を表す整数 r_i (1 <= i <= m)

# が改行区切りで与えられるので、希望する病室の部屋番号をすべて改行区切りで出力して下さい。
# もし、希望する病室が1つもない場合は"none" と出力して下さい。

n = gets.chomp              # 嫌いな数字（文字として扱う）
m = gets.to_i               # 病室の総数
rooms = Array.new(m) { gets.chomp }  # m個の病室番号を配列に格納（文字列として）

result = rooms.select { |room| !room.include?(n) } # 嫌いな数字を含まない部屋番号だけ抽出

if result.empty?
    puts "none"
else
    puts result
end






# C105:カードのスコア
# あなたは数字の書かれた何枚かのカードを持っていて、それらのカードの総合スコアを計算しようとしています。
# カードは 1 ～ 100 の数字が書かれたものが 1 枚ずつあり、あなたはそれらのうち N 枚のカードを持っています。
# このとき、この N 枚のカードの総合スコアは以下のように計算されます。

# ・10, 11, 12 のように、1 の差で連続しているカードを 1 つのグループにする。
# 例えば、5, 10, 11, 12, 24, 25 というカードがあったら「5」というグループと「10, 11, 12」というグループと「24, 25」というグループに分かれる。
# ・各グループのスコアは、グループ内の最大の数であり、総合スコアは各グループのスコアの和である。
# 例えば上記の例では、「5」というグループのスコアは 5 で、
# 「10, 11, 12」というグループのスコアは 12 で、
# 「24, 25」というグループのスコアは 25 なので、総合スコアは 5+12+25 = 42 である。

# 持っている N 枚のカードのリストが与えられるので、これらのカードの総合スコアを求めてください。

# 入力される値
# 入力は以下のフォーマットで与えられます。
# N
# C_1 C_2 ... C_N
# ・1 行目にカードの枚数を表す整数 N が与えられます。
# ・2 行目には、各カードの数字を表す整数 C_i が半角スペース区切りで与えられます。
# ・入力は合計で 2 行となり、入力値最終行の末尾に改行が １ つ入ります。


# 期待する出力
# 与えられた N 枚のカードの総合スコアを 1 行に出力してください。
# 出力の最後に改行を入れ、余計な文字、空行を含んではいけません。

n = gets.to_i # カードの枚数 n を取得（整数）
cards = gets.split.map(&:to_i).sort

score = 0
group_max = cards[0]

(1...n).each do |i|
    if cards[i] == cards[i - 1] + 1
        group_max = cards[i] if cards[i] > group_max
    else
        score += group_max
        group_max = cards[i]
    end
end

score += group_max  # 最後のグループを追加

puts score


# gets.split.map(&:to_i).sort
# gets
# キーボードから 1行の文字列を取得（改行付き）

# split
# スペース区切りで 文字列を配列に分解
# ["10", "3", "5", "1"]

# map(&:to_i)
# 各文字列を to_i で整数に変換
# [10, 3, 5, 1]

# sort
# 配列を 昇順にソート
# [1, 3, 5, 10]



# 1...n（範囲に n を含まない）
# 開始: 1
# 終了: n - 1（含む）

# (1...5).to_a  # => [1, 2, 3, 4]









# C067
# 任意の数字の 2 進数表示のどの桁が 1 になるのか、もしくは 0 になるのかが気になりました。

# 知りたい桁が複数指定されるので、その桁が 0 なのか 1 なのか判定するプログラムを作成してください。
# 知りたい桁は、与えられた数字を 2 進数にしたときの桁数より小さいものとします。

# 入力例 1 の場合、以下の図のように、与えられた数字は 44 であるので、2 進数にした場合 101100 になります。
# そして、出力する値は順番に、右から 4 番目、2 番目、6 番目の数字なので、1, 0, 1 の各番号に改行を含んだものとなります。

# 入力される値
# 入力は以下のフォーマットで与えられます。

# N X
# k_1
# k_2
# ...
# k_N
# ・1 行目にそれぞれ知りたい数字を表す整数 N, X がこの順で半角スペース区切りで与えられます。
# ・続く N 行のうちの i 行目 (1 ≦ i ≦ N) には知りたい桁が右から何番目であるかを表す整数 k_i が与えられます。
# ・入力は合計で N + 1 行となり、入力値最終行の末尾に改行が 1 つ入ります。

# 入力例1
# 3 44
# 4
# 2
# 6
# 出力例1
# 1
# 0
# 1


# 要点整理
# 最初の価格は X 円
# 2回目以降は前回価格から P% 引き（整数計算で、小数点以下切り捨て）
# 無料になる（= 価格が 0 円）まで何度も買い続ける
# 各回の金額をすべて合計し、最終的な合計金額を出力する

n, x = gets.split.map(&:to_i)
n.times do
    k = gets.to_i
    puts (x >> (k - 1)) & 1
end





# C048
# コーヒーショップは本日限定であるサービスを行っています。

# ・コーヒーをお買い上げした際に、次のお買い上げの値段を更に P% off!
# ・毎回の値下げにおいて小数点以下切り捨て

# あなたは値下げが累積する事に目をつけました。
# コーヒーを何回も飲んでいれば、タダでコーヒーを飲めるようになるのです。

# 入力される値
# 入力は以下のフォーマットで与えられます。

# X P
# ・コーヒーの価格を示す整数 X と 割引き率を示す整数 P が、この順に半角スペース区切りで与えられます。
# ・入力は 1 行となり、末尾に改行が 1 つ入ります。

# 期待する出力
# 以後タダで注文するのに必要な金額を出力してください。

# 出力の最後に改行を入れ、余計な文字、空行を含んではいけません。


# 入力例1
# 300 50
# 出力例1
# 596
# 入力例2
# 1000 99
# 出力例2
# 1010

x ,p = gets.split.map(&:to_i)
total = 0
while x > 0
    total += x                # 今回の支払い額を合計に加算
    x = (x * (100 - p)) / 100 # 割引後の次回価格
end
puts total



# 例：価格 x = 300 円、割引率 p = 50
# x = (300 * (100 - 50)) / 100
#   = (300 * 50) / 100
#   = 15000 / 100
#   = 150

# gets.split.map(&:to_i)
# splitで["300", "50"]
# map(&:to_i)で配列の各要素に対して to_i を実行し、
# 新たな配列として返すので[300, 50]となる







# n 個の整数 x_1, x_2, ..., x_n と、整数 mod が与えられます。各 x_i について、
# 以下のハッシュ関数を用いてハッシュ値を計算してください。

# H(x) = x % mod

# 入力される値
# n mod
# x_1
# x_2
# ...
# x_n

# 期待する出力
# n 行出力してください。i (1 ≦ i ≦ n) 行目には、x_i のハッシュ値 H(x_i) を出力してください。
# また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

# H(x_1)
# H(x_2)
# ...
# H(x_n)


# 入力例
# 3 5
# 12
# 7
# 20


# 処理：
# 12 % 5 = 2
# 7 % 5 = 2
# 20 % 5 = 0

# 出力：
# 2
# 2
# 0

n, mod = gets.split.map(&:to_i)
n.times do
    x = gets.to_i
    puts x % mod
end








# ********
# 2次元配列に要素を追加する
# この配列のエクスカリバーを、「石斧」に書き換えてください。
basket = [["木の棒", "こん棒", "エクスカリバー"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草", "アイアンシールド"]]

# 期待する出力値
[["木の棒", "こん棒", "石斧"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草", "アイアンシールド"]]

# ここに、要素を追加するコードを記述する
basket[0][2] = "石斧"

p basket



# ********
# 2次元配列の要素の個数を出力する
# 配列のインデックス1の要素数を出力してください。
basket = [["木の棒", "こん棒"], ["おにぎり", "おにぎり", "むぎ茶"], ["アイアンシールド"], ["毒消し","毒消し","毒消し","毒消し"]]

# ここに、要素の個数を出力するコードを記述する
p basket[1].length




# ********
# 2次元配列に要素を追加する
basket = [["木の棒", "こん棒", "エクスカリバー"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草", "アイアンシールド"]]

# 期待する出力値
[["木の棒", "こん棒", "エクスカリバー", "石斧"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草", "アイアンシールド"]]

# ここに、要素を追加するコードを記述する
basket[0].push("石斧")

p basket





# ********
# 2次元配列に要素を削除する
# 配列から、「アイアンシールド」を削除してください。
basket = [["木の棒", "こん棒", "エクスカリバー"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草", "アイアンシールド"]]
# 期待する出力値
[["木の棒", "こん棒", "エクスカリバー"], ["おにぎり", "おにぎり", "むぎ茶"], ["毒消し", "薬草"]]

# ここに、要素を削除するコードを記述する
basket[2].delete_at(2)

p basket




# ********
#配列の中身をループで表示する
enemies = ["スライム", "モンスター", "ゾンビ", "ドラゴン", "魔王"]
# 期待する出力値

# 1番目のスライムが現れた！
# 2番目のモンスターが現れた！
# 3番目のゾンビが現れた！
# 4番目のドラゴンが現れた！
# 5番目の魔王が現れた！

# ここに、要素をループで表示するコードを記述する
enemies.each_with_index do |name, i|
    puts "#{i + 1}番目の#{name}が現れた！"
end




# ********
# 各要素を3倍にして新しい配列を作成する
numbers = [12, 34, 56, 78, 90]
# ここに、各要素を3倍にして新しい配列を作成するコードを記述する
numbers2 = numbers.map { |i| i * 3 }

p numbers2



# ********
# Array.newを使って、要素数が5、初期値が"paiza"という配列を作成して、pメソッドで出力してください。
array = Array.new(5, "paiza")
p array


# ********
# Array.newとmapメソッドを使って、次のような2次元配列を作成して、pメソッドで出力してください。
# ・要素数は、5個
# ・[7,7,7,7]という配列を要素にする

# 期待する出力値
# [[7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7], [7, 7, 7, 7]]

array = Array.new(5).map{Array.new(4, 7)}
p array




# 期待する出力値

#   @@  
#  @  @
# @    @
# @@@@@@
# @    @
# @    @

letter_A = [[0,0,1,1,0,0],
            [0,1,0,0,1,0],
            [1,0,0,0,0,1],
            [1,1,1,1,1,1],
            [1,0,0,0,0,1],
            [1,0,0,0,0,1]]

letter_A.each do |line|
    line.each do |i|
        if i == 1
            print "@"
        else
            print " "
        end
    end
    puts  # 行の終わりで改行
end


# puts を使うと、1文字ごとに改行が入るので、printを使う。
# print は改行しません → 1行に複数文字出したい時に便利。
# 行末だけ puts で改行すると、整ったブロック文字が描けます。




# ********
# 複数行テキストに行番号を追加する

text = ["吾輩は猫である",
        "名前はまだ無い",
        "どこで生まれたか",
        "とんと見当がつかぬ"]

# 期待する出力値

# 1:吾輩は猫である
# 2:名前はまだ無い
# 3:どこで生まれたか
# 4:とんと見当がつかぬ

#ここに、行番号を表示するコードを記述する
text.each_with_index do |line, i|
	puts "#{i + 1}:#{line}"
end





# ********
# 標準入力から、2次元配列を読み込む

# 標準入力のデータ
# 0,0,1,1,0,0
# 0,1,0,0,1,0
# 1,0,0,0,0,1
# 1,1,1,1,1,1
# 1,0,0,0,0,1
# 1,0,0,0,0,1

# 期待する出力値
# [["0", "0", "1", "1", "0", "0"], ["0", "1", "0", "0", "1", "0"], ["1", "0", "0", "0", "0", "1"], ["1", "1", "1", "1", "1", "1"], ["1", "0", "0", "0", "0", "1"], ["1", "0", "0", "0", "0", "1"]]

letter_A = []
while line = gets
	line.chomp!
    # ここに、読み込んだデータを配列に追加するコードを記述する
    letter_A.push(line.split(","))
end
p letter_A

# split(",") は「文字列を分割」するメソッド
# "0,0,1,1,0,0" を "," 区切りで分割するため、各要素はすべて文字列（"0", "1" など）になります。
# ["0", "0", "1", "1", "0", "0"]

# もし "0" を 数値の 0 にしたいなら、map(&:to_i) を使って、各要素を整数に変換します。
# line.split(",").map(&:to_i)
# [0, 0, 1, 1, 0, 0]  # 各要素は整数





# ********
# 九九の表を作成してみよう

# 期待する出力値
# 1, 2, 3, 4, 5, 6, 7, 8, 9
# 2, 4, 6, 8, 10, 12, 14, 16, 18
# 3, 6, 9, 12, 15, 18, 21, 24, 27
# 4, 8, 12, 16, 20, 24, 28, 32, 36
# 5, 10, 15, 20, 25, 30, 35, 40, 45
# 6, 12, 18, 24, 30, 36, 42, 48, 54
# 7, 14, 21, 28, 35, 42, 49, 56, 63
# 8, 16, 24, 32, 40, 48, 56, 64, 72
# 9, 18, 27, 36, 45, 54, 63, 72, 81



def multi(x, y)
  return x * y
end

for i in 1..9  # 段のループ（1〜9）
    for j in 1..9  # かける数のループ（1〜9）
        print multi(i, j)
        print ", " if j < 9
    end
    puts  # 改行して次の段へ
end




# ********
# RPGの攻撃シーン

# 入力される値
# 730

# 期待する出力値
# 勇者はスライムを攻撃した
# 敵のHPは残り530です
# 戦士はスライムを攻撃した
# 敵のHPは残り380です
# 魔法使いはスライムを攻撃した
# 敵のHPは残り280です

def attack(person)
    puts "#{person}はスライムを攻撃した"
end

def output_ememy_hp(enemy_hp)
    puts "敵のHPは残り#{enemy_hp}です"
end

enemy_hp = gets.to_i
team = {"勇者" => 200, "戦士" => 150, "魔法使い" => 100}
team.each do |person, power|
    attack(person)
    # 以下に、敵の体力を減少させるコードを書く
    enemy_hp -= power
    output_ememy_hp(enemy_hp)
end






# 正の整数 N が与えられます。
# N 以下の正の整数のうち、3 の倍数の個数を答えてください。

# 入力
# 入力は次の形式で与えられます。

# N
# また、入力される値は次の制約を満たします。
# N は 1 以上 1000 以下の整数

# 出力
# 答えを出力してください。

# 入力例 1
# 5
# 出力例 1
# 1

# 1,2,3,4,5 のうち、3 の倍数は「3」の 1 個です。

# 入力を整数として受け取る
n = gets.to_i

# 3の倍数の個数を出力
puts n / 3


# 1 から N までの配列を作り、その中で 3 の倍数を数える場合
result = (1..n).count { |x| x % 3 == 0 }
puts result








# パスワードを表す文字列 S が標準入力から与えられます。
# S が password という文字列と一致している場合には dangerous、そうでない場合は safe を出力してください。

# 入力
# 入力は次の形式で与えられます。

# S
# また、入力される値は次の制約を満たします。
# S は英小文字のみからなる長さ 1 以上 1000 以下の文字列

# 出力
# 答えを出力してください。

s = gets.chomp
puts s == "password" ? "dangerous" : "safe"



# パスワードを表す文字列 S が標準入力から与えられます。
# S が 6 文字以下の場合は dangerous、そうでない場合は safe を出力してください。
s = gets.chomp
puts s.length <= 6 ? "dangerous" : "safe"


# 正整数 N が標準入力から与えられます。
# テストの点数が 0 点以上 100 点以下であるならば valid、そうでないならば invalid を出力してください。
n = gets.to_i
puts n >= 0 && n <= 100 ? "valid" : "invalid"

# または
puts (1..100).include?(n) ? "valid" : "invalid"


# 次の処理を i=1,2,…,100 について行ってください。
# i 行目には整数 i を出力する。
(1..100).each do |i|
    puts i
end

# 次の処理を i=1,2,…,100 について行ってください。
# i 行目には整数 2i を出力する。
(1..100).each do |i|
    puts 2 * i
end


# 次の 10 個の整数のうち、左から K 番目の整数を求めてください。
# 3,1,4,1,5,9,2,6,5,3
# ただし、最も左の整数を左から 0 番目と数えます。

# 入力
# 入力は次の形式で与えられます。
# K
# また、入力される値は次の制約を満たします。
# K は 0 以上 9 以下の整数

k = gets.to_i
array = [3,1,4,1,5,9,2,6,5,3]
puts array[k]

# 繰り返し構文を活用して、次の 10 個の整数の総和を計算し出力するプログラムを作成してください。
# 3, 1, 4, 1, 5, 9, 2, 6, 5, 3

arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
sum = 0
arr.each do |i|
    sum += i
end
puts sum




# N 個の正整数が与えられます。
# その中から 3 の倍数をすべて、入力順に改行区切りで出力してください。
n = gets.to_i
arr = gets.split.map(&:to_i)

arr.each do |x|
    puts x if x % 3 == 0
end




# gets.split.map(&:to_i)
# 1 行に複数の数値が並んでいる場合に使う
# 例:
# 入力が
# 10 20 30
# のとき
# arr = gets.split.map(&:to_i)
# => [10, 20, 30]

# n.times.map { gets.chomp }
# 複数行に 1 つずつデータがある場合に使う
# 例:
# 入力が
# abc
# de
# fghij
# のとき
# arr = 3.times.map { gets.chomp }
# => ["abc", "de", "fghij"]



# 「N 個の文字列を全部つなげてできる文字列の 長さ を出力する」
# 入力例
# 3
# abc
# de
# fghij

# 出力例
# 10

n = gets.to_i
strings = n.times.map { gets.chomp }
result = strings.join.length
puts result



# N 個の文字列の頭文字をつないでできる文字列を出力してください。
n = gets.to_i
ans = ""
n.times do
    s = gets.chomp
    ans << s[0]
end
puts ans





# 配列の K 番目の要素を出力する問題
# 入力
# N K
# A0 A1 ... AN-1

n, k = gets.split.map(&:to_i)
arr = gets.split.map(&:to_i)
puts arr[k]




# 整数列 A（長さN）と整数列 B（長さM）が与えられる。
# それぞれの列の中に含まれる 正の整数（>0） の個数を数える。
# 以下の条件で出力する：
# A の方が多い → "A"
# B の方が多い → "B"
# 同じ → "same"

n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

count_a = a.count { |x| x > 0 }
count_b = b.count { |x| x > 0 }

if count_a > count_b
    puts "A"
elsif count_b > count_a
    pust "B"
else
    puts "same"
end


# count_a = a.count { |x| x > 0 }について

# a.count { ... }は配列 a の中を一つずつ取り出して { ... } の条件に当てはめ、
# true になった回数を数える仕組みです。
# { |x| x > 0 }はブロック。
# |x| は配列から取り出した要素を入れる変数。
# x > 0 という条件を評価して、true なら「カウント対象」になります。




# カメのアルルはスーパーで N 個の商品 を購入しました。

# i 番目の商品は 1 個あたりA円。
# アルルはそれをB個 買いました。
# アルルが支払った 商品の総額 を求めてください。

# 入力
# N
# A0 B0
# A1 B1
# ...
# AN-1 BN-1

n = gets.to_i
total = 0

n.times do
    a, b = gets.split.map(&:to_i)
    total += a * b
end

puts total


# a, b = gets.split.map(&:to_i)をdo endのブロックの外に書くとどうなる？

# n = gets.to_i
# a, b = gets.split.map(&:to_i)  # ← 1行しか読み取れない
# puts a * b
# ここだと 最初の1行しか読み取れません。
# もし n=3 のときでも、a, b に代入されるのは 次の1行（A0, B0）だけ です。





# 入力
# N：生徒の人数
# A0,A1...:各生徒の点数

# 平均点以上を取った生徒の 出席番号（0始まり） を、小さい順に改行区切りで出力

n = gets.to_i
scores = gets.split.map(&:to_i)

average = scores.sum.to_f / n   # 平均点（小数で計算）

scores.each_with_index do |score, i|
    puts i if score >= average
end




# これら N 個の整数を末尾から順に、一行ずつ出力してください。
n = gets.to_i
a = gets.split.map(&:to_i)

a.reverse_each { |x| puts x } # reverse_each で後ろから順に出力します。





# 10,9,…,1 を 1 行ずつ出力してください。
(1..10).to_a.reverse.each do |i|
    puts i
end

# to_a とは？
# Ruby で 「配列に変換するメソッド」 です。
# to_a = "to array" の意味。
# reverseを使いたいから配列にしている。



# 九九を81行で出力する問題ですね。
# 形式に従って "a * b = c" を出力

# 出力例（最初と最後）
# 1 * 1 = 1
# 1 * 2 = 2
# ...
# 9 * 8 = 72
# 9 * 9 = 81

(1..9).each do |a|
    (1..9).each do |b|
        puts "#{a} * #{b} = #{a * b}"
    end
end




# 九九を「表形式」で出力する
# 出力例
# 1 2 3 4 5 6 7 8 9
# 2 4 6 8 10 12 14 16 18
# 3 6 9 12 15 18 21 24 27
# 4 8 12 16 20 24 28 32 36
# 5 10 15 20 25 30 35 40 45
# 6 12 18 24 30 36 42 48 54
# 7 14 21 28 35 42 49 56 63
# 8 16 24 32 40 48 56 64 72
# 9 18 27 36 45 54 63 72 81

(1..9).each do |i|
    result = (1..9).map { |j| i * j }
    puts result.join(" ")
end

# 処理の流れ
# 外側ループ (1..9) → 行番号
# 内側 (1..9).map { |j| i * j } → その行の計算結果を配列にする
# join(" ") でスペース区切りにして1行の文字列に変換
# puts で出力







# 文字列 S の中で文字 'a' が現れるすべての位置（インデックス）を求め、小さい順に改行区切りで出力
n = gets.to_i
s = gets.chomp

s.chars.each_with_index do |ch, i|
    puts i if ch == "a"
end
# s.chars で文字列を配列に分解
# chars にする理由は「文字列を配列にして、Ruby の配列処理メソッド（each, map, select など）が使えるようにする」ため
# each_with_index で (文字, インデックス) を順に処理
# ch == "a" のときだけ puts i




# 最初に現れる 'a' の位置（0始まり）を出力
n = gets.to_i
s = gets.chomp

puts s.index('a')



# 文字列 S に含まれる 'a' の個数を数えて出力
n = gets.to_i
s = gets.chomp

puts s.count('a')



# 長さ N の文字列 S と T が与えられます。
# S と T を比較したとき、同じ位置に同じ文字がある箇所はいくつありますか。
# 同じ位置で文字が一致する数を数える

n = gets.to_i
s = gets.chomp
t = gets.chomp

count = 0
n.times do |i|
    count += 1 if s[i] == t[i]
end
puts count




# 文字列 S の中に "abc" が連続して現れる箇所の数を数える課題
n = gets.to_i
s = gets.chomp

count = 0
(0..n-3).each do |i|  # 長さ3の部分文字列を取り出すので n-3 まで
    count += 1 if s[i, 3] == "abc"
end

puts count

# s[i, 3] は「文字列 s の i 文字目から3文字」を取り出します。
# "abc" と一致したらカウントを増やします。
# i の範囲は 0..n-3（最後の2文字から始めても "abc" は作れないので）。






# 文字列 S の中に文字列 T が 連続して含まれるかを判定し、含まれるなら "Yes", 含まれなければ "No" を出力
s = gets.chomp
t = gets.chomp

puts s.include?(t) ? "Yes" : "No"





# 1 か月のカレンダーを、次の仕様に従って作成してください。

# カレンダーについて
# 1 日から 31 日まであるとする。
# 1 週間は 7 日とする。
# 日曜日を最も左の列とする。
# 1 日が日曜日であるとする。
# 出力形式について
# 日付は空白区切りで出力し、週が変わるごとに改行する。
# すなわち、次のような出力をしてください。

# 1 2 3 4 5 6 7
# 8 9 10 11 12 13 14

(1..31).each_slice(7) do |week|
    puts week.join(' ')
end


# each_slice(7)

# 配列や範囲を 指定したサイズごとに分割して繰り返し処理してくれます。
# ここでは 7 を指定しているので、配列を 7個ずつの小グループに分けて繰り返すことになります。
# 例
# (1..15).each_slice(7) { |week| p week }
# 出力:
# [1, 2, 3, 4, 5, 6, 7]
# [8, 9, 10, 11, 12, 13, 14]



# week.join(' ')

# join(' ') は配列の要素を文字列に変換し、間を ' '（スペース）でつなぎます。
# 例
# [1,2,3,4,5,6,7].join(' ')
# => "1 2 3 4 5 6 7"





# 1..N の中で '4' も '9' も含まない数だけを出力
n = gets.to_i

(1..n).each do |x|
    s = x.to_s
    puts x unless s.include?('4') || s.include?('9')
end





# S を T に一致させるために置き換える必要がある文字数を数える
n = gets.to_i
s = gets.chomp
t = gets.chomp

count = 0
(0...n).each do |i|
    count += 1 if s[i] != t[i]
end
puts count



n = gets.to_i
s = gets.chomp

map = { 'A' => 'T', 'T' => 'A', 'G' => 'C', 'C' => 'G'}
result = ""
s.chars.each do |i|
    result << map[i]
end
puts result

# s.chars.each do |ch|
# → 文字列 s を1文字ずつ取り出してループする。


# 「キー」と「値」をセットで持つデータ構造。
# 上の例だと：
# キー 'A' に対して値 'T'
# キー 'T' に対して値 'A'
# キー 'G' に対して値 'C'
# キー 'C' に対して値 'G'





# 3桁ごとにカンマ区切りにする
s = gets.strip
# gets で標準入力から1行読み込む。
# strip で末尾の改行（\n）を削除する。
# こうして数字が文字列として s に入ります。
# 例: 入力が 1234567 → s = "1234567"

puts s.reverse.chars.each_slice(3).map(&:join).join(',').reverse

# s.reverse
# 文字列を逆順にする。
# 例: "1234567".reverse → "7654321"

# .chars
# 文字列を1文字ずつの配列に変換。
# 例: "7654321".chars → ["7", "6", "5", "4", "3", "2", "1"]

# .each_slice(3)
# 配列を 3個ずつに分割してくれる
# ["7", "6", "5", "4", "3", "2", "1"].each_slice(3).to_a
# => [["7", "6", "5"], ["4", "3", "2"], ["1"]]


# [["7","6","5"], ["4","3","2"], ["1"]].map(&:join)
# => ["765", "432", "1"]
# &:join は { |arr| arr.join } の省略形。

# .join(',')
# それぞれの文字列をカンマ区切りでつなぐ。
# 例: ["765", "432", "1"].join(",") → "765,432,1"

# .reverse
# 最後にもう一度 reverse して正しい順序に戻す。
# 例: "765,432,1".reverse → "1,234,567"