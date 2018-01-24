module Utilities

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

  def wait_until(timeout=Capybara.default_max_wait_time)
    require "timeout"
    Timeout.timeout(timeout) do
      sleep(0.1) until yield
      true
    end
  rescue
    raise "Failed to go true within #{timeout} seconds."
  end
end
