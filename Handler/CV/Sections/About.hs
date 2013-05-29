module Handler.CV.Sections.About (aboutSection) where

import Prelude
import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Handler.CV.Common (h2, ul, strong, link, cls, section, interspace, p, division)

aboutSection :: (ArrowXml a) => a n XmlTree
aboutSection = section [cls "aboutSection"]
  [ division [cls "row"]
    [ division [cls "span6"]
      [ p $ interspace
        [ strong "About me:"
        , txt "I am a developer and designer with an M.Sc. in Computing Science."
        , txt "I like problems and will attack them until solved."
        , txt "I like to communicate in paint, print, and programming."
        ]
      ]
    , division [cls "span6"]
      [ p $ interspace
        [ strong "About you:"
        , txt "You have a clear, simple vision that you will not compromise."
        , txt "You value quality over quantity."
        , txt "You want more than a mere programmer."
        , txt "You like strong static typing and functional programming."
        , txt "You score at least 10 on the "
        , link "http://www.joelonsoftware.com/articles/fog0000000043.html" "Joel Test"
        , "."
        ]
      ]
    ]
  ]
