# frozen_string_literal: true

require 'openssl'

def make(name, day)
  root_key = OpenSSL::PKey::RSA.new 2048
  root_ca = OpenSSL::X509::Certificate.new
  root_ca.version = 2
  root_ca.serial = 1
  root_ca.subject = OpenSSL::X509::Name.parse "/DC=org/DC=ruby-lang/CN=#{name}"
  root_ca.issuer = root_ca.subject
  root_ca.public_key = root_key.public_key
  root_ca.not_before = Time.now
  root_ca.not_after = root_ca.not_before + day * 24 * 60 * 60
  ef = OpenSSL::X509::ExtensionFactory.new
  ef.subject_certificate = root_ca
  ef.issuer_certificate = root_ca
  root_ca.add_extension(ef.create_extension('basicConstraints', 'CA:TRUE', true))
  root_ca.add_extension(ef.create_extension('keyUsage', 'keyCertSign, cRLSign', true))
  root_ca.add_extension(ef.create_extension('subjectKeyIdentifier', 'hash', false))
  root_ca.add_extension(ef.create_extension('authorityKeyIdentifier', 'keyid:always', false))
  root_ca.sign(root_key, OpenSSL::Digest.new('SHA256'))

  root_ca
end

def make_file(root_ca, filename)
  File.open(filename, 'wb') do |f|
    f.write root_ca
  end
end
