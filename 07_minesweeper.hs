import System.IO
import Data.List
import Debug.Trace

data Square = OPEN | CLOSE Int | FLAG deriving Show

grid = [[CLOSE 1,CLOSE 0,CLOSE 1]
      ,[CLOSE 0,CLOSE 1,CLOSE 0]
      ,[CLOSE 1,CLOSE 0 ,CLOSE 0]]

--check whether or not game is over
check OPEN _ = True
check FLAG _ = True
check (CLOSE 1) "O" = False
check (CLOSE 1) "F" = True
check (CLOSE 0) "O" = True
check (CLOSE 0) "F" = True

replace row y newSquare = do
  let (c,_:cs) = splitAt y row
  c ++ newSquare : cs

--apply the changes on grid
apply grid x y "O" = do
  let newRow = replace (grid !! 1) y OPEN
  let (c,_:cs) = splitAt x grid
  c ++ newRow : cs

apply grid x y "F" = do
  let newRow = replace (grid !! 1) y FLAG
  let (c,_:cs) = splitAt x grid
  c ++ newRow : cs
  
prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine

--display the grid

map_square (OPEN) = "O"
map_square (CLOSE _) = "C"
map_square (FLAG) = "F"

display_line line = map map_square line
display_grid grid = mapM_ putStrLn ((map (intercalate ", ") (map display_line grid)))

start grid = do
  print $ grid
  print $ "Here is your grid"
  display_grid grid

  input <- prompt "Enter the x coordinate:"  
  let x = read input :: Int

  input <- prompt "Enter the y coordinate:"  
  let y = read input :: Int

  input <- prompt "Enter the action:"  
    
  if not (check (grid !! x !! y) input) 
    then print $ "Game Over"
    else do 
      let grid = apply grid x y input
      start grid


main = start grid
