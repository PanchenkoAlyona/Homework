#---------------------------------------------
x1, y1, x2, y2 = ARGV 

case 
when x1 == x2 && y1 == y2 
puts 'Точка найдена!'
when x1 == x2 && y1 != y2 
puts 'х координата верна, y - нет' 
when x1 != x2 && y1 == y2 
puts 'y координата верна, х - нет' 
else 
puts 'Близко, но нет' 
end
#--------------------------------------------------
