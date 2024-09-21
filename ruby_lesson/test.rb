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
# a #=> [1, 20, 3]

# 追加
a = []
a << 1
a << 2
# a #=> [1, 2]

a = []
a.push(1)
a.push(2,3)
# a #=> [1, 2, 3]

# 削除
a = [1, 2, 3]
a.delete_at(1)
# a #=> [1, 3]

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
# b = [3, 4, 5]
# a | b #=>[1, 2, 3, 4, 5]

# a - b #=>[1, 2]

# a & b #=>[3]


# %記法で文字列の配列を作成する
# %wで作成する（!で囲む場合）
%w!apple melon orange!#=>["apple","melon","orange"]
# ()で囲む場合
%w(apple melon orange)#=>["apple","melon","orange"]

# 文字列を配列に変換
'Ruby'.chars #=>["R", "u", "b", "y"]
# 'Ruby,Java,Python'#=>["Ruby", "Java", "Python"]

# Arrayを使った配列作成
a = Array.new(5)
# a #=>[nil, nil, nil, nil, nil]

a = Array,new(5, 0)
# a #=>[0, 0, 0, 0, 0]

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
# new_numbers #=> [10,20,30,40,50]
# mapメソッドを使う場合、ブロックの戻り値が配列の要素となる新しい配列が作成されるため、
# mapメソッドの戻り値をそのまま新しい変数に入れることができる。
numbers = [1,2,3,4,5]
new_numbers = []
new_numbers = numbers.map {|n| n * 10}
# new_numbers #=> [10,20,30,40,50]



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
# currencies #=>{'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee', italy' => 'euro'}

# すでにキーが存在している場合は上書きされる。
currencies['japan'] = '円'
# currencies #=>{'japan' => '円', 'us' => 'dollar', 'india' => 'rupee', italy' => 'euro'}

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
# currencies #=> {'us' => 'dollar', 'india' => 'rupee'}


# *********シンボル*********
# シンボルを作成するコード
# :apple
# :japan
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
# a = ['fish',{'drink' => true, 'potato' => false}]
# b = ['fish','drink' => true, 'potato' => false]



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
# a = h[:foo] #=>"hello"
# b = h[:bar] #=>"hello"
a.upcase!
# a #=>"HELLO"
# b #=>"HELLO"


# シンボルを作成する様々な方法
# シンボルを作成する場合はコロンに続けて、変数名やクラス名、メソッド名の識別子として有効な文字列を書く。
# :apple
# :Apple

# シングルクオートで囲んでもシンボルとして有効になる
# :'12345' #=>:"12345"

# シングルクオートの代わりにダブルクオートを使うと、式展開を使える。
name = 'Alice'
:"#{name.upcase}" #=> :ALICE

# ハッシュを作成する際に文字列リテラル: 値 の形式で書いた場合も :文字列リテラル と同じように見なされ、キーがシンボルになる。
# hash = { 'abc': 123} #=> {:abc => 123}



# %記法でシンボルやシンボルの配列を作成する
# !を区切り文字に使う方法
# %s!ruby is fun! #=> :"ruby is fun"
# ()を区切り文字に使う方法
# %s(ruby is fun) #=> :"ruby is fun"

# シンボルの配列を作成する場合は%iを使うことができる。
%i(apple orange melon) #=> [:apple, :orange, :melon]

