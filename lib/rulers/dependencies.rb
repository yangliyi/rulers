class Object
  def self.const_missing(c)
    return nil if @calling_const_missing

    @calling_const_missing = true
    require Rulers.to_underscore(c.to_s)
    # Require the controller's file if it exists.
    # e.g. require 'quotes_controller'
    # Would raise LoadError if there's no such file.
    klass = Object.const_get(c)
    # Get the constant after successfully loading the file.
    # Would recurse and not be able to find the constance if
    # the file name and controller name are not following the naming convention.
    @calling_const_missing = false

    klass
  end
end