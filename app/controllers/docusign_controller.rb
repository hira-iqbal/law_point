# app/controllers/documents_controller.rb

class DocusignController < ApplicationController
    def create
      docusign_service = DocusignService.new
      recipient_email = 'hirach502@gmail.com'
      document_path = Rails.root.join('app', 'assets', 'path', 'to', 'your', 'test.txt').to_s
      template_id = '61d7ae9d-de62-461e-9c98-52d9153b4b7e'
  
      docusign_service.send_document_for_signature(recipient_email, document_path, template_id)
  
      # Your logic after sending the document
    end
  end
  