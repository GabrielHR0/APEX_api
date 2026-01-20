class Permission < ApplicationRecord
    validates :action, inclusion: { 
        in: %w[read create update delete destroy manage export reorder] 
    }
end
