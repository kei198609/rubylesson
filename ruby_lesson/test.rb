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





