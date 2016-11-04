class TermsController < ApplicationController

	def create		
		@term = current_user.terms.new(params_terms)		
		respond_to do |format|
      if @term.save
      	TermMailer.term_email(@term).deliver
        format.html { redirect_to :back, notice: 'Your investigation sent successfully.' }        
      else
        format.html { redirect_to :back, notice: @term.errors.full_messages.join(', ') }
      end
    end
	end 

	private

	def params_terms
		params.require(:term).permit(:investment_interested, :investment_experience, :description ,:user_id)
	end
end
