module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Msgs exposing (Msg)
import Models exposing (SlideId, Slide, SlideContent)
import RemoteData


fetchSlides : Cmd Msg
fetchSlides =
    Http.get fetchSlidesUrl slidesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchSlides


fetchSlidesUrl : String
fetchSlidesUrl =
    "http://localhost:4000/slideList"


slidesDecoder : Decode.Decoder (List Slide)
slidesDecoder =
    Decode.list slideDecoder


slideDecoder : Decode.Decoder Slide
slideDecoder =
    decode Slide
        |> required "id" Decode.string
        |> required "slideType" Decode.string
        |> required "heading" Decode.string
        |> required "content" Decode.string



--|> required "content" Decode.float
-- Add a contentDecoder??
