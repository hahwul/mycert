# frozen_string_literal: true

require 'colorize'

class Logger
  def self.info(text)
    puts '► '.colorize(:blue) + text.to_s.colorize(:light_blue)
  end

  def self.error(text)
    puts '⚠︎ '.colorize(:red) + text.to_s
  end

  def self.data(text)
    puts text.to_s.colorize(:light_green)
  end
end
