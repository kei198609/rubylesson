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

# 上記の知識を応用すると、次のようにメソッド定義と同時にそのメソッドを
# privateメソッドにすることが可能。

class User
    private def foo
        'foo'
    end
end
user = User.new
user.foo #=>NoMethodError


# また、アクセサメソッドをprivateにしたいときは、次のようにすることで可能。
class User
    private attr_accessor :name
    def initialize(name)
        @name = name
    end
end
user = User.new('Alice')
user.name #=>NoMethodError




# protectedメソッド
# protectedメソッドはprotectedメソッドを定義したクラス自身と、
# そのサブクラスのインスタンスメソッドからレシーバ付きで呼び出せます。

# 以下に名前と体重を持つUserクラスがあったとします。
# 体重を後悔するのは恥ずかしいので外部から取得できるのは名前だけにします。
class User
    attr_reader :name #weightは外部に公開しない
    def initialize(name, weight)
        @name = name
        @weight = weight
    end
end
# しかし、何かの理由でユーザ同士の体重を比較しなければならなくなりました。
# というわけで次のようなメソッドを定義します。
class User
    attr_reader :name #weightは外部に公開しない
    def initialize(name, weight)
        @name = name
        @weight = weight
    end
    #自分の体重がother_userより重い場合はtrue
    def heavier_than?(other_user)
        other_user.weight < @weight
    end
end
# しかし、このままだとother_userの体重(weight)が取得できないのでエラーになります。
alice = User.new('Alice', 50)
bob = User.new('Bob', 60)
alice.heavier_than?(bob) #=> NoMethodError

# なので、以下のようにする。
class User
    attr_reader :name #weightは外部に公開しない
    def initialize(name, weight)
        @name = name
        @weight = weight
    end
    #自分の体重がother_userより重い場合はtrue
    def heavier_than?(other_user)
        other_user.weight < @weight
    end

    protected

    def weight
        @weight
    end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)
# 同じクラスのインスタンスメソッド内であればweightを呼び出せる
alice.heavier_than?(bob) #=> false
bob.heavier_than?(alice) #=> true

# クラスの外ではweightは呼び出せない
alice.weight #=>NoMethodError
# これで、体重の一般公開を避けつつ、同じクラスの中でのみ、他のオブジェクトに公開することができました。

# インスタンス変数の内容を返すだけの単純なゲッターメソッドであれば、attr_readerを使って、
# weightメソッドを定義した方がシンプル。次のようにメソッドの定義と同時に
# protectedメソッドにすることができる。
class User
    attr_reader :name
    protected attr_reader :weight
    # 省略
end





# 定数について詳しく
# 定数はクラスの外部から直接参照することも可能です。
# クラスの外部から定数を参照する場合は次のような構文を使う。
# クラス名::定数名
class Product
    DEFAULT_PRICE = 0
end
Product :: DEFAULT_PRICE #=> 0

# 定数をクラスの外部から参照させたくない場合は、
# private_constantで定数名を指定します。
class Product
    DEFAULT_PRICE = 0
    private_constant :DEFAULT_PRICE
end
Product :: DEFAULT_PRICE #=> NameError



# また、Rubyではメソッド内にスコープを限定した定数は定義できません。
# ゆえに、メソッド内部で定数を定義しようとするとエラーになります。
# def foo
#     メソッドの内部で定数を定義しようとすると構文エラーになる。
#     BAR = 123
#     BAR * 10
# end

# そのため、次のように定数の定義は必ずクラス構文の直下、もしくはトップレベルで行う必要があります。
SOME_VALUE = 123
class Product
    DEFAULT_PRICE = 0
end





# また、Rubyの定数定義(=を使った代入)はそれ自体が値を返します
GREEN = 0 #=>0

# この仕組みを利用すると、次のように配列を定数で定義しつつ、その要素も同時に定数として定義することも可能。
class TrafficLight
    # 配列COLORSを定数として定義し、その各要素も定数として同時に定義する
    COLORS = [
        GREEN = 0,
        YELLOW = 1,
        RED = 2
    ]
end
TrafficLight :: GREEN #=>0
TrafficLight :: YELLOW #=>1
TrafficLight :: RED #=>2
TrafficLight :: TrafficLight #=>[0, 1, 2]

# 定数にはリテラルで作られる静的な値だけでなく、メソッドや条件分岐を使った動的な値も代入可能です。
NUMNERS = [1, 2, 3].map {|n| n * 10}
# NUMNERS #=>[10, 20, 30]




# クラスインスタンス変数
class Product
    @name = 'Product' #クラスインスタンス変数

    def self.name
        @name #クラスインスタンス変数
    end

    def initialize(name)
        @name = name #インスタンス変数
    end

    def name
        @name #インスタンス変数
    end
end
# 上のコードには@nameが4箇所登場していますが、実は2種類の@nameに分かれます。
# 一つはインスタンス変数の@nameで、もうひとつはクラスインスタンス変数の@nameです。
# インスタンス変数はクラスをインスタンス化（クラス名.newでオブジェクトを作成）した際に、オブジェクトごとに管理される変数です。
# クラスインスタンス変数はインスタンスの作成とは無関係に、クラス自身が保持しているデータ（クラス自身のインスタンス変数）です。
# クラス構文の直下や、クラスメソッドの内部で@で始まる変数を操作すると、クラスインスタンス変数にアクセスしていることになります。





# エイリアスメソッドの定義
s = 'hello'
s.size #=> 5
s.length #=> 5

# 独自に作成したクラスでもエイリアスメソッドを定義することができます。
# 定義するにはaliasキーワードを使います。
# alias 新しい名前 元の名前

# エイリアスメソッドを定義する場合は、aliasキーワードを呼び出すタイミングに注意。
# aliasキーワードを呼び出す場合は先に元のメソッドを定義しておかないとエラーなります。
# 以下はhelloメソッドのエイリアスメソッドとしてgreetメソッドを定義する例です。

class User
    def hello
        'Hello!'
    end
    alias greet hello
end
user = User.new
user.hello #=>Hello!
user.greet #=>Hello!



# メソッドの削除
# 頻繁に使う機能ではないが、Rubyではメソッドの定義をあとから削除することもできる。
undef 削除するメソッド名で可能。
class User
    undef freeze
end
user = User.new
user.freeze #=>NoMethodError



# 入れ子になったクラスの定義
# class 外側のクラス
#     class 内側のクラス

#     end
# end

# クラスの内部に定義したクラスは次のように::を使って参照できます。
class User
    class BloodType
        attr_reader :type

        def initialize(type)
            @type = type
        end
    end
end
blood_type = User :: BloodType.new('A')
blood_type.type #=>"A"
# この手法はクラス名の予期せぬ衝突を防ぐ名前空間を作る場合によく使われます。
# ただし、名前空間を作る場合はクラスよりもモジュールが使われることが多いです。





# equal?メソッド
a = 'abc'
b = 'abc'
a.equal?(b) #=> false

c = a
a.equal?(c) #=> true

# equal?メソッドはobject_idが等しい場合にtrueを返す。
# つまりまったく同じインスタンスかどうかを判断する場合に使う。
# この挙動が変わるとプログラムの実行に悪影響を及ぼす恐れがあるため、equal?メソッドは再定義してはいけない
# 例えば、以下のように再定義した場合:
class String
    def equal?(other)
        false # 常にfalseを返す
    end
end
# 上記の再定義により、全ての文字列インスタンスで equal? メソッドが機能しなくなり、
# プログラム全体に影響を与えることになります。



# オープンクラス
# Rubyではクラスの継承に制限はありません。
# StringクラスやArrayクラスなど、組み込みライブラリのクラスであっても
# 継承して独自のクラスを定義することができます。

class MyString < String
    # Stringクラスを拡張するためのコードを書く
end
s = MyString.new('Hello')
# s #=> "Hello"
# s.class #=> MyString

# Arrayクラスを継承した独自クラスを定義する
class MyArray < Array
    # Arrayクラスを拡張するためのコードを書く
end
a = MyArray.new()
a << 1
a << 2
# a #=> [1, 2]
# a.class #=> MyArray

# それだけではなく、定義済みのクラスそのものにメソッドを追加したり、
# メソッドの定義を上書きしたりすることもできます。
# Rubyのクラスは変更に対してオープンなのでオープンクラスと呼ばれることもあります。
# 以下はStringクラスにshuffleという独自のメソッドを追加する例です。


def String
    def shuffle
        chars.chuffle.join
    end
end

s = 'Hello, I am Alice.'
s.shuffle #=> ""

# 上記のコードの場合はa.shuffleでメソッドを呼び出していますが、String.newでインスタンスを作成する必要はないのか？については、
# s = 'Hello, I am Alice.' で、s は既に String クラスのインスタンスです。
# このため、String.new を使って新しいインスタンスを作成する必要はありません。
# s に文字列を代入することで、s はすでに String のインスタンスとなっており、shuffle メソッドを直接呼び出すことができます。


# 新しいメソッドを追加するだけでなく、既存のメソッドを上書きすることもできます。
# 既存の実装を上書きして、自分が期待する挙動に変更することをモンキーパッチと呼びます。
# 以下のUserクラスは外部ライブラリで定義されている想定
class User
    def initialize(name)
        @name = name
    end
    def hello
        "hello, #{@name}"
    end
end
# モンキーパッチを当てる前の挙動を確認する
user = User.new('Alice')
user.hello #=> "hello, Alice"

# helloメソッドにモンキーパッチをあてて独自の挙動を持たせる
class User
    def hello
        "#{@name}さん、こんにちは"
    end
end
user.hello #=>"Aliceさん、こんにちは"




# 特異メソッド
# オープンクラスやモンキーパッチによって、既存のクラスを拡張したり挙動を変更したりすることができました。
# さらにRubyではクラスの単位ではなく、オブジェクト単位で挙動を変えることもできます。
alice = 'I am Alice'
bob = 'I am Bob'

# aliceオブジェクトにだけ、shuffleメソッドを定義する
def alice.shuffle
    chars.shuffle.join
end
alice.shuffle #=>"m le a. icIA"
bob.shuffle #=>NoMethodError


# なお、特異メソッドは以下のように定義することもできます。
alice = 'I am Alice'
class << alice
    def shuffle
        chars.shuffle.join
    end
end
alice.shuffle #=>"m le a. icIA"




# ダックタイピング

# display_nameメソッドは引数で渡されたオブジェクトがnameメソッドを持っていること（object.nameが呼び出せること）
# を期待しています。それ以外のことは何も気にしません。なので以下のようにまったく別々のオブジェクトを渡すことができます。

def display_name(object)
    puts "Name is #{object.name}"
end

class User
    def name
        'Alice'
    end
end

class Product
    def name
        'A great movie'
    end
end
# UserクラスとProductクラスはお互いに無関係なクラスだが、display_nameメソッドは何も気にしない
user = User.new
display_name(user) #=> Name is Alice

product = Product.new
display_name(product) #=> Name is A great movie

# このように、オブジェクトのクラスが何であろうと、そのメソッドが呼び出せれば良しとするプログラミングスタイルのことを
# ダックタイピングと呼びます。

# # 以下は別の例
# 在庫の確認は商品の種類によって確認方法が異なるため、サブクラスでstock?メソッドを実装してもらうようにします。
# スーパークラスのProductクラスではstock?メソッドを実装しません。
class Product
    def initialize(name, price)
        @name = name
        @price = price
    end

    def display_text
        stock = stock? ? 'あり' : 'なし'
        "商品名：#{@name} 価格：#{@price} 在庫:#{stock}"
    end
end

class DVD < Product
    def stock?
        #データベースに問い合わせるなどの処理を書く必要があるがここでは省略
    end
end

product = Product.new('A great film', 1000)
product.display_text #=> NoMethodError

dvd = DVD.new('An awesome file', 3000)
dvd.display_text #=>"商品名：An awesome file 価格：3000 在庫:あり"

# Productクラスではdisplay_textの呼び出しに失敗し、DVDクラスでは成功します。
# Rubyが気にするのはあくまでのstock?メソッドが呼び出せるどうかです。
# よって、stock?メソッドが呼び出せないProductクラスではエラーが発生し、
# 呼び出せるDVDクラスでは正常にメソッドが実行できました。



# メソッドの有無を調べるrespond_to?
# オブジェクトに対して特定のメソッドが呼び出し可能か確認する場合はrespond_to?を使います。
s = 'Alice'
#Stringクラスはsplitメソッドを持つ（Rubyの文字列はすべて String クラスに属している）
s.respond_to?(:split) #=> true
# Stringクラスはnameメソッドは持たない。
s.respond_to?(:name) #=> false

# respond_to?メソッドを使えば、そのオブジェクトが呼び出したいメソッドを持っているかどうか条件分岐させることができます。
def display_name(object)
    if object.respond_to?(:name)
        # nameメソッドが呼び出せる場合
        puts "Name is #{object.name}"
    else
        puts "No name"
    end
end




# モジュールの定義
# モジュールは以下のような構文で定義します。
# module モジュール名
#     モジュールの定義（メソッドや定数など）
# end

# helloメソッドを持つGreetableモジュールを定義
module Greetable
    def hello
        'hello'
    end
end
# モジュールはクラスと違い次の特徴があります。
# モジュールからインスタンスは作成することはできない。
# ほかのモジュールやクラスを継承することはできない。
# greetable = Greetable.new #=> NoMethodError

# module AwesomeGreetable < Greetable
# end
#=> syntax error

# 以下のコードは、メソッドが呼ばれたタイミングでログを残そうとする2つのクラスです。
class Product
    def title
        log 'title is called'
    end

    private

    def log(text)
        puts "[LOG] #{text}"
    end
end

class User
    def name
        log 'name is called'
    end

    private

    def log(text)
        puts "[LOG] #{text}"
    end
end

product = Product.new
product.title #=> [LOG] title is called

user = User.new
user.name #=> [LOG] name is called

# しかし、上のコードではログを出力する処理が重複しています。
# コードが重複しているからといって安易に継承を使ったりしていはいけません。
# 製品はユーザであるまたはユーザは製品であるという関係（is-aの関係）が成り立たないのであれば、
# 継承の使用は避けるべきです。
# 継承は使えないがログを出力するという共通の機能は持たせたい、そんなときに選択肢として挙がるのがモジュールです。

module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    include Loggable
    def title
        log 'title is called'
    end
end

class User
    include Loggable
    def name
        log 'name is called'
    end
end

product = Product.new
product.title #=> [LOG] title is called

user = User.new
user.name #=> [LOG] name is called


# 上のコードでは、Loggableモジュールをincludeすることで、モジュールに定義したlogメソッドを
# ProductクラスでもUserクラスでも呼び出すことができました。
# ただ、このコードだとlogメソッドがpublicメソッドになり、クラス外から呼び出せてしまいます。
# publicメソッドにする必要がなければ、モジュール側でprivateメソッドとして定義しておきましょう。
# こうしておくとincludeしたクラスでもそのメソッドがprivateメソッドとして扱われます。

module Loggable

    private

    def log(text)
        puts "[LOG] #{text}"
    end

    class Product
        include Loggable
        def title
            log 'title is called'
        end
    end
end

product = Product.new
# logメソッドはprivateメソッドなので外部から呼び出せない
product.log 'public?' #=>NoMethodError



# include先のメソッドを使うモジュール
# ダックタイピングでも説明した通り、Rubyは動的型付言語であるため、メソッドを実行する瞬間に
# そのメソッドが呼び出せれば良いという考え方でプログラムが書けます。この考えはモジュールにも適用できます。
module Taggable
    def price_tag
        "#{price}円"
    end
end
class Product
    include Taggable
    def price
        1000
    end
end
product = Product.new
product.price_tag #=> 1000円

# Taggableモジュールのprice_tagメソッドはProductクラスのpriceメソッドと連携して
# 目的の処理を実行することができました。




# モジュールをextendする
# extendを使うとモジュール内のメソッドをそのクラスの特異メソッド（つまりクラスメソッド）にすることができます。
module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    extend Loggable

    def self.create_products(names)
        # logメソッドをクラスメソッド内で呼び出す（つまりlogメソッド自体もクラスメソッドになっている）
        log 'create_products is called'
    end
end

# クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([]) #=> [LOG] create_products is called
# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product.log('Hello') #=> [LOG] Hello





# includeされたモジュールの有無を確認する
# あるクラスに特定のモジュールがincludeされているかどうか確認する方法はいくつかあります。
module Loggable
    # 省略
end

class Product
    include Loggable
    # 省略
end

# クラスオブジェクトに対してinclude?メソッドを呼ぶと、引数で渡したモジュールがincludeされているかどうかわかります。
Product.include?(Loggable) #=>true
# included_modulesメソッドを呼ぶと、includeされているモジュールの配列が返ります。
Product.include_modules #=> [Loggable, Kernel]
# ancestorsメソッドを使うと、モジュールだけでなくスーパークラスの情報も配列になって返ってきます。
Product.ancestors #=>[Product, Loggable, Object, Kernel, BasicObject]

# クラスのインスタンスからもincludeされているモジュールの情報は取得できます。
# たとえばclassメソッドを使うと自分が属しているクラスのクラスオブジェクトが取得できるため、
# そこからinclude?メソッドやincluded_modulesメソッドを呼び出すことができます。
product = Product.new
# product.classはProductクラスを返す
product.class.include?(Loggable) #=> true
product.class.include_modules #=> [Loggable, Kernel]





