module DashboardHelper
  def dashboard_cycle_seconds_html_safe
    ENV['DASHBOARD_CYCLE_SECONDS'].to_i.to_json.html_safe
  end
end
