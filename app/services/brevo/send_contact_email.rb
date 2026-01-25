module Brevo
  class SendContactEmail
    def self.call(contact:, company_email:)
      api = ::Brevo::TransactionalEmailsApi.new

      html_content = MessageMailer
        .receive_message(contact, company_email)
        .body
        .decoded

      email = {
        sender: {
          email: ENV['BREVO_EMAIL'],
          name: 'Contato do Site'
        },
        to: [{ email: company_email }],
        subject: "Nova Mensagem de Contato de: #{contact.name}",
        htmlContent: html_content
      }

      response = api.send_transac_email(email)

      # Atualiza status apenas se a API respondeu corretamente
      if response.respond_to?(:message_id) && response.message_id.present?
        contact.update_columns(
          sent_at: Time.current,
          status: 'recebido',
          message_id: message_id
        )
      end

      response
    end
  end
end
