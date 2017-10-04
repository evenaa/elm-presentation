module Models exposing (..)

import RemoteData exposing (WebData)
import Time exposing (Time)


type alias Model =
    { slides : WebData (List Slide)
    , route : Route
    , slidePage : Int
    , time : Time
    }


initialModel : Route -> Model
initialModel route =
    { slides = RemoteData.Loading
    , route = route
    , slidePage = 9
    , time = 0
    }


type alias SlideId =
    Int


type alias SlideClass =
    String


type alias Slide =
    { id : SlideId
    , slideType : String
    }


type Route
    = IntroRoute
    | SlideRoute SlideId
    | PresentationRoute
    | NotFoundRoute
