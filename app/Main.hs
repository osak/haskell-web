{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Web.Scotty

main :: IO ()
main = scotty 3000 $
    get "/hello" $ do
        html "<h1>Hello Scotty!</h1>"
