def bubble_sort(array)
  n = array.length - 1
  (array.length-1).times do
    switched = false
    n.times do |i|
      (array[i] , array[i+1] = array[i+1], array[i] if array[i] > array[i+1]) && switched = true
    end
    break unless switched
    n -= 1
  end
  return array
end

def bubble_sort_by(array)
  n = array.length - 1
  (array.length-1).times do
    switched = false
    n.times do |i|
      if yield(array[i] , array[i+1]) > 0
        array[i] , array[i+1] = array[i+1], array[i] 
        switched = true
      end
    end
    break unless switched
    n -= 1
  end
  return array
end
