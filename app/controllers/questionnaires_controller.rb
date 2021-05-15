class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all  
  end
  
  def show
    @questionnaire = Questionnaire.find_by(slug: params[:slug])
    return redirect_to 'index' unless @questionnaire
    
    return redirect_to_first_step if !params[:uid] || !params[:step_id] || !Result.find_by(uid: params[:uid])
    
    @step = @questionnaire.steps.find_by(position: params[:step_id])
    return redirect_to_first_step unless @step
  end
  
  private 
  
  def redirect_to_first_step
      uid = "uid#{Time.now.to_i.to_s}"
      @questionnaire.results.create(uid: uid)
      redirect_to "/#{params[:slug]}/#{uid}/step/1" 
  end
end
