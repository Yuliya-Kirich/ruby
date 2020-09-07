require_relative '../logic_news/bot_list'
require_relative 'navigator'

class Manager
  attr_accessor :user_input
  def initialize
    @user_input = nil
    new_process
  end

  def new_process
    while user_input != 0
      a = BotList.new
      a.begin
      a.bot
      @user_input = gets.to_i
      Navigator.navigator(user_input)
    end
  end
end
