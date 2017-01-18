class ScreenValidation < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @filter_holders = element(:id, 'row_filter_background')
    @driver = driver
  end

  def filter_visible(filter_name)
    @driver.find_elements(
    @filter_holders[:type], @filter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id, 'row_filter_name').text == filter_name
      print "Filter is visible"
      break
    end
  end

end
