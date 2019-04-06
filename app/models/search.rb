class Search < ActiveRecord::Base
  
  def search_locations
    locations = Location.all
    
    locations = locations.where(["address LIKE ?", "%#{keywords}%"])          if keywords.present?
    locations = locations.where(["location_type LIKE ?", location_type])      if location_type.present?
    locations = locations.where(["address LIKE ?", address])                  if address.present?
    locations = locations.where(["address2 LIKE ?", address2])                if address2.present?
    locations = locations.where(["city LIKE ?", city])                        if city.present?
    locations = locations.where(["postal_code LIKE ?", postal_code])          if postal_code.present?
    locations = locations.where(["country LIKE ?", country])                  if country.present?
    locations = locations.where(["reception_phone LIKE ?", reception_phone])  if reception_phone.present?
    
    return locations
  end
  
end
