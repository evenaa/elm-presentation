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
    , slidePage = 0
    , time = 0
    }


type alias SlideId =
    Int


type alias SlideClass =
    String


type alias Slide =
    { id : SlideId
    , slideType : SlideType
    , heading : String
    , content : List SlideContent
    }


type alias SlideContent =
    { num : String
    , contentString : String
    }


type SlideType
    = Heading String
    | Info String


type Route
    = IntroRoute
    | SlideRoute SlideId
    | PresentationRoute
    | NotFoundRoute
