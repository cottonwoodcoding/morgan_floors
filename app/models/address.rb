class Address < ActiveRecord::Base
  attr_accessible :civic_address, :municipality, :postal_code
end
