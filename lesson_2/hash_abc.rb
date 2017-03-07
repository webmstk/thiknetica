# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
# просто говнокод( как научится писать красиво?потратил минут 50, по документации rubydoc, зато сам

vowels = ('a'..'z').to_a
number = (1..vowels.to_a.size).to_a

vowels = vowels.zip(number).to_h
puts vowels.select { |v| v =~ /[aeiouy]/ }

