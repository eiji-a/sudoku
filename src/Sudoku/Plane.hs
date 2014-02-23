--
-- Plane: data plane of each number
--

module Sudoku.Plane (
  Plane
, emptyT
, notAppT
, fillT
, initPlane
, mergePlane
) where

import Data.Maybe

import Sudoku.Config

-- Plane containes three type of char.
--  '-': empty
--  '0': N/A
--  '1': filled the value
type Plane = String

emptyT  = '-'
notAppT = '0'
fillT   = '1'

initPlane :: Plane
initPlane = map emptyType [0..(boardSize^2 - 1)]

emptyType :: Int -> Char
emptyType _ = emptyT

mergePlane :: Plane -> Plane -> Maybe Plane
mergePlane [] [] = Just []
mergePlane (x:xs) (y:ys)
  | res == Nothing  = Nothing
  | res' == Nothing = Nothing
  | otherwise       = Just ((fromJust res) : (fromJust res'))
  where
    res = mergeVal x y
    res' = mergePlane xs ys

mergeVal :: Char -> Char -> Maybe Char
mergeVal '-' y = Just y
mergeVal x '-' = Just x
mergeVal x y
  | x == y    = Just x
  | otherwise = Nothing
