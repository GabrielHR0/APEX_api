class MessageMailer < ApplicationMailer
    after_deliver :update_contact_status

    default from: ENV['BREVO_EMAIL']
    
    layout 'mailer'

    def receive_message(contact, company_email)
        @contact = contact
        headers['X-Contact-ID'] = @contact.id
        mail(to: company_email, subject: "Nova Mensagem de Contato de: #{contact.name}")
    end

    private
    
    def update_contact_status
        contact_id = message.header['X-Contact-ID'].to_s.gsub(/\s+/, "")

        if contact_id.present?
            contact = Contact.find_by(id: contact_id)
            if contact
                contact.update(status: "recebido")
            else
                Rails.logger.warn "Callback falhou: Contact ID #{contact_id} não encontrado."
            end
        end
      end
end
