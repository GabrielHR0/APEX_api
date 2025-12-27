module Brevo
  class SendContactEmail
    def self.call(contact:, company_email:)
      # Log inicial
      Rails.logger.info("=== INICIANDO ENVIO BREVO ===")
      Rails.logger.info("Contato: #{contact.attributes.to_json}")
      Rails.logger.info("Email da empresa: #{company_email}")
      
      api = ::Brevo::TransactionalEmailsApi.new

      html_content = MessageMailer
        .receive_message(contact, company_email)
        .body
        .decoded

      # Log do conteúdo HTML
      Rails.logger.info("HTML Content (primeiros 200 chars): #{html_content[0..200]}...")

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

      # Log do payload completo
      Rails.logger.info("=== PAYLOAD ENVIADO PARA BREVO ===")
      Rails.logger.info(email.to_json)
      Rails.logger.info("===============================")

      begin
        response = api.send_transac_email(email)
        Rails.logger.info("=== RESPOSTA BREVO (SUCESSO) ===")
        Rails.logger.info("Message ID: #{response.message_id}") if response.respond_to?(:message_id)
        Rails.logger.info("Response: #{response.inspect}")
        
        contact.update!(status: 'recebido')
        Rails.logger.info("Status do contato atualizado para 'recebido'")
        
      rescue ::Brevo::ApiError => e
        Rails.logger.error("=== ERRO BREVO DETALHADO ===")
        Rails.logger.error("Mensagem: #{e.message}")
        Rails.logger.error("Classe: #{e.class}")
        Rails.logger.error("Backtrace (primeiras 5 linhas):")
        e.backtrace.first(5).each { |line| Rails.logger.error(line) }
        
        # Tenta obter mais detalhes do erro
        if e.respond_to?(:response_body)
          Rails.logger.error("Response Body: #{e.response_body}")
          begin
            error_json = JSON.parse(e.response_body)
            Rails.logger.error("Error JSON: #{error_json.to_json}")
          rescue JSON::ParserError
            Rails.logger.error("Response body não é JSON válido")
          end
        end
        
        if e.respond_to?(:response_headers)
          Rails.logger.error("Response Headers: #{e.response_headers.to_json}")
        end
        
        Rails.logger.error("============================")
        raise
      end
    end
  end
end