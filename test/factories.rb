Factory.define :product do |p|
  p.name        { 'product name' }
  p.description { 'product description' }
  p.price       { 5.99 }
  p.association :category
end

Factory.define :category do |c|
end

Factory.define :user do |u|
  u.sequence(:email)  { |i| 'email_%d@email.com' % i }
  u.password          { 'password' }
end

Factory.define :order do |o|
  o.association :user
end

Factory.define :line_item do |l|
  l.quantity    { 2 }
  l.association :product
  l.association :order
end

Factory.define :contact do |c|
  c.email       { 'email@domain.com' }
  c.subject     { 'contact subject' }
  c.body        { 'contact body' }
end
