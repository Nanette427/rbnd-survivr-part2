class Jury
 
  attr_accessor :members

  def initialize
  	@members = []
  end

  # Add a members to the jury: 
  #
  # Params: 
  #  +member+:: the member to add.
  def add_member(member)
  	@members << member
  end

  # Cast the vote for the finalists.
  # Return a hash key is the finalist
  # and value is the number of vote. 
  #
  # Params: 
  #  +finalists+:: array of finalists
  def cast_votes(finalists)
    finalists_size = finalists.size

    votes = Hash.new(0)
    @members.each do |name|
    	random   = Random.new.rand(finalists_size)
    	finalist = finalists[random-1]
    	puts "#{name} vote for #{finalist}"
    	votes[finalist] += 1
    end

  	return votes
  end

  # Create a report of the votes
  #
  # Params: 
  #  +final_votes+:: a hash of vote 
  #    (key == name and value == count)
  def report_votes(final_votes)
  	final_votes.each do |name, count|
  	  puts "#{name}: #{count}"
  	end
  end

  # Return the winner and output them
  # 
  # Params: 
  #  +final_votes+:: a hash of vote 
  #    (key == name and value == count)
  def announce_winner(final_votes)
    winner = final_votes.sort_by {|k,v| v}.last.first
    puts "And the winner is #{winner}".green
    winner
  end

end