#Enumerableモジュール
# Enumerableモジュールは配列やハッシュ、範囲(Range)など、何かしらの繰り返し処理ができるクラスに
# includeされているモジュールです。Enumerableモジュールがincludeされていることは、以下のような
# クラスに対してinclude?メソッドを呼び出すとわかります。
Array.include?(Enumerable) #=>true
Hash.include?(Enumerable) #=>true
Range.include?(Enumerable) #=>true

# Enumerableモジュールをincludeしているクラスであれば代表的な以下のメソッドを呼び出すことが可能です。
# map select find count

[1, 2, 3].map {|i|i * 10} #=> [10, 20, 30]
{ a: 1, b: 2, c: 3 }.map { |k, v| [k, v * 10] } #=> [[a:, 10], [b:, 20], [c:, 30]]
(1..3).map { |n| n * 10 } #=> [10, 20, 30]
[1, 2, 3].count #=>3
{ a: 1, b: 2, c: 3 }.count #=>3
(1..3).count #=>3

# Enumerableモジュールをincludeして、モジュールに定義されたメソッドを使えるようにする条件は、
# include先のクラスでeachメソッドが実装されていること。
# eachメソッドさえ実装していれば、Enumerableモジュールをincludeするだけで、このモジュールに
# 定義された50を超えるメソッドが一気に手に入る。



# Comparableモジュールと<=>演算子
# Comparableモジュールは比較演算を可能にする。このモジュールをincludeすると以下メソッド（演算子）が使えるようになる。
# <, <=, ==, >, >=, between?
# Comparableモジュールのメソッドを使えるようにするための条件は、include先のクラスで<=>演算子を実装しておくことです。

# a <=> bが次のような結果を返すように実装する必要があります。
# ・aがbよりも大きいなら正の整数
# ・aとbが等しいなら0
# ・aがbよりも小さいなら負の整数
# ・aとbが比較できない場合はnil

# 文字列や数値を使って、実際に<=>演算子の戻り値を見てみましょう
# 2 <=> 1 #=>1
# 2 <=> 2 #=>0
# 1 <=> 2 #=>-1
# a <=> 'abc' #=>nil

# 'xyz' <=> 'abc' #=>1
# 'abc' <=> 'abc' #=>0
# 'abc' <=> 'xyz' #=>-1
# 'abc' <=> '123' #=>nil

# Comparableモジュールを独自のクラスにincludeして使うこともできます。
class Tempo
    include Comparable

    attr_reader :bpm

    def initialize(bpm) #bpmは音楽の速さを表す単位
        @bpm = bpm
    end

    def <=>(other)
        # bpm を持つ Tempo オブジェクト同士を比較します。
        # other が Tempo クラスのオブジェクトである場合、bpm の値を比較し、その結果を返します。
        # other が Tempo クラスのオブジェクトでない場合は比較できないのでnilを返す
        other.is_a?(Tempo) ? bpm <=> other.bpm : nil
    end

    # irb上で結果を見やすくするためにinspectメソッドをオーバーライド
    def inspect
        "#{bpm}bpm"
    end

end

t1 = Tempo.new(120)
t2 = Tempo.new(140)

puts t1 < t2    # => true
puts t1 == t2   # => false
puts t2 > t1    # => true



#クラスやモジュール自身もオブジェクトについて

class User
end
# Userクラス自身のクラスはClassクラス
User.class #=>Class
# ClassクラスのスーパークラスはModuleクラス
Class.superclass #=>Module

module Loggable
end
# Loggableモジュール自身のクラスはModuleクラス
Loggable.class #=>Module
# ModuleクラスのスーパークラスはObjectクラス
Module.class #=> Object

# また、クラス構文やモジュール構文内部ではselfがクラス自身やモジュール自身を指しています。
class User
    p self #=> User
    p self.class #=> Class
end
module Loggable
    p self #=> Loggable
    p self.class #=> Module
end





# モジュールとインスタンス変数
# モジュール内で定義したメソッドの中でインスタンス変数を読み書きすると、
# include先のクラスのインスタンス変数を読み書きしたことと同じになります。
module NameChangeable
    #include先のクラスのインスタンス変数を変更する
    def change_name
        @name = 'ありす'
    end
end

class User
    include NameChangeable
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

user = User.new('alice')
user.name #=>"alice"

user.change_name
user.name #=>"ありす"

# ただし、上のコードは、モジュールがミックスイン先のクラスでインスタンス変数を
# 直接参照するのは良い設計ではありません。
# なぜなら、インスタンス変数は任意にのタイミングで新しく定義したり、
# 未定義のインスタンス変数を参照したりできてしまうからです。
# 変数名のタイプミスによって意図せずこうした現象を引き起こしてしまうこともあります。
# 一方、メソッドであれば未定義のメソッドを呼び出したときにエラーが発生します。
# なので、ミックスイン先のクラスと連携する場合は、特定のインスタンス変数の存在を前提とするより、
# 特定のメソッドの存在を前提とするほうが安全です。
# 例えば、先ほどのコードは次のようにセッターメソッド経由でデータを変更するようにした方が安全性が高いです。

module NameChangeable
    #セッターメソッド経由でデータを変更する
    #(ミックスイン先のクラスでセッターメソッドが未定義であれば、エラーが発生して実装上の問題に気づける)
    def change_name
        self.name = 'ありす'
    end
end

class User
    include NameChangeable

    # ゲッターメソッドとセッターメソッドを用意する
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

user = User.new('alice')
user.change_name
user.name #=>"ありす"




# クラス以外のオブジェクトにextendする
# モジュールをextendする先はクラスが多いいですが、クラスだけでなく個々のオブジェクトにextendすることができます。
# 以下のコードは文字列オブジェクトの特異メソッドとしてモジュールをextendする例です。
module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
end

s = 'abc'
s.log('hello') #=>NoMethodError

s.extend Loggable
s.log('hello') #=>[LOG] hello


# モジュールを利用した名前空間の作成
# 名前空間を分けて名前の衝突を防ぐ
# 大規模なプログラムや外部に公開するライブラリを作ったりするときはクラス名の重複が問題になることがあります。
# 例えば、ある人が野球の二塁手という意味でSecondクラスを定義したとします。
class Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end

class Second
    def initialize(digits)
        @digits = digits
    end
end

# なんらかの理由でこれの2つのクラスを同時に使う必要が出てきた場合、どうやって区別すればいいでしょうか？
# 二塁手のAliceを作成したいが区別ができない
Second.new('Alice', 13)
# 時計の13秒を作成したいが区別ができない
Second.new(13)

# こんな時に登場するのが名前空間（ネームスペース）としてのモジュールです。
# モジュール構文の中にクラス定義を書くと「そのモジュールに属するクラス」という意味になるため、
# 同名のクラスがあっても外部のモジュール名さえ異なっていれば名前の衝突は発生しなくなります。
module Baseball
    # Baseballモジュールに属するSecondクラス
    class Second
        def initialize(player, uniform_number)
            @player = player
            @uniform_number = uniform_number
        end
    end
end

module Clock
    # Clockモジュールに属するSecondクラス
    class Second
        def initialize(digits)
            @digits = digits
        end
    end
end

# モジュールに属するクラスを参照する際は、モジュール名::クラス名のように::でモジュール名とクラス名を区切ります。
Baseball::Second.new('Alice', 13)
Clock::Second.new(13)

# また、名前空間は名前の衝突を防ぐためだけでなく、クラスのグループ分け/カテゴリ分けをする目的で使われる場合もあります。
# クラスが何十、何百もあるようなプログラムになってくると、カテゴリ別にモジュール（名前空間）を作って整理しないと、
# どれが何のクラスなのかパッと把握しにくくなるためです。
# 以下のコードであればActiveRecordのAssociationsのAliasTrackerクラスというように名前空間が作られています。
module ActiveRecord
    module Associations
        module AliasTracker
        end
    end
end
# このように大規模なプログラムや不特定多数の開発者が利用する外部ライブラリでは、
# モジュールは名前空間を作成する目的でもよく使われています。
# なお、クラスの定義やモジュール定義を保存するファイルパスは、慣習として名前空間をディレクトリ名に、
# クラス名やモジュール名をファイル名にそれぞれ対応させます。
# 慣習としてディレクトリ名やファイル名はスネークケース（アンダースコア区切り）にします。
# 上で紹介したAliasTrackerクラスもactive_record/associations/alias_tracker.rbというファイルパスに保存されています。





# 入れ子なしで名前空間付きのクラスを定義する
# 名前空間として使うモジュールがすでにどこかで定義されている場合は、モジュール構文やクラス構文を入れ子にしなくても
# モジュール名::クラス名のような形でクラスを定義することもできます。

# すでにBaseballモジュールが定義されている
module Baseball
end

# モジュール名::クラス名の形でクラスを定義できる
class Baseball::Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end





# トップレベルの同名クラスを参照する
# ClockモジュールのSecondクラスが、トップレベルのSecondクラスを参照したいというケースを想定します。

# トップレベルのSecondクラス
class Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end

module Clock
    # ClockモジュールのSecondクラス
    class Second
        def initialize(digits)
            @digits = digits
            # トップレベルのSecondクラスをnewしたい
            @baseball_second = Second.new('Alice', 13)
        end
    end
end
# このままだとコードがClockモジュールの内部にあるため、
# Clock::Secondクラス（つまり自分と同じクラス）を参照していることになります。
# initializeメソッド内のSecond.newの呼び出しに失敗する
Clock::Second.new(13) #=>ArgmentError

# 明示的にトップレベルのクラスやモジュールを指定するためには、クラス名やモジュール名の前に::をつけます。
module Clock
    class Second
        def initialize(digits)
            @digits = digits
            # クラス名の前に::を付けるとトップレベルのクラスを指定したことになる
            @baseball_second = ::Second.new('Alice', 13)
        end
    end
end






# 入れ子の有無によって参照されるクラスが異なるケース
# 名前空間付きでクラスを定義する場合は次の2通りの書き方があります。

# モジュール構文とクラス構文を入れ子にして書く場合
module Baseball
    class Second
        #省略
    end
end

# ::を使ってフラットに書く場合（入れ子なし）
class Baseball::Second
    #省略
end
# 基本的にどちらの書き方でも良いのですが、ほかのクラスを参照する場合は入れ子の有無で
# 挙動が変わるため注意が必要です。たとえば、Baseballモジュール（名前空間）にスコアを記録するための
# Fileクラスがどこかで定義されていたとします。

module Baseball
    class File
        # 省略
    end
end

# このとき、入れ子の有無によって参照されるFileクラスが異なります。
# 次のコードで確かめてみましょう。

module Baseball
    class Second
        def file_with_nesting
            # 入れ子ありのクラス定義でFileクラスを参照する
            puts File
        end
    end
end

class Baseball::Second
    def file_without_nesting
        # 入れこなしのクラス定義でFileクラスを参照する
        puts File
    end
end

second = Baseball::Second.new
second.file_with_nesting #=> Baseball::File
second.file_without_nesting #=> File

# ご覧の通り、入れ子ありの場合は、Baseball::File、なしの場合はFileと表示されました。
# 実はスコアを記録するために作ったFileクラスは前者のBaseball::Fileです。
# 後者のFileはRubyに最初から組み込みライブラリとして用意されているFileクラスです。


# もし、入れこなしのクラス定義で「スコアを記録するためのFileクラス」を参照したい場合は、
# 明示的にBaseball::Fileと書く必要があります。
class Baseball::Second
    def file_without_nesting
        # 入れこなしのクラス定義では明示的に名前空間を付ける必要がある
        puts Baseball::File
    end
end
second = Baseball::Second.new
second.file_without_nesting #=>Baseball::File

# 一方、入れ子ありのクラス定義で「組み込みライブラリのFileクラス」を参照したい場合は、
# クラス名の前に::を付けます。
module Baseball
    class Second
        def file_with_nesting
            puts ::File
        end
    end
end
second = Baseball::Second.new
second.file_with_nesting #=> File





# モジュールに特異メソッドを定義する
# すでに説明したとおり、includeやextendを使うとモジュールのメソッドをインスタンスメソッドや
# クラスメソッドとして追加することができます。しかし、場合によってはわざわざほかのクラスに組み込まなくても
# モジュール単体でそのメソッドを呼び出したい、と思うケースがあります。
# こういう場合はモジュール自身に特異メソッドを定義すれば、直接 モジュール名.メソッド名 という形でメソッドを呼び出すことができます。
module Loggable
    # 特異メソッドとしてメソッドを定義する
    def self.log(text)
        puts "[LOG] #{text}"
    end
end
# ほかのクラスにミックスインしなくてもモジュール単体でそのメソッドを呼び出せる
Loggable.log('Hello') #=>[LOG] Hello

# 上記のような使い方だと、クラスに対して特異メソッド（クラスメソッド）を定義した場合と
# ほとんど同じです。しかし、モジュールはクラスと違ってインスタンスが作れないため、
# newする必要がまったくない単なるメソッド（関数）の集まりを作りたいケースに向いています。
# モジュールでもクラスと同様にclass << selfを使って、特異メソッドを定義することができます。
# 特異メソッドをたくせん定義する場合はメソッド名の前のself.がなくせるぶん、タイプ量を減らすことができます。

module Loggable
    class << self
        def log(text)
            puts "[LOG] #{text}"
        end
        # 以下、ほかの特異メソッドを定義
    end
end
Loggable.log('Hello') #=> [LOG] Hello





# module_functionメソッド
# モジュールではミックスインとして使えて、なおかつモジュールの特異メソッドとしても使える
# 一石二鳥なmodule_functionメソッドを定義することもできます。
module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
    # module_functionは対象のメソッドの定義よりも下で呼び出すこと
    # logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
    module_function :log
end

# モジュールの特異メソッドとしてlogメソッドを呼び出す
Loggable.log('Hello') #=> [LOG] Hello


# Loggableモジュールをincludeしたクラスを定義する
class Product
    include Loggable
    def title
        # includeしたLoggableモジュールのlogメソッドを呼び出す
        log 'title is called'
    end
end
# ミックスインとしてlogメソッドを呼び出す
product = Product.new
product.title #=> [LOG] title is called
# このように、ミックスインとしてもモジュールの特異メソッドとしても使えるメソッドのことを
# モジュール関数と呼びます。
# ちなみに、module_functionでモジュール関数となったメソッドは、自動的にprivateメソッドになります。
product = Product.new
product.log 'Hello' #=> NoMethodErrorになる。logメソッドはprivateなので外部からは呼び出せない

# また、module_functionメソッドを引数なしで呼び出した場合は、
# そこから下に定義されたメソッドがすべてモジュール関数になります。
module Loggable
    # ここから下のメソッドはすべてモジュール関数
    module_function

    def log(text)
        puts "[LOG] #{text}"
    end
end





# モジュールに定数を定義する
# クラスに定数を定義できたように、モジュールにも定数を定義できます。
module Loggable
    PREFIX = '[LOG]'

    def log(text)
        puts "#{PREFIX} #{text}"
    end
end
# 定数を参照する
Loggable :: PREFIX #=> "[LOG]"




# モジュール関数や定数をモジュールの例
# モジュール関数や定数を持つ、代表的なRubyの組み込みライブラリはMathモジュールです。
# Mathモジュールのメソッドはモジュール関数になっているため、モジュールの特異メソッドとしても、
# ミックスインとしても利用することができます。

# モジュールの特異メソッドとしてsqrt(平方根)メソッドを利用する
Math.sqrt(2) #=>1.41421.....

class Calculator
    include Math

    def calc_sqrt(n)
        # ミックスインとしてMathモジュールのsqrtメソッドを使う
        sqrt(n)
    end
end
calculator = Calculator.new
calculator.calc_sqrt(2) #=> #=>1.41421.....





# 状態を保持するモジュールの作成

# AwesomeApiはなんらかのWeb APIを利用するライブラリという想定
module AwesomeApi
    # 設定値を保持するクラスインスタンス変数を用意する
    @base_url = ''
    @debug_mode = false

    # クラスインスタンス変数を読み書きするための特異メソッドを定義する
    class << self
        def base_url=(value)
            @base_url = value
        end

        def base_url
            @base_url
        end

        def debug_mode=(value)
            @debug_mode = value
        end

        def debug_mode
            @debug_mode
        end
    end
end
# 設定値を保存する
AwesomeApi.base_url = 'https://example.com'
AwesomeApi.debug_mode = true
# 設定値を参照する
AwesomeApi.base_url #=> 'https://example.com'
AwesomeApi.debug_mode #=> true


# 上ではわかりやすくするために明示的にメソッドを定義したが、本来は以下の1行で済む
# 以下のように書くことで、base_urlとdebug_modeのゲッターとセッターが自動的に定義されます。
class << self
    attr_accessor :base_url, :debug_mode
end
# これにより、手動でdefを使ってメソッドを定義する必要がなくなりますが、内部的には同じ動作をします。






# メソッド探索ルールを理解する
# Rubyでは様々な方法でメソッドを定義することができます。
# そのため、Fooクラスのbarメソッドが定義されているのは絶対にここ、と言い切ることは困難です。
# たとえば、to_sというメソッド1つを呼び出すにしても、
# ・そのクラス自身にto_sメソッドが定義されている場合
# ・そのスーパークラスにto_sメソッドが定義されている場合
# ・ミックスインとしてto_sメソッドが定義(include)されている場合
# と、実に様々です。
# そんなとき、Rubyはどのようにして呼び出すメソッドを決定するのでしょうか？

# 例えば以下のようなモジュールやクラスがあったとします。
module A
    def to_s
        "<A> #{super}"
    end
end

module B
    def to_s
        "<B> #{super}"
    end
end

class Product
    def to_s
        "<Product> #{super}"
    end
end

