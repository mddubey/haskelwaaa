--mytake :: (Int a) => [x] -> [x]
mytake a [] = []
mytake a (current:rest)
	| a <= 0 = []
	| otherwise = current : mytake (a-1) rest

main = do
	print $ "***************"
  	print $ mytake 0 [1, 2, 3, 4, 5, 6]
  	--print $ mytake 2 [1, 2, 3, 4, 5]
  	--print $ mytake (-4) [1, 2, 3, 4, 5, 6]
  	--print $ mytake 3 ([1])
  	print $ mytake 3 ([])