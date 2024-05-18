'use strict';

{
  const btn = document.getElementById('btn');
  const result = document.getElementById('result');

  btn.addEventListener('click', () => {
    const results = ['大吉','中吉','小吉']
    const n =Math.floor(Math.random() * results.length);
    result.textContent = results[n];
  });
}

// ********レッスン********
// 2. 文字列の逆転
// 問題: 与えられた文字列 s を逆転させます。

// 例:
// 入力: s = "hello"
// 出力: "olleh"
  function reverseString(s) {
    return s.sprit('').reverse().join('');
  }

// 3. 文字列内の特定の文字のカウント
// 問題: 文字列 s 内の特定の文字 char の出現回数をカウントします。

// 例:
// 入力: s = "hello", char = "l"
// 出力: 2

  function count(s, char) {
    return s.sprit(char).length - 1;
  }


// 4. アナグラムの検出
// 問題: 二つの文字列 s1 と s2 がアナグラムかどうかを判断します。

// 例:
// 入力: s1 = "listen", s2 = "silent"
// 出力: true

  function anagram(s1, s2) {
    const sortStr = (str) => {
      return str.sprit('').sort().join('');
    };
    return sortStr(s1) === sortStr(s2);
  }

  // 省略記法(アロー関数の中括弧 {} と return キーワードを省略)
  function anagram(s1, s2) {
    const sortStr = (str) => str.sprit('').sort().join('');
    return sortStr(s1) === sortStr(s2);
  }

// 5. フィボナッチ数列
//   問題: n 番目のフィボナッチ数を求めます。

// 例:
// 入力: n = 5
// 出力: 5 // 0, 1, 1, 2, 3, 5

function fibonacci(n) {
  if (n <= 1) return n;
  let fib = [0, 1];
  for(let i = 2; i <= n; i++) {       //2 から n までの範囲で繰り返し処理を行います
    fib[i] = fib[i - 1] + fib[i - 2];
  }
  return fib[n];
}




// 6. 素数の検出
// 問題: 与えられた数 n が素数かどうかを判断します。

// 例:
// 入力: n = 29
// 出力: true

function primeNumber(n) {
  if (n <= 1) return false;
    for(let i = 2; i <= n; i++) {
      if (n % i === 0) return false; //n が i で割り切れるかどうかを確認。n % i === 0 の場合、n は i で割り切れるので素数ではありません。したがって、false を返します。
    }
    return true;
}






// 7. 最大公約数
// 問題: 二つの数 a と b の最大公約数を求めます。

// 例:
// 入力: a = 54, b = 24
// 出力: 6
function gcd(a, b) {
  if (b === 0) return a;  // b が 0 になったら、a が最大公約数
    return gcd(b, a % b);  // 再帰的に gcd 関数を呼び出す
}
// a = 54, b = 24 の場合：
// gcd(54, 24) を呼び出す
// 54 % 24 = 6 なので、次は gcd(24, 6) を呼び出す
// 24 % 6 = 0 なので、次は gcd(6, 0) を呼び出す
// b が 0 なので、最大公約数は 6 となる




// 8. 数値のパリティ（奇数か偶数か）のチェック
// 問題: 与えられた整数 n が奇数か偶数かを判断します。

// 例:
// 入力: n = 4
// 出力: "偶数"

function evenAdd(n) {
  return(n % 2 === 0) ? "偶数":"奇数"
}


// 10. リニアサーチ
// 問題: 配列 nums 内で target を検索し、そのインデックスを返します。存在しない場合は -1 を返します。

// 例:
// 入力: nums = [4,5,6,7,0,1,2], target = 6
// 出力: 2

function linierSearch(nums, target) {
  for (let i = 0; i < length; i++) {
    if (nums[i] === target) return i;
  }
}






// # Fizz Buzz

// # answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
// # answer[i] == "Fizz" if i is divisible by 3.
// # answer[i] == "Buzz" if i is divisible by 5.
// # answer[i] == i (as a string) if none of the above conditions are true.

// # Example 1:
// # Input: n = 3
// # Output: ["1","2","Fizz"]

// # Example 2:
// # Input: n = 5
// # Output: ["1","2","Fizz","4","Buzz"]

// # Example 3:
// # Input: n = 15
// # Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

function fizzBuzz(n) {
  let answer = [];
  for(let i = 1; i <= n; i++) {
    if (i % 15 === 0){
      answer.push("FizzBuzz");
    }
    else if (i % 3 ===0) {
      answer.push("Fizz");
    }
    else if (i % 5 ===0){
      answer.push("Buzz");
    }
    else {
      answer.push(i.toString());
    }
  }
  return answer;
}




// Missing Number
// Example 1:
// Input: nums = [3,0,1]
// Output: 2
// Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
// Example 2:
// Input: nums = [0,1]
// Output: 2
// Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
// Example 3:
// Input: nums = [9,6,4,2,3,5,7,0,1]
// Output: 8
// Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

function missingNunber(nums) {
  const n = nums.length;
  const total = (n * (n + 1)) / 2;
  const sum = nums.reduce((acc, num) => acc + num, 0); //reduce メソッドは、配列の各要素に対して指定されたコールバック関数を実行し、その結果を累積して1つの値にします。
  return total - sum;
}


// ********Reverse String********
// Example 1:

// Input: s = ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]
// Example 2:

// Input: s = ["H","a","n","n","a","h"]
// Output: ["h","a","n","n","a","H"]

function reverse(s) {
  return s.reverse();
}


// ********重複削除********
// Example 1:
// Input: nums = [1,1,2]
// Output: 2, nums = [1,2,_]
// Example 2:
// Input: nums = [0,0,1,1,1,2,2,3,3,4]
// Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]

function removeDuplicates(nums) {
  const uniqueNums = [...new Set(nums)];  // Setを使って重複を削除し、一意の要素のみを保持
  // 元の配列をクリアし、ユニークな要素を追加
  nums.length = 0;
  uniqueNums.forEach(num => nums.push(num));
  return nums.length  // 重複を削除した後の配列の長さを返す
}