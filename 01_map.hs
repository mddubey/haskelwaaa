add x =  x+5

mymap f [] = []
mymap f(current:rest) = f current : mymap f rest
main = do 
	print $ mymap (add) [1,2,3] 