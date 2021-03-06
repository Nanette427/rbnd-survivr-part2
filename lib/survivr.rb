require "colorizer"
require "string_header"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi",   members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


# This is where you will write your code for the three phases

# In phase one:
#   - Tribes compete in 8 immunity challenge. 
#   - There is a losing tribe every time.
#   - Eliminated 1 candidate from the loosing team
def phase_one
  puts "Phase 1".to_header.light_yellow
  8.times do |round|
    immunity_looser      = @borneo.immunity_challenge
    eliminated_candidate = immunity_looser.tribal_council
    immunity_looser.members.delete(eliminated_candidate)
    puts "For round #{round + 1}: #{eliminated_candidate.name.red} is out"
  end
end


# In phase 2, a single tribe of 12 contestants.
#   - Compete in 3 additional individual immunity challenges.
#   - The winner of every challenge is immune from being eliminated.
#   - One contestant is eliminated after every challenge.
#   - After 3 eliminations, there are 9 remaining contestants.
def phase_two
  puts "Phase 2".to_header.light_yellow
  3.times do |round|
    immune               = @borneo.individual_immunity_challenge
    eliminated_candidate = @merge_tribe.tribal_council(immune: immune)
    @merge_tribe.members.delete(eliminated_candidate)
    puts "For round #{round + 1}: #{eliminated_candidate.name.red} is out"
  end
end

# In phase 3:
#   - 7 more challenges with an “immune” winner.
#   - Each contestant that is eliminated go in the jury.
#   - This leaves 2 finalists and 7 jury members.
def phase_three
  puts "Phase 3".to_header.light_yellow
  7.times do |round|
    immune               = @borneo.individual_immunity_challenge
    eliminated_candidate = @merge_tribe.tribal_council(immune: immune)
    @merge_tribe.members.delete(eliminated_candidate)
    @jury.members << eliminated_candidate
    puts "For round #{round + 1}: #{eliminated_candidate.name.red} is out"
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists    = @merge_tribe.members #set finalists
puts "Cast final votes".to_header.light_yellow
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts "Announces".to_header.light_yellow
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
