'use strict';

// {
// const scores = [100,102,123,134];
// scores.splice(1,3,200,300,400);


// for (let i = 0; i < scores.length; i+=1){
//     console.log(`Score${i}:${scores[i]}`);
// }
// }

// {
//     const otherScores = [100,200];
//     const scores = [80,50,40, ...otherScores];
//     // console.log(scores);

//     function sum(a, b) {
//         console.log(a + b);
//     }
//     sum(...otherScores);
// }

// {
//     const scores = [10,20,30,40];
//     const [a, ...others] = scores;
//     console.log(a);
//     console.log(others);
//     let x = 30;
//     let y = 70;
//     [x,y] = [y,x];
//     console.log(x);
//     console.log(y);
// }

// {
//     const scores = [10,20,30,40];

//     scores.forEach((score, index) => {
//         console.log(`Score${index}: ${score}`);
//     }
//     );
// }
// {
//     const prices = [10,20,30,40];

//     const updatePrices = prices.map(price => price + 20);
//     console.log(updatePrices);
//     }

// {
//     const numbers = [1,2,5,6,9];

//     const evenNumbers = numbers.filter(number => number % 2 === 0);

//     console.log(evenNumbers);
// }




// {
//     const otherProps = {
//         r:4,
//         color: 'red',
//     };


//     const point = {
//         x: 100, 
//         y: 200,
//         ...otherProps,
//     };
//     // console.log(point);

//     const {x,r, ...hoge} = point;
//     console.log(x);
//     console.log(r);
//     console.log(hoge);
// }



// {
//     const point = {
//         x: 100, 
//         y: 200,
//     };
    
//     // const hoge = Object.keys(point);
//     // hoge.forEach(key => {
//     //     console.log(`key: ${key} Value: ${point[key]}`)
//     // });

//     const points = [
//         {x:30, y:40},
//         {x:50, y:70},
//         {x:80, y:90},
//     ];
//     console.log(points[1].y);
// }



