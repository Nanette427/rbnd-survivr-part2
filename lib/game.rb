class Game

  attr_accessor :tribes

  def initialize(tribe1, tribe2)
     @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
  	@tribes <<  tribe
  end

  def immunity_challenge
  	@tribes.sample
  end

  def clear_tribes
  	@tribes = []
  end

  def merge(combined_tribe)
    combined_tribe = Tribe.new(name: combined_tribe, members: [])
    
    @tribes.each do |tribe|
   	  combined_tribe.members << tribe.members
    end

    combined_tribe.members = combined_tribe.members.flatten
    combined_tribe
  end

  def individual_immunity_challenge
  	all_members = []
 
  	@tribes.each do |tribe|
      all_members << tribe.members
  	end

  	all_members.flatten.sample
  end

end