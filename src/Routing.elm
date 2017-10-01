module Routing exposing (..)

import Navigation exposing (..)
import Models exposing (SlideId, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map IntroRoute top
        , map SlideRoute (s "slide" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


introPath : String
introPath =
    ""


slidePath : SlideId -> String
slidePath id =
    "#slide/" ++ id
