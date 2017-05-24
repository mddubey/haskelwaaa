import System.Environment
import Data.List
import Debug.Trace

--readLines = fmap lines . readFile
--split ls = splitAt (length ls `div` 2) ls
--trace ("input a: " ++ show (transpose metrix))
contains list word = do 
	let line = (intercalate "" list)
	if isInfixOf word line then True else isInfixOf (reverse word) line

chars = [["a","b","r","e"]
        ,["e","m","u","n"]
        ,["s","w","b","t"]
        ,["o","e","y","s"]]

contains_word metrix word =  if any (\x -> contains x word) metrix then True else any (\x -> contains x word) (transpose metrix)

main = do
    args <- getArgs;
    print $ "***************";
  	print $ contains_word chars (args !! 0)
