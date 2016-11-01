module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = cont.capitalize # "People"
      cont += "Controller" # "PeopleController"
      [Object.const_get(cont), action]
      # const_get
      # https://ruby-doc.org/core-2.1.0/Module.html#method-i-const_get
    end
  end
end
