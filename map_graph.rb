# map, class file that sets up the city on a map and its index
class MapGraph
  # Method: this gets the index and city
  def get_index_and_city_name(city)
    index = if city == 'Enumerable Canyon'
              0
            elsif city == 'Duck Type Beach'
              1
            elsif city == 'Monkey Patch City'
              2
            elsif city == 'Nil Town'
              3
            elsif city == 'Matzburg'
              4
            elsif city == 'Hash Crossing'
              5
            elsif city == 'Dynamic Palisades'
              6
            end
    index
  end
end
