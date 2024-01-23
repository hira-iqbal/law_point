require 'docusign_esign'
require 'uri'

host = 'https://na4.docusign.net'
integrator_key = 'd1e9f048-0c22-468b-8e82-ec820dbb9331'
user_id = '43829fc3-db5f-4c3b-8293-8dbb63f1eb20'
expires_in_seconds = 3600 # 1 hour
auth_server = 'account-d.docusign.com'
private_key_filename = 'test-app'

# STEP 1: Initialize API Client
configuration = DocuSign_eSign::Configuration.new
configuration.host = host

api_client = DocuSign_eSign::ApiClient.new(configuration)
api_client.configure_jwt_authorization_flow(private_key_filename, auth_server, integrator_key, user_id, expires_in_seconds)

# STEP 2: Initialize Authentication API using the API Client
authentication_api = DocuSign_eSign::AuthenticationApi.new(api_client)

# STEP 3: Make the login call
login_options = DocuSign_eSign::LoginOptions.new
login_information = authentication_api.login(login_options)

if !login_information.nil?
  login_information.login_accounts.each do |login_account|
    if login_account.is_default == "true"
      # STEP 4: Extract the user information
      base_url = login_account.base_url
      account_id = login_account.account_id

      puts base_url
      puts account_id

      # IMPORTANT: Use the base URL from the login account to update the API client which will be used in future API calls
      base_uri = URI.parse(base_url)
      api_client.config.host = "%s://%s/restapi" % [base_uri.scheme, base_uri.host]
    end
  end
end
