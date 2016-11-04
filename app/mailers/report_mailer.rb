class ReportMailer < ApplicationMailer
  def report_published_mail(report)
    @report = report
    mail(to: 'investment@vestedworl.com', subject: 'Published report now available')
  end
end
