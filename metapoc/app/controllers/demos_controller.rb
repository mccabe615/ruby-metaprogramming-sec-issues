class DemosController < ApplicationController
	def index
	end

	def demosend
		@employees = Employee.all
		@employee = Employee.find(1)


	end

	def demosendcreate
		@employee = Employee.find(1)
		type = params[:type]
		@employee.send("#{type}=", params[:value])
		@employee.save!
		
		redirect_to demos_demosend_path
	end

	def democonstantize
	end

	def democonstantizevalidate
	    klass = params[:class].constantize
	    @obj = klass.find_by_id!(params[:id])
	    @valid = @obj.valid?
	    @errors = @obj.errors
	end

	def demoeval
	end

	def contact
	end

	def about
	end
end