# 改行文字を含めたり式展開したりする場合は%Iを使います。
name = 'Alice'
%I(hello\ngood-bye #{name.upcase}) #=> [:"hello\ngood-bye", :ALICE]






# to_symメソッドを使うと文字列をシンボルに変換できる。
# string = 'apple'
to_sym.string #=> :apple

# 反対に、to_sメソッドを使うとシンボルを文字列に変換できる。
symbol = :apple
to_s.symbol #=> 'apple'



# 国名に応じて通貨を返す
def find_currency(country)
    currency = { japan: 'yen', us: 'doller', india: 'rupee' }
    currency[country]
end
# 指定された国の通貨を大文字で返す
def show_currency(country)
    currency = find_currency(country)
    if currency
        currency.upcase
    end
end

puts show_currency(:japan) #=> "YEN"





limit ||= 10
# このコードの意味は変数limitがnilまたはfalseであれば、10を代入する。それ以外はlimitの値をそのまま使う。
limit = nil
limit ||= 10
# limit #=>10

limit = 20
limit ||= 10
# limit #=> 20

# このイディオムは変数にnil以外の値を入れておきたいという目的で使われることが多いいためnilガードと呼ばれる。
# X ||= Aというコード見たら変数Xがnilまたはfalseなら、AをXに代入と読み替えるようにすること。







# クラスを使う場合と、使わない場合の比較

# 使わない場合
users = []
users << { first_name: 'Alice', last_name: 'Ruby',age: 20 }
users << { first_name: 'Bob', last_name: 'Python',age: 30 }

# 氏名を作成するメソッド
def full_name(user)
    "#{user[:first_name]} #{user[:last_name]}"
end

users.each do |user|
    puts "氏名: #{full_name(user)}, 年齢: #{user[:age]}"
end
# => 氏名: Alice Ruby, 年齢: 20
# => 氏名: Bob Python, 年齢: 30

# ハッシュを使うとキータイプミスした場合nilが返ってしまう。
# 間違ったキー指定をしてもエラーになれないので、不具合に気づかない。
users[0][:first_name] #=>"Alice"
users[0][:first_mame] #=>"nil"

# 大きなプログラムになるとハッシュでは管理しきれなくなるので、
# そこで登場するのがクラス

# クラスを使う場合
class User
    attr_reader :first_name, :last_name, :age

    def initialize(first_name, last_name, age)
        @first_name = first_name
        @last_name = last_name
        @age = age
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

users.each do |user|
    puts "氏名: #{user.full_name} 年齢: #{user.age}"
end
# => 氏名: Alice Ruby, 年齢: 20
# => 氏名: Bob Python, 年齢: 30

# Userクラスを導入すると、タイプミスした時エラーが発生します。
users[0].first_mame #=> undifined method

# 新しく属性（データ項目）を追加したり、内容を変更したりすることも防止できます。
# 勝手に属性を追加できない
users[0].country = 'japan' #=> undifined method
# 勝手にfirst_nameを変更できない
users[0].first_name = 'Carol' #=> undifined method





# クラスからオブジェクトを作成するときは以下のようにnewメソッドを使う。
User.new
# この時に呼び出させるのがinitializeメソッド。
# インスタンスを初期化するために実行したい処理があれば、
# このinitializeメソッドでその処理を実装する。（とくに必要がなければ定義しなくてもよい）
# initializeメソッドは特殊なメソッドで、デフォルトでprivateメソッドになっているので、
# 外部から呼び出すことはできません。
# initializeメソッドに引数をつけると、newメソッドを呼び出す時にも引数が必要になります。
class User
    def initialize(name, age)
        puts "name: #{name} age: #{age}"
    end
end
# 引数を期待している initialize メソッドに対して、引数なしで User.new を呼び出すとエラーが発生します
User.new #=> wrong number of arguments (given 0, expected 2)
# 引数を指定すればエラーにならない。
User.new('Alice', 20)





# クラスと内部でメソッドを定義するとそのメソッドはインスタンスメソッドになる。
# インスタンスメソッドはその名のとおり、そのクラスのインスタンスに対して呼び出すことができるメソッド。
class User
    def hello
        "hello"
    end
end
user = User.new
user.hello #=> "hello"






# インスタンス変数はクラスの外部から参照することはできません。
# rubyの場合、単純にインスタンス変数の内部を外部から読み書きするのであれば、
# attr_accessorメソッドを使うことができます。
class User
    attr_accessor :name #@nameを読み書きするメソッドが自動的に定義される
    def initialize(name)
        @name = name
    end
end
user = User.new('Alice')
user.name = 'Bob'
user.name #=> 'Bob'

# 読み取り専用にしたい時は
# attr_readerを使う。
# この場合、@nameの参照はできるが、@nameの変更はできない。。

# 書き込み専用にしたい時は、
# attr_writerを使う。
# この場合、@nameは変更できるが、@nameの参照はできない。



# クラスメソッドの定義

# まず、クラス構文内で単純にメソッドを定義するとインスタンスメソッドになります。
# インスタンスメソッドはそのクラスのインスタンスに対して呼び出すことができるメソッドであり、
# インスタンスに含まれるデータを読み書きする場合はインスタンスメソッドを定義します。
class User
    def initialize(name)
        @name = name
    end
    def hello
        "Hello, I am #{@name}"
    end
end
user = User.new('Alice')
user.hello #=> "Hello, I am Alice"

# インスタンスによって内部のデータが異なるので、helloメソッドの結果も異なる。
user = User.new('Bob')
user.hello #=> "Hello, I am Bob"


# 一方、そのクラスに関連は深いものの、ひとつひとつのインスタンスに含まれるデータは使わない
# メソッドを定義したい場合もあります。そのような場合、クラスメソッドを定義した方が使い勝手が良い。

# クラスメソッドを定義する方法1
# メソッドの前にself.をつける

# class クラス名
#     def self.クラスメソッド
#         #クラスメソッドの処理
#     end
# end

# クラスメソッドを定義する方法2
# class << selfからendの間にメソッドを書く。
# クラスメソッドをたくさん定義したい場合に使う。selfを毎回つけなくて済むので。

# class クラス名
#     class << self
#         def クラスメソッド
#             #クラスメソッドの処理
#         end
#     end
# end

# 名前の配列を渡すと、Userクラスのインスタンスを配列に入れて返すcreate_usersメソッドを定義してみます。
class User
    def initialize(name)
        @name = name
    end
    def self.create_users(names)
        names.map do |name|
            User.new(name)
        end
    end
    def hello
        "Hello, I am #{@name}."
    end
end

names = ['Alice', 'Bob', 'Carol']
users = User.create_users(names)
users.each do |i|
    puts i.hello
end
#=> Hello, I am Alice.
#=> Hello, I am Bob.
#=> Hello, I am Carol.





# クラスの継承

# スーパークラス
class Product
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end

# サブクラス

# Productクラスを継承
class DVD < Product
    attr_reader :running_time #nameとpriceはスーパークラスでattr_readerが設定されているので定義不要
    def initialize(name, price, running_time)
        #スーパークラスのinitializeメソッドを呼び出す.superを使うとスーパークラスの同名メソッドを呼び出すことができる。
        super(name, price)
        @running_time = running_time
    end
end
dvd = DVD.new('great movie', 1000, 120)
dvd.name #=>'great movie'
dvd.price #=> 1000



# メソッドのオーバーライド

# サブクラスではスーパークラスと同名のメソッドを定義することで、スーパークラスの処理を上書きすることができます。
# これをメソッドのオーバーライドといいます。
# ここで取り上げるのはto_sメソッドです。
class Product
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end
class DVD < Product
    attr_reader :running_time
    def initialize(name, price, running_time)
        super(name, price)
        @running_time = running_time
    end
end

product = Product.new('great movie', 1000)
product.to_s #=> "#<Product:0x000000012da47e18>"

dvd = DVD.new('great movie', 1000, 120)
dvd.to_s #=> "#<DVD:0x000000012e10fef8>"

# しかし、上記の通り、to_sメソッドは呼び出せるものの、文字列が変ですね。
# そこでもう少しわかりやすい文字列が返ってくるようにProductクラスで
# to_sメソッドをオーバーライドしてみましょう。

class Product
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
    def to_s
        "name: #{name}, price: #{price}"
    end
end
product = Product.new('great movie', 1000)
product.to_s #=> "name: great movie, price: 1000"

dvd = DVD.new('great movie', 3000, 120)
dvd.to_s #=>"name: great movie, price: 3000"

# すいぶん良くなりました。DVDクラスのほうもスーパークラスのto_sメソッドが使われるので
# 同じようにみやすくなっています。
# しかしDVDクラスでは再生時間(running_time)が表示されていません。
# 再生時間も表示されるように、DVDクラスでもto_sメソッドをオーバーライドすることにします。
class DVD < Product
    attr_reader :running_time
    def initialize(name, price, running_time)
        super(name, price)
        @running_time = running_time
    end
    def to_s
        "name: #{name}, price: #{price}, running_time: #{running_time}"
        #name: #{name}, price: #{price}はスーパークラスのメソッドを呼び出した方がシンプルなので、
        # 以下のようにも書ける。
        # "#{super}, running_time: #{running_time}"
    end
end
dvd = DVD.new('great movie', 3000, 120)
dvd.to_s #=>"name: great movie, price: 3000, running_time: 120"
# これで再生時間も表示されるようになりました。




# メソッドの可視性

# publicメソッド
# publicメソッドはクラスの外部からでも自由に呼び出せるメソッド。
# initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになる。
class User
    #デフォルトはpublic
    def hello
        'Hello'
    end
end
user = User.new
# publicメソッドなのでクラスの外部から呼び出せる
user.hello #=> 'Hello'





# privateメソッドはサブクラスでも呼び出せる

class Product
    private
    def name
        'A great movie'
    end
end

class DVD < Product
    #nameはスーパークラスのprivateメソッド
    def to_s
        "name: #{name}"
    end
end

dvd = DVD.new
dvd.name #=>"name: A great movie"
# この通り、サブクラスからでもスーパークラスのprivateメソッドを呼び出せます。



# クラスメソッドをprivateにしたい場合
class User
    private
    def self.hello
        'Hello'
    end
end
# クラスメソッドはprivateにならない。
User.hello #=> "Hello"


# クラスメソッドをprivateにしたい場合、class << selfの構文を使います。
class User
    class << self
        private
        def hello
            'Hello'
        end
    end
end





# メソッドの可視性を変える方法
class User
    # いったんpublicメソッドとして定義する
    def foo
        'foo'
    end
    def bar
        'bar'
    end

    # fooとbarをprivateメソッドに変更する
    private :foo, :bar

    # bazはpublicメソッド
    def baz
        'baz'
    end
end

user = User.new
user.foo #=>NoMethodError
user.bar #=>NoMethodError
user.baz #=>baz


