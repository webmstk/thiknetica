# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

cart = {}

product_name = ""
product_price = ""
product_quantity = ""

puts "Введите имя товара "
product_name = gets.chomp

until product_name == "stop"
  puts "Введите цену товара "
  product_price = gets.to_f

  puts "Введите количество товара "
  product_quantity = gets.to_f

  cart[product_name] = { quantity: product_quantity, price: product_price }

  puts "Введите имя товара "
  product_name = gets.chomp

end

total_price = 0

cart.each do |name, price_quantity|
  total_price_item = 0
  total_price_item += price_quantity[:price] * price_quantity[:quantity]
  total_price += total_price_item
  puts "Стоймость товара \"#{name}\": #{total_price_item}"
end

puts "Итоговая сумма: #{total_price}"



