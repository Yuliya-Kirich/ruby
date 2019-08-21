# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

  vowels = Hash.new
  alphabet = Hash[(:а..:я).to_a.zip((1..32).to_a)]
  alphabet.each{|key, value|
if key == :а
  vowels[key] = value
elsif key == :е
  vowels[key] = value
elsif key == :и
  vowels[key] = value
elsif key == :о
  vowels[key] = value
elsif key == :у
  vowels[key] = value
elsif key == :э
  vowels[key] = value
elsif key == :ю
  vowels[key] = value
elsif key == :я
  vowels[key] = value
end
  }
  puts vowels