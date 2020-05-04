module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_by(name: name)
    toy = Toy.new(name: name) unless toy

    toy.toyable_id = self.id
    toy.toyable_type = self.class.to_s

    toy.save!
  end
end