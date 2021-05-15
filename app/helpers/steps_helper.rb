module StepsHelper
  def answer_value(result, question_id)
    result&.answers&.find_by(question_id: question_id)&.value
  end
end
