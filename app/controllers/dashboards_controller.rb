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

  private

  def not_found_provider
    NotFoundDataProvider.new(cache: Rails.cache)
  end

  def provider
    return self if params[:provider] =~ %r{^mock/} && Rails.env.development?
    providers[params[:provider]] || not_found_provider
  end

  def providers
    DataProvider.providers
  end
end
