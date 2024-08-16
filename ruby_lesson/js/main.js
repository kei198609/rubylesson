// ********parseInt vs Number ********
// const N = Number(line.trim()); も const N = parseInt(line.trim(), 10); も基本的には数値に変換するためのコードですが、それぞれのメソッドには違いがあります。以下にそれぞれの違いを説明します。

// parseInt(value, radix):
// value を指定された radix（基数）で整数に変換します。
// 基数を指定することで、異なる進数表記の文字列（例えば、16進数の文字列）を整数に変換できます。
// radix を 10 に設定することで、10進数として解釈します。
// parseInt は文字列の先頭から数値として解釈できる部分を変換し、変換できない部分は無視します。例えば、parseInt("123abc", 10) は 123 になります。

// Number(value):
// value を数値に変換します。
// Number は文字列全体が数値でなければ NaN（非数）を返します。例えば、Number("123abc") は NaN になります。
// Number は文字列全体を変換するので、無効な部分を無視しません。
// どちらを使うべきか
// 入力が確実に整数であり、数値以外の文字が含まれないことがわかっている場合は、Number を使っても問題ありません。
// 入力に数値以外の文字が含まれる可能性がある場合や、進数が指定される場合には、parseInt を使うと安全です。


// const: 定数として一度だけ値を設定し、その後変更しない変数に使います。再代入が不要で、変数の参照が一定である場合に使用します。
// let: 再代入可能な変数に使います。変数の値が変更される可能性がある場合に使用します。


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
// 'line' は readline モジュールにおける標準のイベント名であり、名前を変更することはできません。
// 他のイベント（例えば 'close' や 'error'）も同様に、モジュールの仕様に従って使う必要があります。


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






// ********
// 数値 N が入力されます。1 から N までの数値をすべて、改行区切りで出力してください。
process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const n = Number(line.trim());
  for (let i = 1; i <= n; i++) {
    console.log(i);
  }
});


// ********
// 3 つの文字列が改行区切りで与えられます。
// これらの文字列をバーティカルライン | 区切りで出力してください。

// 入力される値
// S1
// S2
// S3

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの数値を出力してください。


// S1|S2|S3


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。


process.stdin.resume();
process.stdin.setEncoding('utf8');

const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];

reader.on('line', (line) => {
  lines.push(line);
});

reader.on('close', () => {
  // バーティカルラインで区切って出力
  console.log(lines.join('|'));
});





// ********
// 10 個の数値が半角スペース区切りで与えられます。これらの数値すべて受け取り、そのまま出力してください。ただし、数値を出力した直後に必ずカンマを、末尾にはさらに改行も出力してください。

// 入力される値
// N1 N2 N3 ... N10

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの数値を出力してください。


// N1,N2,N3,...,N10,


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

process.stdin.resume();
process.stdin.setEncoding('utf8');

const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // 入力の行をスペースで分割して配列にする
  const numbers = line.trim().split(' ');

  // 配列の要素をカンマで結合し、末尾にカンマを追加する
  const result = numbers.join(',') + ',';

  // 結果を出力
  console.log(result);
});





// ********
// 9 個の数値が半角スペース区切りで入力されます。この数値を 3 行 3 列の形式で出力してください。
// 具体的には、入力された数値を N_1 , N_2 , N_3 , ..., N_9 とするとき、 1 行目にはN_1 からN_3 を、2 行目には N_4 から N_6 を、3 行目には N_7 から N_9 を出力してください。
// ただし、数値の間には半角スペースを、各行の末尾には、半角スペースの代わりに改行を入れてください。
// 入力される値
// N_1 N_2 N_3 ... N_9

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます

// 期待する出力
// 答えの数値を出力してください。


// N_1 N_2 N_3
// N_4 N_5 N_6
// N_7 N_8 N_9


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 0 1 2 3 4 5 6 7 8

// 出力例1
// 0 1 2
// 3 4 5
// 6 7 8
process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  // スペースで区切られた数値を配列に変換
  const numbers = line.trim().split(' ');

  // 3行3列の形式で出力
  for (let i = 0; i < 9; i += 3) {
    console.log(`${numbers[i]} ${numbers[i + 1]} ${numbers[i + 2]}`);
  }
});
// i += 3 は、ループの各イテレーション（繰り返し）ごとに i の値を 3 増やす処理です。
// これにより、ループの変数 i は 0 から始まり、次に 3、次に 6 というように増加します。
// 1 回目のイテレーション:
// i += 3 により、i は 0 + 3 = 3 になります。次の条件チェックでは、i が 3 なので、ループの本体が再度実行されます。
// 2 回目のイテレーション:
// i += 3 により、i は 3 + 3 = 6 になります。次の条件チェックでは、i が 6 なので、ループの本体が再度実行されます。
// 3 回目のイテレーション:
// i += 3 により、i は 6 + 3 = 9 になります。次の条件チェックでは、i が 9 なので、条件が偽となりループが終了します。






// ********
// 九九表を出力してください。具体的には、出力のi行j列目 (1 ≦ i, j ≦ 9) の数値は i * j になるように出力してください。
// ただし、数値の間には半角スペースを、各行の末尾には、半角スペースの代わりに改行を入れてください。

// 期待する出力
// 答えの数値を出力してください。


// 1 2 3 4 5 ...
// 2 4 6 8 ...
// 3 6 9 ...
// ...
// 9 18 27 ... 81

process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('close', () => {
  // 1 から 9 までの数値で九九表を出力
  for (let i = 1; i <= 9; i++) {
    let row = [];
    for (let j = 1; j <= 9; j++) {
      row.push(i * j);
    }
    console.log(row.join(' '));
  }
});



// ********
// 自然数 N が入力されます。N 行 N 列の九九表を出力してください。
// 具体的には、出力の i 行 j 列目 (1 ≦ i, j ≦ N ) の数値は i * j になるように出力してください。
// ただし、数値の間には半角スペースを、各行の末尾には、半角スペースの代わりに改行を入れてください。

// 入力される値
// N

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの数値を出力してください。


// A_{1,1} A_{1,2} A_{1,3} ... A_{1,N}
// A_{2,1} A_{2,2} A_{2,3} ... A_{2,N}
// ...
// A_{N,1} A_{N,2} ... A_{N,N}


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 3

// 出力例1
// 1 2 3
// 2 4 6
// 3 6 9

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
const n = parseInt(line.trim(), 10);
for (let i = 1; i<=n; i++) {
    let row = [];
    for ( let j = 1; j<=n; j++) {
        row.push(i * j)
    }
    console.log(row.join(' '));
}
});



