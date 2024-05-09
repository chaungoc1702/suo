require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class GoogleSheetsService
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = 'SuperJLPT'.freeze
  CREDENTIALS_PATH = 'secrets/superjlpt-6f080cf0ca49.json'.freeze

  def get_data
    # Initialize the API
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorizer

    # Fetch data from the sheet
    spreadsheet_id = '1G3B6f2fRWfawcyzFghcQlKmdAIX5JjYNauuto7cvSO0'
    range = 'Lessons!A1:D5'
    response = service.get_spreadsheet_values(spreadsheet_id, range)
    puts 'Data from the sheet:'
    puts response.values
  end

  def authorizer
    Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(CREDENTIALS_PATH),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
    )
    #
    # client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    # token_store = Google::Auth::Stores::FileTokenStore.new(file: 'token.yaml')
    # authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    # user_id = 'default'
    # credentials = authorizer.get_credentials(user_id)
    # if credentials.nil?
    #   url = authorizer.get_authorization_url(base_url: OOB_URI)
    #   puts "Open the following URL in your browser and enter the resulting code after authorization:\n" + url
    #   code = gets
    #   credentials = authorizer.get_and_store_credentials_from_code(user_id: user_id, code: code, base_url: OOB_URI)
    # end
    # credentials
  end
end
