# app/services/docusign_service.rb

class DocusignService
    def initialize
      @api_client = setup_docusign_api_client
    end
  
    def send_document_for_signature(recipient_email, document_path, template_id)
      # Your logic to create and send the document for signature using the DocuSign API
      # Use @api_client for making API calls
      # ...
    end
  
    private
  
    def setup_docusign_api_client
      # Initialize and configure the DocuSign API client
      # This logic can be similar to what you have in your initializer
      # ...
    end
  end
  