// ********
// 偶数 N が入力されます。まず、 1 行目には 1 以上 N / 2 以下の数値を半角スペース区切りですべて出力してください。次に、 2 行目には N / 2 + 1 以上 N 以下の数値を半角スペース区切りですべて出力してください。
// 各行の末尾には、半角スペースの代わりに改行を入れてください。

// 入力される値
// N

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます


// 期待する出力
// 答えの数値を出力してください。


// 1 2 3 ... N/2
// N/2+1 N/2+2 ... N


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 8

// 出力例1
// 1 2 3 4
// 5 6 7 8
process.stdin.resume();
process.stdin.setEncoding('utf8');

var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const n = Number(line.trim()); // 入力を整数に変換
  const half = n / 2; // N の半分を計算

  // 1 行目の数値を配列に追加
  let firstRow = [];
  for (let i = 1; i <= half; i++) {
    firstRow.push(i);
  }
  console.log(firstRow.join(' ')); // 配列をスペース区切りの文字列に変換して出力

  // 2 行目の数値を配列に追加
  let secondRow = [];
  for (let i = half + 1; i <= n; i++) {
    secondRow.push(i);
  }
  console.log(secondRow.join(' ')); // 配列をスペース区切りの文字列に変換して出力
});



// ********
// 自然数 N, M が与えられます。1 行目には 1 以上 N 以下の数値を半角スペース区切りで出力してください。また、2 行目には 1 以上 M 以下の数値を半角スペース区切りで出力してください。
// さらに、各行の末尾には、半角スペースの代わりに改行を入れてください。

// 入力される値
// N M

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの数値を出力してください。


// 1 2 3 ... N
// 1 2 3 ... M


// 末尾に改行を入れ、余計な文字、空行を含んではいけません。


// 入力例1
// 3 5

// 出力例1
// 1 2 3
// 1 2 3 4 5
process.stdin.resume();
process.stdin.setEncoding('utf8');


var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
   // 入力値を分割して n と m に格納
    const [n, m] = line.trim().split(' ').map(Number);

   // 1 行目の数値を作成
    let firstRow = [];
    for (let i = 1; i <= n; i++) {
        firstRow.push(i);
    }
   console.log(firstRow.join(' ')); // スペース区切りで出力

   // 2 行目の数値を作成
    let secondRow = [];
    for (let i = 1; i <= m; i++) {
        secondRow.push(i);
    }
   console.log(secondRow.join(' ')); // スペース区切りで出力
});



// ********
// 自然数 N が与えられます。N が 3 けたになるよう数値の前に半角スペースを埋めて出力してください。

// 入力される値
// N

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えの数値を解答の形式に従った形で出力してください。
// N

// 末尾に改行を入れ、余計な文字、空行を含んではいけません。
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const n = Number(line.trim());

  // 数値を文字列に変換し、3桁になるようにする
  const formattedNumber = n.toString().padStart(3, ' ');

  // 結果を出力
  console.log(formattedNumber);
});
// Number(line.trim()) で、入力された値を数値として取得します。
// n.toString() で数値を文字列に変換します。
// padStart(3, ' ') メソッドを使って、文字列が3桁になるように、前にスペースを追加します。
// padStart メソッドは、指定した長さになるまで、文字列の先頭に指定した文字を追加します。


// ********
// 入力される値
// 以下の形式で標準入力によって与えられます。
// 1 行目に 1 組の整数 a, bが与えられます。


// a b

// 期待する出力
// a と b をそのまま出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a b

// 入力例1
// 8 13

// 出力例1
// 8 13
process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let line = '';

// 標準入力からのデータを1行だけ取得
reader.on('line', (input) => {
  line = input;
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  console.log(line);
});


// ********
// 入力される値
// 以下の形式で標準入力によって与えられます。
// 1 行目に整数 N が、 2 行目に文字列 s_1, ... , s_N が半角スペース区切りで与えられます。


// N
// s_1 ... s_N

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。


// 期待する出力
// s_1, ... , s_N を改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// s_1
// ...
// s_N


// 入力例1
// 5
// paiza 813 paiza813 hello813 good

// 出力例1
// paiza
// 813
// paiza813
// hello813
// good

process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];
let numberOfLines = 0;

// 標準入力からのデータを行ごとに取得
reader.on('line', (line) => {
  if (numberOfLines === 0) {
    // 最初の行で N の値を取得
    numberOfLines = parseInt(line.trim(), 10);
  } else {
    // 次の行で文字列を取得し、スペースで区切る
    const data = line.trim().split(' ');
    // スペースで区切られた文字列を lines 配列に格納
    lines.push(...data);
  }
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  // lines 配列に格納された文字列を改行で出力
  lines.forEach(line => {
    console.log(line);
  });
});

// スプレッド構文について (...)
// line.trim().split(' '): line をスペースで区切って配列に変換します。
// 例えば、line が "paiza 813 paiza813 hello813 good" の場合、data は ["paiza", "813", "paiza813", "hello813", "good"] になります。

// lines.push(...data): data 配列の要素を lines 配列に追加します。
// ...data は、data 配列の各要素を個別の引数として展開します。
// これにより、lines.push("paiza", "813", "paiza813", "hello813", "good") が実行され、lines 配列にこれらの要素が追加されます。




// ********
// 入力される値
// 以下の形式で標準入力によって与えられます。
// 1 行目に 1 組の整数 a, bが与えられます。


// a b

// 期待する出力
// a と b をそのまま出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a b

// 入力例1
// 8 13

// 出力例1
// 8 13
process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = '';

// 標準入力からのデータを1行だけ取得
reader.on('line', (input) => {
  lines = input;
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  console.log(lines);
});




// ********
// 入力される値
// 以下の形式で標準入力によって与えられます。
// 1 行目に 整数 N
// 2 行目から (N + 1) 行目に N 組の整数 a_i, b_i が N 行で与えられます。


// N
// a_1 b_1
// ...
// a_N b_N

// 期待する出力
// N 組の a_i と b_i を改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a_1 b_1
// ...
// a_N b_N

// 入力例1
// 5
// 813 813
// 8 13
// 81 1
// 81 3
// 8 813

// 出力例1
// 813 813
// 8 13
// 81 1
// 81 3
// 8 813
process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];

// 標準入力からのデータを行ごとに取得
reader.on('line', (line) => {
  lines.push(line.trim());
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  const n = parseInt(lines[0], 10); // 最初の行で N の値を取得
  for (let i = 1; i <= n; i++) {
    console.log(lines[i]);
  }
});



