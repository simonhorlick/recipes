module Main exposing (main)

import Browser

import Html exposing (Html, text, pre, div, span)

import RemoteData exposing (RemoteData)

import Graphql.Document as Document
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)

import Api.InputObject
import Api.Interface
import Api.Object
import Api.Object.Ingredients as Ingredients
import Api.Query as Query
import Api.Union
import Api.Object.Recipes

-- The query that we'll send to the graphql server.
query : SelectionSet (List MyRecipe) RootQuery
query =
    Query.recipes identity recipeSelection

-- The data we'll display on the UI.
type alias MyRecipe =
    { name : String
    }

recipeSelection : SelectionSet MyRecipe Api.Object.Recipes
recipeSelection =
    SelectionSet.map MyRecipe
        Api.Object.Recipes.name

makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "http://localhost:8080/v1/graphql"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)

type alias Model =
    RemoteData (Graphql.Http.Error (List MyRecipe)) (List MyRecipe)

type Msg
    -- The graphql response.
    = GotResponse Model

-- Start off the graphql call as soon as the application loads.
init : () -> (Model, Cmd Msg)
init _ =
  ( RemoteData.Loading
  , makeRequest
  )

-- Update the model based off a message.
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GotResponse result ->
      case result of
        RemoteData.NotAsked ->
          (result, Cmd.none)
        RemoteData.Loading ->
          (result, Cmd.none)
        RemoteData.Failure e ->
          (result, Cmd.none)
        RemoteData.Success a ->
          (result, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  case model of
    RemoteData.NotAsked ->
      text "Not yet requested"

    RemoteData.Failure a ->
      text ("Failed to read from the api: " ++ Debug.toString a)

    RemoteData.Loading ->
      text "Loading..."

    RemoteData.Success recipes ->
      div [] (List.map (\recipe -> div [] [text recipe.name]) recipes)

main : Program () Model Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }