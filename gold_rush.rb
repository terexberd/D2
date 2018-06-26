require_relative 'location'
require_relative 'prospector'
# Gold Rush Main Class
class GoldRush
  def self.initialize(seed, num_prospectors)
    @prng = Random.new(seed)
    @days = 0
    @loc_num = 1
    @dorado = Location.new('El Dorado Canyon', nil, nil, nil, nil)
    @midas = Location.new('Midas', nil, @dorado, nil, nil)
    @virginia = Location.new('Virginia City', nil, nil, @midas, @dorado)
    @nevada = Location.new('Nevada City', nil, nil, nil, nil)
    @coloma = Location.new('Coloma', @virginia, nil, nil, nil)
    @angels = Location.new('Angels Camp', @nevada, @virginia, nil, nil)
    @sutter = Location.new('Sutter Creek', @angels, @coloma, nil, nil)

    @dorado.forward_path1 = @midas
    @dorado.forward_path2 = @virginia
    @midas.forward_path1 = @virginia
    @virginia.forward_path1 = @angels
    @virginia.forward_path2 = @coloma
    @nevada.forward_path1 = @angels
    @coloma.forward_path2 = @sutter
    @angels.forward_path3 = @sutter
    @locs = [@sutter, @coloma, @dorado, @midas, @virginia, @nevada, @angels]
    @prospectors = []

    (1..num_prospectors).each do |i|
      @prospectors += [Prospector.new("Prospector ##{i}", 0, 0)]
    end
  end

  def self.set_location
    @current_location = @locs[0]
  end

  def self.check_current_location(prospector)
    if @current_location == @sutter
      @g_found = @prng.rand(3)
      prospector.num_gold += @g_found
      if @g_found == 1
        puts "	Found #{@g_found} ounce of gold in Sutter Creek."
        @days += 1
      elsif @g_found > 1
        puts "	Found #{@g_found} ounces of gold in Sutter Creek."
        @days += 1
      end

      while @g_found > 0 && @loc_num < 4
        @g_found = @prng.rand(3)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Sutter Creek."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Sutter Creek."
          @days += 1
        end
      end

      while @g_found > 1 && @loc_num > 4
        @g_found = @prng.rand(3)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Sutter Creek."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Sutter Creek."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Sutter Creek."
      @days += 1

    elsif @current_location == @coloma
      @g_found = @prng.rand(4)
      prospector.num_gold += @g_found
      if @g_found == 1
        puts "	Found #{@g_found} ounce of gold in Coloma."
        @days += 1
      elsif @g_found > 1
        puts "	Found #{@g_found} ounces of gold in Coloma."
        @days += 1
      end

      while @g_found > 0 && @loc_num < 4
        @g_found = @prng.rand(4)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Coloma."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Coloma."
          @days += 1
        end
      end

      while @g_found > 1 && @loc_num > 4
        @g_found = @prng.rand(4)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Coloma."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Coloma."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Coloma."
      @days += 1

    elsif @current_location == @angels
      @g_found = @prng.rand(5)
      prospector.num_gold += @g_found
      if @g_found == 1
        puts "	Found #{@g_found} ounce of gold in Angels Camp."
        @days += 1
      elsif @g_found > 1
        puts "	Found #{@g_found} ounces of gold in Angels Camp."
        @days += 1
      end

      while @g_found > 0 && @loc_num < 4
        @g_found = @prng.rand(5)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Angels Camp."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Angels Camp."
          @days += 1
        end
      end

      while @g_found > 1 && @loc_num > 4
        @g_found = @prng.rand(5)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Angels Camp."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Angels Camp."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Angels Camp."
      @days += 1
    elsif @current_location == @nevada
      @g_found = @prng.rand(6)
      prospector.num_gold += @g_found
      if @g_found == 1
        puts "	Found #{@g_found} ounce of gold in Nevada City."
        @days += 1
      elsif @g_found > 1
        puts "	Found #{@g_found} ounces of gold in Nevada City."
        @days += 1
      end

      while @g_found > 0 && @loc_num < 4
        @g_found = @prng.rand(6)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Nevada City."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Nevada City."
          @days += 1
        end
      end

      while @g_found > 1 && @loc_num > 4
        @g_found = @prng.rand(6)
        prospector.num_gold += @g_found
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Nevada City."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Nevada City."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Nevada City."
      @days += 1

    elsif @current_location == @virginia
      @g_found = @prng.rand(4)
      @s_found = @prng.rand(4)
      prospector.num_gold += @g_found
      prospector.num_silver += @s_found
      if @s_found == 1
        puts "	Found #{@s_found} ounce of silver in Virginia City."
        @days += 1
      elsif @s_found > 1
        puts "	Found #{@s_found} ounces of silver in Virginia City."
        @days += 1
      end

      if @g_found == 1
        puts "	Found #{@g_found} ounce of gold in Virginia City."
        @days += 1
      elsif @g_found > 1
        puts "	Found #{@g_found} ounces of gold in Virginia City."
        @days += 1
      end

      while (@s_found > 0 && @loc_num < 4) || (@g_found > 0 && @loc_num < 4)
        @s_found = @prng.rand(4)
        @g_found = @prng.rand(4)
        prospector.num_gold += @g_found
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in Virginia City."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in Virginia City."
          @days += 1
        end

        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Virginia City."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Virginia City."
          @days += 1
        end

      end

      while (@s_found > 2 && @loc_num > 4) || (@g_found > 1 && @loc_num > 4)
        @s_found = @prng.rand(4)
        @g_found = @prng.rand(4)
        prospector.num_silver += @s_found
        prospector.num_gold += @g_found
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in Virginia City."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in Virginia City."
          @days += 1
        end
        if @g_found == 1
          puts "	Found #{@g_found} ounce of gold in Virginia City."
          @days += 1
        elsif @g_found > 1
          puts "	Found #{@g_found} ounces of gold in Virginia City."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Virginia City."
      @days += 1

    elsif @current_location == @midas
      @s_found = @prng.rand(6)
      prospector.num_silver += @s_found
      if @s_found == 1
        puts "	Found #{@s_found} ounce of silver in Midas."
        @days += 1
      elsif @s_found > 1
        puts "	Found #{@s_found} ounces of silver in Midas."
        @days += 1
      end

      while @s_found > 0 && @loc_num < 4
        @s_found = @prng.rand(6)
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in Midas."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in Midas."
          @days += 1
        end
      end

      while @s_found > 2 && @loc_num > 4
        @s_found = @prng.rand(6)
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in Midas."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in Midas."
          @days += 1
        end
      end
      puts "\tFound no precious metals in Midas in Midas."
      @days += 1

    elsif @current_location == @dorado
      @s_found = @prng.rand(11)
      prospector.num_silver += @s_found
      if @s_found == 1
        puts "	Found #{@s_found} ounce of silver in El Dorado Canyon."
        @days += 1
      elsif @s_found > 1
        puts "	Found #{@s_found} ounces of silver in El Dorado Canyon."
        @days += 1
      end

      while @s_found > 0 && @loc_num < 4
        @s_found = @prng.rand(11)
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in El Dorado Canyon."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in El Dorado Canyon."
          @days += 1
        end
      end

      while @s_found > 2 && @loc_num > 4
        @s_found = @prng.rand(11)
        prospector.num_silver += @s_found
        if @s_found == 1
          puts "	Found #{@s_found} ounce of silver in El Dorado Canyon."
          @days += 1
        elsif @s_found > 1
          puts "	Found #{@s_found} ounces of silver in El Dorado Canyon."
          @days += 1
        end
      end
      puts "\tFound no precious metals in El Dorado Canyon."
      @days += 1
    end
  end

  def self.print_location(prospector, way)
    if way.zero?
      print "Heading from #{@current_location.location} to #{@current_location.forward_path1.location}, "
      puts "holding #{prospector.num_gold} ounces of gold and #{prospector.num_silver} ounces of silver."
      @current_location = @current_location.forward_path1
    elsif way == 1
      print "Heading from #{@current_location.location} to #{@current_location.forward_path2.location}, "
      puts "holding #{prospector.num_gold} ounces of gold and #{prospector.num_silver} ounces of silver."
      @current_location = @current_location.forward_path2
    elsif way == 2 && !@current_location.forward_path3.nil?
      print "Heading from #{@current_location.location} to #{@current_location.forward_path3.location}, "
      puts "holding #{prospector.num_gold} ounces of gold and #{prospector.num_silver} ounces of silver."
      @current_location = @current_location.forward_path3
    elsif way == 3 && !@current_location.forward_path4.nil?
      print "Heading from #{@current_location.location} to #{@current_location.forward_path4.location}, "
      puts "holding #{prospector.num_gold} ounces of gold and #{prospector.num_silver} ounces of silver."
      @current_location = @current_location.forward_path4
    else
      puts "Error"
      abort
    end

  end

  def self.way_generator(num)
    @way = @prng.rand(num)
    if (num<0)
      puts "Error"
      abort
    end
  end

  def self.gold_rush_go(prospector)
    i = 0
    while i < 4
      way_generator(4)
      way_generator(3) if @way == 3 && @current_location.forward_path4.nil?
      way_generator(2) if @way == 2 && @current_location.forward_path3.nil?
      @way = 0 if @way == 1 && @current_location.forward_path2.nil?
      check_current_location(prospector)
      print_location(prospector, @way)
      @loc_num += 1
      i += 1
    end
    check_current_location(prospector)
  end

