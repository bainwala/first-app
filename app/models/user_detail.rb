class UserDetail < ApplicationRecord
    after_initialize :init

    def init
      self.username ||= "John Doe"
      self.wins  ||= 0
      self.losses ||=0
      self.current_tokens ||=100          
    end
end
