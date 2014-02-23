--
-- Problem: problem data of sudoku
--

module Sudoku.Problem (
  Problem
, problemToSolution
) where

import Data.Char
import Data.Maybe

import Sudoku.Config
import Sudoku.Solution


type Problem = String

problemToSolution :: Problem -> [Solution]
problemToSolution pr = mapMaybe convert (zip [0..] pr)

convert :: (Position, Char) -> Maybe Solution
convert (p, c)
  | xy == Nothing      = Nothing
  | isValid c == False = Nothing
  | otherwise          = Just (p, digitToInt c)
  where
    xy = posToXy p

isValid :: Char -> Bool
isValid '-' = False          -- official mark of empty
isValid '0' = False          -- invalid number for sudoku
isValid c
  | isDigit c = True
  | otherwise = False
