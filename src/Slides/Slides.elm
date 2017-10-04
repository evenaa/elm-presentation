module Slides.Slides exposing (..)

import Markdown
import Html exposing (..)
import Msgs exposing (Msg)


slide : Int -> Html Msg
slide n =
    if n == 1 then
        slide1
    else if n == 2 then
        slide2
    else if n == 3 then
        slide3
    else if n == 4 then
        slide4
    else if n == 5 then
        slide5
    else if n == 6 then
        slide6
    else if n == 7 then
        slide7
    else if n == 8 then
        slide8
    else if n == 9 then
        slide9
    else if n == 10 then
        slide10
    else
        div [] [ text "No content found" ]


slide1 : Html Msg
slide1 =
    Markdown.toHtml [] """
# Elm
## A functional language for webapp development

"""


slide2 : Html Msg
slide2 =
    Markdown.toHtml [] """
# Hello World
## The first example of simplicity
```
module Main exposing (..)

import Html exposing (text)


main =
    text "Hello World"
```
"""


slide3 : Html Msg
slide3 =
    Markdown.toHtml [] """
# Fundamentals

## Values

* String - Int - Float

```
$ elm-repl

> "hello"
"hello" : String

> 4
4 : number (Int)

> 1.3
1.3 Float
```

"""


slide4 : Html Msg
slide4 =
    Markdown.toHtml [] """
# Fundamentals

## Functions

```
> 1 + 2
3 : number

> 2 // 4
0 : Int

> 2 / 4
0.5 : Float

> add1 x = \\
    x + 1
<function> : number -> number

```

"""


slide5 : Html Msg
slide5 =
    Markdown.toHtml [] """
# Fundamentals

## Functions

```
module Main exposing (..)

import Html exposing (text)


add1 x =
    x + 1


main =
    text (toString (add1 1))
```
"""


slide6 : Html Msg
slide6 =
    Markdown.toHtml [] """
# Fundamentals

## Types

* Union type

```
type CarInstruction
  = StartEngine
  | StopEngine
  | SetCruice Int

type Bool
  = True
  | False

```
Need to cover all types in case statement, more on that later

"""


slide7 : Html Msg
slide7 =
    Markdown.toHtml [] """
# Fundamentals

## Types

* Type alias

```
isPopular :
  { name : String, rating : Float }
   -> Bool
isPopular film =
    film.rating > 7

main =
  text
    (toString
      (isPopular
        { name = "Where eagles dare"
        , rating = 10 })
    )
```
"""


slide8 : Html Msg
slide8 =
    Markdown.toHtml [] """
# Fundamentals

## Types

* Type alias

```
type alias Film =
  { name : String, rating : Float}

oldFilm = Film "Where eagles dare" 10

isPopular : Film -> Bool
isPopular film =
    film.rating > 7

main =
  text
    (toString (isPopular oldFilm))
```
"""


slide9 : Html Msg
slide9 =
    Markdown.toHtml [] """
# The Elm Architecture

## Model view controller pattern
```
type alias Model = Int

model : Model
model =
    0

view : Model -> Html Msg
view model =
  div [] [ text (toString model) ]


update : Msg -> Model -> Model
update msg model =
    model + 1

```
"""


slide10 : Html Msg
slide10 =
    Markdown.toHtml [] """ """
