# Заполнить массив числами фибоначи до 100
# первые два числа равны либо 1 и 1, либо 0 и 1, а каждое последующее число равно сумме двух предыдущих чисел.

fibo  = [ 1, 1 ]

while fibo.size <= 100
  fibo << fibo[-2] + fibo[-1]
end

puts fibo
