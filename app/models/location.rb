class Location < ActiveRecord::Base
    
    has_many :departments
    has_many :employees
    
    def self.search(search)
        if search
            where(["address LIKE ?", "%#{search}%"])
        else
            all
        end
    end
    
end
