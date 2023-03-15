def top_three_words(text)
  text = text.gsub(/[^a-zA-Z'\s]/, '') # видаляємо зайві символи
  word_count = Hash.new(0) # сворюємо хеш, щоб визначити кількість повторень кожного слова
  text.split.each do |word| # рахуємо ці повторення
    word_count[word.downcase] += 1
  end
  top_words = word_count.sort_by {|word, count| -count}.map {|word, count| word}[0..2] # визнааємо 3 найбільш повторювані слова та повертаємо їх
  return top_words
end

text = 'In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.'
puts top_three_words(text)