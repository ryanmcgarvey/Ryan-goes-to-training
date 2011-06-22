adder =->(x,y){x + y}.curry

add_three = adder[3]
add_four = adder[4]
puts add_three[2]  #=> 5
puts add_four[5]   #=> 9