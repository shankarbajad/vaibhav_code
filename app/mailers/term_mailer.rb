class TermMailer < ApplicationMailer

	def term_email(term)
		@user = term.user
		@term = term
    	mail(to: 'company@vestedworld.com', subject: 'Investment Terms')
	end
end
