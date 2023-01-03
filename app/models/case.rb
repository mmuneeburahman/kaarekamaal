class Case < ApplicationRecord
    belongs_to :user

    def self.close_case(case_id)
        c = self.find(case_id)
        c.update(is_closed: true)        
    end
end
