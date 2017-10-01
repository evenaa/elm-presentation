module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (PizzaId, Pizza)
import RemoteData


fetchPizzas : Cmd Msg
fetchPizzas =
    Http.get fetchPizzasUrl pizzasDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPizzas


fetchPizzasUrl : String
fetchPizzasUrl =
    "http://localhost:4000/pizzaList"


pizzasDecoder : Decode.Decoder (List Pizza)
pizzasDecoder =
    Decode.list pizzaDecoder


pizzaDecoder : Decode.Decoder Pizza
pizzaDecoder =
    decode Pizza
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "price" Decode.float
