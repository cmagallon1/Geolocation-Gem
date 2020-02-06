# Geolocation-Gem

Geolocation is a gem which provides an easy way to retrieve information about any place that you want to
know

#Instalation

  To install the gem you have to execute the following command:
  > gem install geolocation

# Usage
To be able to use this gem, you have to create an account in the website called locationiq and get the token, this will be needed to initialize the objetc
## Methods

  With this gem you have a few method that you could apply to you code:
  
  | Method | Parameters | Description |
  | :---  | :---      | :---      |
  |location_by_place | place | Provides all the locations about the place passed as parameter in a json format, the place must be a string | 
  |location_by_coordenates   | latitude, longitude | Provides all the data about the place based in his coordenates, both parameters must be numbers |
  |nerby_countries           | latitude, longitude, radius | Provides all the nerby countries of a place based in its coordenates and the radius provided|
  |points_of_interest        | latitude, longitude, radius, type | Provides all the data about places of a certain type based in the coordenates and radius|
  |save_data                 | filename, text | This method saves the text in a file with the name and content provided |
  |give_format   | data, &block, position(optional) | This method returns the response of any of the precede methods, using the lambda passed in the *&block* variable, and taking the position of the response that will be processed, if this parameter is not provides first position will be taken|

## Example

  You can initialize an object like this :
  > Geolocation.new(token)<br>

 Here token is the token that you get when created the account in locationiq<br>
 Because this gem tries to apply the strategy pattern the method *give_format* uses a lambda to give a format to the response done to the api based in the needs of the developer and the way in which he wants to show the data, so you can do something like this:

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

    geolocation = Geolocation.new(token)<br>
    puts geolocation.give_format( geolocation.points_of_interest(19.4326009, -99.1333416, 4000, 'restaurant' ), &points_of_interests)
