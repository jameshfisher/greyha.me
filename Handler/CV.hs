module Handler.CV where

import Import


import Prelude hiding (span, div)
import Text.XML.HXT.Core (runLA, LA, ArrowXml, XmlTree, mkelem, txt, sattr, writeDocumentToString)
import Text.Blaze.Internal (preEscapedText, Markup)
import Text.Lucius (luciusFile)
import Data.Text (pack)
import Control.Arrow ((>>>))

import Handler.CV.Common (mk, section, cls, division, p, link)

import Handler.CV.Sections.Top (topSection)
import Handler.CV.Sections.About (aboutSection)
import Handler.CV.Sections.Education (educationSection)
import Handler.CV.Sections.Experience (experienceSection)
import Handler.CV.Sections.Skills (skillsSection)

getCVR :: Handler RepHtml
getCVR = defaultLayout $ do
  setTitle "CV: James Fisher"
  $(widgetFile "cv")
  toWidgetHead $ [hamlet|
<meta name="description" content="Curriculum Vitae for James Fisher" />
<meta name="keywords" content="James Fisher, James Harrison Fisher, CV, Curriculum Vitae, resume, eegg" />
|]
  -- TODO: convert to blaze-html!

conv :: LA () XmlTree -> Markup
conv x = preEscapedText $ pack $ head $ (runLA $ x >>> (writeDocumentToString [])) ()