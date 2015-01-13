class FaqController < ApplicationController
  def index
    @questions = Faq.all.order('position')
  end

  def new
    last = nil
    if params['position'] == 'Last'
      position = Faq.order('position').last.position + 1
      last = true
    else
      position = params['position']
    end
    q = Faq.new
    q.question = params['question']
    q.answer = params['answer']
    q.position = position
    upper_adjust(Faq.where('position >= ?', position)) unless last
    q.save
    redirect_to faq_path
  end

  def delete
    question = Faq.find(params['id'])
    lower_adjust(Faq.where('position < ?', question.position))
    question.destroy
    redirect_to faq_path
  end

  def up
    question = Faq.find(params['id'])
    prev_question = Faq.where(position: (question.position - 1))
    if prev_question.any?
      p = prev_question.first
      p.position = p.position + 1
      p.save
    end
    question.position = question.position - 1
    question.save
    redirect_to faq_path
  end

  def down
    question = Faq.find(params['id'])
    next_question = Faq.where(position: (question.position + 1))
    if next_question.any?
      n = next_question.first
      n.position = n.position - 1
      n.save
    end
    question.position = question.position + 1
    question.save
    redirect_to faq_path
  end

  private

  def upper_adjust(questions)
    questions.each do |q|
      q.position = q.position + 1
      q.save
    end
  end

  def lower_adjust(questions)
    questions.each do |q|
      q.position = q.position - 1
      q.save
    end
  end
end
