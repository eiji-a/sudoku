--
-- Plane: tests of Plane module
--

module UnitTest.Sudoku.Plane where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck
import Test.HUnit
import Test.QuickCheck

import Sudoku.Plane

main :: IO ()
main = defaultMain testSuite

testSuite = hUnitTestToTests $ tests

tests = "Sudoku Plane" ~: [
    "init Plane" ~: test_init
  , "merge Planes" ~: test_merge
  ]

test_init = test [
    "init" ~: initPlane ~=? "----------------------------------------" ++
                            "-----------------------------------------"
  ]

test_merge = test [
    "- <= ?" ~: mergePlane "---" "-01" ~=? Just "-01"
  , "? <= -" ~: mergePlane "-01" "---" ~=? Just "-01"
  , "0 <= 0" ~: mergePlane "000" "0-0" ~=? Just "000"
  , "1 <= 1" ~: mergePlane "111" "1-1" ~=? Just "111"
  , "0 <= 1" ~: mergePlane "-0-" "111" ~=? Nothing
  , "1 <= 0" ~: mergePlane "-1-" "000" ~=? Nothing
  , "- <= 2" ~: mergePlane "---" "222" ~=? Nothing
  , "2 <= 2" ~: mergePlane "222" "222" ~=? Nothing
  ]