class DVD < Product
    include A
    include B

    def to_s
        "<DVD> #{super}"
    end
end

dvd = DVD.new
dvd.to_s #=>"<DVD> <B> <A> <Product> #<DVD:0x00000012e1b6708"
# この出力結果を見ると、次のような順番でto_sメソッドが呼び出されたことがわかります。
#  ・DVDクラス自身のto_sメソッド(<DVD>)
#  ・2番目にincludeしたモジュールBのto_sメソッド(<B>)
#  ・最初にincludeしたモジュールAのto_sメソッド(<A>)
#  ・スーパークラスであるProductクラスのto_sメソッド(<Product>)
#  ・ProductクラスのスーパークラスであるObjectクラスのto_sメソッド(#<DVD:0x00000012e1b6708")

# 呼び出し順のルールは暗記しなくても良いです。
# ancestorsメソッドを呼び出せば、クラスやモジュールがどの順番でメソッド探索されるか確認できます。
DVD.ancestors #=>[DVD, B, A, Product, Object, Kernel, BasicObject]
# ancestorsメソッドは最後はBasicObjectクラスを探索します。もし、最後のBasicObjectクラスでも
# メソッドが見つからなければNoMethodErrorが発生します。






# モジュールのほかにもモジュールをincludeする
# includeはクラスだけでなく、モジュールに対しても呼び出すことができます。
module Greetable
    def hello
        'hello'
    end
end

module Aisatu
    include Greetable

    def konnichiwa
        'こんにちは'
    end
end

class User
    include Aisatu
end
user = User.new
user.konnichiwa #=>こんにちは
user.hello #=>hello
# Userクラスに対してancestorsメソッドを呼び出してみると、Aisatuモジュールだけでなく、
# Greetableモジュールもメソッド探索の対象になっていることがわかります。
User.ancestors #=>[User, Aisatu, Greetable, Object, Kernel, BasicObject]




# prependでモジュールをミックスインする
# モジュールで定義されたメソッドをインスタンスメソッドとしてミックスインする場合はincludeを
# 使うのが一般的です。もう一つの方法としてprependという方法でモジュールをミックスインすることもできます。
# prependの特徴は同名のメソッドがあったときに、ミックスインしたクラスよりも先にモジュールのメソッドが呼ばれるところです。
module A
    def to_s
        "<A> #{super}"
    end
end

class Product
    prepend A

    def to_s
        "<Product> #{super}"
    end
end

product = Product.new
product.to_s #=> "<A> <Product>"

# prependを使った場合、モジュールのメソッドがクラスのメソッドよりも先に呼ばれます。
# この例では、まずモジュールAのto_sメソッドが実行され、
# その中でsuperが呼ばれることでクラスProductのto_sメソッドが次に実行されます。
# しかし、Productクラス内でもsuperが呼ばれているため、さらに上のクラスであるObjectのto_sが呼ばれます。
# この結果、出力は"<A> <Product>"となります。






# prependで既存のメソッドを置き換える

# このコードは外部ライブラリで定義されているため、直接コードを書き換えることはできないものとします。
class Product
    def name
        'A great file'
    end
end
product = Product.new
product.name #=> "A great file"

# 上のクラスのnameメソッドを拡張して、"<<A great film>>"のような装飾が入るようにしてみましょう。

module NameDecorator
    def name
        # prependするとsuperはミックスインした先のクラスのnameメソッドが呼び出される
        "<<#{super}>>"
    end
end
# このモジュールをProductクラスにprependします。
class Product
    prepend NameDecorator
end
# こうすれば、Productクラスのnameメソッドを直接書き換えることなく、
# なおかつ元の実装を活かしながら振る舞いを変更することができます。
product = Product.new
product.name #=> <<A great file>>


# また、この方法であれば、ほかのクラスに対しても簡単に同じ変更を適用することができます。
# nameメソッドを持つクラスがあったとします。
class User
    def name
        'Alice'
    end
end
class User
    prepend NameDecorator
end
user = User.new
user.name #=> "<<Alice>>"






# 有効範囲を限定できるrefinements
# オープンクラスやモンキーパッチで説明したとおり、Rubyは標準ライブラリや外部ライブラリ(gem)であっても
# あとからオーバーライドしたり、独自のメソッドを追加したりできます。
# とはいえ、広範囲に使われるクラスを独自に変更すると、予期せぬ不具合に遭遇するリスクが高まります。
# refinementsを使うと独自の変更の有効範囲(スコープ)を限定することができます。

# ここでは例として、refinementsを使ってStringクラスに文字列の中身をランダムに入れ替えるshffuleメソッドを
# 追加してみます。まず、refinementsを使う準備としてモジュールを作成します。モジュール内では
# refineメソッドを使ってrefinementsを適用するクラスを指定し、そのブロックの中に今回追加する
# shuffleメソッドの定義を書きます。
module StringShuffle
    # refinementsが目的なので、refineメソッドを使う
    refine String do
        def shuffle
            chars.shuffle.join
        end
    end
end
# refinementsを有効にするためにはusingというメソッドを使います。
# 以下のようにすると、Userクラスの内部においてのみ、shuffleメソッドが有効になります。

class User
    using StringShuffle

    def initialize(name)
        @name = name
    end
    def shuffled_name
        # Userクラスの内部であればStringクラスのshuffleメソッドが有効になる
        @name.shuffle
    end
end
# Userクラス内ではshuffleメソッドが有効になっている
user = User.new
user.shuffled_name #=> "cliAe"

# Userクラスを経由しない場合はshuffleメソッドは使えない
'Alice'.shuffle #=>NoMethodError

# ご覧のとおり、Userクラスの内部だけshuffleメソッドが使えるようになりました。
# このようにrefinementsを使うと既存のクラスに対する変更の有効範囲が限定できるため、
# 予期せぬバグやエラーに遭遇するリスクを低減することができます。




# 二重コロンとドットの違い
module Sample
    class User
        NAME = 'Alice'
        def self.hello(name = NAME)
            "Hello i am #{name}"
        end
    end
end
# Sample::User::NAME #=> "Alice"
# Sample::User.hello #=> "Hello i am Alice"

# # しかし、メソッドを呼び出しに関しては二重コロンを使うことができます。
# Sample::User::hello #=> "Hello i am Alice"





# 例外を捕捉して処理を続行する場合
begin
    # 例外が起きうる処理
rescue
    # 例外が発生した場合の処理
end

# 例外オブジェクトから情報を取得する
# Rubyでは発生した例外自身もオブジェクトになっています。
# そのため例外オブジェクトのメソッドを呼び出すことで、発生した例外に関する情報を取得できます。
# ここでは代表的なメソッドとしてmessageメソッドとbacktraceメソッドを使ってみましょう。
# 例外オブジェクトから情報を取得したい場合は次のような構文を使います。

# begin
#     # 例外が起きうる処理
# rescue => #例外オブジェクトを格納する変数
#     # 例外が発生した場合の処理
# end

# 具体的なコードは以下のとおりです。
begin
    1/0
rescue => e
    puts "エラークラス: #{e.class}"
    puts "エラーメッセージ: #{e.message}"
    puts "バックトレース -----"
    puts e.backtrace
    puts "-----"
end
# 例外オブジェクトを格納する変数の名前は自由に付けることができます。
# exceptionの省略形としてeやexのような名前を見かけます。
# 上のコードではmessageメソッドとbacktraceメソッドをputsメソッドを使って出力しています。





# クラスを指定して捕捉する例外を限定する
# 例外には多くの種類があり、その種類ごとにクラスが異なります。たとえば存在しないメソッドを呼び出した場合は
# NoMethodErrorクラスの例外が発生し、0で除算した場合はZeroDivisionErrorが発生します。
# 次のような構文を使って例外のクラスを指定すると、例外オブジェクトのクラスが一致した場合のみ、例外を捕捉できます。
begin
    # 例外が起きうる処理
rescue # 補足したい例外クラス
    # 例外が発生した場合の処理
end

# 具体的なコードは以下のとおりです。
begin
    1 /0
rescue ZeroDivisionError
    puts "0で除算しました"
end
#=> 0で除算しました

# 上のコードはZeroDivisionErrorが発生した場合のみrescue節のコードが実行され、
# プログラムを続行することができます。
# ZeroDivisionError以外のエラーが発生した場合、例外は補足されませんのでプログラムが異常終了します。
# なので、rescue節を複数書くことで、異なる例外クラスに対応することもできます。
begin
    'abc'.foo
rescue ZeroDivisionError
    puts "0で除算しました"
rescue NoMethodError
    puts "存在しないメソッドが呼び出されました"
end
#=> 存在しないメソッドが呼び出されました


# 1つのrescue節に複数の例外クラスを指定することもできます。
begin
    'abc'.foo
rescue ZeroDivisionError,NoMethodError
    puts '0で除算したか、存在しないメソッドが呼び出されました'
end
#=> 0で除算したか、存在しないメソッドが呼び出されました

# 次のように例外オブジェクトを変数に格納することも可能です。
begin
    'abc'.foo
rescue ZeroDivisionError,NoMethodError => e
    puts "0で除算したか、存在しないメソッドが呼び出されました"
    puts "エラー: #{e.class} #{e.message}"
end
#=> 0で除算したか、存在しないメソッドが呼び出されました
#   エラー: NoMethodError undifined method `foo` for "abc":String




# rescue節に何もクラスを指定しなかった場合に捕捉されるのはStandardErrorとそのサブクラスです。
# NoMemoryErrorやSystemExitなど、StandardErrorを継承していない例外クラスは捕捉されません。
begin
    # 例外が起きそうな処理
rescue
    # StandardErrorとそのサブクラスのみ捕捉される
end

# resuce節に例外クラスを指定した場合、捕捉されるのはそのクラス自身とそのサブクラスになります。
# たとえば次のようにExceptionクラスを指定すると、StandardErrorと無関係のエラーまで捕捉することになります。

# 例外処理の悪い例
begin
    # 例外が起きそうな処理
rescue Exception
    # Exceptionとそのサブクラスが捕捉される。つまりNoMethodErrorやSystemExitまで捕捉される
end
# しかし、通常のプログラムで捕捉するのはStandardErrorクラスか、そのサブクラスに限定すべきです。
# 何か特別な理由がない限りrescue節にExceptionクラスやStandardErrorと無関係な例外クラスを
# 指定することは避けましょう。






# 継承関係とrescue節の順番に注意する
# rescue節が複数ある場合は、上から順番に発生した例外クラスがrescue節のクラスにマッチするかどうかチェックされます。
# 先ほどの説明したとおり、rescue節に例外クラスを指定すると、そのクラス自身とそのサブクラスが捕捉の対象になります。
# そのため、例外クラスの継承関係とrescue節を書く順番に注意しないと永遠に実行されないrescue節を作ることになってしまいます。

# 間違った例外処理の例
begin
    'abc'.foo
rescue NameError
    # NoMethodErrorはここで捕捉される
    puts 'NameErrorです'
rescue NoMethodError
    # このrescue節は永遠に実行されない
    puts 'NoMethodErrorです'
end
#=> NameErrorです

# 2つ目のrescue節が実行されない理由:
# NameErrorはNoMethodErrorのスーパークラスなので、NameErrorクラスを指定した最初のrescue節で捕捉されます。
# そのため、どんなことがあっても2つめのrescue節に到達することはないわけです。
# NameErrorとNoMethodErrorの継承関係: Exception ← StandardError ← NameError ← NoMethodError

# この問題を解決するには、スーパークラスよりもサブクラスを手前に持ってくるようにすればよいです。
begin
    'abc'.foo
rescue NoMethodError
    puts 'NoMethodErrorです'
rescue NameError
    puts 'NameErrorです'
end
# =>NoMethodErrorです

# こうするとNameErrorのrescue節よりも先にNoMethodErrorのrescue節が評価されるため、
# NoMethodError用の例外処理を実行することができます。
# もちろん,NameErrorが発生した場合はNameError用の例外処理を実行することができます。
begin
    'abc'.foo
rescue NoMethodError
    puts 'NoMethodErrorです'
rescue NameError
    puts 'NameErrorです'
end
# =>NameErrorです

# なお、次のように最後にStandardErrorクラスを指定すれば、通常のプログラミングで発生するその他のエラーを
# まとめて捕捉することができます（最後に指定するのはもちろん、StandardErrorがNoMethodErrorやNameErrorの
# スーパークラスだからです）。
begin
    'abc'.foo
rescue NoMethodError
    puts 'NoMethodErrorです'
rescue NameError
    puts 'NameErrorです'
rescue StandardError
    puts 'その他のエラーです'
end





# 例外発生時にもう一度処理をやりなおすretry
# rescue節でretry文を実行すると、begin節の最初からやりなおすことができます。
begin
    # 例外が発生するかもしれない処理
rescue
    retry # 処理をやりなおす
end
# ただし、無条件にretryし続けると、例外が解決しない場合に無限ループを作ってしまう恐れがあります。
# そういう場合はカウンタ変数を用意して、retryの回数を制限するのが良いでしょう。

retry_count = 0
begin
    puts '処理を開始します'
    1 / 0 # ゼロ除算エラーをわざと発生させる
rescue
    retry_count += 1
    if retry_count <= 3
        puts "retryします。#{retry_count}回目"
        retry
    else
        puts 'retryに失敗しました'
    end
end
# 処理を開始します
# retryします。1回目
# 処理を開始します
# retryします。2回目
# 処理を開始します
# retryします。3回目
# 処理を開始します
# retryに失敗しました




# 意図的に例外を発生させる
# 例外を発生させる場合はraiseメソッドを使います。
def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        raise "無効な国名です。#{country}"
    end
end
currency_of(:japan) #=> "yen"
currency_of(:italy) #=> "無効な国名です。italy(RuntimeError)"
# raiseメソッドに文字列を渡すと、その文字列がエラーメッセージになります。




# 例外処理のベストプラクティス
# 安易にrescueを使わない
# すべての例外をrescueすべきかというとそうではありません。むしろ、rescueすべき例外のほうが少ないです。
# 安易にrescueして続行してしまうと処理中のデータの構造が崩れたりして、余計にややこしい別の問題を引き起こす恐れがあります。
# 異常事態が発生したのであればプログラムの実行を即座に中止し(つまりrescueしない)、例外の原因を調査してください。
# Railsのフレームワークでは、例外発生時の共通処理が最初から組み込まれています。
# 具体的にエラーメッセージやバックトレースをログに書き込み、ユーザに対してエラーの発生を画面上に通知してくれます。
# 自分でrescueしなくても、フレームワークに例外処理をゆだねることができます。
# 例外が発生したら即座に異常終了させるもしくはフレームワークの共通処理に丸投げする考えるほうが安全です。





# resuceしたら情報を残す
# 原因調査ができるように、例外時の状況を確実に記録に残しましょう。
# 最低でも発生したクラス名、エラーメッセージ、バックトレースの3つはログやターミナルに出力すべきです。
# これらの情報はfull_messageメソッドを使うと一度に取り出せます。
# 例外発生時の情報を残す架空のコード例を以下に示します。

# 大量のユーザにメールを送信する(例外が起きても最後まで続行する)
users.each do |i|
    begin
        # メール送信を実行する
        send_mail_to(i)
    rescue => e
        # 例外のクラス名、エラーメッセージ、バックトレースをターミナルに出力
        puts e.full_message
    end
end
# 例外をrescueしたらその場で情報を残さないと詳細な情報が失われてしまいますので、確実に残しておきましょう。




# 例外処理も条件分岐を使う
# 例外の発生がある程度予測できる処理であれば、実際に実行する前に問題の有無を確認できる場合があります。
# Date.valid_date?というメソッドで正しい日付かどうか確認することができます。

require 'data'

