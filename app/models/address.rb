class Address < ApplicationRecord
  belongs_to :customer

  def pan
    "〒" + postal_code + " " + address + " " + name
  end
end
