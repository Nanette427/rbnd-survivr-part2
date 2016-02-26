class Tribe 

  attr_accessor :name, :members

  def initialize(options)
  	@name    = options[:name]
  	@members = options[:members] 
  	puts "The members of #{name} are:".light_cyan if !@members.empty?
  	@members.each do |member|
  		puts member.name
  	end
  end

  # Return name of the tribe
  def to_s
  	@name
  end

  # Return the elimintated candidate
  # 
  # Params: 
  #   +options+:: a hash of options (optionnal)
  #     +immune+:: the immune candidate
  def tribal_council(options={})
    immune          = options[:immune]
  	votable_members = self.members
    votable_members.delete_if { |member|  member == immune }
  	votes           = Hash.new(0)
    members.each do |member|
	    random           = Random.new.rand(votable_members.size)
      vote_for         = votable_members[random - 1]
      votes[vote_for] += 1
  	end
    votes.sort_by {|k,v| v}.last.first  
  end

end