{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Web.Scotty
import Data.Aeson
import Data.Aeson.KeyMap as KM
import Network.HTTP.Types.Status
import Data.Text.Lazy as L

main :: IO ()
main = scotty 3000 $ do
    get "/hello" $
        html "<h1>Hello Scotty!</h1>"

    post "/hello" $ do
        payload <- jsonData :: ActionM Object
        case KM.lookup "name" payload of
                Just f -> case f of
                                String n -> html $ L.fromStrict $ "<h1>Hello " <> n <> "</h1>"
                                _ -> raiseStatus status400 "Wrong type for name field"
                Nothing -> raiseStatus status400 "Missing name field"
