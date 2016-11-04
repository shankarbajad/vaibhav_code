module Api
  class DocuSign  
    def initialize(username=nil, password=nil, integrator_key=nil, model, model_id, url, upload_url)
      @model = model.constantize.find(model_id)
      # Authenticate with DocuSign API
      @api = DocusignApi.new( username: '3323b043-22b2-4a47-9c27-00e3403ac523',  password: '12345678',   integrator_key: '0336da62-487b-4f21-853d-b32f1b3c5301',   login_url: url)
      # Fetch templates
      templates = @api.get '/templates'
      # Take first template
      template_id = JSON.parse(templates.body)["envelopeTemplates"][0]["templateId"]
      # Mail format
      format = {
        emailSubject: "DocuSign Signature",
        status: 'created',
        templateRoles: [],
        compositeTemplates: [{
          serverTemplates: [
            {
              sequence: '1',
              templateId: template_id
            }
          ],
          document: {
            name: 'first document',
            documentId: 23969281,
            documentBase64: Base64.encode64(File.read(upload_url)),
            documentFields: [
              # { name: 'field1', value: 'value1' },
              # { name: 'field2', value: 'value2' }
            ]
          }
        }]
      }
      @user = model.eql?("User") ? @model : @model.user
      # Generate envelope
      envelope = @api.post '/envelopes', format.to_json
      envelope_id = JSON.parse(envelope.body)["envelopeId"]
      # Recipient info
      recipient = {
        signers: [ roleName: 'signer', email: @user.email, name: @user.try(:name), recipientId: @user.id ]
      }
      # Put Recipient info in envelope
      recp = @api.put "/envelopes/#{envelope_id}/recipients", recipient.to_json
      puts JSON::parse(recp.body)
    end
  end
end