class QuestionnaireMailer < ApplicationMailer
	def send_notification(questionnaire)
		@questionnaire = questionnaire
    	mail(to: "hemantyuvasoft114@gmail.com", subject: 'Entrepreneur Application')    	
	end

	def send_notification_to_team(questionnaire)		
		@questionnaire = questionnaire
    	mail(to: "from@vestedworld.com", subject: "Entrepreneur Application")
	end

	def accept_questionnaire(questionnaire)
		@questionnaire = questionnaire
    	mail(to: "hemantyuvasoft114@gmail.com", subject: "Entrepreneur Application Status")
	end
end
