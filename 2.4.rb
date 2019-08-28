# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

# frozen_string_literal: true

my_hash = {}
('а'..'я').each.with_index(1) do |val, index|
  my_hash[val] = index if %w[а е и о у э ю я].include?(val)
end
puts my_hash
