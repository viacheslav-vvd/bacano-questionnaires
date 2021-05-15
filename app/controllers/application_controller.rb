# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_questionnaire

  private
  
    def set_questionnaire
      @questionnaire = Questionnaire.find_by(slug: params[:slug])
      redirect_to 'questionnaires#index' unless @questionnaire
    end
    
    def redirect_to_first_step
      uid = "uid#{Time.now.to_i.to_s}"
      redirect_to "/questionnaires/#{@questionnaire.slug}/#{uid}/steps/1" 
    end
end
