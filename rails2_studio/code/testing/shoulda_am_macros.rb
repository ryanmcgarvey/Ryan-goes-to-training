require 'rubygems'
require 'action_mailer'
require 'action_controller'
require 'shoulda/rails'
require 'test/unit'
ActionMailer::Base.delivery_method = :test

#START:code
class MailerTest < Test::Unit::TestCase
  context "Sending mail (or not)" do
    should "have sent any email" do
      assert_sent_email
    end
    
    should "have sent an email about spam" do
      # All delivered mails are yielded.
      # At least one must match
      assert_sent_email do |mail|
        mail.subject =~ /spam/i
      end
    end
    
    should "have not sent any email" do
      assert_did_not_send_email
    end
  end
end
#END:code