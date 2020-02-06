# Geolocation-Gem

Geolocation is a gem which provides an easy way to retrieve information about any place that you want to
know

#Instalation

  To install the gem you have to execute the following command:
  > gem install geolocation

# Usage
 ## Methods
  With this gem you have a few method that you could apply to you code:
  
  | Method | Parameters | Description |
  | :---:  | :---:      | :---:      |
  |location_by_place | place | Provides all the locations about the place passed as parameter in a json format, the place must be a string | 
  |location_by_coordenates   | latitude, longitude | Provides all the data about the place based in his coordenates, both parameters must be numbers |
  |nerby_countries           | latitude, longitude, radius | Provides all the nerby countries of a place based in its coordenates and the radius provided|
  |points_of_interest        | latitude, longitude, radius, type | Provides all the data about places of a certain type based in the coordenates and radius|
  |give_format                   |
