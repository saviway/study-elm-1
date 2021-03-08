module Main exposing (main, customSum)

import Browser
import Html exposing (button, text, div, input, Html, h1)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder, value)

-- model
type alias Model
    = String

initialModel: Model
initialModel
    = ""

view: Model -> Html MsgEvent
view model
    = div
        [] [
        input [ placeholder "Enter your text", value model, onInput OnChange] []
        ,h1 [] [text <| String.toUpper model]
        , button [onClick Clear] [text "Clear"]

    ]

type MsgEvent
    = OnChange String
    | Clear

update: MsgEvent -> Model -> Model
update msg model =
    case msg of
        OnChange text -> text
        Clear -> ""

main: Program () Model MsgEvent
main =
    Browser.sandbox
    { init = initialModel
    , update = update
    ,view = view
    }

