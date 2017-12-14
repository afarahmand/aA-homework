def nsquared(fish)
  fish.each_with_index do |fish1, i1|
    shorter_fish_tally = []
    fish.each_with_index do |fish2, i2|
      if fish1.length > fish2.length
        shorter_fish_tally.push(1)
      end
    end

    return fish1 if !shorter_fish_tally.include?(0)
  end
end

def merge_sort(arr)
  prc = Proc.new { |x, y| x <=> y }

  return arr if count <= 1

  mid = count / 2
  left = merge_sort(arr[0..mid-1])
  right = merge_sort(arr[mid..-1])

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged.concat(left)
  merged.concat(right)

  merged
end

def clever(fish)
  longest_fish = ''
  fish.each{|fish| longest_fish = fish if fish.length > longest_fish.length}
  longest_fish
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

sluggish = nsquared(fish)
dominant = merge_sort(fish)[0]
clever = clever(fish)

puts "Sluggish: #{sluggish}"
puts "Dominant: #{dominant}"
puts "Clever: #{clever}"


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each do |tile|
    if tile == direction
      return tiles_array.index(tile)
    end
  end
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
