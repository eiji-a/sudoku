--
-- Solution: solution of one position on the board
--

module Sudoku.Solution (
  Position
, Value
, Solution
, posToXy
, xyToPos
, solutionX
, solutionY
, solutionVal
) where

import Data.Maybe

import Sudoku.Config

type Position = Int
type Value    = Int
type Solution = (Position, Value)

posToXy :: Position -> Maybe (Int, Int)
posToXy pos
  | pos < 0            = Nothing
  | pos >= boardSize^2 = Nothing
  | otherwise          = Just (x, y)
  where
    x = pos `mod` boardSize + 1
    y = pos `div` boardSize + 1

xyToPos :: (Int, Int) -> Maybe Position
xyToPos (x,y) 
  | p < 0            = Nothing
  | p >= boardSize^2 = Nothing
  | otherwise        = Just p
  where
    p = (x - 1) + (y - 1) * boardSize

solutionX :: Solution -> Maybe Int
solutionX (p, v)
  | xy == Nothing = Nothing
  | otherwise     = Just (fst (fromJust(xy)))
  where
    xy = posToXy p

solutionY :: Solution -> Maybe Int
solutionY (p, v)
  | xy == Nothing = Nothing
  | otherwise     = Just (snd (fromJust(xy)))
  where
    xy = posToXy p

solutionVal :: Solution -> Value
solutionVal (p, v) = v


