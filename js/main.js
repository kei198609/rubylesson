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




// 正の整数 N が与えられます。
// 1 ~ N の整数を 1 から順に改行区切りで出力してください。
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
    const N = Number(lines[0]); // ← 数値に変換
  for (let i = 1; i <= N; i++) {
      console.log(i);
  }
});





// 整数 A, B が与えられます。A と B の差 D と積 P を半角スペース区切りで出力してください。
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
  const [A, B] = lines[0].split(' ').map(Number); // A, Bを数値として取得
  const D = A - B;
  const P = A * B;
  console.log(`${D} ${P}`); // 半角スペース区切りで出力
});


// 長さ N の数列Aが与えられます。Aの中に 0 が含まれていない場合はYESを、 0 が含まれている場合はNOを出力してください。
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
  const N = Number(lines[0]);
  const A = lines.slice(1, N + 1).map(Number);
  const hasZero = A.includes(0);
  if (hasZero) {
    console.log("NO");
  } else {
    console.log("YES");
  }
});





// 2 つの整数A、Bが与えられます。AとBが両方とも 10 以上の場合はYESを、そうではない場合はNOを出力してください。
// 入力される値
// A B

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
  const [A, B] = lines[0].split(' ').map(Number);
  if (A >= 10 && B >= 10) {
    console.log("YES");
  } else {
    console.log("NO");
  }
});




// 大文字または小文字のアルファベットCが与えられます。
// Cが大文字の場合はYESを、そうではない場合はNOを出力してください。

// 入力される値
// C

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
  const C = lines[0];// 1文字のアルファベット
  if (C >= 'A' && C <= 'Z') {
    console.log();
  } else {
    console.log();
  }
});

// C >= 'A' && C <= 'Z'
// → アルファベットの大文字かどうかを判定する条件です。
// 'A'〜'Z' は Unicode（またはASCII）で連続しているので、この比較が有効です。



// 2 つの整数A、Bが与えられます。A, B の少なくとも一方が 10 以上の場合はYESを、そうではない場合はNOを出力してください。

// 入力される値
// A B
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
  const [A, B]  = lines[0].split(' ').map(Number);
  if (A >= 10 || B >= 10) {
    console.log('YES');
  } else {
    console.log('NO');
  }
});




// 長さ N の数列Aが与えられます。この数列に含まれる偶数の要素の個数と、奇数の要素の個数を答えてください。

// 入力される値
// N
// A1 A2 ... AN
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
  const N  = Number(lines[0]);// 最初の行は要素数
  const A  = lines[1].split(' ').map(Number);// 2行目が数列A
  let even = 0;
  let add = 0;
  for (let i = 0; i < N; i++) {
    if (A[i] % 2 === 0) {
      even++;
    } else {
      add++;
    }
  }
  console.log(`${even} ${odd}`);
});



// 整数Nが与えられます。Nのけた数を出力してください。
// 入力される値
// N

// 期待する出力
// N のけた数Dを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
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
  const N  = lines[0].trim();// 入力された行から改行や空白を除く
  const D  = N.replace('-', '').length;//負の符号を除いた桁数
  console.log(D);
});



// 整数N, A, B ( - 99 ≦ N, A, B ≦ 100 ) があります。
// 以下の 2 つの操作をそれぞれ 1 回ずつおこなったとき、Nを 0 にできる場合はYESを、
// できない場合はNOを出力してください。
// 1. NにAを足す、またはNからAを引く
// 2. NにBを足す、またはNからBを引く

// 入力される値
// N A B
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
  const [N, A, B]  = lines[0].split(' ').map(Number);
  const results = [
    N + A + B,
    N + A - B,
    N - A + B,
    N - A - B
  ];
  if (results.includes(0)) {
    console.log('YES');
  } else {
    console.log('NO');
  }
});
// N ± A ± B の4通りを results 配列に格納
// .includes(0) でどれか1つでも 0 になれば "YES"




// 整数N, 2 つの数列A, B が与えられます。 1 ≦ i ≦ N を満たす整数 i のうち、
// A_i と B_i が等しくなるような i の個数を求めてください。

// 入力される値
// N
// A_1 A_2 ... A_N
// B_1 B_2 ... B_N
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
  const N  = Number(lines[0]);
  const A  = lines[1].split(' ').map(Number);
  const B  = lines[2].split(' ').map(Number);

  let count = 0;

  for (let i = 0; i < N; i++) {
    if (A[i] === B[i]) {
      count++;
    }
  }
});




// 2 以上の整数N, Kが与えられます。
// 「Nを 2 倍した数でNを更新する」という操作を何度か繰り返すことを考えます。
// このとき, ちょうどある回数 M で N の値は K 以上になります。この時点で操作の繰り返しを終了することにします。

// この繰り返しの回数Mを求めてください。(Mは 0 でも構いません)

// 入力される値
// N K

reader.on('close', () => {
  let [N, K]  = lines[0].split(' ').map(Number); //後半のN *= 2で再代入があるため letにしている

  let M = 0;

  while (N < K) {
    N *= 2;
    M++;
  }
  console.log(M);
});





// 直線上の道があり、最初は X = 0 の地点にいます。この道はX = T + 0.1 の地点で崖になっています。
// また、 1 歩でX軸方向にK進むことができます。崖に落ちずにN歩進むことはできるでしょうか。

// 崖に落ちずにN歩進むことができる場合はYESを、そうではない場合はNOを出力してください。
// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力される値
// N K T

reader.on('close', () => {
  const [N, K, T]  = lines[0].split(' ').map(Number); //
  const position = N * K;
  const cliff = T + 0.1;

  if (position < cliff) {
    console.log("YES");
  } else {
    console.log("NO");
  }
});