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
  , "extract Plane" ~: test_extract
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

test_extract = test [
    "row 1" ~: extractRow p 1 ~=? "123456781"
  , "row 8" ~: extractRow p 8 ~=? "198765432"
  , "col 1" ~: extractCol p 1 ~=? "198763219"
  , "col 9" ~: extractCol p 9 ~=? "987654321"
  , "blk 1,1" ~: extractBlk p 1 1 ~=? "123912891"
  , "blk 3,3" ~: extractBlk p 3 3 ~=? "543432321"
  ]
  where
    p =  "123456789"
      ++ "912345678"
      ++ "891234567"
      ++ "789123456"
      ++ "678912345"
      ++ "321987654"
      ++ "219876543"
      ++ "198765432"
      ++ "987654321"

