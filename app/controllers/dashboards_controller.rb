# frozen_string_literal: true

class DashboardsController < ApplicationController
  layout 'application'

  def index
    names = DataProvider.providers.to_h.keys.map(&:to_s)
    current = params[:provider] ||= names.first
    next_index = (names.index(current) + 1) % names.size
    @next_provider = names[next_index]
    show
    render :show
  end

  def show
    provider = DataProvider.providers[params[:provider]]
    provider = self if params[:provider] =~ /^mock\// && Rails.env.development?
    raise ActionController::RoutingError, 'Not Found' unless provider
    @data = provider.fetch
  end

  def fetch
    type = params[:provider][5..-1]
    [
      {
        type: 'number',
        title: 'Antal',
        data: 2
      },
      {
        type: 'text',
        title: 'Omsättning i Standout (i wish :))',
        data: '1 000 000 000 SEK'
      },
      {
        type: 'table',
        title: 'Pull requests',
        meta: {
          headers: ['Namn', 'Antal PRs', 'Användarnamn']
        },
        data: [
          ['David', 8, 'davidelbe'],
          ['Emric', 2, 'istanful'],
          ['Tobias', 2, 'sandelius'],
          ['Ross', 2, 'alex-ross'],
          ['Kevin', 0, 'kevseamountain']
        ]
      }
    ].select { |item| item[:type] == type }
  end
end
