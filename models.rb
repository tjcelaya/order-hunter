require 'data_mapper'
$db = DataMapper.setup(:default, 'sqlite:store.db')

class Usr
  include DataMapper::Resource

  has n, :order
  property :uid,      Serial
  property :uname,    String
  property :uhpass,   String, :length => 64
end

class Order
  include DataMapper::Resource

  belongs_to :usr, :required => false
  property :oid,      Serial
  property :oitem,    String
  property :ovendor,  String
  property :ocreate,  Date,   :default => lambda { |r,p| Time.now }
  property :ocomplete,Date
end

# class RMA
#   include DataMapper::Resource

#   is :order
#   property :rid,      Serial
#   property :rnum,     String
# end

# puts RMA.methods.sort

DataMapper.finalize

DataMapper.auto_upgrade!

if $-d
  $db.inspect.split(',').each do |line|
    puts line
  end
end