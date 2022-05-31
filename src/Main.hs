module Main where

import Web.Scotty
import Network.HTTP.Types (status418)

main :: IO ()
main = do

  scotty 8000 $ do
    get "/" $ do
      status status418
      text "root\n"
    get "/status" $ do
      status status418
      text "Everything is hunky-dory.\n"
    


