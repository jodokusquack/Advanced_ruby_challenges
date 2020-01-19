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
  return array, array.length-n
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
  return array, array.length-n
end
  

print bubble_sort([3,2,1,0,0,0,0,0,0]) , "\n"
print bubble_sort([4,3,78,2,0,2]), "\n"

print bubble_sort_by(["hiiiiiiiii", "hello", "hey"]) {|left, right| left.length - right.length}

