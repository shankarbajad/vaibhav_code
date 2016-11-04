module QuestionnairesHelper
	def checked(field, area)	
	  @questionnaire.send(field).nil? ? false : @questionnaire.send(field).match(area)
	end
end
