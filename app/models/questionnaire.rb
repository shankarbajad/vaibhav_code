class Questionnaire < ActiveRecord::Base

	attr_accessor :email_confirmation
	validates :email, confirmation: true
	belongs_to :user
	belongs_to :company
	# after_create :send_notification
	before_save do	
	  self.key_strengths.gsub!(/[\[\]\"]/, "") if attribute_present?("key_strengths")
	  self.improvement_strength.gsub!(/[\[\]\"]/, "") if attribute_present?("improvement_strength")
	  self.finance_type.gsub!(/[\[\]\"]/, "") if attribute_present?("finance_type")
	  self.fund_plan.gsub!(/[\[\]\"]/, "") if attribute_present?("fund_plan")	  
	end

	private
	
	# def send_notification
	#     QuestionnaireMailer.send_notification(self).deliver
	#     QuestionnaireMailer.send_notification_to_team(self).deliver
 #  	end
end
