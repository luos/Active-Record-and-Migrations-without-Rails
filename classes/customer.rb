load 'db/connection.rb'

class Customer < ActiveRecord::Base
  validates_presence_of :name, :phone, :age
  validates_format_of :phone, :with => /[0-9]{8}/
  validates_numericality_of :age, :only_integer => true
end

