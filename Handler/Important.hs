module Handler.Important where

import Import

shitThatsImportant =
  [ [hamlet|People are living on the streets. I walk right past them.|]
  , [hamlet|Old people won't be around much longer.|]
  ]
shitThatsNotImportant = 
  [ [hamlet|Your shiny new iPhone 7.|]
  , [hamlet|The front page of <a href="http://reddit.com/r/all">r/all</a>, <a href="http://reddit/r/programming">/r/programming</a>, etc.|]
  ]

getImportantR :: Handler RepHtml
getImportantR = defaultLayout $ do
  setTitle "Shit that's important"
  $(widgetFile "important")