{
    // let x = 1;
    // let y = x;
    // x = 5;
    // console.log(x);
    // console.log(y);

    // let x = [1,2];
    // let y = [...x];
    // x[0] = 5;
    // console.log(x);
    // console.log(y);

    // let x = [1,2];
    // let y = x;
    // x[0] = 5;
    // console.log(x);
    // console.log(y);





    // const d = [2022,11,11];
    // console.log(d.join('/'));

    // const t = '15:45:66';
    // console.log(t.split(':'));

    // const [hour, minute, second] = t.split(':');
    // console.log(hour);
    // console.log(minute);
    // console.log(second);




    // const scores = [130,274,332];

    // let sum = 0;

    // scores.forEach(score => {
    //     sum = sum + score;
    // }
    // );

    // const avg = sum / scores.length;
    // console.log(avg);
    // console.log(sum);

    // console.log(Math.floor(avg));
    // console.log(Math.ceil(avg));
    // console.log(Math.round(avg));

    // console.log(Math.random());






    // Math.floor(Math.random()*3)
    // Math.floor(Math.random() * (max + 1 - min)) + min
    // console.log(Math.floor(Math.random() * (6 + 1 - 1)) + 1);
    





    // const d = new Date();
    // console.log(`${d.getMonth() + 1} 月 ${d.getDate()} 日`);
    


    // const d = new Date(2022,0);
    // d.setHours(10,20,30);
    // d.setDate(32);
    // d.setDate(d.getDate() + 10);
    // console.log(d);


    // alert('hello');
    // const answer = confirm('OK?');
    // if (answer){
    //     console.log('削除しました');
    // }else{
    //     console.log('キャンセルしました');
    // }









    // let i = 0;

    // function showTime(){
    //     console.log(new Date());
    //     i++;
    //     if(i > 2){
    //         clearInterval(intervalid);
    //     }
    // }
    // const intervalid = setInterval(showTime, 1000);










    // let i = 0;

    // function showTime(){
    //     console.log(new Date());
    //     const timeoutid = setTimeout(showTime, 1000);
    //     i++;
    //     if(i>2){
    //         clearTimeout(timeoutid);
    //     }
    // }
    // showTime();

    // const name = 123;
    // try{
    //     console.log(name.toUpperCase());

    // }catch(e){
    //     console.log(e);
    // }
    
    // console.log('finish');








    // const posts = [
    //     {
    //     text: '勉強中', 
    //     likecount:0,
    //     },
    //     {
    //     text: 'foobar', 
    //     likecount:0,
    //     },
    // ];

    // function show(hoge){
    //     console.log(`${hoge.text} ${hoge.likecount}いいね`);
    // }

    // show(posts[0]);






    // const posts = [
    //     {
    //     text: '勉強中', 
    //     likecount:0,
    //         show() {
    //             console.log(`${this.text} ${this.likecount}いいね`);
    //         },
    //     },

    //     {
    //     text: 'foobar', 
    //     likecount:0,
    //         show() {
    //             console.log(`${this.text} ${this.likecount}いいね`);
    //         },
    //     },
    // ];

    // posts[0].show();
    // posts[1].show();







    // class Post{
    //     constructor(text) {      
    //         this.text = text;
    //         this.likecount = 0;
    //     }

    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //     }
    // }


    // const posts = [
    //     new Post('勉強中です'),
    //     new Post('旅行中です'),
    // ];

    // posts[0].show();
    // posts[1].show();











    // class Post{
    //     constructor(text) {      
    //         this.text = text;
    //         this.likecount = 0;
    //     }

    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //     }

    //     like() {
    //         this.likecount++;
    //     }
    // }


    // const posts = [
    //     new Post('勉強中です'),
    //     new Post('旅行中です'),
    // ];

    
    // posts[0].like();
    
    // posts[0].show();
    // posts[1].show();






    // class Post{
    //     constructor(text) {      
    //         this.text = text;
    //         this.likecount = 0;
    //     }
    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //     }
    //     like() {
    //         this.likecount++;
    //     }
    //    // 静的メソッド
    // //    thisは使えない
    //     static showInfo(){
    //         console.log('Post class version 1.0');
    //     }
    // }
    // const posts = [
    //     new Post('勉強中です'),
    //     new Post('旅行中です'),
    // ];
    // posts[0].like();
    // posts[0].show();
    // posts[1].show();
    // Post.showInfo();








    // class Post{
    //     constructor(text) {      
    //         this.text = text;
    //         this.likecount = 0;
    //     }
    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //     }
    //     like() {
    //         this.likecount++;
    //     }
    // }
    // class SponsoredPost{
    //     constructor(text, sponsor) {      
    //         this.text = text;
    //         this.likecount = 0;
    //         this.sponsor
    //     }
    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //         console.log(`sponsored by ${this.sponsor}`);
    //     }
    //     like() {
    //         this.likecount++;
    //     }
    // }
    // const posts = [
    //     new Post('勉強中です'),
    //     new Post('旅行中です'),
    //     new SponsoredPost('hogehoge'),
    // ];
    // posts[0].like();
    // posts[0].show();
    // posts[1].show();
    // posts[2].show();















    // class Post{
    //     constructor(text) {      
    //         this.text = text;
    //         this.likecount = 0;
    //     }
    //     show() {
    //         console.log(`${this.text} ${this.likecount}いいね`);
    //     }
    //     like() {
    //         this.likecount++;
    //     }
    // }
    // // extendsを使ってPostクラスを継承
    // // 子クラスの constructor() で this キーワードを使うには constructor() の最初で super() としてあげる必要があります。
    // class SponsoredPost extends Post{
    //     constructor(text, sponsor) {      
    //         super(text); 
    //         this.sponsor
    //     }
    //     show() {
    //         // 親クラスの show() メソッドを使えば良いので、その場合 super に繋げて書けば親クラスのメソッドを呼べるというルールもあります。
    //         super.show();
    //         console.log(`sponsored by ${this.sponsor}`);
    //     }
    // }
    // const posts = [
    //     new Post('勉強中です'),
    //     new Post('旅行中です'),
    //     new SponsoredPost('hogehoge'),
    // ];
    // posts[0].like();
    // posts[0].show();
    // posts[1].show();
    // posts[2].show();
    







    // function update() {
    //     document.getElementById('target').textContent = 'Changed';
    //     // document.querySelectorAll('p')[0].textContent = 'Changed';
    //     document.querySelectorAll('p').forEach((p, index) => {
    //         p.textContent = `${index}番目のpです`;
    //     });
    // }
    // setTimeout(update, 1000);











    // function update() {
    //     document.getElementById('target').textContent = 'Changed';
    // }
    // document.querySelector('button').addEventListener('click',update);

    // // アロー関数で表現した場合
    // document.querySelector('button').addEventListener('click',() => {
    //     document.getElementById('target').textContent = 'Changed'
    // });














    // document.querySelector('button').addEventListener('click',() => {
    //     const targetNode = document.getElementById('target');

    //     targetNode.textContent = 'Changed';
    //     targetNode.title = 'This is title';
    //     targetNode.style.color = 'red';
    //     targetNode.style.backgroundColor = 'green';
    // });










    // document.querySelector('button').addEventListener('click',() => {
    //     const targetNode = document.getElementById('target');


    //     targetNode.className = 'my-color my-border';
    // });








    // document.querySelector('button').addEventListener('click',() => {
    //     const targetNode = document.getElementById('target');
    //     // targetNode.className = 'my-color my-border';
    //     // targetNode.classList.add('my-color');
    //     if(targetNode.classList.contains('my-color') === true){
    //         targetNode.classList.remove('my-color');
    //     }else{
    //         targetNode.classList.add('my-color');
    //     }
    // });

    // 上をもっと短く書くと

    // document.querySelector('button').addEventListener('click',() => {
    //     const targetNode = document.getElementById('target');
    //     targetNode.classList.toggle('my-color');
    // });













    // document.querySelector('button').addEventListener('click',() => {
    //     const targetNode = document.getElementById('target');

    //     targetNode.textContent = targetNode.dataset.translation;
    // });








    // document.querySelector('button').addEventListener('click',() => {
    //     const item2 = document.createElement('li');
    //     item2.textContent = 'item2';
    //     const ul =document.querySelector('ul');
    //     ul.appendChild(item2);









    // document.querySelector('button').addEventListener('click',() => {
    //     const item0 = document.querySelectorAll('li')[0];
    //     const copy = item0.cloneNode(true);
        
    //     const ul = document.querySelector('ul');
    //     const item2 = document.querySelectorAll('li')[2];
    //     ul.insertBefore(copy, item2);








    // document.querySelector('button').addEventListener('click',() => {
    //     const item1 = document.querySelectorAll('li')[1];

    //     // item1.remove();
    //     // 他の削除方法は親Node.removeChild(削除するNode)
    //     document.querySelector('ul').removeChild(item1);










    // document.querySelector('button').addEventListener('click',() => {
    //     const li = document.createElement('li');
    //     const text = document.querySelector('input');

    //     li.textContent = text.value;
    //     document.querySelector('ul').appendChild(li);

    //     text.value = '';
    //     text.focus();









    // document.querySelector('button').addEventListener('click',() => {
    //     const li = document.createElement('li');
    //     const color = document.querySelector('select');

    //     li.textContent = `${color.value} ${color.selectedIndex}`; 
    //     document.querySelector('ul').appendChild(li);










    // document.querySelector('button').addEventListener('click',() => {
    //    const colors =document.querySelectorAll('input');
    // //    選択された値を保持しておきたいので変数も宣言
    //    let selectedColor;

    //    colors.forEach(color => {
    //     if(color.checked === true){
    //         selectedColor = color.value;
    //     }
    //    });
    //    const li = document.createElement('li');
    //    li.textContent = selectedColor;
    //    document.querySelector('ul').appendChild(li);










// DOM 16
    // document.querySelector('button').addEventListener('click',() => {
    //     const colors = document.querySelectorAll('input');
    //     // チェックボックスの場合、複数選択可なので、選択された値を配列で保持しておきましょう。
    //     const selectedColors = [];

    //     // color の checked プロパティが true だったら selectedColors に追加したいので push() メソッドを使ってあげましょう。
    //     // push() する値は選択された値なので、 color の value プロパティを使ってあげれば良いですね。
    //     colors.forEach(color => {
    //         if (color.checked === true){
    //             selectedColors.push(color.value);
    //         }
    //     });

    //     const li = document.createElement('li');
    //     // li 要素の textContent ですが、 selectedColors の配列の要素を , （カンマ）区切りで設定してあげましょう。join() を使ってあげれば OK ですね。
    //     li.textContent = selectedColors.join(',');
    //     document.querySelector('ul').appendChild(li);
    // });









    // document.querySelector('button'),addEventListener('dblclick', () => {
    //     console.log('hogehoge');
    // });

    // document.addEventListener('mousemove', e => {
    //     console.log(e.clientX, e.clientY);
    // });

    // document.addEventListener('keydown', e => {
    //     console.log(e.key);
    // });








    // const text = document.querySelector('textarea');

    // text.addEventListener('focus', () => {
    //     console.log('hoge');
    // });
    // text.addEventListener('blur', () => {
    //     console.log('foobar');
    // });
    // text.addEventListener('input', () => {
    //     // console.log('hoge');
    //     console.log(text.value.length);
    // });
    // text.addEventListener('change', () => {
    //     console.log('foobar');
    // });







// DOM 20
    // document.querySelector('form').addEventListener('submit', e => {
    //     e.preventDefault();
    //     console.log('hoge');
    // });




const numbers = [1, 2, 3, 2, 1];
const duplicates = [];

numbers.map(function(number, index, array){
    if (index !== array.indexOf(number)) {
        duplicates.push(number);
    }
});
console.log(duplicates);

}

