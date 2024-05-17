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


// 問題: 与えられた文字列 s を逆転させます。

// 例:
// 入力: s = "hello"
// 出力: "olleh"
  function reverseString(s) {
    return s.sprit('').reverse().join('');
  }


//   問題: 文字列 s 内の特定の文字 char の出現回数をカウントします。

// 例:
// 入力: s = "hello", char = "l"
// 出力: 2

  function count(s, char) {
    return s.sprit(char).length - 1;
  }

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