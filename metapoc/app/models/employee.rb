class Employee < ActiveRecord::Base
	validates :name, :presence => true
	validates :salary, :presence => true
	validates :position, :presence => true
end
