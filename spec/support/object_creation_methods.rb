module ObjectCreationMethods
  def new_address(overrides = {})
    defaults = {state: "CO", zip: 80204}
    Address.new(defaults.merge(overrides))
  end

  def create_address(overrides = {})
    new_address(overrides).save!
  end

  def new_shop(overrides = {})
    defaults = {name: "Coffee Shop"}
    Shop.new(defaults.merge(overrides))
  end

  def create_shop(overrides = {})
    new_shop(overrides).save!
  end
end
