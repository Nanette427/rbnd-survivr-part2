class Jury
 
  attr_writer :members

  @@members = []

  def initialize
  	@@members = []
  end

  def add_member(member)
  	@@members << member
  end

  def members
  	return @@members
  end

  def cast_votes(finalists)
  	votes = Hash.new(0)
  	
  	finalists.each do |finalist|
  	  votes[finalist] += 1	  
  	end
  	
  	return votes
  end

end