# frozen_string_literal: true

require 'openssl'

def create_pkcs12(_name, password, filename)
  p12 = OpenSSL::PKCS12.create(password, 'myapp', root_key, root_ca)
  File.open(filename, 'wb') do |f|
    f.write p12.to_der
  end
end
