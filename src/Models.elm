module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { pizzas : WebData (List Pizza) }


initialModel : Model
initialModel =
    { pizzas = RemoteData.Loading }


type alias PizzaId =
    String


type alias Pizza =
    { id : PizzaId
    , name : String
    , price : Float
    }
