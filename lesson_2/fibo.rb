# Заполнить массив числами фибоначи до 100
# первые два числа равны либо 1 и 1, либо 0 и 1, а каждое последующее число равно сумме двух предыдущих чисел.
# потратил часа два, хреново когда сложно с матаном, но хабр спасает) надо алгоритмы учиться составлять так и не понял до 144 должно быть или же 100 раз проситать

array = []
fibo = (1..100)
a = 0
b = 1
for n in fibo
  a, b = b, a + b
  array << a
end
puts array

