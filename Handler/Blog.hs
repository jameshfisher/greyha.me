module Handler.Blog where

import Import

getBlogR :: Handler RepHtml
getBlogR = defaultLayout $ do
  setTitle "Blog"
  $(widgetFile "blog")