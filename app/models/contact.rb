class Contact
  include ActiveModel::Validations
  include ActiveModel::Serializers::Xml
  include ActiveModel::Serializers::JSON

  attr_accessor :email, :subject, :body

  validates_presence_of :subject, :body

  validates :email, :presence => true, :email => true

  def initialize(email, subject, body)
    @email, @subject, @body = email, subject, body
  end

  def attributes
    {
      'email' => @email,
      'subject' => @subject,
      'body' => @body
    }
  end
end
