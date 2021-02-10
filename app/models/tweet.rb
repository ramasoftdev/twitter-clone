class Tweet < ApplicationRecord
    belongs_to :user

    validates_length_of :twett_content, maximum: 280
end
