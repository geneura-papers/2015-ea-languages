-- Data.Vector.Unboxed allows for a specialised and more efficient representation
-- of a boolean vector.
import Data.Vector.Unboxed.Mutable as V
import Data.Vector.Unboxed as U
import Control.Monad.Primitive
import Control.Monad

iterations = 100000
len = 16

-- Flips the given bit in a mutable vector, returns an action in m.
bitflip :: (PrimMonad m) => MVector (PrimState m) Bool -> Int -> m ()
bitflip v i = do
  x <- unsafeRead v i
  unsafeWrite v i (not x)

-- Sequences the reading of every element in a mutable vector.
toPrintList :: (PrimMonad m, Unbox a) => MVector (PrimState m) a -> m [a]
toPrintList v = sequence [V.read v n | n <- [1..V.length v-1]]


main :: IO [Bool]
main = do
  -- Random vector
  vector <- V.replicate len False

  -- Random bitflips
  bitflip vector 1

  -- Printing
  Main.toPrintList vector
