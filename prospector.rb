# Prospector Class, this searches for rubies
class Prospector
  def initialize(map, map_graph)
    @map = map
    @map_graph = map_graph
    @fake_rubies_total = 0
    @rubies_total = 0
    @cities_visited = 1
    @num_days = 0
    setup_table
  end

  # Method to search for rubies at a location
  def find(iteration, city)
    iteration = iteration.to_i
    city = city.to_i
    return nil if iteration < 0 || city < 0 || city >= 7

    success = 1
    if iteration < 6
      loop do
        @num_days += 1
        real_rubies = rand(@table[city][0]).to_i
        puts "      Found #{real_rubies} ruby in #{@map[city][0]}." if
          real_rubies == 1
        puts "      Found #{real_rubies} rubies in #{@map[city][0]}." if
          real_rubies > 1
        @rubies_total += real_rubies
        fake_rubies = rand(@table[city][1]).to_i
        puts "      Found #{fake_rubies} fake ruby in #{@map[city][0]}." if
          fake_rubies == 1
        puts "      Found #{fake_rubies} fake rubies in #{@map[city][0]}." if
          fake_rubies > 1
        @fake_rubies_total += fake_rubies
        puts "      Found no rubies or fake rubies in #{@map[city][0]}." if
          real_rubies.zero? && fake_rubies.zero?
        break if real_rubies.zero? && fake_rubies.zero?
      end
    end
    success
  end

  # Random Number Generator for seed
  def gen_rand_num(seed, range)
    seed = seed.to_i
    return nil if seed <= 0

    rng2 = Random.new(seed)
    num = rng2.rand(range) + 1
    num
  end

  # Method to pick next city to visit
  def pick_next_city(curr_city, seed)
    curr_city = curr_city.to_i
    return nil if curr_city < 0 || curr_city >= 7

    range = 1
    range = @map[curr_city].length - 1 unless @map[curr_city].length <= 1
    next_city = gen_rand_num(seed, range).to_i

    next_city += 1 if next_city.zero?
    return nil if next_city.nil?

    if @cities_visited < 6
      print "Heading from #{@map[curr_city][0]} to
        #{@map[curr_city][next_city]}."
      puts
    end
    # Gets next_city location on map to return
    @cities_visited += 1
    city = @map_graph.get_index_and_city_name(@map[curr_city][next_city])
    city
  end

  # Method to keep track of prospectors locations visited.
  # @return 1
  def no_of_location
    1
  end

  # Set up table for max rubies to be found
  # Index 0 = real_rubies,
  # Index 1 = fake_rubies
  def setup_table
    @table = [[1, 1], [2, 2], [1, 1], [0, 3], [3, 0], [2, 2], [2, 2]]
  end

  # Method to display prospectors results
  def print_end(prospector)
    prospector = prospector.to_i
    return nil if prospector <= 0

    puts "After #{@num_days} days Rubyist ##{prospector} found:"
    if @rubies_total == 1
      puts "      #{@rubies_total} ruby"
    else
      puts "      #{@rubies_total} rubies"
    end
    if @fake_rubies_total == 1
      puts "      #{@fake_rubies_total} fake ruby"
    else
      puts "      #{@fake_rubies_total} fake rubies"
    end
    if @rubies_total >= 10
      puts 'Going home victorious!'
    elsif @rubies_total.zero?
      puts 'Going home empty-handed.'
    elsif @rubies_total >= 1 || @rubies_total <= 9
      puts 'Going home sad'
    end
    puts "\n\n"
    1
  end
end
