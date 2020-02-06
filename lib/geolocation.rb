require 'net/http'
require 'json'

class Geolocation
  
  def initialize(token)
    @token = token
  end

  def location_by_place(place)
    retrieve_data("https://us1.locationiq.com/v1/search.php?key=#{@token}&q=#{place}&format=json")
  end  

  def location_by_coordenates(latitude, longitude)
    retrieve_data("https://us1.locationiq.com/v1/reverse.php?key=#{@token}&lat=#{latitude}&lon=#{longitude}&format=json")
  end

  def nerby_countries(latitude, longitude, radius)
    retrieve_data("https://us1.locationiq.com/v1/nearby.php?key=#{@token}&lat=#{latitude}&lon=#{longitude}&tag=countries&radius=#{radius}&format=json")
  end

  def points_of_interest(latitude, longitude, radius, type)
    retrieve_data("https://us1.locationiq.com/v1/nearby.php?key=#{@token}&lat=#{latitude}&lon=#{longitude}&tag=#{type}&radius=#{radius}&format=json")
  end

  def give_format(data, position = 0, &block)
    puts position
    position == 0 ? block.call(data) : block.call(data,position)
  end
  
  def retrieve_data(url)
    uri = URI(url)
    data = Net::HTTP.get_response(uri)
    parseData(data.body)
  end

  def save_data_in_file(filename, text)
    file = File.new(filename, "w")
    file.puts text
    file.close   
  end
  
  def parseData(data)
    JSON.parse(data)
  end

  private :parseData, :retrieve_data
end

dataWithKeys = lambda do |data|
  text ="Data report: \n" 
    data[0].each do |key, value|
      text += "#{key}: #{value}\n"
    end
    return text
end

points_of_interests = lambda do |data|
  text = "data report\n"
  data.each do |point|
    point.each do |key,value|
      text += "#{key}:#{value}\n"
    end
    text += "-----------\n"
  end
  return text
end

geolocation = Geolocation.new("44fcebb8c5c660")
puts geolocation.give_format( geolocation.points_of_interest(19.4326009, -99.1333416, 4000, 'restaurant' ), &points_of_interests)





