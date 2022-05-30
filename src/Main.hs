module Main where

import Web.Scotty
import Network.HTTP.Types (status418)
--import Web.Scotty.Resource.Trans (resource, get, post)
--import Web.Scotty.Trans (scottyT, text, body, raw, status, param)

main :: IO ()
main = do

  scotty 8083 $ do
    get "/status" $ do
      status status418
      text "Everything is hunky-dory."


