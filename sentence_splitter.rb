def sentence_splitter(sentence, limit)
  sentence.join.scan(/.{1,#{limit}}/)
end

sentence = ['hola', 'este', 'es', 'un', 'nuevo', 'mensaje']

puts sentence_splitter(sentence, 10)