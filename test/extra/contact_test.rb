require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  setup do
    @contact = Contact.new('email@address.com', 'subject', 'body')
  end

  test 'should validate format of email' do
    @contact.email = 'not_an_email_address'
    assert ! @contact.valid?
  end

  test 'should be serializable to xml' do
    assert_not_nil @contact.to_xml
    assert @contact.to_xml =~ /^\<\?xml/, 'not valid XML format'
  end

  test 'should be serializable to json' do
    assert_not_nil @contact.to_json
    assert @contact.to_json =~ /^\{/, 'not valid JSON format'
  end

end
