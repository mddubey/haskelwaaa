--import Debug.Trace

--myreduce :: (a -> b -> b) -> b -> [a] -> b

multiply x y = x * y

myreduce f b [] = b

myreduce f b (current:rest) = myreduce f (f b current) rest  

main = do
	print $ "***************"
  	print $ myreduce (*) 1 [1, 2, 4]
  