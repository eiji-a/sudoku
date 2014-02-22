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

tests =  "Sudoku Solution" ~: test_value

test_value = "value" ~:
  test [
    "pos 0" ~: posToXy 0 ~=? (1, 1)
  , "pos 1" ~: posToXy 1 ~=? (2, 1)
  ]

test_conversion = [
  ]
