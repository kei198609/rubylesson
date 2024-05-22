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
