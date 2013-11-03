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
        , txt "I am a software developer and designer with an M.Sc. in Computing Science with a distinction."
        ]
      ]
    , division [cls "span6"]
      [ p $ interspace
        [ strong "About you:"
        , txt "You have a clear vision without compromise."
        , txt "You value quality over quantity."
        , txt "You want more than a mere programmer."
        , txt "You like strongly typed functional programming."
        , txt "You score at least 10 on the "
        , link "http://www.joelonsoftware.com/articles/fog0000000043.html" "Joel Test."
        ]
      ]
    ]
  ]
