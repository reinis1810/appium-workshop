class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @parameter_holders[:type], @parameter_holders[:value]
      ).displayed?
    end
  end

  def set_name(text_name)
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).click
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).send_keys(text_name)
  end

  def set_price(from, to)
    @driver.find_elements(
    @parameter_holders[:type], @parameter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id, 'parameter_name').text == 'CENA (EUR)'
      row.find_element(:id, 'left_param').send_keys(from)
      row.find_element(:id, 'right_param').send_keys(to)
      break
    end
  end

  def set_area(from, to)
    @driver.find_elements(
    @parameter_holders[:type], @parameter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id, 'parameter_name').text == 'PLATĪBA (M2)'
      row.find_element(:id, 'left_param').send_keys(from)
      row.find_element(:id, 'right_param').send_keys(to)
      break
    end
  end

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end



end
