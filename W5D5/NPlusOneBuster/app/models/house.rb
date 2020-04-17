class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO: your code here
    # self.plants.includes(:seeds).select("seeds.*")
    # ^ Why doesn't this work?

    plants_with_seeds = self.plants.includes(:seeds)
    # What is plants at this point?
    
    seeds = []

    plants_with_seeds.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  # DEBUG METHOD
  def plants_with_seeds
    plants_with_seeds = self.plants.includes(:seeds).to_a
  end
end
