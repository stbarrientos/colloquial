class CountryPublication < ActiveRecord::Base
  
  belongs_to :country
  belongs_to :publication

end
