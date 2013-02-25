{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Home where

import Import

getHomeR :: Handler RepHtml
getHomeR = defaultLayout $ do
  setTitle "greyha.me"
  addStylesheet $ StaticR js_tweet_jquery_tweet_css
  addScriptRemote "http://code.jquery.com/jquery-1.9.1.min.js"
  addScript $ StaticR js_tweet_jquery_tweet_js
  $(widgetFile "homepage")