// ********
// 入力される値
// 1 行目に整数 N が与えられます。
// 2 行目以降に N 行 3 列の行列が与えられます。
// 以下の形式で標準入力によって与えられます。


// N
// a_{1,1} a_{1,2} a_{1,3}
// ...
// a_{N,1} a_{N,2} a_{N,3}

// 期待する出力
// N 行 3 列の行列をそのまま出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a_{1,1} a_{1,2} a_{1,3}
// ...
// a_{N,1} a_{N,2} a_{N,3}

// 入力例1
// 2
// 1 2 3
// 8 1 3

// 出力例1
// 1 2 3
// 8 1 3
process.stdin.resume();
process.stdin.setEncoding('utf8');
// 自分の得意な言語で
// Let's チャレンジ！！
var lines = [];
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
// 標準入力からのデータを行ごとに取得
reader.on('line', (line) => {
  lines.push(line.trim());
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  const n = parseInt(lines[0], 10); // 最初の行で N の値を取得
  for (let i = 1; i <= n; i++) {
    console.log(lines[i]);
  }
});


// ********
// 入力される値
// 1 行目で整数 M が与えられます。
// 2 行目以降で 3 行 M 列の行列が与えられます。
// 以下の形式で標準入力によって与えられます。


// M
// a_{1,1} ... a_{1,M}
// a_{2,1} ... a_{2,M}
// a_{3,1} ... a_{3,M}

// 期待する出力
// 3 行 M 列の行列をそのまま出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a_{1,1} ... a_{1,M}
// a_{2,1} ... a_{2,M}
// a_{3,1} ... a_{3,M}

// 入力例1
// 5
// 1 2 3 4 5
// 8 1 3 8 1
// 813 138 381 183 831

// 出力例1
// 1 2 3 4 5
// 8 1 3 8 1
// 813 138 381 183 831

process.stdin.resume();
process.stdin.setEncoding('utf8');
// 自分の得意な言語で
// Let's チャレンジ！！
var lines = [];
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

// 標準入力からのデータを行ごとに取得
reader.on('line', (line) => {
  lines.push(line);
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  const M = parseInt(lines[0], 10); // 最初の行で列数 M の値を取得
  // 3 行 M 列の行列をそのまま出力
  for (let i = 1; i < lines.length; i++) {
    console.log(lines[i]);
  }
});



// ********
// 入力される値
// 1 行目で整数 N と整数 M が与えられます。
// 2 行目以降で N 行 M 列の行列が与えられます。
// 以下の形式で標準入力によって与えられます。


// N M
// a_{1,1} ... a_{1,M}
// ...      ...
// a_{N,1} ... a_{N,M}

// 期待する出力
// N 行 M 列の行列をそのまま出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a_{1,1} ... a_{1,M}
// ...      ...
// a_{N,1} ... a_{N,M}

// 入力例1
// 2 3
// 1 2 3
// 8 1 3

// 出力例1
// 1 2 3
// 8 1 3
process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];

// 標準入力からのデータを行ごとに取得
reader.on('line', (line) => {
  lines.push(line.trim());
});

// 入力が終了したときに処理を行う
reader.on('close', () => {
  // 最初の行から N と M の値を取得（使用しませんが確認用）
  const [N, M] = lines[0].split(' ').map(Number);

  // 残りの行をそのまま出力
  for (let i = 1; i < lines.length; i++) {
    console.log(lines[i]);
  }
});

// ********
// 変数 N を 10,000 で初期化する
// N を A で割った商を N へ代入する
// N を B で割った余りを N へ代入する
// N を出力する

// 入力される値
// A B

// 期待する出力
// 計算結果 N を一行で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
// N

// 入力例1
// 911 285

// 出力例1
// 10

// 入力例2
// 526 772

// 出力例2
// 19

process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const [a, b] = line.trim().split(' ').map(Number);
  let n = 10000;
  n = Math.floor(n / a);
  n %= b;
  console.log(n);
});



// ********
// 要素数 N の数列 A と数値 M が与えられます。A の M 番目の値を出力してください。

// 入力される値
// N M
// A_1 ... A_N

// 期待する出力
// A の M 番目の値を出力してください。
// A_M

// 入力例1
// 5 2
// 1 2 3 4 5

// 出力例1
// 2

// 入力例2
// 3 3
// 7 8 9

// 出力例2
// 9

process.stdin.resume();
process.stdin.setEncoding('utf8');

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line',(line) => {
  // 1 行目から N と M の値を取得
  const [n, m] = line.trim().split(' ').map(Number);
  // 2 行目以降から数列 A の値を取得
  reader.once('line',(line) => {
    const [a] = line.trim().split(' ').map(Number);
    // M 番目の値を出力 (配列は 0 ベースなので M - 1 でインデックスを指定)
    console.log(a[m - 1]);
  });
});

// once の特徴
// 一度だけの実行: once で登録したリスナーは、指定されたイベントが一度発生した後に自動的に削除されます。リスナーが再度実行されることはありません。
// 使いどころ: 一度だけイベントを処理したい場合や、特定のイベントが発生した後にリスナーを削除したい場合に使います。例えば、設定や初期化が完了した後の処理に適しています。
// on メソッドとの違い
// on メソッド: イベントリスナーを複数回実行する場合や、イベントが発生するたびにリスナーを呼び出したい場合に使用します。
// once メソッド: イベントリスナーを一度だけ実行し、その後は自動的に削除する場合に使用します。



// ********
// 0 以上 9 以下の整数が N 個与えられます。各数値の出現回数を求め、
// 「0」の出現回数、「1」の出現回数、...「9」の出現回数、をこの順に半角スペース区切りで1行に出力してください。
// 入力される値
// N
// A_1 A_2 ... A_N

// 期待する出力
// 「0」の出現回数 count0、「1」の出現回数 count1、...「9」の出現回数 count9 をこの順に、
// 半角スペース区切りで1行に出力してください。
// count0 count1 ... count9

// 入力例1
// 5
// 1 2 3 3 6

// 出力例1
// 0 1 1 2 0 0 1 0 0 0

// 入力例2
// 10
// 0 1 2 3 4 5 6 7 8 9

// 出力例2
// 1 1 1 1 1 1 1 1 1 1
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = Number(line.trim()); // 入力の最初の行で N の値を取得（必要ないが、形式に合わせるために取得）

  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number); // 数値の配列を取得
    const count = Array(10).fill(0);// 0 から 9 までの出現回数をカウントする配列
    // 数値の出現回数をカウント
    numbers.forEach(num => {
      if (num >= 0 && num <= 9) {
        count[num]++;
      }
    });
    console.log(count.join(' '));// 結果を半角スペース区切りで出力

  });

});

