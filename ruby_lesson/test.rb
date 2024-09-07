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



# *********ハッシュ*********
# 空のハッシュ
{}
# キーとの組み合わせ（要素）を3つ格納するハッシュ
{キー1 => 値1, キー2 => 値2, キー3 => 値3}

# 要素を追加する場合は、ハッシュ[] = 値 の構文を使う。
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies['italy'] = 'euro'
currencies #=>{'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee', italy' => 'euro'}

# すでにキーが存在している場合は上書きされる。
currencies['japan'] = '円'
currencies #=>{'japan' => '円', 'us' => 'dollar', 'india' => 'rupee', italy' => 'euro'}

# ハッシュから値を取り出すには、ハッシュ[キー] のようにして書く。
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies['india'] #=> 'rupee'
currencies['brazil'] #=> nil

# ハッシュを使った繰り返し処理
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.each do |key, value|
    puts "#{key}:#{value}"
end
#=>
# japan:yen
# us:dollar
# india:rupee

# 要素の取得
# sizeまたはlengthを使うとハッシュの要素の個数を調べられる
{'x' => '1', 'y' => '2', 'z' => '3'}.size #=>3

# 要素の削除
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.delete('japan')
currencies #=> {'us' => 'dollar', 'india' => 'rupee'}


# *********シンボル*********
# シンボルを作成するコード
:apple
:japan
# シンボルは破壊的な変更は不可
symbol = :apple
symbol.upcase! #=>エラー

#ハッシュのキーにシンボルを使うと、文字列よりも高速に値を取り出すことができる。
currencies = {:japan => 'yen', :us => 'dollar', :india => 'rupee'}
currencies[:japan] #=>'yen'

# シンボルがキーになる場合、=>を使わずにシンボル: 値という記法が使える。
{:japan => 'yen', :us => 'dollar', :india => 'rupee'}
# 以下は上と同じ
{japan: :yen, us: :dollar, india: :rupee}

# メソッドのキーワード引数とハッシュ
# def メソッド名(キーワード引数1: デフォルト値1, キーワード引数2: デフォルト値2)

# end
def buy_burger(menu, drink: true, potato: true)
    if drink
        puts "ドリンクを購入しました"
    end
    if potato
        puts "ポテトを購入しました"
    end
    puts "#{menu}バーガーを購入しました"
end
# キーワード引数を持つメソッドを呼び出す場合は、引数: 値の形式で引数を指定する。
buy_burger('cheese', drink: true, potato: true)
# 存在しないキーワード引数を指定した場合、エラーになる
buy_burger('fish', salad: true) #=>エラー

buy_burger('cheese')
# この呼び出しでは、drink と potato が省略されているため、デフォルト値 true が使用され、以下の出力が得られます。
# ドリンクを購入しました
# ポテトを購入しました
# cheeseバーガーを購入しました

# デフォルト値を上書きする呼び出し
buy_burger('cheese', drink: false, potato: true)
# この呼び出しでは、drink が false、potato が true として扱われ、以下の出力が得られます。
# ポテトを購入しました
# cheeseバーガーを購入しました


#*********ハッシュで使用頻度の高いメソッド*********
# keysメソッドはハッシュのキーを配列として返す。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.keys #=> [:japan, :us, :india]

# valuesメソッドはハッシュの値を配列として返す。
currencies.values #=>['yen', 'dollar', 'rupee']

# ハッシュの中に指定されたキーが存在するか確認するメソッド
# has_key?（エイリアスメソッド key?,include?,member?）
currencies.has_key?(:japan) #=>true
currencies.has_key?(:italy) #=>false

# **でハッシュ展開させる
h = { us: 'dollar', india: 'rupee' }
{ japan: 'yen', **h } #=>{ japan: 'yen', us: 'dollar', india: 'rupee' }
# **のかわりにmergeメソッドを使っても同じ結果が得られる。
{ japan: 'yen' }.merge(h) #=>{ japan: 'yen', us: 'dollar', india: 'rupee' }

# メソッド呼び出し時の{}の省略
buy_burger('fish',{'drink' => true, 'potato' => false})
# 最後の引数がハッシュ{}であれば、{}は省略できる
buy_burger('fish','drink' => true, 'potato' => false)
# このルールは配列リテラルでも同様
a = ['fish',{'drink' => true, 'potato' => false}]
b = ['fish','drink' => true, 'potato' => false]



# ハッシュはto_aメソッドを使って配列に変換できる。このメソッドを使うと
# キーと値が1つの配列に入り、それが複数並んだ配列になって返る。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.to_a #=>[[japan: 'yen'], [us: 'dollar'], [india: 'rupee']]
# 反対に、配列に対してto_hメソッドを呼ぶと、配列をハッシュに変換できる。
currencies = [[japan: 'yen'], [us: 'dollar'], [india: 'rupee']]
currencies.to_h #=>{ japan: 'yen', us: 'dollar', india: 'rupee' }

# ハッシュのデフォルト値
h = {}
h[:foo] #=> nil

# nil以外の値を返したい時、Hash.newでハッシュを作成し、引数にデフォルト値となる値を指定する。
h = Hash.new('hello')
h[:foo] #=> "hello"

# 注意 デフォルト値に対して破壊的なメソッドを実行すると他の変数の値も変わる
a = h[:foo] #=>"hello"
b = h[:bar] #=>"hello"
a.upcase!
a #=>"HELLO"
b #=>"HELLO"


