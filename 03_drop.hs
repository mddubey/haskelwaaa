--mydrop :: (Int a) => [x] -> [x]
mydrop a [] = []
mydrop a (current:rest)
	| a <= 0 = current:rest
	| otherwise = mydrop (a-1) rest


main = do
	print $ "***************"
  	print $ mydrop 0 [1, 2, 3, 4, 5, 6]
  	print $ mydrop 2 [1, 2, 3, 4, 5]
  	print $ mydrop (-4) [1, 2, 3, 4, 5, 6]
  	print $ mydrop 3 ([1]) -- not able to handle [] case
  	--print $ mydrop 3 ([])