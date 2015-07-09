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
		### FROM https://github.com/andreacfm/active_metadata/blob/4a76cd1c6ebb61eb28b78d3060b5c5ac5aed4b6d/app/controllers/active_metadata/watchers_controller.rb
		@object = eval(params[:model_name]).find params[:model_id]
	end

	def demoevalcmd
		cmd = CGI::escape(params[:cmd])
		@source = "http://localhost:9292/?code=#{cmd}"
	end

	def demoevalemplist
		@employees = Employee.all
	end

	def demomethmissing
		# https://github.com/Scatchell/FoodForThought/blob/master/app/controllers/registrations_controller.rb
	end

	def contact
	end

	def about
	end
end
