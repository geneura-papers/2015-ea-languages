-- Data.Vector.Unboxed allows for a specialised and more efficient representation
-- of a boolean vector.
import Data.Vector.Unboxed.Mutable as V
import Data.Vector.Unboxed as U
import Control.Monad.Primitive
import Control.Monad
import Control.Monad.Random
import System.Random
import Data.List

iterations = 100000
len = 5

-- Flips the given bit in a mutable vector, returns an action in m.
bitflip :: (PrimMonad m) => MVector (PrimState m) Bool -> Int -> m ()
bitflip v i = do
  x <- unsafeRead v i
  unsafeWrite v i (not x)

-- Sequences the reading of every element in a mutable vector.
toPrintList :: (PrimMonad m, Unbox a) => MVector (PrimState m) a -> m [a]
toPrintList v = sequence [V.read v n | n <- [0..V.length v-1]]

-- Creates a random boolean list, given a generator
randomBoolList :: (Random a) => Int -> StdGen -> [a]
randomBoolList n = Data.List.take n . Data.List.unfoldr (Just . random)

-- Creates a random boolean list, given a generator and a range
randomIntList :: Int -> (Int,Int) -> StdGen -> [Int]
randomIntList n (a,b) = Data.List.take n . Data.List.unfoldr (Just . (randomR (a,b)))

main :: IO ()
main = do
  -- Random vector
  vector <- V.replicate len False
  let seed = mkStdGen 1
  let rs = (randomBoolList len seed) :: [Bool]
  sequence $ Prelude.map (\n -> write vector n (rs!!n)) [0..len-1]

  -- Printing
  Main.toPrintList vector >>= print

  -- Random bitflips
  let seed2 = mkStdGen 2
  let res = (randomIntList iterations (0,len-1) seed2) :: [Int]
  sequence $ Prelude.map (\pos -> bitflip vector pos) res

  -- Printing
  Main.toPrintList vector >>= print
  return ()
