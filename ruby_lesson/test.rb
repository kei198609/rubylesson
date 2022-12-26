# hash = {"1" => "hoge", "2" => "fuga"}
# p hash
# p (hash['2'])
# hash ['2'] = ('Japan')
# p hash
# hash ['3'] = ('foobar')
# p hash

# hash = {"1" => "hoge", "2" => "fuga"}
# hash.store("3","foobar")
# p hash
# hash.delete("3")
# p hash
# hash. each do |key,value|
#     p "key#{key}のvalueは#{value}"
# end

# hash = {"1" => "hoge", "2" => "fuga"}
# p hash. sort {|a,b| a[1] <=> b[1]}
# p hash. sort_by {|k,v| v}
# p hash. count
# hash_1 = {foo:"bar"}
# hash_2 = {hoge:"fuga"}
# p hash_1. merge!(hash_2)
# p hash_1

# hash = {りんご:"200",みかん:"80"}
# p "りんごとみかんを買うと#{hash[:りんご].to_i + hash[:みかん].to_i}円"
# hash = {りんご:200,みかん:80}
# p "りんごは" + hash[:りんご].to_s + "円"
# hash = {りんご:"200",みかん:"80"}
# p hash.sort_by{ |k,v|v}.to_h
# hash = {りんご:200,みかん:80}
# p hash.to_a

# for i in 0..4 do
#     puts "#{i}:確認です。"
# end

# num = 0
# while num < 2 do
#     puts ("num = #{num}")
#     num += 1
# end

# num = 2
# until num <= 0 do
#     puts "num = #{num}"
#     num -= 1
# end

# 2.times do |n|
#     puts "num = #{n}"
# end

# num = 0
# loop do
#   if num > 2
#     break
#   end
#   puts "num = #{num}"
#   num += 1
# end

# def puts_method(price)
#     if price >= 5000
#         price
#     else
#         price + 500
#     end
# end
# puts "#{puts_method(3000)}円です"
# puts "#{puts_method(10000)}円です"

# class Fruit
#     attr_accessor :name

#     def initialize(name:)
#         self.name = name
#     end
# end

# apple = Fruit.new(name:"apple")

# apple.name = "green_apple"

# puts apple.name

# class Fruit
#     def puts_method
#         puts "apple"
#     end
# end

# apple = Fruit.new()
# apple.puts_method

# class Fruit
#     attr_accessor :name
#     attr_accessor :price

#     def initialize(name:, price:)
#         self.name = name
#         self.price = price
#     end
# end

# apple = Fruit.new(name: "apple", price: 200)
# grape = Fruit.new(name: "grape", price: 500)

# puts "#{apple.name}は1個#{apple.price}円です"

# class Fruit
#     attr_accessor :name

#     def initialize(name:)
#         self.name = name
#     end

#     def puts_method
#         puts "#{self.name}"
#     end

# end

# apple = Fruit.new(name: "apple")
# apple.puts_method

# class Test
#     p self
#     def hoge
#         p self
#     end
# end

# test = Test.new
# test.hoge

# class Car
#     @@count = 0
#     def run
#         @@count += 1
#     end
#     def self.count
#         @@count
#     end
# end

# car1 = Car.new
# car1.run
# car2 = Car.new
# car2.run
# car1.run
# puts Car.count

class A
    @value = 1
    def self.value
        @value
    end
end

p A.value