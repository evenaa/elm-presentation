module Routing exposing (..)

import Navigation exposing (..)
import Models exposing (SlideId, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map IntroRoute top
        , map SlideRoute (s "slide" </> int)
        , map PresentationRoute (s "presentation")
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


slidePath : Int -> String
slidePath id =
    "#slide/" ++ toString id


homeRoute : Route
homeRoute =
    IntroRoute
