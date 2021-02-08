class AddressAdmin < ApplicationRecord
  belongs_to :admin, optional: true
  include Addressable
end
