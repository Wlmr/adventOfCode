module AoC where
import Data.List
import Data.Char
import System.IO
import System.Directory



--1st millisec
inverseCaptcha :: String -> Int
inverseCaptcha str = foldl acc 0 $ filter ((>1).length) $ group cyclic
  where
    cyclic = str++[head str]
    acc p lst = p + (digitToInt (head lst) * (length lst - 1))


inverseCaptcha' ::  String -> Int
inverseCaptcha' [x] = 0
inverseCaptcha' (x:xs)
  | digitToInt x == digitToInt (head xs) = digitToInt x + inverseCaptcha' xs
  | otherwise = 0 + inverseCaptcha' xs

--2nd millisec

delta :: String -> String
delta s = show $ maximum ints - minimum ints
  where
    ints = map read $ words s

--main = do
--    handle <- openFile "2nd.txt" ReadMode
--    contents <- hGetContents handle
--    let rader = lines contents
--    putStr $ show . sum . map read $ map delta rader
--    hClose handle


--3rd millisec
spiral 1 = 0
spiral n = frames + pos
  where
    pos     = abs $ mod (n - last squares) (frames*2) - frames
    frames  = length squares
    squares = takeWhile (< n) $ map (^2) [1,3..]


--4th millisec

isPassphrase :: [String] -> Int
isPassphrase [x] = 1
isPassphrase (x:xs)
  | null (elemIndices x xs) = isPassphrase xs
  | otherwise               = 0



main = do
  handle <- openFile "4th.txt" ReadMode
  contents <- hGetContents handle
  let phrases = lines contents
  putStr $ show . sum $ map (isPassphrase . words) phrases
