class TestimonialController < ApplicationController
  def index
    if admin_signed_in?
      @testimonials = Testimonial.all.order('created_at')
    else
      @testimonials = Testimonial.all.where(approved: true).order('created_at')
    end
  end

  def new
    t = Testimonial.new
    t.content = params['testimonial']
    t.name = params['name']
    t.approved = admin_signed_in?
    t.save
    redirect_to testimonial_path
  end

  def testimonial_list
    testimonials = Testimonial.all.order('created_at')
    render partial: 'testimonial_list', locals: {testimonials: testimonials}
  end

  def delete
    Testimonial.find(params['id']).destroy
    redirect_to testimonial_path
  end

  def approve
    t = Testimonial.find(params['id'])
    t.approved = true
    t.save
    redirect_to testimonial_path
  end
end
