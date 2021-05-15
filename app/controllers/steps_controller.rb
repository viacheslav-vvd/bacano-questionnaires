# frozen_string_literal: true

class StepsController < ApplicationController
  def show_questions
    @step = @questionnaire.steps.find_by(position: params[:step_position])
    return redirect_to_first_step unless @step
    
    @result = @questionnaire.results&.find_by(uid: params[:uid])
  end

  def save_answers
    params[:questions].each do |question_id, value|
      value_valid?(question_id, value)
      result = Result.find_or_create_by(uid: params[:uid], questionnaire_id: @questionnaire.id)
      answer = Answer.find_or_create_by(result_id: result.id, question_id: question_id)
      answer.update(value: value) unless answer.value == value
    end
    
    step_position = params[:step_position].to_i
    return redirect_to completed_questionnaire_path(@questionnaire.slug) if last_step?(step_position)
    
    redirect_to "/questionnaires/#{ @questionnaire.slug }/#{params[:uid]}/steps/#{ step_position + 1 }"
  end
  
  private
  
  def last_step?(step_position)
    @questionnaire.steps.order(:position).last.position == step_position
  end
  
  def value_valid?(question_id, value)
    !Question.find(question_id).answer_required || value.present?
  end
end