// Array(10).fill(0); は、JavaScript の配列操作でよく使われるテクニックです。これについて詳しく説明します。

// Array(10)
// この部分は、Array コンストラクタを使って長さが 10 の配列を作成します。ただし、Array(10) のみでは、
// 10 個の要素を持つ配列が生成されますが、要素は未定義（空）です。具体的には、配列の長さは 10 ですが、配列の中身は空で、初期化されていません。

// .fill(0)
// fill メソッドは、配列のすべての要素を指定した値で埋めるためのメソッドです。この場合、fill(0) は配列のすべての要素を 0 で埋めることを意味します。
const array = Array(10).fill(0);
console.log(array);
// 出力: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]






// ********
// N 個の要素からなる数列 A と、整数 B が与えられます。
// B が A に含まれているかどうかを判定してください。


// 入力される値
// N B
// A_1 A_2 ... A_N

// 期待する出力
// B が A に含まれているなら「Yes」を、含まれていないなら「No」を出力してください。
// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 5 4
// 1 2 3 4 5

// 出力例1
// Yes

// 入力例2
// 5 6
// 1 2 3 4 5

// 出力例2
// No

// 入力例3
// 1 100
// 1

// 出力例3
// No
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
// 1行目でNとBを取得
reader.once('line', (line) => {
  const [N, B] = line.trim().split(' ').map(Number);
  // 2行目で数列Aを取得
  reader.once('line', (line) => {
    const a =line.trim().split(' ').map(Number);
    // BがAに含まれているかどうかを判定
    if (a.includes(B)) {
      console.log('Yes');
    } else {
      console.log('No');
    }
  });
});


// ********
// N 個の要素からなる数列 A が与えられます。数列 A は昇順にソートされています。
// A の重複した要素を取り除いて昇順に出力してください。
// 入力される値
// N
// A_1 A_2 ... A_N

// 期待する出力
// A の重複した要素を取り除き、半角スペース区切りで昇順に1行で出力してください。
// 末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 6
// 1 2 3 3 4 5

// 出力例1
// 1 2 3 4 5

// 入力例2
// 3
// 1 1 1

// 出力例2
// 1

// 入力例3
// 3
// 1 2 3

// 出力例3
// 1 2 3
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = Number(line.trim());
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);
    const result = Array.from(new Set(a)).sort((a, b) => (a - b));
    console.log(result.join(' '));
  });
});

// 走査
// line.trim().split(' ').map(Number)は
// line.trim() は、line から前後の空白を取り除きます。
// split(' ') は、空白で文字列を分割して配列を作成します。
// map(Number) は、各要素を数値に変換します。
// 例えば、line が "1 2 3 3 4 5" の場合、これにより配列 [1, 2, 3, 3, 4, 5] が得られます。

// new Set(a)は
// new Set(a) は、配列 a から Set オブジェクトを作成します。
// Set は重複を許さないため、配列の重複した要素が自動的に取り除かれます。
// 例えば、[1, 2, 3, 3, 4, 5] という配列を Set に変換すると、重複を取り除いた {1, 2, 3, 4, 5} が得られます。

// Array.from(new Set(a))は
// Array.from は、Set から新しい配列を作成します。これにより、重複を取り除かれた要素を含む配列が得られます。
// 例えば、{1, 2, 3, 4, 5} から Array.from を使うと、[1, 2, 3, 4, 5] という配列が得られます。


// ********
// 0 または 1 の整数 A と B が与えられます。 A OR B の結果を出力してください。
// 入力される値
// A B

// 期待する出力
// A OR B の結果を 0 または 1 で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

// ビット演算 OR
// ビット演算の OR は、対応するビットのいずれかが 1 であれば 1 を返します。両方のビットが 0 の場合に限り 0 を返します。

// 具体的には次のような演算です：

// 0 OR 0 は 0
// 0 OR 1 は 1
// 1 OR 0 は 1
// 1 OR 1 は 1
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const [A, B] = line.trim().split(' ').map(Number);
  const result = A | B; // ビット演算 OR
  console.log(result);
  reader.close();
});


// ********
// 0 または 1 の整数 A が与えられます。 NOT A の結果を出力してください。

// 入力される値
// A

// 期待する出力
// NOT A の結果を 0 または 1 で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。


// ビット演算 NOT
// ビット演算の NOT は、ビットを反転させます。0 は 1 に、1 は 0 に変換されます。

// 具体的には次のような演算です：

// NOT 0 は 1
// NOT 1 は 0
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const A = Number(line.trim());
  const result = A ^ 1; // NOT A を計算
  console.log(result);
  reader.close();
});


// ********
// 0 または 1 の整数 A と B が与えられます。 A XOR B の結果を出力してください。

// 入力される値
// A B

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// A XOR B の結果を 0 または 1 で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const [A, B] = line.trim().split(' ').map(Number);
  const result = A ^ B; // XOR演算を行う
  console.log(result);
  reader.close();
});




// ********
// 1 行で文字列 S が与えられるので、 S が "paiza" である時は "YES", そうでない時は "NO" を出力してください。

// 入力される値
// S

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます

// 期待する出力
// S が "paiza" である時は "YES", そうでない時は "NO" を 1 行で出力してください。

// 入力例1
// paiza

// 出力例1
// YES

// 入力例2
// PAIZA

// 出力例2
// NO
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const s = line.trim();

  if (s === 'paiza') {
    console.log('YES');
  } else {
    console.log('NO');
  }

  // ストリームを閉じる
  reader.close();
});


// ********
// 1 行で文字列 S が与えられるので、 S の文字数を出力してください。
// 入力される値
// S

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// S の文字数を 1 行で出力してください。

// 入力例1
// paiza

// 出力例1
// 5
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.on('line', (line) => {
  const s = line.trim();
  console.log(s.length);

  // ストリームを閉じる
  reader.close();
});



// ********
// 与えられる文字列の数 N と、 N 個の文字列が与えられるので、
// それらを順に末尾に連結した文字列を出力してください。
// 入力される値
// N
// S_1
// ...
// S_N

// ・ 1 行目で与えられる文字列の数 N が与えられます。
// ・ 続く N 行で連結する文字列 S_i (1 ≦ i ≦ N) が与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// N 個の文字列を順に後ろに連結した文字列を 1 行で出力してください。

