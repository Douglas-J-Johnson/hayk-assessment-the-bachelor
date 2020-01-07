require 'pp'

def get_contestants_by_season(data, season_to_find)
  #Returns an array of contestants in data for the specified "season_to_find"
  data.each do |season, contestants|
    if season == season_to_find then
      return contestants
    end
  end

  return []
end

def get_all_contestants(data)
  all_contestants = []

  data.each do |season, contestants|
    all_contestants += contestants
  end

  return all_contestants
end

def get_first_name_of_season_winner(data, season)
  get_contestants_by_season(data, season).each do |contestant_data|
    if contestant_data["status"] == "Winner" then
      return contestant_data["name"].split(" ")[0]
    end
  end

  return ""
end

def get_contestant_name(data, occupation)
  get_all_contestants(data).each do |contestant_data|
    if contestant_data["occupation"] == occupation then
      return contestant_data["name"]
    end
  end
  
  return ""
end

def count_contestants_by_hometown(data, hometown)
  num_contestants_in_hometown = 0

  get_all_contestants(data).each do |contestant_data|
    if contestant_data["hometown"] == hometown then
      num_contestants_in_hometown += 1
    end
  end

  return num_contestants_in_hometown
end

def get_occupation(data, hometown)
  get_all_contestants(data).each do |contestant_data|
    if contestant_data["hometown"] == hometown then
      return contestant_data["occupation"]
    end
  end

  return ""
end

def get_average_age_for_season(data, season)
  season_contestants = get_contestants_by_season(data, season)
  total_age = 0.0
  num_contestants = season_contestants.length

  if num_contestants > 0 then
    season_contestants.each do |contestant_data|
      total_age += contestant_data["age"].to_f
    end
  else
    return 0
  end

  return (total_age/num_contestants).round
end
