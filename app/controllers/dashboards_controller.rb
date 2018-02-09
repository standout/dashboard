# frozen_string_literal: true

class DashboardsController < ApplicationController
  layout 'application'

  def show
    @data = DataProvider.providers[params[:provider]].fetch
  end
end