def convert_reiwa_to_data(reiwa_text)
    m = reiwa_text.match(/令和(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year =m[:jp_year].to_i + 2018
    month = m[:month].to_i
    day = m[:day].to_i

    # 正しい日付の場合のみ、Dateオブジェクトを作成する
    if Date.valid_date?(year, month, day)
        Date.new(year, month, day)
    end
end

convert_reiwa_to_data('令和3年12年31日') #=> #<Date: 2021-12-31>
convert_reiwa_to_data('令和3年99年99日') #=>nil
# begin rescueを使うよりも条件分岐を使ったほうが可読性やパフォーマンスの面で有利です。





# 予期しない条件は異常終了させる
# 想定外のパターンがやってきたときは例外を発生させ、速やかにプログラムの実行を中止するのが良いでしょう。

# elseに入ったら例外を発生させるパターン(良い例)
def currency_of
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else raise ArgmentError, "無効な国名です。#{country}"
    end
end
# 例外が発生する
currency_of(:italy) #=> 無効な国名です。italy (ArgmentError)

# 例外が発生するのでプログラムの実行はそこで止まってしまいますが、エラーメッセージやバックトレースが残るので、
# 原因の調査と対策がしやすくなります。





# 例外処理も手を抜かずにテストする

def some_method
    1 / 0
rescue => e
    # full_messageと書くつもりがfull_mesageと書いてしまった
    puts "ERROR! #{e.full_mesage}"
end
# resuce節で別の例外が起きたために、本来出力されるべき"ERROR!"の文字が出力されない
some_method #=> undefined method `full_mesage`
# このように、resuce節で別の予期せぬ例外が発生すると、肝心な場面で例外処理が「例外的な状況」に対処できなくなります。
# ですので、rescue節のコードもテストを行い、正常に実行できることを検証しましょう。





# 例外処理についてもっと詳しく
# 例外処理を入れた場合、例外が発生してもしなくても実行したい処理が出てくる場合があります。
# そんな場合は例外処理にensure節を加えることで必ず実行される処理を書くことができます。

begin
    # 例外が発生するかもしれない処理
rescue
    # 例外発生時の処理
ensure
    # 例外の有無にかかわらず実行する処理
end

# rescue節は必須ではありません。異常終了しても良いが、終了する前に必ず実行したい処理がある場合は
# 次のようにensure節だけ書くことも可能です。
begin
    # 例外が発生するかもしれない処理
ensure
    # 例外の有無にかかわらず実行する処理
end

# たとえば以下は例外発生の有無にかかわらず、速やかにFileオブジェクトをクローズする場合のコード例です。
# 書き込みコードでファイルを開く
file = File.open('some.txt', 'w')

begin
    # ファイルに文字列を書き込む
    file << 'hello'
ensure
    # 例外の有無にかかわらず必ずファイルをクローズする
    file.close
end





# ensureの代わりにブロックを使う
# Rubyでは自分で例外処理を書かなくても、ブロックを使って同等の処理を実現できる場合があります。
# ファイルの読み書きを行う場合はopenメソッドにブロックを渡すことで、ensure節やクローズ処理を
# 書かずに済ませることができます。

File.open('some.txt', 'w') do |file|
    file << 'hello'
end
# File.open メソッドは、指定したファイルを開き、ブロックを実行します。
# このメソッドは、ファイルを開いた後に指定したブロックを実行し、ブロックが終了すると自動的にファイルを閉じます。
# ブロック内で file << 'hello' を実行すると、some.txt ファイルに文字列 'hello' が書き込まれます。

# もしブロックの実行中に例外が発生した場合もopenメソッドが必ずクローズ処理を実行してくれます。
File.open('some.txt', 'w') do |file|
    file << 'hello'
    # わざと例外を発生させる
    1 / 0
end




# 例外処理のelse
begin
    # 例外が発生するかもしれない処理
rescue
    # 例外が発生した場合の処理
else
    # 例外が発生しなかった場合の処理
ensure
    # 例外の有無にかかわらず実行する処理
end
# else節が使われるケースは多くないので、else節を使わなくても
# begin節に例外が発生しなかった場合の処理を書いてしまえば良いです。
begin
    puts 'hello'
    puts '例外は発生しませんでした'
rescue
    puts '例外が発生しました'
end




# 例外処理と戻り値
# 例外が発生せず、最後まで正常に処理が進んだ場合はbegin節の最後の式が戻り値になります。
# 例外が発生してその例外が捕捉された場合はrescue節の最後の式が戻り値になります。
ret =
    begin
        'OK'
    rescue
        'error'
    ensure
        'ensure'
    end
puts ret #=>"OK"

# 例外が発生した場合
# ret =
#     begin
#         1 / 0
#         'OK'
#     rescue
#         'error'
#     ensure
#         'ensure'
#     end
# puts ret #=>"error"

# 上の例では例外処理の戻り値を変数に格納しましたが、次のようにメソッドの戻り値として使うこともできます。
# def hoge(n)
#     begin
#         1 / n
#         'OK'
#     rescue
#         'error'
#     ensure
#         'ensure'
#     end
# end
# hoge(1) #=> "OK"
# hoge(0) #=> "error"





# begin/endを省略するrescue修飾子

# rescueは修飾子としても使うこともできます。
# 例外が発生しそうな処理 rescue 例外が発生したときの戻り値

# 例外が発生しない場合
1 / 1 rescue 0 #=> 1
# 例外が発生する場合
1 / 0 rescue 0 #=> 0

# Dateクラスを使い、引数として渡された文字列をパースしてDateクラスのオブジェクトに変換するメソッドです。
# パース不可能な文字列が渡されて例外が発生した場合はnilを返します。
# (パースは特定の書式に従った文字列を解析し、プログラムで利用可能な別のデータ構造に変換すること)
def to_date(string)
    Date.parse(string) rescue nil
end
# ご覧の通り、beginとrescueを省略できるぶん、メソッドを短く書くことができました。




# 例外処理のbegin/endを省略できるケース
def fizz_buzz(n)
    begin
        if n % 15 == 0
            'fizzbuzz'
        elsif n % 3 == 0
            'fizz'
        elsif n % 5 == 0
            'buzz'
        else
            n.to_s
        end
    rescue => e
        puts "#{e.class} #{e.message}"
    end
end
fizz_buzz(nil) #=>NoMethodError undefined method '%' for nil:NilClass

# 省略した場合の書き方
def fizz_buzz(n)
    if n % 15 == 0
        'fizzbuzz'
    elsif n % 3 == 0
        'fizz'
    elsif n % 5 == 0
        'buzz'
    else
        n.to_s
    end
rescue => e
    puts "#{e.class} #{e.message}"
end

fizz_buzz(nil) #=>NoMethodError undefined method '%' for nil:NilClass
# こうすると行数とインデントを減らすことができるので、コードが少しスッキリします。

# また、beginとendの省略はdo/endブロックの内部でも有効です。
users.each do |user|
    begin
        send_mail_to(user)
    rescue => e
        puts e.full_mesage
    end
end
# beginとendを省略した場合
users.each do |user|
    send_mail_to(user)
rescue => e
    puts e.full_mesage
end

# ただし、do/endではなく{}を使った場合はbeginとendの省略はできないので注意
users.each {
    begin
        send_mail_to(user)
    rescue => e
        puts e.full_mesage
    end
}







# rescueした例外を再度発生させる
# rescue節の中でraiseメソッドを使うこともできる。このときraiseメソッドの引数を省略すると
# rescue節で捕捉した例外をもう一度発生させることができます。
def fizz_buzz(n)
    if n % 15 == 0
        'fizzbuzz'
    elsif n % 3 == 0
        'fizz'
    elsif n % 5 == 0
        'buzz'
    else
        n.to_s
    end
rescue => e
    # 発生した例外をログやメールで残す(ここではputsで代用)
    puts "[LOG]エラーが発生しました: #{e.class} #{e.message}"
    raise
end
fizz_buzz(nil) #=>[LOG]エラーが発生しました: NoMethodError undefined method '%' for nil:NilClass






# ブロックを利用するメソッドの定義とyield
# yieldを使ってブロックの処理を呼び出す

# まず普通にメソッドを実行すると以下のとおりです。
def greet
    puts 'おはよう'
    puts 'こんばんは'
end
greet
#=> おはよう
#   こんばんは

# メソッドの呼び出しに適当なブロックを付けてみます
greet do
    puts 'こんにちは'
end
#=> おはよう
#   こんばんは

# 出力結果は変わることはありません。渡されたブロックを実行するためには
# メソッド内でyieldを使います。

def greet
    puts 'おはよう'
    yield
    puts 'こんばんは'
end
# こうするとメソッド呼び出し時に紐づいたブロックが実行されるようになります。
greet do
    puts 'こんにちは'
end
#=> おはよう
#   こんにちは
#   こんばんは

# また、ブロックを付けずに呼び出すとエラーになります。
greet
#=> おはよう
# no block given(yield)(LocalJumpError)


# ブロックが渡されたかどうか確認する場合はblock_given?メソッドを使います。
# このメソッドはブロックが渡されている場合trueを返します。
def greet
    puts 'おはよう'
    # ブロックの有無を確認してからyieldを呼び出す
    if block_given?
        yield
    end
    puts 'こんばんは'
end

greet
#=> おはよう
#   こんばんは

greet do
    puts 'こんにちは'
end
#=> おはよう
#   こんにちは
#   こんばんは





# yieldはブロックに引数を渡したりブロックの戻り値を受け取ったりできます。
def greet
    puts 'おはよう'
    text = yield 'こんにちは'
    puts text
    puts 'こんばんは'
end

greet do |text|
    text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

# なお、yieldとブロックでやりとりする引数は個数の過不足に寛容です。
def greet
    puts 'おはよう'
    # 2つの引数をブロックに渡す
    text = yield 'こんにちは', 12345
    puts text
    puts 'こんばんは'
end

greet do |text|
    # ブロックパラメータが1つであれば、2つめの引数は無視される
    text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは


def greet
    puts 'おはよう'
    # 2つの引数をブロックに渡す
    text = yield 'こんにちは'
    puts text
    puts 'こんばんは'
end
greet do |text, other|
    # ブロックパラメータが2つであれば、2つめの引数はnilになる
    text * 2 + other.inspect
end
#=> おはよう
#   こんにちはこんにちはnil
#   こんばんは





# ブロックを引数として明示的に受け取る

# ブロックをメソッドの引数として明示的に受け取ることもできます。ブロックを引数として受け取る場合は、
# 引数の前に&を付けます。また、そのブロックを実行する場合はcallメソッドを使います。
# ブロックをメソッドの引数として受け取る
def メソッド(&引数)
    引数.call
end

# 以下はyieldではなくメソッドの引数として受け取ったブロックをcallメソッドで実行する例です。
def greet(&block)
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end
greet do |text|
    text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

# 引数名はblockとしていますが自由に付けることができます。
# ただし、ブロックの引数はメソッド定義につき1つしか指定できません。

# ちなみに、ブロックを引数として受け取る場合でもyieldやblock_given?メソッドは使用可能です。
def greet(&block)
    puts 'おはよう'
    # 引数のblockを使わずにblock_given?やyieldを使っても良い。
    if block_given?
        text = yield 'こんにちは'
        puts text
    end
    puts 'こんばんは'
end

# ブロックを引数にするメリットの1つはブロックをほかのメソッド引数に渡せるようになることです。
# 以下は日本語版と英語版のgreetメソッドを用意する例です。
# greet_jaメソッドやgreet_enメソッドは引数として受け取ったブロックを実行することなく、
# 共通処理を定義したgreet_commonメソッドにブロックを引き渡しています。
def greet_ja(&block)
    texts = ['おはよう', 'こんにちは', 'こんばんは']
    greet_common(texts, &block) # ブロックを別のメソッドに引き渡す
end

def greet_en(&block)
    texts = ['good morning', 'hello', 'good evening']
    greet_common(texts, &block) # ブロックを別のメソッドに引き渡す
end

# 出力処理用の共通メソッド
def greet_common(texts, &block) #ほかのメソッドにブロックを引き渡す場合は、引数の手前にも&を付けること。
    puts texts[0]
    # ブロックを実行する
    puts block.call(texts[1])
    puts texts[2]
end

# 日本語版のgreetメソッドを呼び出す
greet_ja do |text|
    text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは


# 英語版のgreetメソッドを呼び出す
greet_en do |text|
    text.upcase
end
#=> good morning
#   hellohello
#   good evening




# ブロックを引数にするメリットの2つ目は、渡されたブロックに対してメソッドを呼び出し、
# 必要な情報を取得したり、ブロックに対する何かしらの操作を実行したりできるようになることです。
# たとえばarityメソッドを使うとブロックパラメータの個数を確認することができます。
# 以下はブロックパラメータの個数に応じて、yieldで渡す引数の個数と内容を変えるコード例です。
def greet(&block)
    puts 'おはよう'
    text =
        if block.arity == 1
            yield 'こんにちは' #ブロックパラメータが1個の場合
        elsif block.arity == 2
            yield 'こんに','ちは' #ブロックパラメータが2個の場合
        end
    puts text
    puts 'こんばんは'
    end
end

# 1個のブロックパラメータでメソッドを呼び出す
greet do |text|
    text * 2
end
#=> おはよう
#   こんにちはこんにちは
#   こんばんは


# 2個のブロックパラメータでメソッドを呼び出す
greet do |text_1, text_2|
    text * 2
end
#=> おはよう
#   こんにこんにちはちは
#   こんばんは





# Procオブジェクト

# Procクラスはブロックをオブジェクト化するためのクラスです。
# たとえば、Stringクラスであれば文字列を、Integerクラスであれば整数を表しますが、
# Procクラスはブロック、つまり何かの処理(何らかの手続き)を表します。
# Procクラスのインスタンスを作成する場合は、次のようにProc.newにブロックを渡します。

# "Hello"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new do
    'Hello'
end
# do endの代わりに{}を使ってもよい
hello_proc = Proc.new { 'Hello' }


# Procオブジェクトを実行したい場合はcallメソッドを使います。
hello_proc = Proc.new { 'Hello' }
hello_proc.call #=>"Hello"


# 実行時に引数を利用するProcオブジェクトも定義できます。
# 以下は2つの引数を受け取って、加算するProcオブジェクトです。
add_proc = Proc.new { |a, b| a + b }
add_proc.call(10, 20) #=> 30


# 次のように引数にデフォルト値を付けることもできます
add_proc = Proc.new{ |a = 0, b = 0| a + b }
add_proc.call #=> 0
add_proc.call(10) #=> 10
add_proc.call(10, 20) #=> 30


# Procオブジェクトを作成する場合は、Proc.newだけでなく、Kernelモジュールのprocメソッドを
# 使うこともできます。どちらを使っても構いません。
# Proc.newメソッドの代わりにprocメソッドを使う
add_proc = proc { |a, b| a + b }




# Procオブジェクトをブロックの代わりに渡す
def greet(&block)
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end
# 上のコードに出てきた引数のblockはgreetメソッドを実行した際に紐づけられるブロックです。
# つまり「引数のblockはProcオブジェクトである」と言うこともできます。
# 次のようにすれば引数のblockが何クラスのインスタンスなのかがわかります。
def greet(&block)
    puts block.class
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end

greet do |text|
    text * 2
end
#=> Proc
#   おはよう
#   こんにちはこんにちは
#   こんばんは

# ところでarityメソッドを使えば、ブロックパラメータの個数がわかります。
# このarityメソッドは実はProcクラスのインスタンスメソッドです。
# つまり、arityメソッドが呼び出せるのは、メソッド呼び出し時に使ったブロックが
# Procオブジェクトになっているからということになります。
# この考えを発展させると、ブロックの代わりにProcオブジェクトをメソッドの引数として渡す
# というテクニックが使えます。
# たとえば以下は直接ブロックを渡さずに、あらかじめ作成したProcオブジェクトをgreetメソッドに渡しています。
def greet(&block)
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end

# Procオブジェクトを作成し、それをブロックの代わりとしてgreetメソッドに渡す
repeat_proc = Proc.new { |text| text * 2 }
greet(&repeat_proc)
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

# Procオブジェクトをブロックの代わりに渡す際は&repeat_procのように、手前に&がついている点に注意。
# &がないとブロックではなく、普通の引数が渡されたと見なされます。





# Procオブジェクトを普通の引数として渡す

# ブロックではなく1個のProcオブジェクトを引数として受け取る(&を付けない)
def greet(arrange_proc)
    puts 'おはよう'
    text = arrange_proc.call('こんにちは')
    puts text
    puts 'こんばんは'
end
# Procオブジェクトを普通の引数としてgreetメソッドに渡す(&を付けない)
repeat_proc = Proc.new { |text| text * 2 }
greet(repeat_proc)
#=> おはよう
#   こんにちはこんにちは
#   こんばんは

# 上のコードではブロックが登場しないので、メソッド定義の引数やメソッド呼び出しで&が使われていない点に注意。

# メソッドが受け取れるブロックの数は最大1つですが、Procオブジェクトは文字列や数値と同じ「ただのオブジェクト」
# なので、引数として渡すぶんには制限はありません。次のようにすれば3つのProcオブジェクトを引数として渡すこともできます。

# 3種類のProcオブジェクトを受け取り、それぞれのあいさつを文字列に適用するgreetメソッド
def greet(proc_1, proc_2, proc_3)
    puts proc_1.call('おはよう')
    puts proc_2.call('こんにちは')
    puts proc_3.call('こんばんは')
end
# greetメソッドに渡すProcオブジェクトを用意する
shuffle_proc = Proc.new  { |text| text.chars.shuffle.join }
repeat_proc = Proc.new  { |text| text * 2 }
question_proc = Proc.new  { |text| "#{text}?" }

greet(shuffle_proc, repeat_proc, question_proc)
#=> はおうよ
#   こんにちはこんにちは
#   こんばんは?




# Proc.newとラムダの違い

# Procオブジェクトを作る方法は4つあります。
Proc.new { |a, b| a + b }
proc { |a, b| a + b }
# 上の2つの方法はすでに解説してあります。残りの2つの方法を見てみましょう。

# ->構文またはlambdaメソッドでProcオブジェクトを作成する
->(a, b) { a + b }
lambda { |a, b| a + b }
# いずれも作成されるのはProcクラスのオブジェクトなのですが、最初の2つと
# ->構文またはlambdaメソッドの方法は振る舞いが異なります。

# ->がラムダを作成するための記号です。
# その後ろにくる(a, b)は引数のリストです。{ }は引数を使って実行する処理の内容なります。
# 引数のリストに使っている( )は省略可能です。
-> a, b { a + b }
# 引数がなければ全て省略可能です。
-> { 'Hello' }
# ブロックを作成するときと同様、{ }は改行させて使ってもかまいません。
->(a, b) {
    a + b
}
# また、{ }の代わりに、do endを使うこともできます。
->(a, b) do
    a + b
end
# 引数のデフォルト値を持たせることも可能です。
->(a = 0, b = 0) { a + b }

# Proc.newの方法とラムダはほぼ同じものなのですが、微妙に違いがいくつかあります。
# その中でも一番重要な違いは引数の使い方です。

# Proc.newの作成と実行
add_proc = Proc.new { |a, b| a + b }
add_proc.call(10, 20) #=> 30

# ラムダの作成と実行
add_lambda = ->(a, b) { a + b }
add_lambda.call(10, 20) #=> 30
# しかし、ラムダはProc.newの方法よりも引数のチェックが厳密になります。以下のコード例を見て。

add_proc = Proc.new { |a, b| a.to_i + b.to_i }
# Proc.newは引数が1つまたは3つでも呼び出しが可能
add_proc.call(10) #=> 10
add_proc.call(10, 20, 100) #=> 30

# ラムダの場合
add_lambda = ->(a, b) { a.to_i + b.to_i }
# ラムダは個数について厳格なので、引数が2個ちょうどでなけれなエラーになる
add_lambda.call(10) #=> wrong number of arguments(given 1, expected 2)
add_proc.call(10, 20, 30) #=> wrong number of arguments(given 3, expected 2)





# Proc.newかラムダかを判断するlambda?メソッド
# Proc.newの場合
add_proc = Proc.new { |a, b| a + b }
add_proc.class #=> Proc
add_proc.lambda? #=> false

# ラムダの場合
add_lambda = ->(a, b) { a + b }
add_lambda.class #=> Proc
add_lambda.lambda? #=> true





# Procオブジェクトについてもっと詳しく

# Procオブジェクトを実行するさまざまな方法
# Procオブジェクトを実行する方法はcall以外にもいくつかあります。
add_proc = Proc.new { |a, b| a + b }
# callメソッドを使う
add_proc.call(10, 20) #=> 30
# yieldメソッドを使う
add_proc.yield(10, 20) #=> 30
# .()を使う
add_proc.(10, 20) #=> 30
# []を使う
add_proc[10, 20] #=> 30
# ===を使う
add_proc === [10, 20] #=> 30
# なぜProcオブジェクトが===で呼び出せるようになっているのかというと、
# case文のwhen節でProcオブジェクトを使えるようにするためです。
def judge(age)
    adult = Proc.new { |n| n > 20 } #20より大きければtrueを返すProcオブジェクト
    child = Proc.new { |n| n < 20 } #20より小さければtrueを返すProcオブジェクト

    case age
    when adult
        '大人です'
    when child
        '子供です'
    else
        'はたちです'
    end
end
judge(25) #=> "大人です"
judge(18) #=> "子供です"
judge(20) #=> "はたちです"




# &とto_procメソッド
# Procオブジェクトをブロックとして渡したい場合は引数の前に&を付ける必要があります。
reverse_proc = Proc.new { |s| s.reverse }
['Ruby', 'Java', 'Python'].map(&reverse_proc) #=>["ybuR", "avaJ", "nohtyP"]
# &の役割はProcオブジェクトをブロックとして認識させるだけではありません。
# 厳密には右辺のオブジェクトに対してto_procメソッドを呼び出し、その戻り値として得られたProcオブジェクトを
# ブロックを利用するメソッドに与えます。

# ただし、元からProcオブジェクトだった場合はto_procメソッドを呼んでも自分自身が変えるだけです。
reverse_proc = Proc.new { |s| s.reverse }
other_proc = reverse_proc.to_proc
# Procオブジェクトに対してto_procオブジェクトを呼んでも自分自身が変えるだけ
reverse_proc.equal?(other_proc) #=> true
# しかし、RubyにはProcオブジェクト以外でto_procメソッドを持つものがあります。
# その1つがシンボルです。シンボルを変換してできたProcオブジェクトが変わっている点は
# 実行時の引数の数によって実行される処理の内容が微妙に変化するところです。
# 例えば次のように:splitというシンボルをto_procでProcオブジェクトに変換します。
split_proc = :split.to_proc
# このProcオブジェクトに引数を1つ渡して実行すると、1つめの引数をレシーバにし、
# そのレシーバに対して元のシンボルと同じ名前のメソッドを呼び出します。

# 引数が1つの場合はホワイトスペースで分割する
split_proc.call('a-b-c-d e') #=> ["a-b-c-d", "e"]
# 引数が2つの場合は指定された文字で分割する
split_proc.call('a-b-c-d e', '-') #=> ["a", "b", "c", "d e"]
# 引数が3つの場合は分割する個数を制限する
split_proc.call('a-b-c-d e', '-', '3') #=> ["a", "b", "c-d e"]





# Procオブジェクトとクロージャ

# メソッドの引数やメソッドのローカル変数は通常、メソッドの実行が終わると参照できなくなります。
# しかし、Procオブジェクトないで引数やローカル変数を参照すると、メソッドの実行が完了してもProcオブジェクトは
# 引き続き引数やローカル変数にアクセスし続けることができます。
# たとえば以下のコードではgenerate_procというProcオブジェクトを生成して返すメソッドを定義しています。

def generate_proc(array)
    counter = 0
    # Procオブジェクトをメソッドの戻り値とする
    Proc.new do
        counter += 10 #ローカル変数のcounterを加算する
        array << counter #メソッド引数のarrayにcounterの値を追加する
    end
end
# 次にメソッドの外部でvaluesという空の配列を用意し、generate_procメソッドに渡して戻り値の
# Procオブジェクトをsample_procという変数で受け取ります。

values =[]
sample_proc = generate_proc(values)

# generate_procメソッドの実行はすでに終わっているのですが、Procオブジェクトの中ではまだメソッド引数の
# array(メソッドに渡した時の変数名はvalues)やローカル変数のcounterは生き続けています。
# そのため、Procオブジェクトを実行するとcounterへの加算やarrayへの値追加が問題なく実行できます。
# 結果として、最初に宣言したvaluesの中身がProcオブジェクトを実行するたびにどんどん変わることになります。

# Procオブジェクトを実行するとgenerate_procメソッドの引数だったvaluesの中身が書き換えられる
sample_proc.call
values #=> [10]

# generate_procメソッド内のローカル変数counterも加算され続ける
sample_proc.call
values #=> [10, 20]

# 一般に、生成時のコンテキスト(変数情報など)を保持している関数をクロージャ(closure,関数閉包)と言います。
# RubyのブロックやProcオブジェクトはクロージャとして振る舞います。





# yieldやProcってどこで使うの？

# Proc(とくにラムダ)をよく使うシーンはActiveRecordのスコープです。
class Guitar < ApplicationRecord
    # 'gold'というスコープを定義
    scope :gold, -> { where(color: 'gold') }
end


# スコープの名前 (:gold):
# scope :gold の部分は、gold というスコープ名を定義しています。
# このスコープ名を使って、Guitar クラスのインスタンスやクエリに対して特定の条件を適用できます。

# Procオブジェクト (-> { where(color: 'gold') }):
# -> { where(color: 'gold') } の部分が第二引数であり、
# これは Procオブジェクト（または lambda）です。

# このProcオブジェクトは、scope メソッドに渡され、スコープが呼び出されたときに実行されます。
# 具体的には、Guitar.gold が呼ばれると、このProcオブジェクト内のコードが実行され、
# color が 'gold' のギターを検索するクエリが発行されます。
guitars = Guitar.gold  # 'gold'のcolorを持つギターを取得する
# Guitar.gold が呼ばれると、-> { where(color: 'gold') } の部分が実行され、
# color が 'gold' のギターをデータベースから取得するためのクエリが作成されます。





# yieldはある典型的な処理があり、その一部だけユースケースに合わせて柔軟に変更したいという要件が
# あるときはyieldを有効活用できそうです。たとえば処理の開始と終了を毎回ログに記録する要件が
# 複数ある場合は、月のようなメソッドを定義することでその処理を共通化することができます。

# 処理の開始時と終了時にログを記録する共通メソッド
def with_logging(name)
    puts "[LOG] START: #{name}"
    ret = yield # ブロック内の処理を実行
    puts "[LOG] END: #{name}"
    ret # ブロックの結果を返す
end

# 上のメソッドを使えばブロック内の処理を実行した際の開始時と終了時にログが記録できます。
# ログ付きで数字の加算を実行する(このブロックが yield で実行され、その結果が answer に格納されます)
answer = with_logging('add numbers') do
    1 + 2
end

# 出力:
# => [LOG] START: add numbers
# => [LOG] END: add numbers
answer #=> 3


# ログ付きでmapメソッドを実行する
numbers = with_logging('Array#map') do
    [1, 2, 3].map { |n| n * 10 }
end
# 出力:
# => [LOG] START: Array#map
# => [LOG] END: Array#map
numbers #=> [10, 20, 30]





# パターンマッチ

records = [
    [2021],
    [2019, 5],
    [2017, 11, 25],
]

# 上のコードではrecords配列の中に年月日を表す配列が格納されていて、要素の数は3パターンに分かれています。
# [2021]のように配列の要素が1つだけの場合はその年の1月1日を、
# [2019, 5]のように2つだけの場合はその年月の1日を、
# [2017, 11, 25]のように3つあった場合はその年月日をDateオブジェクトに変換して新しい配列を返す処理を考えてみます。
# 愚直に考えると以下のようなコードが思いつくかもしれません。

require date,

records.map do |record|
    case record.size
    when 1
        Date.new(record[0], 1, 1)
    when 2
        Date.new(record[0], record[1], 1)
    when 3
        Date.new(record[0], record[1], record[3])
    end
end

# 一方パターンマッチを使うと次のように書けます。
records.map do |record|
    case record
    in[y]
        Date.new(y, 1, 1)
    in[y, m]
        Date.new(y, m, 1)
    in[y, m, d]
        Date.new(y, m, d)
    end
end

# パターンマッチは以下のような構文になっています。
# case/inの組み合わせになっている点に注目してください。

# case 式
# in パターン1
#     パターン1にマッチした時の処理
# in パターン2
#     パターン1にマッチせず、パターン2にマッチした時の処理
# else
#     パターン1、2にもマッチしなかったときの処理
# end

# in節に出てくるyやmやdはcase節の式に対応した要素が代入されるローカル変数になります。
# パターンマッチでは代入演算子の=を使わずにin節でローカル変数の宣言と代入が行われる点に注意してください。





# ハッシュをパターンマッチさせる

cars = [
    {name: 'GTR', engine: '280ps'},
    {name: 'Prius', engine: '100ps', motor: '72ps'},
    {name: 'Tesla', motor: '300ps'}
]

# それぞれの車のスペックを自動車の型識別に出力してみましょう。
# まずはパターンマッチを使わない場合です。
cars.each do |car|
    if cars.key?(:engine) && car.key?(:motor)
        puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
    elsif cars.key?(:engine)
        puts "Gasoline: #{car[:name]} / engine: #{car[:engine]}"
    elsif car.key?(:motor)
        puts "EV: #{car[:name]} / motor: #{car[:motor]}"
    end
end
# Gasoline: GTR / engine: 280ps
# Hybrid: Prius / engine: 100ps / motor: 72ps
# EV: Tesla / motor: 300ps

# ここでは愚直にkey?メソッドを使ってキーの有無を確認しながら条件分岐させてみました。
# 次にパターンマッチを使った場合のコード例を見てみましょう。

cars.each do |car|
    case car
    in {name:, engine:, motor:}
        puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    in {name:, engine:}
        puts "Gasoline: #{name} / engine: #{engine}"
    in {name:, motor:}
        puts "EV: #{name} / motor: #{motor}"
    end
end
# Gasoline: GTR / engine: 280ps
# Hybrid: Prius / engine: 100ps / motor: 72ps
# EV: Tesla / motor: 300ps


# in節の{name:, engine:, motor:}や{name:, engine:}はキーは書いてあるものの、値が書いてありません。
# 配列のパターンマッチでは[y]のyのように自動的に代入されるローカル変数がありましたが、ハッシュの
# パターンマッチではそれが見当たりません。
# 実はハッシュのパターンマッチでも、次のように各キーに対応する値を代入するローカル変数を明示的に指定することができます。
cars.each do |car|
    case car
    in {name: name, engine: engine, motor: motor}
        puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    in {name: name, engine: engine}
        puts "Gasoline: #{name} / engine: #{engine}"
    in {name: name, motor: motor}
        puts "EV: #{name} / motor: #{motor}"
    end
end

# in節で値を省略してキーだけ書いた場合は、自動的にキーと同じ名前のローカル変数が作成され、
# そこに値が代入されるようになっています。

cars.each do |car|
    case car
    in {name: , engine: , motor:}
        puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    # 以下省略
    end
end
# すなわち、in {name: , engine:}は:nameと:engineというキーを持つハッシュに、
# in {name: , motor:}は:nameと:motorというキーを持つハッシュにそれぞれマッチします。





# パターンマッチの利用パターン

# valueパターン

# in節に数値や文字列を直接指定できる利用パターンです。
# case節の式とin節の値が等しければ、対応する処理が実行されます。
country = 'italy'

case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
end
#=> "Ciao"

# case文と同様にパターンマッチも値を返すので、結果を変数に代入したり
# メソッドの戻り値にしたりすることができます。
country = 'italy'

message =
    case country
    in 'japan'
        'こんにちは'
    in 'us'
        'hello'
    in 'italy'
        'Ciao'
    end
message #=> "Ciao"

# thenを使って条件にマッチした時の処理を1行で書ける点もcase文と同じです。
case country
in 'japan' then 'こんにちは'
in 'us' then 'hello'
in 'italy' then 'Ciao'
end

# しかし、case文と違う点もあります。それはパターンが1つもマッチしないとエラー(例外)が発生する点です。
# 以下のコード例でcase文とパターンマッチの違いを確認しましょう。

# case文の場合は真になる条件がまったくなくてもエラーにならずnilが返るだけ。
country = 'india'

case country
when 'japan'
    'こんにちは'
when 'us'
    'hello'
when 'italy'
    'Ciao'
end
#=> nil

# パターンマッチではいずれの条件にもマッチしない場合は例外が発生する
case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
end
#=> india(NoMatchingPatternError)

# エラーを発生させたくない場合はelse節を用意すると、どの条件にもマッチしなかった場合の処理が書けます。
country = 'india'

case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
else
    'Unknown'
end
#=> "Unknown"


# 想定しなかった条件が発生したときに意図的に例外をraiseするコードを書く場合は、
# 自動的に例外が発生するパターンマッチを使ったほうがシンプルに書けます。

country = 'india'
# 想定外の条件に備えてelse節で意図的に例外をraiseする
case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
else
    raise "無効な国名です。#{country}"
end
#=> 無効な国名です。india(RuntimeError)

# パターンマッチでは自動的に例外が発生するのでelse節が不要
case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
end
#=> india(NoMatchingPatternError)

# else節の代わりに後述するvariableパターンを利用し、任意のオブジェクトにマッチする
# in節を用意することで例外の発生を防止することもできます。
country = 'india'

case country
in 'japan'
    'こんにちは'
in 'us'
    'hello'
in 'italy'
    'Ciao'
in obj
    "Unknown: #{obj}"
end
#=> "Unknown: india"

# valueパターンでもcase文と同じようにin節の範囲オブジェクトやクラス名を書いても機能します。
value = "abc"

case value
in Integer
    '整数です'
in String # String === "abc"が真なのでここにマッチ
    '文字列です'
end
#=> "文字列です"





# variableパターン
# in節のパターンに変数を書いてローカル変数の宣言と代入を同時に行う利用パターンです。
# たとえば次のようにin objのように書くと、あらゆるオブジェクトがマッチし変数objに代入されます。

# 文字列もマッチ
case 'Alice'
in obj # objは任意の変数名
    "obj=#{obj}"
end
#=> "obj=Alice"

case 'Alice'
in name
    "name=#{name}"  # 'Alice'がnameに代入される
end
#=> "name=Alice"

# 数値もマッチ
case 123
in obj
    "obj=#{obj}"
end
#=> "obj=123"

# 配列もマッチ
case [10, 20]
in obj
    "obj=#{obj}"
end
#=> "obj=[10, 20]"


# このように、in 節に変数を使うことで、パターンマッチの対象となるオブジェクトを直接変数に代入することができ、
# case の中でそのオブジェクトを利用することができます。
# 例えば、値が何であるかに関わらず、変数に代入してその後の処理に使いたい場合に非常に便利です。
data = [123, 'Alice', [10, 20]]

data.each do |item|
    case item
    in obj
        puts "obj=#{obj}"  # objに何でも代入される
    end
end
# 実行結果:
# obj=123
# obj=Alice
# obj=[10, 20]


# 配列に要素を変数に代入することもできます。
record = [2019, 5]

# パターンマッチした値(配列の要素)をin句の変数に代入する。
case record
in [year]
    "#{year}年です"
in [year, month] #recordの要素が2つなのでここにマッチ
    "#{year}年#{month}月です"
in [year, month, day]
    "#{year}年#{month}月#{day}日です"
end
# 実行結果:
"2019年5月です"

# 場合によっては代入ではなく、in節で事前に定義された変数の値を参照したいことがあるかもしれません。
# その場合はピン演算子(^)を使います。
alice = 'Alice'
bob = 'Bob'
name = 'Bob'

case name
in ^alice
    'Aliceこんにちは'
in ^bob #ここにマッチ
    'Bobこんにちは'
end
#=> "Bobこんにちは"


# ピン演算子は事前に定義された変数だけでなくin節で代入された変数を同じin節で参照することもできます。
# 下のコード例は配列の値が3つとも同じだった場合とそれ以外で出力を切り分ける例です。
records = [
    [7, 7, 7],
    [6, 7, 5]
]
records.each do |record|
    case record
    in [n ,^n, ^n] #要素数が3つでなおかつ3つとも同じ値であればマッチ
        puts "all same: #{record}"
    else
        puts "not same: #{record}"
    end
end
#=> all same: [7, 7, 7]
#=> not same: [6, 7, 5]

# ただし、厳密に言うとピン演算子を使ったマッチはvariableパターンではなくvalueパターンとなり、
# マッチには===が利用されます。そのため、次のようなコードを書くこともできます。
records = [
    [Integer, 1, 2],
    [Integer, 3, x]
]

records.each do |record|
    case record
    in [klass, ^klass, ^klass] #最後の2要素が最初の要素のクラスのインスタンスであればマッチ
        puts "match: #{record}"
    else
        puts "not match: #{record}"
    end
end
# match: [Integer, 1, 2]
# not match: [Integer, 3, x]


# なお、in節に指定できる変数はローカル変数のみです。インスタンス変数を使おうとすると構文エラーになります。
case 1
in @n
    "@n=#{@n}"
end
#=> syntax error

# ピン演算子を使う場合もやはり使えるのはローカル変数のみです。
@n = 1
# ピン演算子とインスタンス変数を組み合わせると構文エラーになる
case 1
in ^@n
    '1です'
end
#=> syntax error

# ピン演算子を使いたい場合はいったんローカル変数に入れ直す必要がある
n = @n
case 1
in ^n
    '1です'
end
#=> "1です"

# メソッド呼び出しもピン演算子と組み合わせることはできません。
s = '1'
# ピン演算子とto_iメソッドを組み合わせた場合も構文エラー
case 1
in ^s.to_i
    '1です'
end
#=> syntax error





# arrayパターン

# in節に[]を使って配列の構造パターンを指定できる利用パターンです。
case [1, 2, 3]
in [a, b, c]
    "a=#{a}, b=#{b}, c=#{c}" #配列の要素が3つであればマッチし、なおかつ対応する要素が変数a, b, cに代入される
end
#=> "a=1, b=2, c=3"

# 配列は入れ子になってもかまいません。
case [1, 2, 3]
in [a, [b, c]]
    "a=#{a}, b=#{b}, c=#{c}"
end
#=> "a=1, b=2, c=3"

# 次のように書くと入れ子になった配列を配列のまま1つの変数に代入することもできます。
case [1, [2, 3]]
in [a, b]
    "a=#{a}, b=#{b}" #bには配列[2, 3]が代入される
end
#=> "a=1, b=[2, 3]"

# 変数ではなく、数値や文字列をそのままin節に指定すると「その値と等しいこと」がマッチの条件になります。
case [1, 999, 3]
in [1, n, 3]
    # 配列の要素数は3、かつ最初と最後の要素がそれぞれ1と3であればマッチ
    # 2番目の要素は任意で対応する値が変数nに代入される
    "n=#{n}"
end
#=> "n=999"





# 各要素のマッチ判定には===が使われるため、クラス名(クラスオブジェクト)や範囲オブジェクトをin節に指定して
# 「そのクラスのインスタンスか？」「その範囲に収まる値か？」といった条件を指定することもできます。
case ['Alice', 999, 3]
in [String, 10.., n]
    # 配列の要素数は3、かつ最初の要素は文字列(String型)、かつ2番目の要素が10以上あればマッチ
    # 3番目の要素は任意で対応する値が変数nに代入される
    "n=#{n}"
end
#=> "n=3"

# in節で同じ変数を2回以上使うことはできません。
case [1, 2, 3]
    in[a, a, 3]
        #省略
end
#=> duplicated variable name(SyntaxError)

# 同じ値を同じ変数に代入しようとした場合も同様にエラーになる
case [1, 1, 3]
    in[a, a, 3]
        #省略
end
#=> duplicated variable name(SyntaxError)

# _(アンダースコア1文字)、または_で始まる変数は任意の要素を表現する目的で、
# 例外的に2回以上使うことができます。(この場合は通常の変数として使わないことが前提になります)
case [1, 2, 3]
in [_, _, 3]
    # 要素数が3つで最後の要素が3ならマッチ
    # 最初と2番目の要素は任意(_は変数として使わない)
    'matched'
end
#=> "matched"

# _の代わりに_aを使う(意味は上のコードと同じ)
case [1, 2, 3]
in [_a, _a, 3]
    'matched'
end
#=> "matched"

# in節で*を使うと任意の長さの要素を指定したことになります。
case [1, 2, 3, 4, 5]
in [1, *rest]
    # 最初の要素が1であればマッチ
    # それ以外の要素は任意(0個以上)で、対応する要素が配列として変数restに代入される
    "rest=#{rest}"
end
#=> "rest=[2, 3, 4, 5]"

# *は最後の要素だけでなく最初や途中でも使えます。
case [1, 2, 3, 4, 5]
in [*rest, 5]
    # 最後の要素が5であればマッチ
    # それ以外の要素は任意(0個以上)で、対応する要素が配列として変数restに代入される
    "rest=#{rest}"
end
#=> "rest=[1, 2, 3, 4]"

case [1, 2, 3, 4, 5]
in [1, *rest, 5]
    # 最初と最後の要素がそれぞれ1と5であればマッチ
    # それ以外の要素は任意(0個以上)で、対応する要素が配列として変数restに代入される
    "rest=#{rest}"
end
#=> "rest=[2, 3, 4]"

# *を使いたいが変数には入れなくても良い、という場合は変数名を省略できます。
case [1, 2, 3, 4, 5]
in [1, *]
    # 最初の要素が1であればマッチ
    # 2番目以降の要素は任意だが、変数には入れなくて良い
    'matched'
end
#=> "matched"

# 上のコードは次のように*をなくしてカンマで終わらせても同じ意味になります。
case [1, 2, 3, 4, 5]
in [1, ]
    'matched'
end
#=> "matched"

# ここまでarrayパターンのin節には必ず[]をつけていましたが、一番外側の[]は省略可能です。
case [1, [2, 3]]
in a, [b, c]
    "a=#{a}, b=#{b}, c=#{c}"
end
#=> "a=1, b=2, c=3"





# hashパターン
# in節に{}を使ってハッシュの構造パターンを指定する利用パターンです。
# 値に変数を指定すると、その変数に対応する値が格納されます。
case {name: 'Alice', age: 20}
in {name: name, age: age}
    "name=#{name}, age=#{age}"
end
#=> "name=Alice, age=20"


# 値の変数を省略するとキーと同じ名前の変数に値が代入されます。
case {name: 'Alice', age: 20}
in {name:, age:}
    "name=#{name}, age=#{age}"
end
#=> "name=Alice, age=20"


# キーの順番はマッチの結果には影響しません。
case {name: 'Alice', age: 20}
in {age:, name:}
"name=#{name}, age=#{age}"
end
#=> "name=Alice, age=20"


# 値にはvalueパターンのように、固定の値や===で比較可能な値を指定できます。
case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', age: 18.., gender:}
    # :nameの値がAlice, :ageの値が18以上かつ、キーに:genderが含まれればマッチ
    # :genderに対応する値は変数genderに代入される
    "gender=#{gender}"
end
#=> "gender=female"

# 参考 :name と name: の違い
# :name は シンボル です。Rubyでは、シンボルは主に識別子として使われます。
# シンボル自体には値が含まれているわけではなく、名前（識別子）として扱われます。
# name: はハッシュの キー を示すための構文で、シンボル :name をキーとして使っているという意味です。
# 例
# person = { name: 'Alice' }
# これは、`:name` をキーとして、'Alice' を値に持つハッシュです。


# hashパターンとarrayパターンを混在させることも可能です。
case {name: 'Alice', children: ['Bob']}
in {name:, children: [child]}
# :nameと:childrenのキーを持ち、なおかつ:chidrenの値が要素1個の配列であればマッチ
"name=#{name}, child=#{child}"
end
#=> "name=Alice, child=Bob"


# hashパターンはハッシュの各要素がin節で指定したパターン(キーと値、またはキーのみ)に部分一致すればマッチしたと判定されます。
case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', gender:}
    # in節に:ageを指定していないが、:nameと:genderの条件が部分一致するので全体としてはマッチ
    "gender=#{gender}"
end
#=> "gender=female"


# in節の順番を間違えると意図した動きになりません。
cars = [
    {name: 'The Beatle', engine: '105'},
    {name: 'Prius', engine: '98', motor: '72ps'},
    {name: 'Tesla', motor: '306ps'}
]

cars.each do |car|
    case car
    in {name: ,engine:}
        puts "Gasoline:#{name} / engine:#{engine}" # The BeatleもPriusもどちらもこのパターンにマッチする
    in {name:, motor:}
        puts "EV:#{name} / motor:#{motor}"
    in {name:, engine:, motor:}
        # Priusはガソリン車のパターンに部分一致するので下の処理は絶対に実行されない
        puts "Hybrid:#{name} / engine:#{engine} / motor:#{motor}"
    end
end
# 実行結果:
# Gasoline:The Beatle / engine:105ps
# Gasoline:Prius / engine:98ps
# EV:Tesla / motor:306ps

# ただし、in節に{}を書いた場合は例外的に「空のハッシュに完全一致」することがマッチの条件になります。
case {a: 1}
in {}
    'empty' # {a: 1}は空のハッシュではないのでここにはマッチしない
in {a:}
    "a=#{a}"
end
#=> "a=1"

case {}
in {}
    'empty' # 空のハッシュ同士で完全一致するのでここにマッチする
in {a:}
    "a=#{a}"
end
#=> "empty"




# hashパターンのin節は、key: value形式のパターンしか許容されていません。
# key => value形式を使おうとすると構文エラーが発生します。
# この制約によりhashパターンで使えるハッシュのキーは必然的にシンボルのみになります。
case {name: 'Alice', age: 20}
in {:name => n, :age => a}
#省略
end
#=> syntax error 省略

# メソッド引数の定義と同様に**を使って任意のキーと値を指定することもできます。
case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', **rest}
# :nameがキーで値がAliceならマッチ。それ以外のキーと値は任意で変数restに代入
"rest=#{rest}"
end
#=> "rest={:age=>20, :gender=>:female}"

# arrayパターンの*とは異なり、**が使える位置はパターンの最後だけです。
# 最初や途中で**を使おうとすると構文エラーになります。
# (そもそもhashパターンではキーの順番はマッチの結果に影響しないので**を使う場所を変えても意味がありません)
case {name: 'Alice', age: 20, gender: :female}
in {**rest, gender:}
# 省略
end
#=> syntax error 省略

# 変数として使わない場合は**だけでもかまいません。
# ですが、**をつけなかったときと違いがないので、実際に使うことはほとんどないかもしれません。
case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', **}
    # :nameがキーで値がAliceならマッチ。それ以外のキーと値は任意(変数として使わない)
    # ただし、in {name: 'Alice'}と書いたときと違いがない
    'matched'
end
#=> "matched"



# **nilとして場合は「ほかのキーと値がないこと」を指定してことになります。
# これもメソッド引数の定義と考え方は同じです。
# **nilを使うとhashパターンを部分一致ではなく完全一致でマッチさせることができます。
case {name: 'Alice', age: 20, gender: :female}
in {name: , **}
    # :name以外のキーがないことがマッチの条件になるので、case節のハッシュはマッチしない
end
#=> {name: 'Alice', age: 20, gender: :female} (NoMatchingPatternError)

case {name: 'Alice'}
in {name:, **nil}
    # :name以外のキーがないので、case節のハッシュはマッチする
    "name=#{name}"
end
#=> "name=Alice"

# arrayパターンと同様にin節の一番外側の{}は省略可能です。
case {name: 'Alice', age: 20}
in age:, name:
    "name=#{name}, age=#{age}"
end





# in節に書くのはあくまでのパターン

# in節に書くパターンは一見、単なる配列やハッシュのように見える場合があります。
# これは配列っぽい
# in [1, 2, 3]

# これはハッシュぽい
# in {x: 10, y:20}

# これはあくまで配列やハッシュの記法(リテラル)に似せただけの「パターン」です。
# in節に書くパターンは配列やハッシュそのもではないです。

# パターンとしては有効だが配列リテラルとしては無効(なのでこれは配列ではなくパターン)
# in 1, 2, 3

# パターンとしては有効だがハッシュリテラルとしては無効(なのでこれはハッシュではなくパターン)
# in x:, y:





# asパターン
# asパターンはパターンマッチでマッチしたオブジェクトを変数に代入する利用パターンです。
# たとえば、以下のようなパターンマッチは「:nameが文字列で:ageが18以上のハッシュ」にはマッチしますが、
# このままでは:nameや:ageに対応する値を取得できません。
case {name: 'Alice', age: 20, gender: :female}
in {name: String, age: 18..}
# マッチするが、:nameや:ageの値が取得できない
end

# こんなときはin節のパターンに"=> 変数名"と書くと、マッチしたオブジェクトを変数に代入できます。
case {name: 'Alice', age: 20, gender: :female}
in {name: String => name, age: 18.. => age}
    "name=#{name}, age=#{age}" # => 変数名 の形式でマッチしたオブジェクトを変数に代入できる(asパターン)
end
#=> "name=Alice, age=20"

# 次のように一番外側に"=> 変数名"と書くとマッチしたオブジェクト全体(ここではHashオブジェクト)を取得できます。
case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', age: 18..} => person
    # マッチしたハッシュ全体を変数personに代入できる
    "person=#{person}"
end
#=> "person={:name=>\"Alice"\, :age=>20, :gender=>:female}"




# alternativeパターン
# alternativeパターンは2つ以上のパターンを指定し、どれかに1つにマッチすればマッチしたときとみなす利用パターンです。
# alternativeパターンではパイプ(|)で連結します。たとえば以下はcase値の値が0か1か2であればマッチします。
case 2
in 0 | 1 | 2
    "matched"
end
#=> "matched"

# arrayパターンやhashパターンとalternativeパターン(とasパターン)を組み合わせることも可能です。
case {name: 'Bob', age: 25}
in {name: 'Alice' | 'Bob' => name, age:}
    # nameの値が'Alice'または'Bob'かつ:ageというキーがあればマッチ
    "name=#{name}, age=#{age}"
end
#=> "name=Bob, age=25"


# ただし、alternativeパターンとvariableパターンを組み合わせることはできません。構文エラーになります。

# variableパターンで配列の要素を変数に代入しつつ、
# alternativeパターンとして組み合わせようとすると構文エラーになる
case [2021, 4, 1]
in [y, m, d] | Date
    #省略
end

# 組み合わせられない理由はマッチ成功時に変数の値が未定義(nil)になる可能性があるためです。
# もし以下の書き方を許してしまうと、マッチに成功しても変数aの値が未定義になってしまう。
case 0
in 0 | a
    a
end

# 次のようにパターン全体をasパターンで変数に代入するのはエラーになりません。
case [2021, 4, 1]
in [Integer, Integer, Integer] | Date => obj
    # 整数を3つ含む配列またはDateオブジェクトであればマッチ
    # さらにマッチしたオブジェクト全体が変数objに代入される
    "obj=#{obj}"
end
#=> "obj=[2021, 4, 1]"

# 例外的に_(アンダースコア1文字)そのもの、または_で始まる変数名はalternativeパターンと組み合わせることができます。
# これは以下の例のように、オブジェクトの構造にマッチする目的で使用します。
case [2021, 4, 1]
in [_,_] | [_,_,_] # 配列の要素に2個、または3つならマッチ(要素の値は任意)
    'matched'
end
#=> "matched"







# findパターン

# arrayパターンでは*を使って「任意の要素」をパターンとして指定することができます。
case [1, 2, 3, 4, 5]
in [first, *]
    "first=#{first}"
end
#=> "first=1"

case [1, 2, 3, 4, 5]
in [*, last]
    "last=#{last}"
end
#=> "last=5"


# Ruby3.0では**を2回使って「前と後ろにある任意の要素」をパターンとして表現できます。
# これにより、配列の中から特定のパターンに合致する部分を見つけて抜き出すことができます。これがfindパターンです。
# 以下はfindパターンを使って「10以上の整数が3つ連続する部分」を見つけ出すコード例です。
case [13, 11, 9, 6, 12, 10, 15, 5, 7, 14]
in [*, 10.. => a, 10.. => b, 10.. => c, *]
    # findパターンで配列内で 10以上 の整数が連続して現れる部分は、12, 10, 15 です。
    # この部分がそれぞれ a, b, c に代入されます。
    "a=#{a}, b=#{b}, c=#{c}"
end
#=> "a=12, b=10, c=15"






# パターンマッチについてもっと詳しく

# ガード式
# パターンマッチでは次のような形式でin節に追加の条件式(if文やunless文)を追加できます。
# case 式
# in パターン if(またはunless) 条件式
#     パターンにマッチし、なおかつ条件式が真になった場合に実行する処理
# end

# 以下はパターンにマッチした3つの値が連続した整数になっていることをガード式で判定する例です。
data = [[1, 2, 3],[5, 4, 6]]
data.each do |numbers|
    case numbers
    in [a, b, c] if b = a + 1 && c = b + 1
        puts "matched: #{numbers}"
    else
        puts "not matched: #{numbers}"
    end
end
#出力結果
# matched: [1, 2, 3]
# not matched: [5, 4, 6]

# ただし、findパターンとガード式を組み合わせるときは注意が必要で、
# ガード式を利用しながら再検索を繰り返すことはできません。
# 最初にマッチした部分にたいしてのみガード条件が適用され、その結果をもってパターンマッチの成功/失敗が決まります。

# n, 2パターンでは1, 2にマッチする。ガード条件も真となる(マッチ成功)
case [1, 2, 3, 2, 1]
in [*, n, 2, *] if n == 1
    "matched: #{n}"
else
    'not matched'
end
#=> "matched: 1"

# n, 2パターンは1, 2にマッチするが、ガード条件は偽となる。
# データ上、3, 2にもマッチするが、再検索は行われない(マッチ失敗)
case [1, 2, 3, 2, 1]
in [*, n, 2, *] if n == 3
    "matched: #{n}"
else
    'not matched'
end
#=>"not matched"





# 1行パターンマッチ
# Rubyのパターンマッチではcase節を省略して"評価したい式 in パターン"を1行で書くことができます。
# Ruby3.0の1行パターンマッチではマッチすればtrue,しなければfalseが返ります。
[1, 2, 3] in [Integer, Integer, Integer] #=> ture
[1, 2, 'x'] in [Integer, Integer, Integer] #=> false

# trueまたはfalseを返す1行パターンマッチの特性を活かすと、次のようにif文でパターンマッチを使えます。
person = {name: 'Alice', children: ['Bob']}
if person in {name:, children: [_]}
    # :nameと:childrenをキーに持ち、なおかつ:childrenが要素1つの配列であれば以下の処理を実行する
    "Hello, #{name}"
end
#=> # Hello, Alice

# 次のコード例ではパターンマッチとselectメソッドを組み合わせて、
# 配列の中からキーに:nameと:motorを含むハッシュだけを抽出しています。

cars = [
    {name: 'The Beatle', engine: '105'},
    {name: 'Prius', engine: '98', motor: '72ps'},
    {name: 'Tesla', motor: '306ps'}
]

# selectメソッドを1行パターンマッチを使って、キーに:nameと:motorを含むハッシュだけを抽出する
cars.select do |car|
    car in {name:, motor:}
end
# [
# {:name => "prius", :engine => "98ps", :motor => '72ps'},
# {:name => "Tesla", :motor => '306ps'}
# ]


# 1行パターンマッチはもう1つ、式 => パターンという記法も用意されています。
# この記法はおもにパターンマッチに使った変数代入を利用するために使います。

# =>を使った1行パターンマッチで変数nameとchildにハッシュの値を代入する
{name: 'Alice', children: ['Bob']} => {name:, children: [child]}
name #=> "Alice"
child #=> "Bob"

# この1行パターンマッチ構文を使うと、あたかも左辺の式を右辺の変数に代入しているように見える場合があるため
# 「右代入」と呼ばれることがあります。
123 => n
n * 10 #=> 1230


# 右代入はメソッドチェーンのような長くて複雑な式を変数に代入する際に視線やキャレットを右端から先頭へ
# 戻さずに、そのまま変数を読み書きできるというメリットもあります。
words = 'Ruby is fun'
words.split('').map { |word| words.upcase + '!' * 3 }.join(' ') => loud_voice
loud_voice #=> "RUBY!!! IS!!! FUN!!!"

# words.split(''):
# words の文字列 'Ruby is fun' を1文字ずつ分割します。
# 結果として、['R', 'u', 'b', 'y', ' ', 'i', 's', ' ', 'f', 'u', 'n'] という配列になります。

# map { |word| words.upcase + '!' * 3 }:
# map メソッドで、配列内の各文字（word）に対して処理を行っていますが、実際には words.upcase + '!' * 3 という処理が行われています。
# map メソッドは、配列の各要素に指定したブロック内の処理を実行し、その結果を新しい配列として返します。
# mapメソッド基本例
# arr = [1, 2, 3, 4]
# result = arr.map { |n| n * 2 }
# puts result
# #=> [2, 4, 6, 8]





# 変数のスコープに関する注意点
# Rubyのパターンマッチは独自の変数スコープ(有効範囲)を作りません。
# そのため、すでに同名のローカル変数が存在していると意図せず上書きされる可能性があります。
# また、パターンマッチ内で新たに定義されたローカル変数は、パターンマッチを抜けても使用可能です。

# 先にローカル変数のnameを定義しておく
name = 'Alice'

# パターンマッチを実行する
case {name: 'Bob', age: 25}
in {name:, age:}
    "name=#{name}, age=#{age}"
end
#=> "name=Bob, age=25"

# 変数nameはパターンマッチによって上書きされる
name #=> "Bob"

# パターンマッチを抜けてもパターンマッチ内で代入された変数は使用可能
age #=> 25


# 望ましくないコード例
case {name: 'Bob', age: 25}
in {name:, age: 30.. => age}
    # :ageの条件がマッチしないのでここでは実行されない
else
    # 上のin節で変数の代入が完了しており、ここで変数nameやageが使えてしまうが、
    # 未定義の挙動であるため、こうしたコードは書いてはいけない
    "not matched: name=#{name}, age=#{age}"
end






# 自作クラスをパターンマッチに対応させる
# ここまでarrayパターンやhashパターンでは組み込みライブラリのArrayオブジェクトやHashオブジェクトを
# マッチさせてきましたが、組み込みライブラリだけでなく、自作クラスをパターンマッチに対応させることも可能です。

# 自作クラスをarrayパターンに対応させるためにはdeconstructメソッドを、hashパターンに対応させるためには
# deconstruct_keysメソッドをそれぞれに定義します。deconstructメソッドは自分自身の配列表現を、
# deconstruct_keysメソッドでは自分自身のハッシュ表現をそれぞれ戻り値として返すようにします。
# たとえば、平面座標を表す単純なPointクラスを作り、このクラスをパターンマッチに対応させるために
# deconstructメソッドとdeconstruct_keysメソッドを定義してみます。

class Point
    def initialize(x, y)
        @x = x
        @y = y
    end
    # arrayパターンで呼ばれるメソッド
    def deconstruct
        [@x, @y]
    end

    # hashパターンで呼ばれるメソッド
    def deconstruct_keys(_keys)
        {x: @x, y: @y}
    end

    #実行結果をわかりやすく表示させるためto_sメソッドもオーバーライドしておく
    def to_s
        "x:#{@x}, y:#{@y}"
    end
end

# 次にこのクラスをパターンマッチで使ってみます。
point = Point.new(10, 20)

case point
in [1, 2]
    # ここにはマッチしない
in [10, 20]
    # ここにマッチする
    'matched'
end
#=> "matched"

case point
in {x: 1, y:2}
# ここにはマッチしない
in {x: 10, y:20}
# ここにマッチする
'matched'
end
#=> "matched"


# in節には[1, 2]や{x: ,y:}のような形式でパターンを書いてきましたが、
# クラス名(パターン)またはクラス名[パターン]という形式もあります。
# この記法を使うと、arrayパターンやhashパターンを利用しつつ、マッチさせたいオブジェクトの型を限定することができます。
# たとえば、以下のようなパターンマッチではPointオブジェクトが来ても、Arrayオブジェクト(ただの配列)が来ても、どちらもマッチしてしまいます。

# PointオブジェクトとArrayオブジェクトを混在させた配列を作る
data = [
    Point.new(10, 20),
    [10, 20]
]
data.each do |obj|
    case obj
    in [10, 20]
        # PointもArrayもどちらもマッチする
        puts "obj=#{obj}"
    end
end
#=> obj=x:10, y:20
#   obj=[10, 20]

# これをin Point(10, 20)やin Array(10, 20)に変えると、判定対象となる
# オブジェクトのデータ型を限定することができます。
data.each do |obj|
    case obj
    in Point(10, 20)
        # Pointオブジェクトかつ、配列表現が[10, 20]ならマッチ
        puts "point=#{obj}"
    in Array(10, 20)
        # Arrayオブジェクトかつ、配列表現が[10, 20]ならマッチ
        puts "array=#{obj}"
    end
end
#=> point=x:10, y:20
#   array=[10, 20]

# またhashパターンの場合はPoint(x: 10, y: 20)、もしくはPoint[x: 10, y: 20]と書きます。
point = Point.new(10, 20)
# クラス名(パターン)の形式を使う場合
case point
in Point(x: 10, y: 20)
    'matched'
end
#=> "matched"

# クラス名[パターン]の形式を使う場合
case point
in Point[x: 10, y: 20]
    'matched'
end
#=> "matched"






# deconstruct_keysメソッドの引数として渡されるオブジェクトの中身と利用目的について説明します。
# まず、オブジェクトの中身についてですが、この引数にはhashパターンで参照されるキーの配列が渡されます。
class Point
    def initialize(x, y)
        @x = x
        @y = y
    end

    def deconstruct
        [@x, @y]
    end

    # hashパターンで呼ばれるメソッド
    def deconstruct_keys(keys)
        puts "keys=#{keys.inspect}" # 確認用にkeysの内容を表示する
        {x: @x, y: @y}
    end

    def to_s
        "x:#{@x}, y:#{@y}"
    end
end

point = Point.new(10, 20)
# hashパターンで参照されるキーの配列がdeconstruct_keysメソッドに渡される
point in {x: 10, y: 20} #=> keys=[:x, :y]
point in {x: 10}        #=> keys=[:x]

# ただし、**restや**nilのようなパターンが指定された場合は、すべての要素を返す必要があるため、
# 他のキー指定の有無にかかわらずnilが渡される
point in {x: 10, **rest} #=> keys=nil
point in {x: 10, y: 20, **nil} #=> keys=nil



# ハッシュの要素が大量にあったり、値の取得が重たい処理だったりする場合は、毎回すべての要素を返すより、
# 必要最小限の要素を返すようにしたほうが効率的です。
# そこで、パフォーマンス上の懸念がある場合は引数で渡されるキー情報に応じて返却する要素を取捨選択します。
def deconstruct_keys(keys)
    # 引数のkeysを参照して、必要最小限の要素を返すコード例
    hash = {}
    hash[:x] = @x if keys.nil? || keys.include?(x)
    hash[:y] = @y if keys.nil? || keys.include?(y)
    hash
end
# 解説
# hash = {}:
# 空のハッシュを作成します。このハッシュに、必要なキーと値のペアを条件に応じて追加していきます。

# hash[:x] = @x if keys.nil? || keys.include?(:x):
# keys が nil の場合、または keys に :x が含まれている場合に、@x を hash に追加します。

# hash[:y] = @y if keys.nil? || keys.include?(:y):
# 同様に、keys が nil または keys に :y が含まれている場合、@y を hash に追加します。

# hash:
# 最後に、条件に基づいて要素を追加したハッシュを返します。

# 実際にこのメソッドを使う例を見てみましょう。
# keys が nil の場合

class MyClass
    def initialize(x, y)
        @x = x
        @y = y
    end

    def deconstruct_keys(keys)
        hash = {}
        hash[:x] = @x if keys.nil? || keys.include?(:x)
        hash[:y] = @y if keys.nil? || keys.include?(:y)
        hash
    end
end

obj = MyClass.new(10, 20)

# keysがnilの場合、両方の要素を返す
puts obj.deconstruct_keys(nil) #=> {:x => 10, :y => 20}



# キー情報を使うかどうかは任意です。使わない場合はアンダースコア(_)で始まる引数名にして、
# 「APIの規約上必要だが、実際には使わない引数」であることを示すと良いでしょう。
def deconstruct_keys(_keys)
    {x: @x, y: @y}
end





# よく発生する例外クラスとその原因

# NameError

# 未定義のローカル変数や定数などを呼び出した時に発生します。
# 外部ファイルや外部ライブラリのrequireを忘れている場合にも発生することがあります。

# 出力例
# distanceをdistanseとタイプミスした場合
# undefined local variable or method `distanse` for #<Gate:0x00000001393e85e8 ...> (NameError)

# dataライブラリをrequireせずにDateクラスを使おうとした場合
# uninitialized constant Date (NameError)



# NoMethodError

# 存在しないメソッドや可視性が制限されているため呼び出せないメソッドを呼び出そうとした場合に発生します。
# たとえば以下のような場合です。
# ・単純にメソッド名を打ち間違えた。
# ・privateメソッドをクラスの外部から呼び出そうとした。
# ・レシーバ(メソッドが呼び出されたオブジェクトのこと)の型(クラス)が想定していた型と異なる(文字列ではなくシンボルになっていた場合など)
# ・レシーバが想定に反してnilになっている。

# 特に4つめのレシーバがnilになっているケースは非常によく発生します。

# 出力例
# stamped_atメソッドを間違えてstamped_onと入力した場合
# undefined method `stamped_on` for #<Ticket:0x000000012e...> (NoMethodError)

# 出力例
# privateメソッドのbarをクラスの外部から呼び出そうとした場合
# private method `bar` called for #<Foo:0x000000012e33e1c0> (NoMethodError)

# 出力例
# シンボルに対してcharsメソッドを呼び出してしまった場合
# undefined method `chars` for :japan:Symbol (NoMethodError)

# 出力例
# ticket.fareを呼び出したが、ticketがnilだった場合
# undefined method `fare` for nil:NilClass (NoMethodError)





# TypeError

# TypeErrorは期待しない型(クラス)がメソッドの引数に渡された時に発生します。
# 出力例
# 10 + '1'のように整数と文字列を加算しようとした場合
# String can't be coerced into Integer (TypeError)




# ArgumentError

# ArgumentErrorは引数の(argument)の数が違ったり、期待する値ではなかったりした場合に発生します。
# 出力例
# 引数が必須なのに[1, 2, 3].deleteのように引数なしでメソッドを呼んだ場合
# wrong number of arguments (given 0, expected 1) (ArgumentError)

# 出力例
# 正の値を渡すべきメソッド(演算子)に対し、'a' * -1のように負の値を渡した場合
# negative argument (ArgumentError)


# ZeroDivisionError

# ZeroDivisionErrorは整数を0で除算(割り算)しようとしたときに発生します。
# 出力例
# 1 / 0のように0で除算しようとした場合
# divided by 0 (ZeroDivisionError)



# SystemStackError

# スタックがあふれたときに発生します。とくに間違ってメソッドを再帰呼び出しした場合に発生します。
# 以下は再帰呼び出しのテクニックを使って階乗の計算メソッドを作ろうとしたものの、修了条件を設定し忘れたため
# 再帰呼び出しが終わらず、SystemStackErrorが発生してしまうコード例です。
def factorial(n)
    # 終了条件を書き忘れたため永遠に再帰呼び出しが発生する
    n * factorial(n - 1)

    # 本来であれば次のような条件分岐を作って終了させる必要がある
    # n == 0 ? 1 : n * factorial(n - 1)
end

factorial(5)
#=> stack level too deep (SystemStackError)


# n == 0 ? 1 : n * factorial(n - 1)は
# n == 0 の場合は、階乗の定義に従って 1 を返します。
# それ以外の場合は、n * factorial(n - 1) が評価されます。

# 三項演算子の構文は以下の通りです：
# 条件式 ? 条件が真の場合の結果 : 条件が偽の場合の結果



# LoadError

# requireやrequire_relativeの実行に失敗したときに発生します。
# ・requireの引数に与えたライブラリ名が間違っている
# ・requireしようとしたgemが実行環境にインストールされていない
# ・require_relativeで指定したファイルのパスが間違っている
# 出力例
# require 'pathname'を間違ってrequire 'pathmame'と書いてしまった場合
# cannot load such file -- pathmame (LoadError)


# SyntaxError
# 構文エラーです。たいていの場合、プログラムの起動自体に失敗します。
# このエラーが発生したときはendやカンマの数に過不足がある、丸カッコや中カッコが
# ちゃんと閉じられていない、といった原因が考えられます。
# 以下のコードはputs({ foo: 1, bar: 2})のように丸カッコが必要
# puts{ foo: 1, bar: 2 }
#=> syntax error, unexpected ':', expecting '}' (SyntaxError)




# プログラムの途中経過を確認する

# printデバッグ
# printメソッドをプログラムに埋め込んでプログラムを実行し、ターミナルに出力される値を確認して不具合を探るという手法です。
# Rubyの場合はprintメソッドよりもputsメソッドやpメソッドのほうをよく使います。

def to_hex(r, g, b)
    [r, g, b].sum('#') do |n|
        n.to_s(16).rjust(2, '0')
    end
end


# printデバッグは変数やメソッドの値を出力するだけでなく、メソッドや条件分岐が意図したとおりに
# 実行されているかどうか確認する場合にも使えます。

def greet(country)
    puts 'greet start' # greetメソッドが呼ばれたことを確認
    return 'countryを入力してください' if country.nil?

    if country == 'japan'
        puts 'japan' # 真の条件分岐に入ったことを確認
        'こんにちは'
    else
        puts 'other' # 偽の条件分岐に入ったことを確認
        'hello'
    end
end


# tapメソッドでメソッドチェーンをデバッグする
# tapメソッドはブロックパラメータにレシーバをそのまま渡します。
# ブロックの戻り値は無視され、tapメソッド全体の戻り値はレシーバ自身になります。

# ブロックパラメータのsには、tapメソッドのレシーバ(ここでは文字列の"hello")が入る
a = 'hello'.tap { |s| puts "<<#{s}>>" }
#=> <<hello>>

# tapメソッドはレシーバをそのまま返す
a #=> "hello"

# この特徴を利用すると、次のようにtapメソッドをメソッドチェーンの途中に挟み込むことで、
# 途中の値を確認することができます。

# メソッドチェーンを使っているこのコードをデバッグしたい
'#043c78'.scan(/\w\w/).map(&:hex)

# tapメソッドを使って、scanメソッドの戻り値をターミナルに表示する
'#043c78'.scan(/\w\w/)    # 16進数表現を2文字ずつ抽出する
    .tap { |rgb| p rgb }    # 抽出結果をターミナルに出力する
    .map(&:hex)             # 抽出した文字列を16進数整数に変換する
#=> ["04", "3c", "78"] # tapによるデバッグ出力
#=> [4, 60, 120]     # 最終的な戻り値




# ログにデバッグ情報を出力する

# 以下はRailsアプリケーションでログ出力するコード例です。
class User < ApplicationRecord
    def facebook_username
        logger.debug "[DEBUG] info.name: #{info.name}" #ログに変数info.nameの値を出力する
        info.name
    end
end




# デバッガ(debug.gem)を使う

# fizz_buzzメソッドに処理が移ったタイミングで停止させてみましょう。
# debugライブラリをrequireしたあと、if文が始まる直前にbinding.breakというコードを挟み込んでみます。
require 'debug'

def fizz_buzz(n)
    binding.break
    if n % 15 == 0
        'Fizz Buzz'
    elsif n % 3 == 0
        'Fizz'
    elsif n% 5 == 0
        'Buzz'
    else
        n.to_s
    end
end





# Rubyに関するその他のトピック

# 日付や時刻の扱い
# Ruby標準ライブラリには日付や時刻を扱うクラスが3つあります。

# Timeクラス
# Dateクラス
# DateTimeクラス(非推奨)

# Dateクラスは日付を扱うクラスで、TimeクラスとDateTimeクラスは日付と時刻を扱うクラスです。
# Timeクラスだけが組み込みライブラリになっているので、requireせずに使うことができます。

time = Time.new(2021, 1, 31, 23, 30, 59)
#=> 2021-01-31 23:30:59 +0900

require 'date'
date = Date.new(2021, 1, 31)
#=> <Date: 2021-01-31 ((2459246j,0s,0n),+0s,2299161j)>




# ファイルやディレクトリの扱い
# Rubyの標準ライブラリにはファイルやディレクトリを扱うクラスがいくつかあります。
# ・Fileクラス
# ・Dirクラス
# ・FileUtilsモジュール
# ・Pathnameクラス

# FileクラスとDirクラスは組み込みライブラリなので、requireなしで使うことができます。

# カレントディレクトリに"secret.txt"が存在するか？
File.exist?('./secret.text')
# カレントディレクトリに"secret_folder"が存在するか？
Dir.exist?('./secret_folder')

# 以下はファイルを読み書きする簡単なコード例です。

# libディレクトリにあるfizz_buzz.rbの行数をターミナルに表示する
File.open('./lib/fizz_buzz.rb', 'r') do |f|
    puts f.readline.count
end

# libディレクトリにhello_world.txtを作成して文字を書き込む
File.open('./lib/hello_world.txt', 'w') do |f|
    f.puts 'Hello, world'
end

# 'w'モードを使うと書き込み専用でファイルを開き、ファイルが存在しない場合は新規作成、存在する場合は上書きします。
# 以下はRubyで使用できる主要なファイルモードです：
# モード	説明
# 'r'	読み込み専用。ファイルが存在しない場合はエラーになります。
# 'r+'	読み書き可能。読み込み位置はファイルの先頭に設定されます。
# 'w'	書き込み専用。ファイルが存在しない場合は新規作成され、存在する場合は内容が消去されます。
# 'w+'	読み書き可能。書き込み専用モードと同様にファイルの内容が消去されます。
# 'a'	追記専用。ファイルが存在しない場合は新規作成されます。書き込み位置は常に末尾です。
# 'a+'	読み書き可能。追記専用モードと同様に書き込み位置は常に末尾です。
# 'b'	バイナリモード。上記モードに追加して使用されます（例: 'rb', 'wb'）。



# FileUtilsモジュールは基本的なファイル操作を集めたモジュールです。
# ファイルのコピーや削除などを便利に実行するためのメソッドが定義されています。
require 'fileutils'

# libディレクトリのhello_world.txtをhello_world.rbにリネームする
FileUtils.mv('./lib/hello_world.txt', './lib/hello_world.rb')


# Pathnameクラスはパス名をオブジェクト指向らしく扱うクラスです。
# たとえば、自分自身がファイル(またはディレクトリ)かどうかを返すメソッドや、
# 新しいパス文字列を組み立てるメソッドなどが定義されています。

require 'pathname'

# カレントディレクトリ配下にあるlibディレクトリを表すオブジェクトを作る
lib = Pathname.new('./lib')
# ファイルか？
lib.file? #=> false
# ディレクトリか？
lib.directory? #=> true
# libディレクトリ配下にあるsample.txtへのパス文字列を作る
lib.join('sample.txt').to_s #=> "./lib/sample.txt"





# 特定の形式のファイルを読み書きする
# Rubyでは単純なテキストファイルだけでなく、CSVファイルやJSONといった特定の形式の
# ファイルやテキストデータを読み書きするライブラリも用意されています。

# CSV
require 'csv'
# CSVファイルの出力
CSV.open('./lib/sample.csv', 'w') do |csv|
    # ヘッダ行を出力する
    csv << ['Name', 'Email', 'Age']
    # 明細行を出力する
    csv << ['Alice', 'alice@example.com', 20]
end

# JSON
# JSONはJavaScript Object Notationの略で、JavaScriptと互換性のあるテキストフォーマットの一種です。
# シンプルかつ軽量にオブジェクトの内容を表現できるため、JavaScriptだけでなく様々な言語やWebサービス間で
# データを交換するときによく使われます。

require 'json'

# ハッシュをJSON形式の文字列に変換する
user = { name: 'Alice', email: 'alice@example.com', age: 20 }
user_json = user.to_json # ハッシュをJSON形式の文字列に変換する
puts user_json
#=> {"name":"Alice","email":"alice@example.com","age":"20"}

# JSON文字列をパースしてハッシュに変換する(デフォルトではキーは文字列になる)
JSON.parse(user_json)
#=> {"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}

# symbolize_namesオブションを指定するとキーがシンボルになる
JSON.parse(user_json, symbolize_names: true)
#=> {:name=>"Alice", :email=>"alice@example.com", :age=>20}



# YAML
# YAMLは"YAML Ain't a Markup Language"の略で、インデントを使ってデータの階層構造を
# 表現でするテキストフォーマットの一種です。
require 'yaml'

# YAML形式のテキストデータを用意する
yaml = <<TEXT # <<TEXT で YAML形式の文字列を作成します。
    alice:
    name: 'Alice'
    email: 'alice@example.com'
    age: 20
TEXT

# YAMLテキストをパースしてハッシュに変換する
users = YAML.load(yaml)
{
    "alice" => {
        "name" => "Alice",
        "email" => "alice@example.com",
        "age" => 20
    }
}
# YAML.loadは文字列をRubyオブジェクトに変換します。


# ハッシュに新しい要素を追加する
users['alice']['gender'] = :female
# ハッシュの構造が以下のように更新されます：
{
    "alice" => {
        "name" => "Alice",
        "email" => "alice@example.com",
        "age" => 20,
        "gender" => :female
    }
}


# ハッシュからYAMLテキストに変換する
puts YAML.dump(users)
# ターミナルに以下のような出力が表示されます：
# alice:
#   name: Alice
#   email: alice@example.com
#   age: 20
#   gender: :female

# YAML.dumpはRubyオブジェクトをYAML形式に変換します。




# Rake
# RakeはRubyで作られているビルドツールです。
# macOS/Linux系の環境で昔からよく使われているビルドツールにMakeがありますが、
# RakeはそのRuby版だと言えます。ただし、もともとはビルドツールとして開発されたRakeですが、
# 実際にはビルドに限らず、「何かしらのまとまった処理」を簡単に実行するためのツールとして使われることも多いです。
# ビルドとはコンパイルやトランスパイル(別言語への変換)といった処理を通じて、
# ソースコードやライブラリを1つにまとめ、実行可能ファイルや配布パッケージを作成する処理です。

# Rakeの基本的な使い方
# Rakeの大きな特徴の1つはRubyプログラムを内部DSLとして使用する点です。
# RakeはRakefileという名前のファイルにタスクを定義します。
# たとえば以下はRakefileに"hello_world"という名前のタスク定義をする例です。

# hello_worldという名前のタスクを定義する
task :hello_world do
    puts 'Hello, world' # ブロックの中がタスクとして実行される処理になる
end

# 上のタスクは以下のようにrakeコマンドを使って実行できます。
# $ rake hello_world
# Hello, world


# タスクにはdescメソッドを使ってタスクの説明を入れることもできます。
desc 'テスト用のタスクです。'
task :hello_world do
    puts 'Hello, world'
end

# rake -Tというコマンドを入力すると、タスクの一覧が説明付きで表示されます。
# $ rake -T
# rake hello_world #テスト用のタスクです。



# タスクの数が増えてきたときは、名前空間(ネームスペース)を使ってタスクを整理することもできます。
# 名前空間を使ってタスクをグループ分けする
namespace :my_tasks do
    desc 'テスト用のタスクです。'
    task :hello_world do
        puts 'Hello, world'
    end
end
# 名前空間付きのタスクを実行するときは、コロン(:)を使って名前空間とタスクを区切ります。
# $ rake my_tasks:hello_world
# Hello, world






# Gemfile.lockの役割
# Bundlerを使ってgemをインストールすると、Gemfileと同じディレクトリにGemfile.lockというファイルが自動生成されます。
# このファイルにはBundlerで管理すべきgemとバージョン番号が記載されています。
# Gemfile.lockはBundlerが自動的に作成更新するファイルなので、開発者が直接編集してはいけません。
# チームで1つのアプリケーションを開発したり、開発環境とは別に本番環境を用意したりする場合は、
# GemfileやGemfile.lockもバージョン管理システムgitなどで変更管理します。
# こうすることで、たとえばチームに新しく参加した開発者はバージョン管理システムからファイル一式をダウンロード(gitであればgit clone)し、
# bundle installを実行するだけでほかの開発者とまったく同じバージョンのgemを使って開発を始めることができます。
# これはBundlerがGemfile.lockの情報を見て、必要なgemをバージョンまでそろえて、まとめてインストールしてくれるからです。



# Gemfileでgemのバージョンを指定する記号の意味
# バーション番号を指定しない場合はBundleインストールにおまかせになります。
# Bundlerは依存関係上、問題が起きない最新バージョンをインストールします。
# ただし、問題が起きないバージョンがマシンにすでにインストールされている場合は、最新かどうかにかかわらずそれを再利用します。

# バージョンはBundlerにおまかせ
gem 'faker'

# 特定のバージョンを使いたいときは、カンマ区切りでそのバージョンを指定します。
# 2.17.0に固定
gem 'faker', '2.17.0'

# 2.17.0以上であれば何でも良いという場合は>=を使います。
# 2.17.0以上(上は制限なし)
gem 'faker', '>= 2.17.0'

# 2.17.0以上かつ2.18未満(2.17.1などは良いが、2.18.0はNG)
gem 'faker', '~> 2.17.0'
# バッチバージョンは上がっても良いがマイナーバージョンは上げたくないことを意味します。

# 2.17以上かつ3.0未満(2.19.0などは良いが、3.0.0はNG)
gem 'faker', '~> 2.17'

# マイナーバージョンやメジャーバージョンが変わると、後方互換性のない変更が導入されて
# 突然プログラムが動かなくなる場合があります。
# なので、それを防止したいときに悲観的バージョン演算子(~>)を使います。






# Rubyに関する基礎知識
# 全てがオブジェクト
# 文字列や配列はもちろん、数値やnilも含めて、全てがオブジェクトになっています。
# その証拠に数値やnil、trueやfalseに対してもメソッドを呼び出すことができます。
# 以下はさまざまなタイプのオブジェクトに対してto_sメソッドを呼び出すコード例です。

# 文字列
'1'.to_s #=> "1"
# 数値
1.to_s #=> "1"
# nil
nil.to_s #=> ""
# true
true.to_s #=> "true"
# false
false.to_s #=> "false"


# メソッド呼び出し
# Rubyでは次のような形式でオブジェクトのメソッドを呼び出すことができます。
# オブジェクト.メソッド(引数1, 引数2, 引数3)
# オブジェクト.メソッド 引数1, 引数2, 引数3
# オブジェクト.メソッド

# 以下はその実行例です。
1.to_s() #=> "1"
1.to_s #=> "1"
# 数値を16進数の文字列に変換する(カッコあり)
10.to_s(16) #=> "a"
# 数値を16進数の文字列に変換する(カッコなし)
10.to_s 16 #=> "a"


# 変数(ローカル変数)の宣言と代入
# 変数名 = 式や値

# 変数名は慣習として小文字のスネークケースで書きます。
# スネークケースとは単語をアンダースコア(_)で区切る記法です。
# special_price = 200

# 変数名に数字を入れる
# special_price_2 = 300

# 数字から始める変数名は使えない(エラーになる)
# 2_special_price_2 = 300


# 次のようにして、2つ以上の値を同時に代入することもできます(多重代入)
# a, b = 1, 2
# a #=> 1
# b #=> 2

# 右辺の数が少ない場合はnilが入る
# c, d = 10
# c #=> 10
# d #=> nil

# 右辺の数が多い場合ははみ出した値が切り捨てられる
# e, f = 100, 200, 300
# e #=> 100
# f #=> 200


# 互に無関係な値を多重代入すると理解しづらいコードになる
name, age, height = 'Alice', 20, 160
# こういう場合は別々に変数に代入していく方が良い。
name = 'Alice'
age = 20
height = 160

# 2つの変数に同じ値を代入する
a = b = 200
a #=> 200
b #=> 200

# 以下の場合、bも大文字になるので注意
a = b = 'Hello'
a.upcase!
a #=> "HELLO"
b #=> "HELLO"

# 別々に代入した場合はこの問題は起きない
c = 'Hello'
d = 'Hello'
c.upcase!
c #=> "HELLO"
d #=> "Hello"




# シングルクォートとダブルクォート
# 挙動が異なる点がある
# 文字列中に改行文字(\n)を埋め込みたい場合は、ダブルクォートで囲む必要がある。
puts "こんにちは\nさようなら"
#=> こんにちは
#   さようなら

# シングルクォートで囲むとただの文字列になる
puts 'こんにちは\nさようなら'
#=> こんにちは\nさようなら

# 式展開を使い場合はダブルクォートを使う
name = 'Alice'
puts "Hello,#{name}" #=> Hello,Alice

# ダブルクォートを使う文字列で改行文字や式展開の機能を打ち消したい場合は手前にバックスラッシュをつけます。
puts "こんにちは\\nさようなら"
#=> こんにちは\nさようなら




# 数値
# Rubyでは人間が自然に理解しやすい形式で数値を書くことができます。
# 正の整数
10
# 少数
1.5
# 負の整数
-3
# 負少数
-4.75

# 数値には_を含めることができます。_は無視されるので、大きな数の区切り文字として使うと便利です。
1_000_000 #=> 1000000


# 整数同士の割り算は整数になる点に注意してください。
1 / 2 #=> 0

# 少数点以下の値が必要な場合は、どちらかの値に少数の.0をつけます。
1.0 / 2 #=> 0.5

1 / 2.0 #=> 0.5

# to_fメソッドを呼びことで整数から少数に変更することができます。
n = 1
n.to_f #=> 1.0
n.to_f / 2 #=> 0.5

# %は割り算の余りを求める演算子です。
8 % 3 #=> 2

# **はべき乗を求める演算子です。
2 ** 3 #=> 8



# 演算子の優先順位
# 数学の四則演算と同じく、*と/は+と-よりも優先順位が高いです。
# ()を使うと優先順位を変えることができます。
2 * (3 + 4) * (5 - 6) / 2 #=>-7

# 変数に格納された数値の増減
# Rubyには変数の値を増減させる++や--のような演算子がありません。
# これに近い演算子として+=や-=が用意されています。

n = 1
# nを1増やす
n += 1 #=> 2
# nを1減らす
n -= 1 #=> 1

n = 2
# nを3倍にする
n *= 3 #=> 6
# nを2で割る
n /= 2 #=> 3
# nを2乗する
n **= 2 #=> 9

# Rubyでは数値と文字列を+演算子で加算することはできない
1 + '10' #=> String can't be coerced into Integer

# 文字列は数値に変換する必要がある

# 整数に変換
1 + '10'.to_i #=> 11

# 少数に変換
1 + '10.5'.to_f #=> 11.5

# 文字列を数値に+演算子で連結することはできないので、数値を文字列に変換する必要がある。
number = 3
'Number is' + number.to_s #=> "Number is 3"

# 式展開を使った場合は、自動的にto_sメソッドが呼ばれるので、文字列に変換する必要はありません。
number = 3
"Number is #{number}" #=> "Number is 3"





# 真偽値と条件分岐
# Rubyの真偽値は次のようなルールを持っています。
# ・falseまたはnilであれば偽
# ・それ以外はすべて真

data = find_data
if data != nil
    'データがあります'
else
    'データはありません'
end

# しかし、Rubyの場合、falseとnil以外はすべて真なので、次のようにシンプルに書けます。
# Rubyのプログラミングでは「nilも偽」という性質を活かしたコードがよく出てくるので、
# 以下のようなコードに慣れるのようしましょう。
data = find_data
if data
    'データがあります'
else
    'データはありません'
end


# 条件1も条件2も真であれば真、それ以外は偽
# 条件1 && 条件2
t1 = true
t2 = true
f1 = false
t1 && t2 #=> true
t1 && f1 #=> false


# 条件1か条件2のいずれかが真であれば真、両方偽であれば偽
# 条件1 || 条件2
t1 = true
f1 = false
f2 = false
t1 || t1 #=> true
t1 || t2 #=> false


# &&は||よりも優先順位が高いので、次のように解釈される
# (条件1 && 条件2) || (条件3 && 条件4)
t1 = true
t2 = true
f1 = false
f2 = false
t1 && t2 || f1 && f2 #=> true
# 上の式と下の式は同じ意味
(t1 && t2) || (f1 && f2) #=> true

# !演算子を使うと真偽値を反転させることができます。
t1 = true
f1 =false
!t1 #=> false
!f1 #=> true




