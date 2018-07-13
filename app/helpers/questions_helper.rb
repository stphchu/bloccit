module QuestionsHelper

  def resolved_question(question)
     return "(SOLVED)" if question.resolved
  end

end
