class DemosController < ApplicationController
	def index
	end

	def demosend
		@employees = Employee.all
		@employee = Employee.new

	end

	def demosendcreate
		@employee = Employee.find(params[:id])
		type = params[:type]
		@employee.send("#{type}=", params[:value])
		@employee.save!
		redirect_to demos_demosend_path
	end

	def democonstantize
	end

	def demoeval
	end
end
