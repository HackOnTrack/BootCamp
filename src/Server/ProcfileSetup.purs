module ProfileSetup where
  
import Prelude

import Data.Array as Array
import Data.Foldable (foldM, foldl)
import Data.Int as Int
import Data.Newtype (wrap, unwrap)
import Data.Tuple (Tuple(..), uncurry)
import Effect (Effect)
import Pure.Entities.Tank as Tank
import Pure.Game.Main as Main
import Pure.RunningGameList as Rgl
import Pure.Runtime.Scene (Game)
import Pure.Runtime.Scene as Scene
import Pure.Types (EntityCommand, GameEvent)
