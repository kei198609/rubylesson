# クラスメソッド　インスタンスメソッド

class User
    # initializeメソッドはUser.newのようにnewメソッドを使うと呼び出される
    def initialize(name)
        @name = name
    end
    #クラスメソッド
    def self.create_user(names)
        names.map do |name|
            User.new(name)
        end
    end
    #インスタンスメソッド
    def hello
        "hello i am #{@name}"
    end
end

names = ['Alice','bob','jone']

users = User.create_user(names)

users.each do |user|
    puts user.hello
end







# attr_accessorメソッド
class User
    # @nameを読み書きするメソッドが自動的に定義される
    attr_accessor :name
    def initialise(name)
        @name = name
    end
end
user = User.new('Alice')

# @nameを変更する
user.name = 'Bob'
# @nameを参照するとBobに変更されている。
user.name #=>"Bob"

# *********配列*********

# 要素の変更、追加、削除
# 変更
a = [1, 2, 3]
a[1] = 20
a #=> [1, 20, 3]

# 追加
a = []
a << 1
a << 2
a #=> [1, 2]

a = []
a.push(1)
a.push(2,3)
a #=> [1, 2, 3]

# 削除
a = [1, 2, 3]
a.delete_at(1)
a #=> [1, 3]

# 配列の一部を抜き出す
a = [1, 2, 3, 4, 5]
a[1..3]#=>[2, 3, 4]

a = [1, 2, 3, 4, 5]
a[1, 3]#=>[2, 3, 4]


# 最後の要素を取得
a = [1, 2, 3]
a[-1]#=>3
# 最後から2番目の要素を取得
a = [1, 2, 3]
a[-2]#=>2

# 配列の和集合、差集合、積集合
a = [1, 2, 3]
b = [3, 4, 5]
a | b #=>[1, 2, 3, 4, 5]

a - b #=>[1, 2]

a & b #=>[3]


# %記法で文字列の配列を作成する
# %wで作成する（!で囲む場合）
%w!apple melon orange!#=>["apple","melon","orange"]
# ()で囲む場合
%w(apple melon orange)#=>["apple","melon","orange"]

# 文字列を配列に変換
'Ruby'.chars #=>["R", "u", "b", "y"]
'Ruby,Java,Python'#=>["Ruby", "Java", "Python"]

# Arrayを使った配列作成
a = Array.new(5)
a #=>[nil, nil, nil, nil, nil]

a = Array,new(5, 0)
a #=>[0, 0, 0, 0, 0]

# *で配列同士を非破壊的に連結する
a = [1, 2, 3]
[a] #=>[[1, 2, 3]]
[*a] #=>[1, 2, 3]
[-1, 0, *a, 4, 5] #=>[-1,0,1,2,3,4,5]

# *********mapメソッド*********

# mapメソッドを使わない場合
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each {|n| new_numbers << n * 10}
new_numbers #=> [10,20,30,40,50]
# mapメソッドを使う場合、ブロックの戻り値が配列の要素となる新しい配列が作成されるため、
# mapメソッドの戻り値をそのまま新しい変数に入れることができる。
numbers = [1,2,3,4,5]
new_numbers = []
new_numbers = numbers.map {|n| n * 10}
new_numbers #=> [10,20,30,40,50]



# *********ブロックについて詳しく*********
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { |fruit, i| puts "#{i}:#{fruit}" }
# 0:apple
# 1:orange
# 2:melon

# 名前に"a"を含み、なおかつ添え字が奇数の要素を削除
fruits.delete_if.with_index{ |fruit, i| fruit.include?('a') && i.add? }
# ["apple", "melon"]

# ブロックの後ろに別のメソッドを続けて書くこともできる
names = ['田中', '鈴木', '佐藤']
names.map {|name| "#{name}さん"}.join('と') #=> 田中さんと鈴木さんと佐藤さん
# {}　とdo endは同じなので以下のようにendのあとにjoinを追記できるけど、{}で書く方が読みやすい
name.map do |name|
    "#{name}さん"
end.join('と')



# *********ブロックを利用するメソッドの定義とyield*********
# 例としてまずはこんなメソッドを用意
def greet
    puts 'おはよう'
    puts 'こんばんは'
end
# メソッドを実行するとこうなる
greet
#=>
# おはよう
# こんばんは

# ブロック付きでメソッドを呼び出す
greet do
    puts 'こんにちは'
end
# エラーは起きないが出力結果が変わることはない
#=>
# おはよう
# こんばんは

# なので、渡されたブロックを実行するためには、メソッド内でyieldを使う。
def greet
    puts 'おはよう'
    yield
    puts 'こんばんは'
end
#=>
# おはよう
# こんにちは
# こんばんは


# yieldはブロックに引数を渡したり、ブロックの戻り値を受け取ったりもできる。
# 以下はこんにちはという引数をブロックに渡し、
# ブロックの戻り値を受け取ってputsメソッドで出力するコード例
def greet
    puts 'おはよう'
    text = yield 'こんにちは'
    puts text
    puts 'こんばんは'
end

greet do |text|
    text * 2
end
#=>
# おはよう
# こんにちはこんにちは
# こんばんは


# ブロックを引数として明示的に受け取ることもできる。
# ブロックを引数として受け取る場合は、引数名の前に&をつける。
# そのブロックを実行する場合は、callメソッドを使う。
# def メソッド(引数)
#     引数.call
# end

def greet(&hoge)
    puts 'おはよう'
    text = hoge.call('こんにちは')
    puts text
    puts 'こんばんは'
end
# ブロック引数 text には、メソッド内で hoge.call('こんにちは') として渡された 'こんにちは' が入る
greet do |text|
    text * 2
end
#=>
# おはよう
# こんにちはこんにちは
# こんばんは

# ブロックを引数として受け取るメリットについて
# 例えば、arityメソッドを使うとブロックパラメータの個数を確認することができる。
def greet(&block)
    text =
        if block.arity == 1
            yield 'こんにちは'
        elsif block.arity == 2
            yield 'こんに', 'ちは'
        end
    puts text
end
greet do |text|
    text * 2
end
#=>こんにちはこんにちは
greet do |text_1, text_2|
    text_1 * 2 + text_2 * 2
end
#=>こんにこんにちはちは