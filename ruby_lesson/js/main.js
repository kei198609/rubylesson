// ********コードで値が取得 ********
// readline モジュールのセットアップ
// readline モジュールを使用して、標準入力 (process.stdin) と
// 標準出力 (process.stdout) を扱うインターフェースを作成します。
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

// line イベントのリスナーを設定
// readline インターフェースは、標準入力から一行ずつ読み取るたびに line イベントを発火します。
// このイベントが発生するたびに、コールバック関数が呼び出され、その行のデータが引数 line として渡されます。
// このコールバック関数では、受け取った行のデータを lines 配列に追加しています。
reader.on('line', (line) => {
  // 文字列 s を取得
  lines.push(line);
});

// close イベントのリスナーを設定
// 入力ストリームが終了すると、readline インターフェースは close イベントを発火します。
// このイベントが発生すると、コールバック関数が呼び出され、lines 配列からデータを取り出して出力します。
// 配列には、標準入力から読み取った各行が格納されています。
reader.on('close', () => {
  // 文字列 s をそのまま出力し、末尾に改行を追加
  console.log(lines[0]);
});


// ********半角スペース区切りの 2 つの入力 ********
// 入力される値
// 以下の形式で標準入力によって与えられます。
// 半角スペースで区切られた文字列 s_1, s_2 が 1 行で与えられます。


// s_1 s_2

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 入力された文字列 s_1, s_2 をそれぞれ改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// s_1
// s_2


process.stdin.resume();
process.stdin.setEncoding('utf8');
// 自分の得意な言語で
// Let's チャレンジ！！
var lines = [];
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line', (line) => {
  const [s1, s2] = line.split(' ');

  console.log(s1);
  console.log(s2);
});





// ********
// 箱の中に 1~9 までのいずれかの数字が書かれている玉を取り出し、
// その玉に書かれている数字から運勢を占います。玉に書かれている数字が 7 の時は大吉となります。
// 占いで取り出した玉に書かれている数字が 1 つ与えられます。大吉かどうかを判定してください。

// 入力される値
// n


// ・ 1 行目に取り出した玉に書かれている数字 n が入力されます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 大吉の場合は「Yes」、そうでない場合は「No」と 1 行に出力してください。

process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // 入力値を整数に変換
  const n = Number(line.trim());

  // 数字が 7 なら 'Yes' を、それ以外は 'No' を出力
  if (n === 7) {
    console.log('Yes');
  } else {
    console.log('No');
  }
});









// ********
// 正の整数 N が与えられます。
// 1 ~ N の整数を 1 から順に改行区切りで出力してください。

// 入力される値
// N


// ・ 正の整数 N が 1 行で与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 1 〜 N の整数を 1 から順に改行区切りで出力してください。
// 出力の末尾には改行を入れてください。


process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // 入力値を整数に変換
  const N = parseInt(line.trim(), 10);

  // 1 から N までの整数を出力
  for (let i = 1; i <= N; i++) {
    console.log(i);
  }
});




// ********
// 1 ~ 100 の整数に対して、3 と 5 の両方で割り切れるなら FizzBuzz を、 3 でのみ割り切れるなら Fizz 、5 でのみ割り切れるなら Buzz を改行区切りで出力してください。また、どちらでも割り切れない場合は、その数字を改行区切りで出力してください。

// 1
// 2
// Fizz
// 4
// Buzz

// 入力される値
// ・ 入力は与えられません。


process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

// 実際の処理は標準入力ではなく、直接書くコードにします。
// 1から100までの数字を処理するためのコード
for (let i = 1; i <= 100; i++) {
  if (i % 3 === 0 && i % 5 === 0) {
    console.log('FizzBuzz');
  } else if (i % 3 === 0) {
    console.log('Fizz');
  } else if (i % 5 === 0) {
    console.log('Buzz');
  } else {
    console.log(i);
  }
}


// ********
// 1. 標準入力から文字列を 1 個受け取る
// 2. その文字列が「Hello」に等しい場合、次のメッセージを表示する
// こんにちは

// 3. 「Hello」に等しくない場合、次のメッセージを表示する
// AAAはHelloではない

// * AAAに、その文字列を当てはめる
// 入力される値
// Hello


