module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { slides : WebData (List Slide)
    , route : Route
    , slidePage : Int
    }


initialModel : Route -> Model
initialModel route =
    { slides = RemoteData.Loading
    , route = route
    , slidePage = 1
    }


type alias SlideId =
    String


type alias Slide =
    { id : SlideId
    , slideType : String
    , heading : String
    , content : List SlideContent
    }


type alias SlideContent =
    { num : String
    , contentString : String
    }


type Route
    = IntroRoute
    | SlideRoute SlideId
    | NotFoundRoute
