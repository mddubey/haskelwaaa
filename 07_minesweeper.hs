import System.IO

data Square = Mine | Okey deriving Show

grid = [[Mine,Okey,Okey],[Okey,Mine,Mine],[Okey,Mine,Okey]]

prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine

check Mine = print $ "Game Over"
check Okey = do
	print $ "It's not a Mine. Continue"
  	input <- prompt "Enter the x coordinate:"
  	let x = read input :: Int

  	input <- prompt "Enter the y coordinate:"
  	let y = read input :: Int
  	check (grid !! x !! y)

main = do
    input <- prompt "Enter the x coordinate:"  
    let x = read input :: Int

    input <- prompt "Enter the y coordinate:"  
    let y = read input :: Int
    print $ check (grid !! x !! y)
