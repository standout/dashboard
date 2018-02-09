require 'data_provider/lib/data_provider'

DataProvider.register :billogram, BillogramDataProvider,
  username: Rails.application.secrets.billogram_username,
  password: Rails.application.secrets.billogram_password

DataProvider.register :front, FrontDataProvider,
  token: Rails.application.secrets.front_token
