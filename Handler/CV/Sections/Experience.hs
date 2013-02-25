module Handler.CV.Sections.Experience (experienceSection) where

import Prelude
import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Handler.CV.Common (mk, h2, ul, strong, link, cls, section, attrVal, trs, csvAnd, em, p, q)
import Handler.CV.Links (mkLink, Link(LinkYUDU, LinkSoftwire, LinkJava, LinkEnterpriseJavaBeans, LinkSpring, LinkAS3, LinkGit, LinkLexdenMontessori, LinkHSK, LinkUBM, LinkHSBC, LinkCSCI, LinkCaringHomes, LinkGilgilTrust, LinkPembrokeHouse))

experienceSection :: (ArrowXml a) => a n XmlTree
experienceSection = section [cls "experienceSection"]
  [ h2 "Experience"
  , mkelem "table" [cls "table table-quiet"]
    [ mk "tbody" $ trs [ yudu, lm, gilgilTrust, pembrokeHouse, hsk, caringHomesDB, caringHomesVarious ]
    ]
  ]

yudu, lm, gilgilTrust, pembrokeHouse, hsk, caringHomesDB, caringHomesVarious :: (ArrowXml a) => [a n XmlTree]

yudu =
  attrVal [txt "May 2012–present"] [] $
  [ strong "Software Developer at ", mk "strong" [mkLink LinkYUDU], txt ". "
  , txt "I am currently the lead in a team of three YUDU developers "
  , txt " working alongside the YUDU team at ", mkLink LinkSoftwire
  , txt ". I am working on feature requests, bug fixes, and maintenance of the code-base for client-side and server-side software. "
  , txt "Technologies used include "] ++ (csvAnd [mkLink LinkJava, mkLink LinkEnterpriseJavaBeans, mkLink LinkSpring, mkLink LinkAS3, mkLink LinkGit]) ++ 
  [ txt "."
  ]

lm =
  attrVal [txt "2006–present"] [] $
  [ txt "Director and Secretary of ", mk "strong" [mkLink LinkLexdenMontessori], txt ", a nursery in Colchester. "
  , txt "I have worked in business planning, market research and advertising, administration and secretarial duties, and web design and maintenance for "
      , mkelem "a" [sattr "href" "http://www.lexdenmontessori.com"] [txt "www.", strong "lexdenmontessori.com"]
      , txt "."
  ]

gilgilTrust =
  attrVal [txt "2012–present"] [] $
  [ txt "Branding, marketing consultancy, and web design for "
  , mk "strong" [mkLink LinkGilgilTrust]
  , txt ", an organization providing young people around the town of Gilgil in Kenya with shelter, health-care, and help in their education and careers."
  ]

pembrokeHouse =
  attrVal [txt "2010"] [] $
  [ p
    [ txt "Branding for "
    , mk "strong" [mkLink LinkPembrokeHouse]
    , txt " a private Kenyan prep school."
    ]
  , p
    [ txt " In the words of their Commercial Director, "
    , mk "q"
      [ txt "James has worked with me on new brand designs for Harambee Schools Kenya ", em "(see below)"
      , txt " a charity, and Pembroke House school, a prep school. In both cases his work was of the highest quality, and reflected a passion for design, but also for getting under the skin of the organisation he is designing for. I wouldn't hesitate to use James again for any design projects that I might have."
      ]
    ]
  ]

hsk =
  attrVal [txt "2010"] [] $
  [ p
    [ txt "Branding and web design for ", mk "strong" [ mkLink LinkHSK ]
    , txt " a charity building schools around Gilgil in rural Kenya."
    ]
  , p
    [ mk "strong" [ link "http://onlinemarketing.gwsmedia.com/2010/11/2nd-objective-of-charity-website-design.html" "GWS Media gave the website an award" ]
    , txt ", commending its ", q "plain, clear English; striking design, and beautiful images."
    , txt " To date, the new branding and website is known to have directly brought in ", strong "£53,000 of funding"
    , txt " including from ", mkLink LinkUBM, txt " (the global media and comms giant) and ", mkLink LinkHSBC, txt " who made HSK their official corporate charity after finding the website."
    ]
  ]

caringHomesDB =
  attrVal [txt "2009"] []
  [ txt "Developing an internal database-driven system for managing care homes and ", mkLink LinkCSCI
  , txt " for ", mk "strong" [mkLink LinkCaringHomes]
  , txt "."
  ]

caringHomesVarious =
  attrVal [txt "2008"] []
  [ txt "Various responsibilities at ", mk "strong" [mkLink LinkCaringHomes]
  , txt ", including accountancy and financial planning, due diligence, insurance of plant, and remote I.T. support."
  ]

      {-<!--<tr>
        <th>2005</th>
        <td>First prize in a sixth-form art competition</td>
      </tr>
      <tr>
        <th>2004&ndash;6</th>
        <td>I.T. technician at <a href="http://www.crgs.co.uk/">Colchester Royal Grammar School</a></td>
      </tr>
      <tr>
        <th>2004&ndash;5</th>
        <td>Membership in a <strong><a href="http://www.young-enterprise.org.uk/">Young Enterprise</a></strong> company, qualifying with a <strong>distinction</strong></td>
      </tr>-->-}
