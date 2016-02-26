class Game

  attr_accessor :tribes

  def initialize(tribe1, tribe2)
     @tribes = [tribe1, tribe2]
  end

  # Add a tribe to the game
  #
  # Params: 
  #  +tribe+:: A tribe
  def add_tribe(tribe)
  	@tribes <<  tribe
  end

  # Return the imnunne tribe
  def immunity_challenge
  	@tribes.sample
  end

  # Clear all the tribes
  # Return an empty array
  def clear_tribes
  	@tribes = []
  end

  # Merged all game tribes into a single tribe.
  # 
  # Params: 
  #  +combined_tribe+: name of the new tribe
  def merge(combined_tribe)
    combined_tribe = Tribe.new(name: combined_tribe, members: [])
    
    @tribes.each do |tribe|
   	  combined_tribe.members << tribe.members
    end

    combined_tribe.members = combined_tribe.members.flatten
    combined_tribe
  end

  # Return the immune contestant 
  def individual_immunity_challenge
  	all_members = []
 
  	@tribes.each do |tribe|
      all_members << tribe.members
  	end

  	all_members.flatten.sample
  end

end