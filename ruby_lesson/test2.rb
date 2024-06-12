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







# ********paiza********
