class CompanyMailer < ApplicationMailer
  def company_created_mail(company)
    @company = company
    mail(to: 'company@vestedworld.com', subject: 'New company was added')
  end
end
