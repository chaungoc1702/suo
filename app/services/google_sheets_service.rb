require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class GoogleSheetsService
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'SuperJLPT'
  CREDENTIALS_PATH = 'secrets/superjlpt-6f080cf0ca49.json'
  SHEET_ID = '1G3B6f2fRWfawcyzFghcQlKmdAIX5JjYNauuto7cvSO0'

  def get_lessons
    get_data('Lessons', 'A1:D5')
  end

  def get_data(sheet, range)
    range = "#{sheet}!#{range}"
    response = api.get_spreadsheet_values(SHEET_ID, range)
    response.values
  end

  private

  def api
    @api ||= begin
      api = Google::Apis::SheetsV4::SheetsService.new
      api.client_options.application_name = APPLICATION_NAME
      api.authorization = authorizer
      api
    end
  end

  def authorizer
    Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(CREDENTIALS_PATH),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
    )
  end
end

# service = GoogleSheetsService.new
# data = service.get_data('Lessons', 'A1:D5')