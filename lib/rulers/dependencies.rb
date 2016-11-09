class Object
  def self.const_missing(c)
    require Rulers.to_underscore(c.to_s)
    # Require the controller's file if it exists.
    # e.g. require 'quotes_controller'
    # Would raise LoadError if there's no such file.
    Object.const_get(c)
    # Get the constant after successfully loading the file.
    # Would recurse and not be able to find the constance if
    # the file name and controller name are not following the naming convention.
  end
end