def self.calculate(gnum, snum)
      total = gnum * 20.67 + snum * 1.31
      total = (total * 100).round / 100.0
end

  def self.run
    @prospectors.each do |prospector|
      set_location
      puts "#{prospector.prospector_name} starting in Sutter Creek."
      gold_rush_go(prospector)

      total = calculate(prospector.num_gold, prospector.num_silver)
      print "After #{@days} days, #{prospector.prospector_name}"
      puts ' returned to San Francisco with:'

      if prospector.num_gold == 1
        puts "	#{prospector.num_gold} ounce of gold."
      else
        puts "	#{prospector.num_gold} ounces of gold."
      end
      if prospector.num_silver == 1
        puts "	#{prospector.num_silver} ounce of silver."
      else
        puts "	#{prospector.num_silver} ounces of silver."
      end

      puts "	Heading home with $#{total}."
      puts "\t"
      @days = 0
      @loc_num = 1
    end
  end

  def self.argpass
    args = ARGV
    args.to_a
  end

  def self.argchecker(args)
    if args.length == 2
      if args[0].to_i > 0 && args[1].to_i > 0
        @seed = args[0].to_i
        @num_prospectors = args[1].to_i
      else
        puts('Usage:')
        puts('ruby gold_rush.rb *seed* *num_prospectors*')
        puts('*seed* should be an integer')
        puts('*num_prospectors* should be a non-negative integer')
        abort
      end
      initialize(@seed, @num_prospectors)
      run
    else
      puts('Usage:')
      puts('ruby gold_rush.rb *seed* *num_prospectors*')
      puts('*seed* should be an integer')
      puts('*num_prospectors* should be a non-negative integer')
      abort
    end
  end
  argchecker(argpass)
end
