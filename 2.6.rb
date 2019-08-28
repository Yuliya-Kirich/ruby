# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

# Это в блокноте на винде прогоняю, когда в дороге. Пусть тут останется, пожалуйста.
# if (Gem.win_platform?)
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__
#
#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

purchases = {}
sum = 0

loop do
  puts "Введите название товара :"
  product = gets.chomp.to_s
  if (product != "стоп".to_s) & (product != "stop")
    puts "Введите цену за единицу товара : "
    unit_price = gets.chomp.to_f
    puts "Введите количество купленного товара : "
    quantity_of_goods = gets.chomp.to_f
    purchases[product] = {unit_price => quantity_of_goods}
  end
  break if (product == "стоп") || (product == "stop")
end

puts purchases

purchases.each do |product_t, amount_of_goods|
  amount_of_goods.each do |unit_price, quantity_of_goods|
    sum += (unit_price * quantity_of_goods)
    puts "Итоговая сумма по товару #{product_t} : #{unit_price * quantity_of_goods}"
  end
end

puts "Итоговая сумма всех покупок в корзине: #{sum}"
