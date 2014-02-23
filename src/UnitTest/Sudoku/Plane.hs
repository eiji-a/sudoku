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
  ]