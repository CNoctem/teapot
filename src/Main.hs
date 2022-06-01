{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# OPTIONS_GHC -fno-cse #-}


module Main where

import Web.Scotty as S
import Network.HTTP.Types (status418)
import System.Console.CmdArgs
import GHC.Generics
import Data.Aeson

main :: IO ()

data Config = Config { port :: Int
                     , nodeId :: String
                     , nodeName :: String
                     } deriving (Show, Data, Typeable, Generic )

config :: Config
config = Config { port = 8000, nodeId = "NID01", nodeName = "NN0A1" }

instance ToJSON Config

main = do

  cnf <- cmdArgs config
  
  scotty (port cnf) $ do
    get "/" $ do
      status status418
      text "root\n"
    get "/status" $ do
      status status418
      text "Everything is hunky-dory."
    get "/info" $ do
      status status418
      S.json cnf
