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
	# Overwritting the AjaxValidation plugin to manage the permission
	### FROM https://github.com/thinkdry/blank-application/blob/master/app/controllers/admin/users_controller.rb#L187
	# /users/validate
	    model_class = params['model'].classify.constantize
	    @model_instance = params['id'] ? model_class.find(params['id']) : model_class.new
	    @model_instance.send("#{params['attribute']}=", params['value'])
	    @model_instance.valid?
	    render :inline => "<%= error_message_on(@model_instance, params['attribute']) %>"
	end

	def demoeval
	end

	def contact
	end

	def about
	end
end
