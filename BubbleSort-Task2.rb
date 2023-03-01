def bubble_sort(array)
    array_length = array.size
    return array if array_length <= 1

    loop do
      swapped = false
      (array_length-1).times do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swapped = true
        end
      end
      break if not swapped
    end
    array
end

  puts'The array length: '
  n = readline
  num = n.to_i
  x = 0
  unsorted_array = Array.new
  while num > 0 do
    puts'The array element: '
    a = readline
    b = a.to_i
    unsorted_array[x]=b
    x = x + 1
    num = num - 1
  end

  puts 'Before:'
  puts unsorted_array
  puts 'After:'
  puts bubble_sort(unsorted_array)
