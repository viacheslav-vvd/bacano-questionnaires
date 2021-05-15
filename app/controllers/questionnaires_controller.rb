# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  skip_before_action :set_questionnaire, only: :index

  def index
    @questionnaires = Questionnaire.all  
  end
  
  def show
    redirect_to_first_step
  end
  
  def completed; end
end
