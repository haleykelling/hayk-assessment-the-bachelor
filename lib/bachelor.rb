require 'pry'

def get_first_name_of_season_winner data, season 
  winner_info = data[season].find do |contestant|
    contestant["status"] == "Winner"
  end
  winner_info["name"].split(" ").first
end

def all_contestants_from_all_seasons data
  all_contestants_info = []
  data.each do |season_number, contestants|
    all_contestants_info.concat contestants
  end
  all_contestants_info
end

def get_contestant_name data, occupation 
  all_contestants_info = all_contestants_from_all_seasons data
  key_contestant = all_contestants_info.find do |contestant|
    contestant["occupation"] == occupation
  end
  key_contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants_info = all_contestants_from_all_seasons data
  hometown_buddies = all_contestants_info.select do |contestant|
    contestant["hometown"] == hometown
  end
  hometown_buddies.length
end

def get_occupation(data, hometown)
  all_contestants_info = all_contestants_from_all_seasons data
  key_contestant = all_contestants_info.find do |contestant|
    contestant["hometown"] == hometown
  end
  key_contestant["occupation"]
end

def get_average_age_for_season(data, season)
  sum_of_ages = data[season].reduce(0) do |sum, contestant|
    sum + contestant["age"].to_i
  end
  sum_of_ages.fdiv(data[season].length).round
end
