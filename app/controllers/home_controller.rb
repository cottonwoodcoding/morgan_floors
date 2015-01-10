class HomeController < ApplicationController
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::SanitizeHelper

  def index
    content = AppDetail.first
    @about = content ? content.about : nil
    if @about
      str_lines = []
      @about.lines.each do |l|
        str_lines << strip_tags(l).strip
      end
      @plain = str_lines.join("\n")
    end
  end

  def update_about
    content = AppDetail.first_or_create!
    content.about = simple_format(params['about'])
    content.save
    redirect_to home_path
  end
end