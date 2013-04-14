module Handler.Like (getLikeR) where

import Import

getLikeR :: Handler RepHtml
getLikeR = defaultLayout $ do
  setTitle "Stuff I like"
  $(widgetFile "like")
