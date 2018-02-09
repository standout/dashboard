# frozen_string_literal: true

class DashboardsController < ActionController::Base
  def show
    @data = [
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
          ['David', 999, 'davidelbe'],
          ['Emric', 2, 'istanful'],
          ['Tobias', 2, 'sandelius'],
          ['Ross', 2, 'alex-ross'],
          ['Kevin', 0, 'kevseamountain']
        ]
      }
    ]
  end
end