// 入力例1
// 2
// pa
// iza

// 出力例1
// paiza


const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let n;
const strings = [];

// 最初の行で N の値を取得
reader.once('line', (line) => {
  // strings.length === n で n が未定義になる可能性があるため、確実に n をグローバルスコープに持つ必要があります。
  n = parseInt(line.trim(), 10);
});

// N 個の文字列を取得
reader.on('line', (line) => {
  strings.push(line.trim());

  if (strings.length === n) {
    // すべての文字列が取得できたら連結して出力
    const result = strings.join('');
    console.log(result);
    reader.close();
  }
});



// ********
// 数値を表す文字列 S が与えられるので、 S - 813 の値を求めてください。
// 入力される値
// S


// ・ 文字列 S が 1 行で与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// S - 813 の値を 1 行で出力してください。

// 入力例1
// 813

// 出力例1
// 0

// 入力例2
// 12345

// 出力例2
// 11532

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const S = Number(line.trim());
  const result = S - Number(813);
  console.log(result.toString());
});
// console.log() は、渡された引数を自動的に文字列に変換して出力します。
// そのため、数値に対して toString() を明示的に呼び出さなくても、出力は問題ありません。





// ********
// 数値 X , Y が与えられるので、X + Y の計算結果の先頭から N 文字目の数字を出力してください。
// 例
// ・ X = 813 , Y = 813 , N = 1 のとき
// X + Y = 1626 の 1 文字目である 1 を出力してください。

// ・ X = -813 , Y = 813 , N = 1 のとき
// X + Y = 0 の 1 文字目である 0 を出力してください。

// ・ X = 10000 , Y = -813 , N = 3 のとき
// X + Y = 9187 の 3 文字目である 8 を出力してください。

// 入力される値
// X
// Y
// N
// ・ 1 行目では数値 X が、 2 行目では数値 Y , 3 行目では数値 N が与えられます。
// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 答えとなる数字を 1 行で出力してください。

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
// 入力値を格納する変数
let X, Y, N;
reader.once('line', (line) => {
  X = Number(line.trim());
});
reader.once('line', (line) => {
  Y = Number(line.trim());
});
reader.once('line', (line) => {
  N = Number(line.trim());
  const sum = X + Y;
  const sumString = sum.toString();

  if (N <= sumString.length) {
    const result = sumString[N-1]; //sumString[N - 1] で N 番目の文字を取得します。N は 1 から始まるため、N - 1 を使ってインデックスを調整します。
    console.log(result);
  }else {
    console.log('error');
  }

});
// N <= sumString.length という条件で、N が文字列の長さ以内であることを確認します。
// これにより、指定されたインデックスが有効であるかをチェックし、範囲外のインデックスによるエラーを防ぎます。

// N が文字列の長さを超える場合、sumString[N - 1] のインデックスは存在しないため、
// エラーが発生します。例えば、sumString が 12345 で長さが 5 の場合、N が 6 のときは、
// sumString[5] のインデックスは存在しません。





// ********
// 入力される値
// S
// T


// ・ 1 行目に文字列 S , 2 行目に文字列 T が与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。


// 期待する出力
// T が S の部分文字列ならば "YES" , そうでなければ "NO" を出力してください。


// 入力例1
// paiza
// iza

// 出力例1
// YES

// 入力例2
// hellllllllllo
// hellllllllllo

// 出力例2
// YES

// 入力例3
// abcdefg
// abe

// 出力例3
// NO

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
let S;
let T;
reader.once('line', (line)=> {
  S = line.trim();
});
reader.once('line', (line)=> {
  T = line.trim();
  if (S.includes(T)) {
    console.log('YES');
  } else {
    console.log('NO');
  }
});



// ********
// 文字列 S が与えられるので、 S が回文かどうかを判定してください。
// なお、回文とは、前から読んでも後ろから読んでも同じ文字列になるような文字列のことをいいます。

// 入力される値
// S


// ・ 文字列 S が 1 行で与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// S が回文である場合 "YES" を、そうでない場合は "NO" を出力してください。

// 入力例1
// 1234321

// 出力例1
// YES

// 入力例2
// paizaazzap

// 出力例2
// NO

// 入力例3
// shinbunshi

// 出力例3
// NO

// 入力例4
// qpwoeirutyyturieowpq

// 出力例4
// YES
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line)=> {
  S = line.trim();
  const isPalindrome = S === S.split('').reverse().join('');
  console.log(isPalindrome ? 'YES' : 'NO');
});

// S.split('') で ['1', '2', '3', '4', '3', '2', '1'] という配列に分割
// .reverse() で ['1', '2', '3', '4', '3', '2', '1'] という逆順の配列に変換（この場合、逆順でも同じ）
// .join('') で '1234321' という文字列に再結合



// ********
// 入力される値
// S


// ・ 文字列 S が 1 行で与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// S を ',' で区切ったときに得られる各要素を順に改行区切りで出力してください。

// 入力例1
// a,b,c,d,e

// 出力例1
// a
// b
// c
// d
// e

// 入力例2
// 123,456,789

// 出力例2
// 123
// 456
// 789

// 入力例3
// 1,23,456,789,1011

// 出力例3
// 1
// 23
// 456
// 789
// 1011

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const S = line.trim().split(',');
  S.forEach(element => {
    console.log(element);
  });

});



// ********
// 入力される値
// S


// ・ 文字列 S が 1 行で与えられます。

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// S から数字の重複を取り除いたときにできる文字列を 1 行で出力してください。

// 入力例1
// 1234567890

// 出力例1
// 1234567890

// 入力例2
// 112123123412345

// 出力例2
// 12345
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const S = line.trim();
  const result = Array.from(new Set(S)).join('');
  console.log(result);
});

// ********
// 以下の数列の全要素を改行区切りで出力してください。

// 5 1 3 4 5 12 6 8 1 3

// 入力される値
// 入力は与えられません。

// 期待する出力
// 数列の全要素を改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// 5
// 1
// 3
// 4
// 5
// 12
// 6
// 8
// 1
// 3

const numbers = "5 1 3 4 5 12 6 8 1 3";
const elements = numbers.split(' ');

elements.forEach(element => {
  console.log(element);
});



// ********
// 以下の数列の 4 番目の要素を出力してください。

// 5 1 3 4 5 12 6 8 1 3

// 入力される値
// 入力は与えられません。

// 期待する出力
// 数列の 4 番目の要素を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// 4

const number = "5 1 3 4 5 12 6 8 1 3";
const element = numbers.split(' ');

