require 'rubygems'
require 'twilio-ruby'

print "Enter locale: "
case gets.chomp
when "en"
  phone = "+12244200655"
when "pt-BR"
  phone = "+5511991517625"
when "es-PE"
  phone = "+51958923335"
end
print "Enter message: "
message = gets.chomp

@account_sid = ENV['ACCOUNT_SID'] 
puts ENV['ACCOUNT_SID']
@auth_token = ENV['AUTH_TOKEN']
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
@account = @client.account

begin
  @message = @account.sms.messages.create({ from: "+13125488213", to: "#{phone}", body: message.force_encoding("ISO-8859-1") })
  puts message.force_encoding("ISO-8859-1").bytesize
rescue Twilio::REST::RequestError => err
  puts "Error sending sms to #{phone}"
  puts "* #{err}"
end
