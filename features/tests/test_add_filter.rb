class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def select_category(category)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row category
  end

  def select_type
    @screens.screen_select_sub_category.visible?('Nekustamie īpašumi')
    @screens.screen_select_sub_category.select_sub_category 'Zeme'
  end

  def select_district
    @screens.screen_select_sub_category.visible?('Zeme')
    @screens.screen_select_sub_category.select_sub_category 'Ventspils un rajons'
  end

  def select_town
    @screens.screen_select_sub_category.visible?('Ventspils un rajons')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def select_action
    @screens.screen_select_sub_category.visible?('Darbība')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def submit_empty_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def set_filter_name
    @screens.screen_set_filter_parameters.set_name 'Filtrs 1'
  end

  def set_price_name
    @screens.screen_set_filter_parameters.set_price '100', '1000'
  end

  def set_area_name
    @screens.screen_set_filter_parameters.set_area '50', '500'
  end

  def filter_visible
    sleep(3)
    @screens.screen_validation.filter_visible 'Filter 1'
  end

  def create_empty_filter
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    submit_empty_filter_parameters
  end

  def create_filter
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    set_filter_name
    set_price_name
    set_area_name
    submit_filter_parameters
  end
end