let lines = require("fs").readFileSync("/dev/stdin", "utf8").split("\n");
let greeting = lines[0];

if ( greeting == 'Hello') {
    console.log('こんにちは');
}else {
    console.log(`${greeting}はHelloではない`); // 文字列での式展開はこう書く
}




// ********
// 1. 標準入力から整数を 1 個受け取る
// 2. 受け取った整数の回数分、以下のメッセージを表示する
// Hello paiza


// 入力される値
// 3
//  期待する出力値
// Hello paiza
// Hello paiza
// Hello paiza

//  標準入力で指定した回数繰り返す
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // 入力値を数値に変換
  const count = Number(line.trim());

  // 指定された回数だけメッセージを表示
  for (let i = 0; i < count; i++) {
    console.log("Hello paiza");
  }

  // リーダーを閉じる
  reader.close();
});



// ********
// 1. 標準入力から整数を 1 個受け取る
// 2. 受け取った整数を表示する

// 3. 受け取った整数回分、以下の処理を繰り返す

// a. さらに標準入力から整数を 1 個受け取る
// b. その整数が 0 の場合、以下のメッセージを表示する
// AAAは0

// c. その整数が 0 より大きい場合、以下のメッセージを表示する
// AAAはプラス

// d. それ以外の場合、以下のメッセージを表示する
// AAAはマイナス

// * AAA には、その整数を当てはめる


// 入力される値
// 1
// 0
// 期待する出力値
// 1
// 0は0


// ゼロ・プラス・マイナスを繰り返し判定する
let lines = require("fs").readFileSync("/dev/stdin", "utf8").split("\n");
let count = lines[0];
console.log(count);

for (let i = 1; i <= count; i++) { // 配列のインデックスが1から始まるので、i=1 から開始
  let number = Number(lines[i].trim()); // 数値として扱うために Number() を使う

  if (number === 0) {
    console.log(`${number}は0`);
  } else if (number > 0) {
    console.log(`${number}はプラス`);
  } else {
    console.log(`${number}はマイナス`);
  }
}



// ********
// 10 個の文字列 S_1, S_2, S_3, ..., S_10 が改行区切りで与えられます。
// これらの文字列をすべて、半角スペース区切りで出力してください。

// 入力される値
// S_1
// S_2
// S_3
// ...
// S_10

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの文字列を 1 行で出力してください。

// S_1 S_2 S_3 ... S_10

// 末尾に改行を入れ、余計な文字、空行を含んではいけません。


const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 各行の入力を lines 配列に追加します。
let lines = [];
reader.on('line', (line) => {
  lines.push(line);
});

// reader.on('close', () => { ... }); で入力が完了した後、
// lines 配列を join(' ') メソッドでスペース区切りの文字列に変換し、
// それを console.log(result); で出力します。
reader.on('close', () => {
  // すべての文字列をスペース区切りで結合
  const result = lines.join(' ');
  console.log(result);
});








// ********
// 2 つの文字列 S, T が入力されます。S, T を改行区切りで出力してください。
// 入力される値
// S
// T

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます
// 期待する出力
// 答えの文字列を 2 行で出力してください。

// S
// T

// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];
reader.on('line', (line) => {
  lines.push(line);// line イベントで受け取った各行を lines 配列に追加します。これにより、全ての入力行を収集できます。
});

reader.on('close', () => {
  const [s, t] = lines; // close イベントで入力が完了した後に、収集した lines 配列から各行を取り出し、改行区切りで出力します。
  console.log(s);
  console.log(t);
});





// ********
// 10 個の文字列 S_1, S_2, S_3, ..., S_10 が半角スペース区切りで与えられます。
// これらの文字列をすべて、改行区切りで出力してください。
// 入力される値
// S_1 S_2 S_3 ... S_10

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの文字列を 10 行で出力してください。

// S_1
// S_2
// S_3
// ...
// S_10

// 末尾に改行を入れ、余計な文字、空行を含んではいけません。



const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // 半角スペースで区切られた文字列を配列に分割
  const strings = line.split(' ');

  // 配列の各要素を改行区切りで出力
  strings.forEach(str => console.log(str));
});

// forEach は、JavaScript の配列メソッドで、
// 配列の各要素に対して指定された関数を一度ずつ実行します。配列を順番に処理するための便利な方法です。