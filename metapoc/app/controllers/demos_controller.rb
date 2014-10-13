class DemosController < ApplicationController
	def index
	end

	def demosend
		@employees = Employee.all
		@employee = Employee.new

	end

	def demosendcreate
		@employee = Employee.new
		@employee.name = params[:employee][:name]
		@employee.status = params[:employee][:status]
		@employee.position = params[:employee][:position]
		@employee.save

		redirect_to demos_demosend_path
	end

	def democonstantize
	end

	def demoeval
	end
end
