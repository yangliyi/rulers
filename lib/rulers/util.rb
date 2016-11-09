module Rulers
  def self.to_underscore(string)
    string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
    # First, to_underscore calls gsub (replace-all) on double-colons with slashes. That’s important in Rails where a constant like “Namespace::Controller” means you want a subdirectory. In your case it’s probably not important.
    # Next, it gsubs any two or more consecutive capital letters followed by a lowercase letter... And replaces it with \1_\2. If you’ve used regular expressions, you know that \1 means “the first thing in parentheses” and \2 means “the second thing in parentheses”.
    # So with a little work, you can see that this would change, say, “BOBSays” into “BOB_Says”. Huh. That’s pretty cool! If you’re
    # having trouble figuring it out, open up irb and start trying things like “BOBSays”.gsub(/([a-z\d])([A-Z])/,'\1_\2') to see what they do.
    # It’s worth trying out each step here if you’re confused.
    # Next, it gsubs from lowercase-number-uppercase to lowercase- number-underscore-uppercase. That is, it changes “a7D” into “a7_D” or “b4M” into “b4_M”.
    # Finally it turns all dashes into underscores, and converts everything to lowercase.
  end
end