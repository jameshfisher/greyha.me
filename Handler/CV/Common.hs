module Handler.CV.Common where

import Prelude
import Data.List (intersperse)
import Text.XML.HXT.Core (ArrowXml, XmlTree, mkelem, txt, sattr)

mk :: ArrowXml a => String -> [a n XmlTree] -> a n XmlTree
mk n = mkelem n []

meta :: ArrowXml a => String -> String -> a n XmlTree
meta name content = mkelem "meta" [sattr "name" name, sattr "content" content] []

style :: ArrowXml a => String -> String -> a n XmlTree
style media url = mkelem "link"
  [ sattr "rel" "stylesheet"
  , sattr "type" "text/css"
  , sattr "media" media
  , sattr "href" url
  ] []

cls :: ArrowXml a => String -> a n XmlTree
cls c = sattr "class" c

section :: (ArrowXml a) => [a n XmlTree] -> [a n XmlTree] -> a n XmlTree
section = mkelem "section"

division :: ArrowXml a => [a n XmlTree] -> [a n XmlTree] -> a n XmlTree
division = mkelem "div"

htmlSpan :: (ArrowXml a) => [a n XmlTree] -> [a n XmlTree] -> a n XmlTree
htmlSpan = mkelem "span"

strong :: ArrowXml a => String -> a n XmlTree
strong s = mkelem "strong" [] [txt s]

p :: (ArrowXml a) => [a n XmlTree] -> a n XmlTree
p = mkelem "p" []

h2, h3, q, em, email :: ArrowXml a => String -> a n XmlTree

h2 s = mk "h2" [txt s]
h3 s = mk "h3" [txt s]
q s  = mk "q"  [txt s]
em s = mk "em" [txt s]

item :: ArrowXml a => String -> [a n XmlTree]
item url = [sattr "itemscope" "itemscope", sattr "itemtype" url]

prop :: (ArrowXml a) => String -> a n XmlTree
prop = sattr "itemprop"

obscure :: String -> String
obscure s = s -- "mailt&#111;&#58;j&#97;&#37;6Des&#104;fi%73%6&#56;er&#64;gmail&#46;&#99;&#111;m"

email e = mkelem "a" [sattr "href" ("mailto:"++e')] [txt e']
  where e' = obscure e

link :: ArrowXml a => String -> String -> a n XmlTree
link href t = mkelem "a" [sattr "href" href] [txt t]

linkAbbr :: ArrowXml a => String -> String -> String -> a n XmlTree
linkAbbr url abbr body = mkelem "a" [sattr "href" url] [mkelem "abbr" [sattr "title" abbr] [txt body]]

trs :: (ArrowXml a) => [[a n XmlTree]] -> [a n XmlTree]
trs = map (mk "tr")

attrVal :: ArrowXml a => [a n XmlTree] -> [a n XmlTree] -> [a n XmlTree] -> [a n XmlTree]
attrVal attr atts val =
  [ mk "th" attr
  , mkelem "td" atts val
  ]

ul :: ArrowXml a => [[a n XmlTree]] -> a n XmlTree
ul lis = mkelem "ul" [] (map (mkelem "li" []) lis)

listTable :: ArrowXml a => [[a n XmlTree]] -> a n XmlTree
listTable lis = mkelem "ul" [cls "listTable"] (map (mkelem "li" []) lis)

csv :: (ArrowXml a) => [a n XmlTree] -> [a n XmlTree]
csv = intersperse $ txt ", "

csvAnd :: (ArrowXml a) => [a n XmlTree] -> [a n XmlTree]
csvAnd [] = []
csvAnd [e] = [e]
csvAnd [e1,e2] = [e1, txt " and ", e2]
csvAnd (e : es) = e : (txt ", ") : csvAnd es 

interspace :: (ArrowXml a) => [a n XmlTree] -> [a n XmlTree]
interspace = intersperse $ txt " "
