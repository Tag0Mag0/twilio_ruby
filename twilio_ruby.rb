require 'rubygems'
require 'twilio-ruby'

print "Enter locale: "
case gets.chomp
when "en"
  country_code = "+"
when "pt-BR"
  country_code = "+55"
when "es-PE"
  country_code = "+51"
end
print "Enter number with area code: "
phone = gets.chomp
print "Enter message: "
message = gets.chomp

@account_sid = ENV['ACCOUNT_SID'] 
puts ENV['ACCOUNT_SID']
@auth_token = ENV['AUTH_TOKEN']
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
@account = @client.account

begin
  @message = @account.sms.messages.create({ from: "+13125488213", to: "#{country_code}#{phone}", body: message.force_encoding("ISO-8859-1") })
  puts message.force_encoding("ISO-8859-1").bytesize
rescue Twilio::REST::RequestError => err
  puts "Error sending sms to #{country_code}#{phone}"
  puts "* #{err}"
end
