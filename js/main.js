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
    return s.split('').reverse().join('');
  }

// 3. 文字列内の特定の文字のカウント
// 問題: 文字列 s 内の特定の文字 char の出現回数をカウントします。

// 例:
// 入力: s = "hello", char = "l"
// 出力: 2

  function count(s, char) {
    return s.split(char).length - 1;
  }



// split(char) の動作：
// split() は、指定した文字で文字列を分割し、配列を返します。
// "hello" の中には "l" が 2回 含まれています。
// "l" を区切りとして分割すると：
// "he"（最初の "l" の前）
// ""（2つの "l" の間）
// "o"（最後の "l" の後）

// "hello".split("l")
// → ["he", "", "o"]


// 4. アナグラムの検出
// 問題: 二つの文字列 s1 と s2 がアナグラムかどうかを判断します。

// 例:
// 入力: s1 = "listen", s2 = "silent"
// 出力: true

  function anagram(s1, s2) {
    const sortStr = (str) => {
      return str.split('').sort().join('');
    };
    return sortStr(s1) === sortStr(s2);
  }

  // 省略記法(アロー関数の中括弧 {} と return キーワードを省略)
  function anagram(s1, s2) {
    const sortStr = (str) => str.split('').sort().join('');
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

function missingNumber(nums) {
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



// ********Rotate Array********
// Example 1:

// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]
// Explanation:
// rotate 1 steps to the right: [7,1,2,3,4,5,6]
// rotate 2 steps to the right: [6,7,1,2,3,4,5]
// rotate 3 steps to the right: [5,6,7,1,2,3,4]
// Example 2:

// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]
// Explanation:
// rotate 1 steps to the right: [99,-1,-100,3]
// rotate 2 steps to the right: [3,99,-1,-100]

function rotate(nums) {
  k = k % nums.length;// k を配列の長さで割った余りに設定
  const rotatePart = nums.splice(-k);// 配列の最後の k 要素を取得して削除
  nums.unshift(...rotatePart);// 取得した要素を配列の先頭に追加
}

// k を配列の長さで割った余りに設定します。
// これにより、k が配列の長さを超える場合でも適切な回転数に調整されます。

// splice メソッドを使って、配列の最後の k 要素を切り出し、
// それらを新しい配列 rotatedPart に格納します。同時に、元の配列からこれらの要素が削除されます。

// unshift メソッドを使って、切り出した要素を元の配列 nums の先頭に追加します。
// ... スプレッド構文を使って要素を展開し、一つ一つの要素として追加します。

// 例1: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
// k = 3 の場合、3 % 7 = 3 なので k はそのまま 3 です。
// 最後の 3 要素 [5, 6, 7] を切り出して、配列 nums は [1, 2, 3, 4] になります。
// 切り出した [5, 6, 7] を先頭に追加して、配列 nums は [5, 6, 7, 1, 2, 3, 4] になります。

// 例2: nums = [-1, -100, 3, 99], k = 2
// k = 2 の場合、2 % 4 = 2 なので k はそのまま 2 です。
// 最後の 2 要素 [3, 99] を切り出して、配列 nums は [-1, -100] になります。
// 切り出した [3, 99] を先頭に追加して、配列 nums は [3, 99, -1, -100] になります。



// ********valの削除********
// Example 1:
// Input: nums = [3,2,2,3], val = 3
// Output: 2, nums = [2,2,_,_]

// Example 2:
// Input: nums = [0,1,2,2,3,0,4,2], val = 2
// Output: 5, nums = [0,1,4,0,3,_,_,_]
function removeElement(nums, val) {
  let i = 0; // 新しい配列のインデックス
  for (let j = 0; j < nums.length; j++) {
    if (nums[j] !== val) {
      nums[i] = nums[j];
      i++;
    }
  }
  for (let k = i; k < nums.length; k++) {
    nums[k] = '_'; // 削除された部分を '_' で置き換える
  }
  return i; // 削除後の新しい長さを返す
}




// fizzBuzz
// 1 ~ 100 の整数に対して、3 と 5 の両方で割り切れるなら FizzBuzz を、
// 3 でのみ割り切れるなら Fizz 、5 でのみ割り切れるなら Buzz を改行区切りで出力してください。
// また、どちらでも割り切れない場合は、その数字を改行区切りで出力してください。

process.stdin.resume();
process.stdin.setEncoding('utf8');
// 自分の得意な言語で
// Let's チャレンジ！！
const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line', (line) => {
  lines.push(line);
});
reader.on('close', () => {
  for (let i = 1; i <= 100; i++) {
    if (i % 15 === 0) {
      console.log("FizzBuzz");
    } else if (i % 3 === 0) {
      console.log("Fizz");
    } else if (i % 5 === 0) {
      console.log("Buzz");
    } else {
      console.log(i);
    }
  }
});






// 入力される値
// S

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
// 期待する出力
// YESまたはNOを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。


// YES
// または
// NO
process.stdin.resume();
process.stdin.setEncoding('utf8');

const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  lines.push(line);
});

reader.on('close', () => {
  const S = lines[0]; // 入力された文字列

  // ↓ ここに判定ロジックを書く
  if (S === "hello") {  // 例：Sが"hello"ならYES
    console.log("YES");
  } else {
    console.log("NO");
  }
});




// 整数 A, B, C が与えられます。
// 式 A × B ≦ C が成立している場合はYESを、そうではない場合はNOを出力してください。

process.stdin.resume();
process.stdin.setEncoding('utf8');

const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  lines.push(line);
});

reader.on('close', () => {
  const [A, B, C] = lines[0].split(' ').map(Number);

  if (A * B <= C) {
    console.log("YES");
  } else {
    console.log("NO");
  }
});

// lines[0]： "3 4 12" のような文字列が格納される。
// .split(' ')： ["3", "4", "12"] に分割。
// .map(Number)： [3, 4, 12] に数値変換。






// ある占いでは、箱の中に 1~9 までのいずれかの数字が書かれている玉を取り出し、
// その玉に書かれている数字から運勢を占います。
// 玉に書かれている数字が 7 の時は大吉となります。
// 占いで取り出した玉に書かれている数字が 1 つ与えられます。
// 大吉かどうかを判定してください。
process.stdin.resume();
process.stdin.setEncoding('utf8');

const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line', (line) => {
  lines.push(line);
});
reader.on('close', () => {
  const num = Number(lines[0]); //lines[0] に入力された数字が文字列として入るので、Number() で数値に変換。
  if (num === 7) {
    console.log("Yes");
  } else {
    console.log("No");
  }
});