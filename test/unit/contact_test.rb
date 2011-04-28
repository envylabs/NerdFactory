require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  setup do
    @contact = Contact.new('email@address.com', 'subject', 'body')
  end

  test 'should validate presence of email' do
    @contact.email = nil
    assert ! @contact.valid?
  end

  test 'should validate presence of subject' do
    @contact.subject = nil
    assert ! @contact.valid?
  end

  test 'should validate presence of body' do
    @contact.body = nil
    assert ! @contact.valid?
  end

  test 'should be valid when email, subject, and body are supplied' do
    assert @contact.valid?
  end

end
