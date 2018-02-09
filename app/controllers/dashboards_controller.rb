# frozen_string_literal: true

class DashboardsController < ApplicationController
  layout 'application'

  def show
    provider = DataProvider.providers[params[:provider]]
    raise ActionController::RoutingError, 'Not Found' unless provider
    @data = provider.fetch
  end
end
