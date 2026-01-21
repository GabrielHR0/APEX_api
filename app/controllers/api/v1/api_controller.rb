module Api
  module V1
    class ApiController < ApplicationController
      include Pundit::Authorization
      
      before_action :debug_auth_header
      before_action :authenticate_user!

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def user_not_authorized
        render json: { error: "Não autorizado." }, status: :forbidden
      end

      def debug_auth_header
        puts "\n--- DEBUG HEADER START ---"
        
        auth_header = request.headers['Authorization']
        
        if auth_header.present?
          puts "Header Authorization recebido!"
          puts "Tamanho do Header: #{auth_header.length} caracteres"
          puts "Conteúdo (primeiros 50 chars): #{auth_header[0..50]}..."
          
          # Verifica se tem o Bearer
          if auth_header.start_with?('Bearer ')
            token = auth_header.split(' ').last
            puts "Token extraído parece válido? #{token.count('.') == 2 ? 'Sim (tem 3 partes)' : 'Não'}"
          else
            puts "ERRO: Header não começa com 'Bearer '"
          end
        else
          puts "O HEADER AUTHORIZATION ESTÁ NIL (VAZIO)!"
          puts "Headers recebidos: #{request.headers.to_h.keys.select { |k| k.match?(/HTTP_/) }}"
        end
        
        puts "--- DEBUG HEADER END ---\n"
      end
    end
  end
end