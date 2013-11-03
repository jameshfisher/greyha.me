module Handler.CV.Sections.Top (topSection) where

import Import

import Prelude
import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Handler.CV.Common (h2, ul, strong, link, cls, section, attrVal, email, obscure, csv, item, mk, trs, prop, htmlSpan, division)

-- WIP
topSection' = [hamlet|
<section itemscope="itemscope" itemtype="http://data-vocabulary.org/Person">
  <span style="display: none;" itemprop="name">James Harrison Fisher
  <div .row>
    <div .span8>
      <table .table .table-nopadding .table-quiet>
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
      [ mkelem "table" [cls "table table-nopadding table-quiet table-fix-first-col"]
        [ mk "tbody" $ trs
          [ attrVal [txt "Birth date"] [] [txt "October 1987"]
          , attrVal [txt "Address"] ([prop "address"]++(item "http://data-vocabulary.org/Address")) $ csv
              [ htmlSpan [prop "locality"] [txt "Finchley Central"]
              , htmlSpan [prop "region"] [txt "London"]
              ]
          , attrVal [txt "Email"] []
            [ email "jameshfisher@gmail.com"
            , txt " (", link "/static/keys/public.gpg" "public key", txt ")"
            ]
          , attrVal [txt "Mobile"] [] [txt $ obscure "07951 498 897"]
          ]
        ]
      ]
    ]
  ]
