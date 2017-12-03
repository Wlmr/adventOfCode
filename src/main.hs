module AoC where
import Data.List
import Data.Char
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