// インデックス 3 の要素を出力（4 番目の要素）
console.log(element[3]);







// ********
// 入力される値
// 整数 K が与えられます。
// 以下の形式で標準入力によって与えられます。
// K

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// 数列の K 番目の要素を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// a_K
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const sequence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

reader.once('line', (line) => {
  const K = Number(line.trim());
  console.log(sequence[K-1]);
});



// ********
// 入力される値
// 1 行目に整数 K が与えられます。
// 2 行目に 10 個の整数 a_i が半角スペース区切りで与えられます。
// 以下の形式で標準入力によって与えられます。


// K
// a_1 ... a_10

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// K 番目の要素 a_K を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// a_K

// 入力例1
// 5
// 8 1 3 1 3 8 3 8 1 1

// 出力例1
// 3

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
let K;
let num = [];
reader.once('line', (line) => {
  let K = Number(line.trim());
});
reader.once('line', (line) => {
  let num = line.trim().split('').map(Number);
  console.log(num[K-1]);
});



// ********
// 以下のような配列があります。

// 10 13 21 1 6 51 10 8 15 6

// この中に、6 が含まれているなら Yes、含まれていないなら No を出力してください。

// 入力される値
// 入力は与えられません。

// 期待する出力
// 6 が含まれているなら Yes、含まれていないなら No を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

const arrays = [10, 13, 21, 1, 6, 51, 10, 8, 15, 6];
const result = arrays.includes(6);//includes メソッドは、指定された値が配列に存在する場合に true を返す
console.log(result ? "YES" : "NO");

// ********
// 整数 N が与えられます。
// 以下の配列に、整数 N が含まれているなら Yes、含まれていないなら No を出力してください。

// 5 12 6 84 14 25 44 3 7 20

// 入力される値
// 整数 N が与えられます。
// 以下の形式で標準入力によって与えられます。
// N

// 期待する出力
// N が含まれているなら Yes、含まれていないなら No を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
const a = [10, 13, 21, 1, 6, 51, 10, 8, 15, 6];
reader.once('line', (line) => {
  const N = Number(line.trim());
  const result = a.includes(N);
  console.log(result ? "YES" : "NO");
});



// ********
// 1 行目に整数 N, M が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// 以下の形式で標準入力によって与えられます。


// N M
// a_1 a_2 ... a_N

// 期待する出力
// N 個の整数の中に、整数 M が含まれているなら Yes、含まれていないなら No を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 5 1
// 1 2 3 4 5

// 出力例1
// Yes


const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
let b = [];
let target = null;
reader.once('line', (line) => {
  const [N, M] = line.trim().split(' ').map(Number);
  target = M;

  reader.once('line', (line) => {
    b = line.trim().split(' ').map(Number);
    const result = b.includes(target) ? "YES" : "NO";
    console.log(result);

  });

});

// ********
// 以下のような配列があります。
// 1 10 2 9 3 8 4 7 5 6

// この配列の中で、8 が左から何番目にあるか出力してください。
// 左端を 1 番目とします。

// 入力される値
// 入力は与えられません。

// 期待する出力
// 8 が左から何番目にあるか出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// 6

const array_1 = [1, 10, 2, 9, 3, 8, 4, 7, 5, 6];
const target_1 = 8;
const position = array_1.indexOf(target_1) + 1;
console.log(position);
// array.indexOf(N) で N の位置を 0 から始まるインデックスとして取得します。




// ********
// 以下のような配列があります。

// 1 2 2 1 2 1 2 1 1 1

// この中に含まれる 1 の個数を出力してください。

// 入力される値
// 入力は与えられません。

// 期待する出力
// 配列に含まれる 1 の個数を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// 6

const array_2 = [1, 2, 2, 1, 2, 1, 2, 1, 1, 1];
const countOne = array_2.filter(value => value === 1).length;
console.log(countOne);
// array.filter(value => value === 1) は、配列内の全要素をチェックし、値が 1 の要素だけを含む新しい配列を作成します。



// ********
// 入力される値
// 1 行目に整数 A, B, N が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// 以下の形式で標準入力によって与えられます。


// A B N
// a_1 a_2 ... a_N

// 入力値最終行の末尾に改行が１つ入ります。
// 文字列は標準入力から渡されます。

// 期待する出力
// N 個の整数の内、その数が A だった場合、B に書き換えてください。
// 書き換えた N 個の整数を改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// a_1
// a_2
// ...
// a_N

// 入力例1
// 3 1 5
// 1 2 3 4 5

// 出力例1
// 1
// 2
// 1
// 4
// 5

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const [A, B, N] = line.trim().split(' ').map(Number);
  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number);
    const result = numbers.map(num => num === A ? B : num); //num は、numbers 配列の各要素を順に受け取る引数です。
    result.forEach(num => console.log(num));
  });

});

// 条件: num === A
//   各要素 num が、指定された整数 A と等しいかどうかをチェックします。
// 真の場合: B
//   num が A と等しい場合、B に置き換えます。
// 偽の場合: num
//   num が A と等しくない場合、そのまま num を残します。



// ********
// 配列の要素の入れ替え

// 入力される値
// 1 行目に整数 A, B, N が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// 以下の形式で標準入力によって与えられます。
// A B N
// a_1 a_2 ... a_N

// 期待する出力
// N 個の整数の左から A 番目の数と B 番目の数の値を入れ替えて、改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

// 入力例1
// 2 3 5
// 1 2 3 4 5

// 出力例1
// 1
// 3
// 2
// 4
// 5

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const [A, B, N] = line.trim().split(' ').map(Number);
  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number);
    // 配列のインデックスは0から始まるので、A-1 と B-1 に変換
    const indexA = A - 1;
    const indexB = B - 1;
    // A 番目と B 番目の要素を入れ替える
    [numbers[indexA], numbers[indexB]] = [numbers[indexB], numbers[indexA]];
    numbers.forEach(num => console.log(num));
  });
});



// ********
// 配列の連結

// 1 行目に整数 N, M が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// 3 行目に M 個の整数 b_1, b_2, ..., b_M が与えられます。
// N 個の整数 a_1, a_2, ..., a_N の後ろに M 個の整数 b_1, b_2, ..., b_M を連結させ、改行区切りで出力してください。
// 入力例1
// 2 3
// 1 2
// 3 4 5

// 出力例1
// 1
// 2
// 3
// 4
// 5
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const [N, M] = line.trim().split(' ').map(Number);
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);
  });
    reader.once('line', (line) => {
      const b = line.trim().split(' ').map(Number);
      const result = a.concat(b);
      result.forEach(num => console.log(num));
    });
});



