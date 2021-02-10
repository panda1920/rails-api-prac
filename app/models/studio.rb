class Studio < ApplicationRecord
    has_many :games

    enum studio_type: %i[firstParty secondParty thirdParty]
end
