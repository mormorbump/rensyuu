module Addressable
	extend ActiveSupport::Concern

	included do
		with_options presence: true do
			validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/}
			validates :area
			validates :city
			validates :block_number
			validates :phone_number, format:{with:/\A\d{11}\z/}
		end
	end
end