// ********
// 配列のソート
// 1 行目に整数 N が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// N 個の整数を小さい順にソートし、改行区切りで出力してください。
// 入力例1
// 5
// 5 4 3 2 1

// 出力例1
// 1
// 2
// 3
// 4
// 5

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  // 1行目から整数 N を取得
  const N = Number(line.trim());

  // 2行目から配列 a を取得
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);

    // 配列 a をソート（小さい順）
    a.sort((x, y) =>  x - y);

    // 結果を改行区切りで出力
    a.forEach(num => console.log(num));
  });
});



// ********
// 配列の反転
// 1 行目に整数 N が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// N 個の整数の順番を反転させ、改行区切りで出力してください。
// 入力例1
// 5
// 1 5 2 4 3

// 出力例1
// 3
// 4
// 2
// 5
// 1

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  // 1行目から整数 N を取得
  const N = Number(line.trim());

  // 2行目から配列 a を取得
  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number);

    // 配列 a を反転
    numbers.reverse();

    // 結果を改行区切りで出力
    numbers.forEach(num => console.log(num));
  });
});

// ********
// 要素のカウント
// 1 行目に整数 N, M が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// N 個の整数に含まれている M の個数を出力してください。
// 入力例1
// 5 1
// 1 1 1 2 2

// 出力例1
// 3

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const [N, M] = line.trim().split(' ').map(Number);
  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number);
    const count = numbers.filter(num => num === M).length;
    console.log(count);
  });
});



// ********
// 配列末尾への追加
// 1 行目に整数 N, M が与えられます。
// 2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
// N 個の整数の末尾に整数 M を挿入し、改行区切りで出力してください。

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const [N, M] = line.trim().split(' ').map(Number);
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);
    a.push(M);// M を配列 a の末尾に追加
    a.forEach(num => console.log(num));
  });
});

// ********
// 要素数の出力
// 複数の文字列があります。文字列の数を出力してください。

// Hello
// paiza
// 1234
// pa13

// 入力される値
// 入力は与えられません。

// 期待する出力
// 文字列の数を出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。
// 4
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lines = [];
// 行ごとにデータを読み取る
reader.on('line', (line) => {
  // 空行で終了
  if (line.trim() === '' ) {
    reader.close();
    return;
  }
  lines.push(line.trim());
});
// 全ての入力が終了したら文字列の数を出力
reader.on('close', () => {
  console.log(lines.length);
});



// ********
// 全要素の出力
// 複数の文字列があります。すべての文字列を改行区切りで出力してください。

// good
// morning
// paiza
// 813
// pa13

// 入力される値
// 入力は与えられません。

// 期待する出力
// すべての文字列を改行区切りで出力してください。
// また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


// good
// morning
// paiza
// 813
// pa13

const string = [
  "good",
  "morning",
  "paiza",
  "813",
  "pa13"
];
string.forEach(str => console.log(str));



// ********
// 文字列の配列の入力 2

// 10 個の文字列 s_1, s_2, ..., s_10 が半角スペース区切りで与えられます。
// すべての文字列を改行区切りで出力してください。
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const string = line.trim().split(' ');// 入力された文字列を半角スペースで分割して配列に変換
  string.forEach(str => console.log(str));
});



// ********
// 整数 N が与えられます。
// 以下の文字列のうち、N 番目の文字列を出力してください。

// good
// morning
// paiza
// 813
// pa13

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
const string_1 = [
  'good',
  'morning',
  'paiza',
  '813',
  'pa13'
];
reader.once('line', (line) => {
  const N = Number(line.trim());
  console.log(string_1[N-1]);
});



// ********
// i 番目の出力 2
// 1 行目に整数 N が与えられます。
// 2 行目に 5 個の文字列 s_1, s_2, ..., s_5 が半角スペース区切りで与えられます。
// N 番目の文字列 s_N を出力してください。
// 入力例1
// 3
// a b c d e

// 出力例1
// c
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const N = Number(line.trim());
    reader.once('line', (line) => {
      const string = line.trim().split(' ');
      console.log(string[N-1]);
    });
});


// ********
// 重複の削除
// 以下のような数列があります。

// 1 3 5 1 2 3 6 6 5 1 4

// この数列から数の重複をなくし、昇順にし改行区切りで出力してください。
// 入力される値
// 入力は与えられません。
a = [1, 3, 5, 1, 2, 3, 6, 6, 5, 1, 4];
const result_1 = Array.from(new Set(a)).sort((a, b) => (a - b));
console.log(result_1.join(' '));



// ********
// 2 つの整数A、Bが与えられます。AとBが両方とも 10 以上の場合はYESを、そうではない場合はNOを出力してください。
// 入力される値
// A B

// 入力例1
// 12 10

// 出力例1
// YES

// 入力例2
// 8 15

// 出力例2
// NO
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const [A, B] = line.trim().split(' ').map(Number);
  if (A>=10 && B >=10) {
    console.log('YES');
  } else {
    console.log('NO');
  }

});


// ********
// 長さ N の数列Aが与えられます。この数列に含まれる偶数の要素の個数と、奇数の要素の個数を答えてください。
// 入力される値
// N
// A1 A2 ... AN

// 偶数の要素の個数Eと、奇数の要素の個数Oを半角スペース区切りで出力してください。
// 末尾に改行を入れ、余計な文字、空行を含んではいけません。
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const N = Number(line.trim());
  reader.once('line', (line) => {
    const A = line.trim().split(' ').map(Number);

    let evenCount = 0;
    let oddCount = 0;

    // 数列を走査してカウントを更新する
    A.forEach(num => {
      if ( num % 2 === 0 ) {
        evenCount ++;
      } else {
        oddCount ++;
      }
    });
    console.log(`${evenCount} ${oddCount}`);

  });

});



// ********
// 曜日の判定
// ある月の 1 日は日曜日、 2 日は月曜日...です。X日は何曜日でしょう。
// 入力される値
// X
// 入力例1
// 1

// 出力例1
// Sun

// 入力例2
// 11

// 出力例2
// Wed

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const X = Number(line.trim());
  const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  const dayIndex = (X - 1) % 7;
  console.log(daysOfWeek[dayIndex]);
});



// ********
// けた数の測定
// 整数Nが与えられます。Nのけた数を出力してください。

// 入力される値
// N

// 期待する出力
// N のけた数Dを出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
// D

// 入力例1
// 5

// 出力例1
// 1

// 入力例2
// 100

