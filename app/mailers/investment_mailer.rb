class InvestmentMailer < ApplicationMailer
  def investment_created_mail(investment)
    @investment = investment
    mail(to: 'investment@vestedworl.com', subject: 'New investment was added')
  end
end
