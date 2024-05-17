# フィボナッチ

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


# 7. 最大公約数
# 問題: 二つの数 a と b の最大公約数を求めます。

# 例:
# 入力: a = 54, b = 24
# 出力: 6

def gcd(a, b)
    return a if b == 0  # b が 0 になったら、a が最大公約数
    gcd(b, a % b)  # 再帰的に gcd 関数を呼び出す
end


# // 8. 数値のパリティ（奇数か偶数か）のチェック
# // 問題: 与えられた整数 n が奇数か偶数かを判断します。

# // 例:
# // 入力: n = 4
# // 出力: "偶数"

def evenAdd(n)
    n % 2 == 0 ? "偶数" : "奇数"
end


# 10. リニアサーチ
# 問題: 配列 nums 内で target を検索し、そのインデックスを返します。存在しない場合は -1 を返します。

# 例:
# 入力: nums = [4,5,6,7,0,1,2], target = 6
# 出力: 2

def linierSearch(nums, target)
    nums.each_with_index do |num, index|
        return index if num == target
    end
    -1
end


