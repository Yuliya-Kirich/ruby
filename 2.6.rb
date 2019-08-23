# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".



if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


  purchases = {}
  price_and_quantity = {}
  total_amount = []
  total_amount_of_goods = {}
  sum = 0

loop do
  puts "Введите название товара :"
  product = gets.chomp.to_s

if  (product != "стоп".to_s) & (product != "stop")

  puts "Введите цену за единицу товара : "
  unit_price = gets.chomp
  puts "Введите количество купленного товара : "
  quantity_of_goods = gets.chomp

  purchases [product] = {unit_price => quantity_of_goods}
#  total_amount << (unit_price.to_f * quantity_of_goods.to_f)
  total_amount_of_goods [product] = (unit_price.to_f * quantity_of_goods.to_f)
end

break if  (product == "стоп") || (product == "stop")
end

  puts purchases
  total_amount_of_goods.each do |name_product, total|
  puts "Итоговая сумма по товару #{name_product} : #{total}"
  sum += total
  end
  puts "Итоговая сумма всех покупок в корзине: #{sum}"