# frozen_string_literal: true

require_relative 'mycert/version'
require_relative 'mycert/general'
require_relative 'mycert/logger'
require_relative 'mycert/pkcs'
require_relative 'mycert/utils'
require_relative 'mycert/android'
require 'thor'

module Mycert
  class Error < StandardError; end

  class CLI < Thor
    class_option :name, aliases: :n, default: 'mycert', type: :string, desc: 'RootCA Name'
    class_optinon :expire, aliases: :e, default: 365, type: :numeric, desc: 'CA expire day'
    class_option :pkcs12_password, default: '', type: :string, desc: 'Password for PKCS12'

    desc 'all', ''
    def all; end

    desc 'android', ''
    def android; end

    desc 'pkcs12', ''
    def pkcs12; end

    desc 'version', 'Show version.'
    def version
      puts Mycert::VERSION.to_s
    end

    def self.exit_on_failure?
      true
    end
  end
end
