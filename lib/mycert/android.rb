# frozen_string_literal: true

require 'openssl'

def create_android(root_ca)
  hash = root_ca.subject.hash.to_s(16)
  File.open("#{hash}.0", 'wb') do |f|
    f.write root_ca
  end
end