// 出力例2
// 3
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = line.trim();
  const digitCount = N.length;  // 数字を文字列として扱い、その長さを取得
  console.log(digitCount);
});

// line.trim().split(' ').map(Number): split(' ') は複数の値を処理する際に使いますが、
// ここでは単一の整数 N の場合なので、split は不要です。trim() だけで十分です。




// ********
// 整数N, 2 つの数列A, B が与えられます。 1 ≦ i ≦ N を満たす整数 i のうち、A_i と B_i が等しくなるような i の個数を求めてください。

// 入力される値
// N
// A_1 A_2 ... A_N
// B_1 B_2 ... B_N

// 期待する出力
// A_i == B_iである要素の個数Cを求めてください。末尾に改行を入れ、余計な文字、空行を含んではいけません。
// C

// 入力例1
// 5
// 1 2 3 4 5
// 1 20 30 4 5

// 出力例1
// 3

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = Number(line.trim());
  reader.once('line', (line) => {
    const A = line.trim().split(' ').map(Number);
    reader.once('line', (line) => {
      const B = line.trim().split(' ').map(Number);
      let count = 0;
      for (let i = 1; i<N; i++) {
        if ( A[i] === B[i] ) {
          count++;
        }
      }
      console.log(count);
    });
  });
});

// ちなfor letの箇所は、forEachでも書ける↓
A.forEach((value, index) => {
  if (value === B[index]) {
    count++;
  }
})
// A.forEach((value, index) => {...}) を使って、配列 A の各要素とそのインデックスを取得します。
// value は A の各要素、index はその要素のインデックスです。



// ********
// 直線上の道があり、最初は X = 0 の地点にいます。この道はX = T + 0.1 の地点で崖になっています。
// また、 1 歩でX軸方向にK進むことができます。崖に落ちずにN歩進むことはできるでしょうか。

// 入力される値
// N K T

// 期待する出力
// 崖に落ちずにN歩進むことができる場合はYESを、そうではない場合はNOを出力してください。
// 末尾に改行を入れ、余計な文字、空行を含んではいけません。
// YES
// または
// NO

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const [N, K, T] = line.trim().split(' ').map(Number);
  const finalPosition = N * K; //N 歩進んだ最終位置を計算します。
  const cliffPosition = T + 0.1; //崖の位置を設定します。
  if (finalPosition < cliffPosition) {
    console.log('YES');
  } else {
    console.log('NO');
  }
});




// ********
// 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
// この数列の中に 1 が何個あるか出力してください。
// 入力される値
// N
// a_1 a_2 ... a_N
// ・ 1 行目に整数 N が与えられます。
// ・ 2 行目に長さ N の数列 a が与えられます。
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = Number(line.trim()); // Nは整数なのでNumberで変換
  reader.once('line', (line) => {
    const numbers = line.trim().split(' ').map(Number); // 数列を整数配列に変換
    const count = numbers.filter(num => num === 1).length; // 1の個数をカウント
    console.log(count); // 結果を出力
  });
});



// ********
// 長さ N の数列 a (a_1, a_2, ..., a_N) と b (b_1, b_2, ..., b_N) が与えられます。
// a の各要素から b の各要素を引いた結果 (a_1 - b_1, a_2 - b_2, ..., a_N - b_N) を、改行区切りで出力してください。
// 入力される値
// N
// a_1 a_2 ... a_N
// b_1 b_2 ... b_N
// 入力例1
// 5
// 1 2 3 4 5
// 5 4 3 2 1

// 出力例1
// -4
// -2
// 0
// 2
// 4
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  const N = Number(line.trim()); // 数列の長さ N
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number); // 数列 a の読み込み
    reader.once('line', (line) => {
      const b = line.trim().split(' ').map(Number); // 数列 b の読み込み
      // 各要素の引き算を行い、結果を出力

      const result = a.map((value, index) => value - b[index]);
      result.forEach( num => console.log(num));

    });
  });
});
// 以下のようにも書ける
reader.once('line', (line) => {
  const N = Number(line.trim()); // 数列の長さ N
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number); // 数列 a の読み込み
    reader.once('line', (line) => {
      const b = line.trim().split(' ').map(Number); // 数列 b の読み込み
      // 各要素の引き算を行い、結果を出力

      a.forEach((value, index) => {
        console.log(value - b[index]);
      });

    });
  });
});


// ********
// 数列の和
// 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
// この数列の和を計算し、出力してください。

// 入力される値
// N
// a_1 a_2 ... a_N

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const N = Number(line.trim());
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);
    const sum = a.reduce((acc, value) => acc + value, 0);
    console.log(num);
  });
});
// コールバック関数(acc, value)について、
// 累積値（acc）: 前回の計算結果や初期値。最初の呼び出し時にはこの値が初期値になります。
// 現在の値（value）: 現在処理している配列の要素。
// また、reduce メソッドの第二引数として渡される 0 は、初期値



// ********
// 数列の値を全部 * 2 して出力
// 長さ N の数列 a (a_1, a_2, ..., a_N) が与えられます。
// この数列の全ての要素を 2 倍し、改行区切りで出力してください。
// 入力される値
// N
// a_1 a_2 ... a_N

// 入力例1
// 5
// 1 2 3 4 5

// 出力例1
// 2
// 4
// 6
// 8
// 10
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.once('line', (line) => {
  const N = Number(line.trim());
  reader.once('line', (line) => {
    const a = line.trim().split(' ').map(Number);
    a.forEach(num => console.log(num * 2));
  });
});



// ********
// 長さ N の数列 a (a_1, a_2, ..., a_N) と b (b_1, b_2, ..., b_N) が与えられます。
// a の各要素から b の各要素を引いた結果 (a_1 - b_1, a_2 - b_2, ..., a_N - b_N) を、改行区切りで出力してください。
// 入力される値
// N
// a_1 a_2 ... a_N
// b_1 b_2 ... b_N
// 入力例1
// 5
// 1 2 3 4 5
// 5 4 3 2 1

// 出力例1
// -4
// -2
// 0
// 2
// 4
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.once('line', (line) => {
  // 数列の長さ N を取得
  const N = Number(line.trim());

  reader.once('line', (line) => {
    // 数列 a の要素を取得
    const a = line.trim().split(' ').map(Number);

    reader.once('line', (line) => {
      // 数列 b の要素を取得
      const b = line.trim().split(' ').map(Number);

      // 各要素の引き算を行い、結果を改行区切りで出力
      a.forEach((value, index) => console.log(value - b[index]));

    });
  });
});