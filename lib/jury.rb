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
    	puts "#{name} vote for #{finalist}"
    	votes[finalist] += 1
    end

  	return votes
  end

  def report_votes(final_votes)
  	final_votes.each do |name, count|
  	  puts "#{name}: #{count}"
  	end
  end

  def announce_winner(final_votes)
    winner = final_votes.sort_by {|k,v| v}.last.first
    puts "And the winner is #{winner}"
    winner
  end

end