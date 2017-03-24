class Shopper < ApplicationRecord
	has_many :styles
	has_many :memos
end

