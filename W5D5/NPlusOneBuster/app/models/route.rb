# == Schema Information
#
# Table name: routes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  # # My broken version
  # def better_drivers_query
  #   # TODO: your code here
  #   buses = self.buses.includes(:drivers)

  #   hash = {}

  #   buses.each do |bus|
  #     hash[bus.id] = bus.drivers.to_a
  #   end

  #   hash
  # end

  # Working version
  def better_drivers_query
    buses = self.buses.includes(:drivers)

    hash = {}

    buses.each do |bus|
      drivers = []

      bus.drivers.each do |driver|
        drivers << driver.name
      end

      hash[bus.id] = drivers
    end

    hash    
  end

end
