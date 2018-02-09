require 'data_provider/lib/data_provider'

DataProvider.register :front, FrontDataProvider, token: Rails.secrets.front.token
