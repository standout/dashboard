require 'data_provider/lib/data_provider'

DataProvider.register :front, FrontDataProvider, token: Rails.application.secrets.front.token
