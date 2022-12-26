
# module Hoge
#     def info
#         puts "#{self.class} debug info ..."
#     end
# end


# class Player
#     include Hoge
# end

# class Monster
#     include Hoge
# end

# Player.new.info
# Monster.new.info


class MyError < StandardError; end

x = gets.to_i

begin
    if  x == 3
        raise MyError
    end
    p 100 / x
rescue MyError
    puts "not 3!"
rescue => hoge
    p hoge.message
    p hoge.class
    puts "stop!"
ensure
    puts "END"
end