# frozen_string_literal: true

ENV['DASHBOARD_CYCLE_SECONDS'] ||= (Rails.env.development? ? '5' : '10')
