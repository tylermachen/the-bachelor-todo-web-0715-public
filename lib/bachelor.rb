def get_first_name_of_season_winner(data, season)
  name = nil
  data[season].each { |c| name = c["name"].split if c["status"] == "Winner" }
  name[0]
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each { |attribute| return attribute["name"] if attribute["occupation"] == occupation }
  end
end

def count_contestants_by_hometown(data, hometown)
  c = 0
  data.each do |season, contestants|
    contestants.each { |contestant| c += 1 if contestant["hometown"] == hometown }
  end
  c
end

def get_occupation(data, hometown)
  data.each { |s, c| c.each { |c| return c["occupation"] if c["hometown"] == hometown }}
end

# testing out how abstract I can make the method; this much abstraction may be too much.
def get_average_age_for_season(data, season)
  a = []; data[season].each { |c| a << c["age"].to_f }; (a.reduce(:+) / a.count).round
end
