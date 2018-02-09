# frozen_string_literal: true

class DashboardsController < ApplicationController
  layout 'application'

  def show
    @data = send(:"provider_data_#{params[:provider]}")
  end

  private

  def provider_data_github
    [
      {
        type: 'number',
        title: 'Antal',
        data: 2
      },
      {
        type: 'table',
        title: 'Pull requests',
        meta: {
          headers: ['Namn', 'Antal PRs', 'Användarnamn']
        },
        data: [
          ['David', 13, 'davidelbe'],
          ['Emric', 2, 'istanful'],
          ['Tobias', 2, 'sandelius'],
          ['Ross', 2, 'alex-ross'],
          ['Kevin', 0, 'kevseamountain']
        ]
      }
    ]
  end

  def provider_data_billogram
    [
      {
        type: 'text',
        title: 'Omsättning i Standout (i wish :))',
        data: '1 000 000 000 SEK'
      }
    ]
  end
end
