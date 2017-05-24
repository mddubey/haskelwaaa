type FirstName = String
type SecondName = String

let toFirst :: String -> FirstName; toFirst x = x
let toSecond :: String -> SecondName; toSecond x = x
let printSec :: SecondName -> SecondName; printSec x = x

main = print $ toSecond "ABC"