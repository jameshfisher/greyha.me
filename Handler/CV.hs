module Handler.CV where

import Import


import Prelude hiding (span, div)
import Text.XML.HXT.Core (runLA, LA, ArrowXml, XmlTree, mkelem, txt, sattr, writeDocumentToString)
import Text.Blaze.Internal (preEscapedText, Markup)
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
  toWidgetHead $ [hamlet|
<link rel="stylesheet" type="text/css" href="http://eegg.github.com/style/css/common.css" />
<link rel="stylesheet" type="text/css" href="/static/css/cv.css" />
<meta name="description" content="Curriculum Vitae for James Fisher" />
<meta name="keywords" content="James Fisher, James Harrison Fisher, CV, Curriculum Vitae, resume, eegg" />
|]
  -- From an old CV
  -- TODO: convert to blaze-html!
  [whamlet|
<div .photo>
<h1>James Fisher
<div>#{conv topSection}
<div>#{conv aboutSection}
<div>#{conv educationSection}
<div>#{conv skillsSection}
<div>#{conv experienceSection}
<div .endNode .print>
  <p>
    This document is available at #
    <a href="http://eegg.github.com/cv">http://eegg.github.com/cv/
    .
  <section .screen #formats>
    <a href="cv.txt"><img src="/static/img/cv/txt.png" alt="Get the plaintext"/>
    <a href="cv.txt"><img src="/static/img/cv/acrobat.png" alt="Get the PDF"/>
|]

conv :: LA () XmlTree -> Markup
conv x = preEscapedText $ pack $ head $ (runLA $ x >>> (writeDocumentToString [])) ()