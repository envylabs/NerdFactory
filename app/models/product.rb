class Product < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :name, :description, :price, :category_id
  
  has_attached_file :picture, :styles => { :original => ["420x420#", :jpg], :thumbnail => ["190x190#", :jpg] }

  scope :active, where(:active => true)

end
