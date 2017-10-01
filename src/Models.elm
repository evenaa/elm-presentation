module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { slides : WebData (List Slide)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { slides = RemoteData.Loading
    , route = route
    }


type alias SlideId =
    String


type alias Slide =
    { id : SlideId
    , slideType : String
    , heading : String
    , content : String
    }


type alias SlideContent =
    { num : String
    , contentString : String
    }


type Route
    = IntroRoute
    | SlideRoute SlideId
    | NotFoundRoute
