class BusinessInfoController < ApplicationController
  before_action :authenticate_admin!, :business_info

  def index
  end

  def update
    address_params = params[:address]
    primary_number = params[:primary_phone]

    if address_params.values.include?('')
      @address.destroy if @address
    else
      if address = Address.first
        address.update_attributes!(address_params)
      else
        Address.create!(address_params)
      end
    end

    if primary_number.empty?
      @primary_number.destroy! if @primary_number
    else
      if @primary_number
        @primary_number.update_attributes!(number: primary_number)
      else
        PhoneNumber.create!(number: primary_number, primary: true)
      end
    end

    PhoneNumber.where(primary: false).destroy_all
    if other_phones = params[:other_phone]
      other_phones.values.each do |number|
        PhoneNumber.create!(number: number, primary: false)
      end
    end

    flash[:success] = "Business Info Updated Successfully!"
    redirect_to action: :index
  end

  def other_phone
    render(partial: 'other_phone')
  end

  def address
    render(json: @address.to_json)
  end

  private

  def business_info
    @address = Address.first
    @primary_number = PhoneNumber.where(primary: true).first
    @other_numbers = PhoneNumber.where(primary: false)
  end
end
