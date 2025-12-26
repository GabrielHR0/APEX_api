module Brevo
    class SendContactEmail
        def self.call(contact:, company_email:)
            api = ::Brevo::TransactionalEmailsApi.new

            html_content = ApplicationController.render(
                template: 'message_mailer/receive_message',
                layout: false,
                assigns: {contact: contact}
            )

            email = {
                sender: {
                    email: ENV['BREVO_EMAIL'],
                    name: 'Contato do Site'
                },
                to: [
                    {email: company_email}
                ],
                subject: "Nova Mensagem de Contato de: #{contact.name}",
                htmlContent: html_content
            }

      api.send_transac_email(email)

      contact.update!(status: 'recebido')
    rescue ::Brevo::ApiError => e
      Rails.logger.error("[Brevo] #{e}")
      raise
    end
  end
end