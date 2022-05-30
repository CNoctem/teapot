module Main where

import Web.Scotty
import Network.HTTP.Types (status418)

main :: IO ()
main = do

  scotty 8083 $ do
    get "/status" $ do
      status status418
      text "Everything is hunky-dory."


