class ContactController < ApplicationController
  def index
    @address = Address.first
    @primary_number = PhoneNumber.where(primary: true).first
    @other_numbers = PhoneNumber.where(primary: false)
    @has_numbers = (!@primary_number.nil? || @other_numbers.count > 0)
  end

  def send_feedback
    begin
      ContactMailer.send_feedback(params[:email], params[:name], params[:message]).deliver
      flash[:notice] = "Feedback Sent Successfully"
    rescue => e
      flash[:alert] = 'There was an error sending your feedback please try again.'
    end
    redirect_to action: :index
  end
end
