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