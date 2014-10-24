class DemosController < ApplicationController
	
	def index
	end

	def demosend
		@employees = Employee.all
		@employee = Employee.find(1)
	end


	def private_inst_demo
		if DemosController.private_instance_methods.include? meth.to_sym
			self.send(params[:meth].to_sym)
		end
	end


	def demosendcreate
		@acceptable_params = ["name","status"]
		@employee = Employee.find(1)
		type = params[:type]
		if @acceptable_params.include?(type)
			@employee.send("#{type}=", params[:value])
			@employee.save!
		else			
		end
	redirect_to demos_demosend_path	
	end

	def democonstantize
	end

	def democonstantizevalidate
		@valid_classes = ["Employee"]
		validation = params[:class]
		if @valid_classes.include?(validation)
			validation
		else
			validation = "Employee"
		end
		klass = validation.constantize
		@obj = klass.find_by_id!(params[:id])
		@valid = @obj.valid?
		@errors = @obj.errors
	end

	def demoeval
		cmd = params[:cmd]
		@source = "http://localhost:3001?code=#{cmd}"
	end

	def demoevalemplist
	end

	def demomethmissing
		# https://github.com/Scatchell/FoodForThought/blob/master/app/controllers/registrations_controller.rb
	end

	def contact
	end

	def about
	end
end
