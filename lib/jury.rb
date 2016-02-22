class Jury
 
  attr_accessor :members

  def initialize
  	@members = []
  end

  def add_member(member)
  	@members << member
  end

  def cast_votes(finalists)
  	votes = Hash.new(0)
  	
    @members.each do |name|
    	random = Random.new.rand(2)
    	finalist = finalists[random-1]
    	puts finalist
    	votes[finalist] += 1
    end

  	return votes
  end

end