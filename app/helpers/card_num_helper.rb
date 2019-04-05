module CardNumHelper
  def encryp(card_num)
    secret = Digest::SHA1.hexdigest(name)
        a = ActiveSupport::MessageEncryptor.new(secret)
        b = a.encrypt(card_num)
        b
  end
  
end