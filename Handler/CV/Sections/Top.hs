module Handler.CV.Sections.Top (topSection) where

import Import

import Prelude
import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Handler.CV.Common (h2, ul, strong, link, cls, section, attrVal, email, obscure, csv, item, mk, trs, prop, htmlSpan, division)
import Handler.CV.Links (mkLink, Link(LinkMeLinkedIn, LinkMeBitbucket, LinkMeGitHub, LinkMeReddit))

-- WIP
topSection' = [hamlet|
<section itemscope="itemscope" itemtype="http://data-vocabulary.org/Person">
  <span style="display: none;" itemprop="name">James Harrison Fisher
  <div .row>
    <div .span8>
      <table .table .table-condensed .table-quiet>
        <tbody>
          <tr>
            <th>Birth date
            <td>October 1987
          <tr>
            <th>Address
            <td>
|]

topSection :: (ArrowXml a) => a n XmlTree
topSection = section (item "http://data-vocabulary.org/Person")
  [ htmlSpan [sattr "style" "display: none;", prop "name"] [txt "James Harrison Fisher"]
  , division [cls "row"]
    [ division [cls "span8"]
      [ mkelem "table" [cls "table table-condensed table-quiet"]
        [ mk "tbody" $ trs
          [ attrVal [txt "Birth date"] [] [txt "October 1987"]
          , attrVal [txt "Address"] ([prop "address"]++(item "http://data-vocabulary.org/Address")) $ csv
              [ htmlSpan [prop "locality"] [txt "Highgate"]
              , htmlSpan [prop "region"] [txt "London"]
              , htmlSpan [prop "postal-code"] [txt "N6 4AG"]
              ]
          , attrVal [txt "Email"] [] [email "jameshfisher@gmail.com"]
          , attrVal [txt "Mobile"] [] [txt $ obscure "07951 498 897"]
          , attrVal [txt "Find me on"] [] $ csv $ map mkLink [ LinkMeLinkedIn, LinkMeBitbucket, LinkMeGitHub, LinkMeReddit ]
          ]
        ]
      ]
    , division [cls "span4"]
      [ division [cls "photo"] []
      ]
    ]
  ]
