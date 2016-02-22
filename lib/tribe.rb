class Tribe 

  attr_accessor :name, :members

  def initialize(options)
  	@name    = options[:name]
  	@members = options[:members] 
  	puts "#{name}:"
  	@members.each do |member|
  		puts member.name
  	end
  end

  def to_s
  	@name
  end

  def tribal_council(immune)
  	votable_members = self.members
    votable_members.delete(immune) 
  	votes           = Hash.new(0)
    members.each do |member|
	    random           = Random.new.rand(votable_members.size)
      vote_for         = members[random - 1]
      votes[vote_for] += 1
  	end
    [votes.sort_by {|k,v| v}.last.first]
  end

end