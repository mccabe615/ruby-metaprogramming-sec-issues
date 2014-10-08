class DebugController < ApplicationController
  def validate
    klass = params[:class].constantize
    @obj = klass.find_by_id!(params[:id])
    @valid = @obj.valid?
    @errors = @obj.errors
  end
end