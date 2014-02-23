--
-- Solution: tests of Solution module
--

module UnitTest.Sudoku.Solution where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck
import Test.HUnit
import Test.QuickCheck

import Sudoku.Solution

main :: IO ()
main = defaultMain testSuite

testSuite = hUnitTestToTests $ tests

tests = "Sudoku Solution" ~: [
    "posToXy" ~:
    test [
      "pos 0" ~: posToXy 0 ~=? Just (1, 1)
    , "pos 1" ~: posToXy 1 ~=? Just (2, 1)
    , "pos 40" ~: posToXy 40 ~=? Just (5, 5)
    , "pos 80" ~: posToXy 80 ~=? Just (9, 9)
    , "pos -1" ~: posToXy (-1) ~=? Nothing
    , "pos -5" ~: posToXy (-5) ~=? Nothing
    , "pos 81" ~: posToXy 81 ~=? Nothing
    ]
  , "xyToPos" ~:
    test [
      "xy 1,1" ~: xyToPos (1,1) ~=? Just 0
    , "xy 2,1" ~: xyToPos (2,1) ~=? Just 1
    , "xy 9,9" ~: xyToPos (9,9) ~=? Just 80
    , "xy 0,0" ~: xyToPos (0,0) ~=? Nothing
    , "xy -1,0" ~: xyToPos ((-1),0) ~=? Nothing
    , "xy 10,9" ~: xyToPos (10,9) ~=? Nothing
    , "xy 9,10" ~: xyToPos (9,10) ~=? Nothing
    ]
  ]

test_conversion = [
  ]
