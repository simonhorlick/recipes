module Main exposing (main)

import Api.InputObject
import Api.Interface
import Api.Object
import Api.Object.Ingredients as Ingredients
import Api.Object.Recipes
import Api.Query as Query
import Api.Union
import Browser
import Browser.Navigation
import Graphql.Document as Document
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (RemoteData)
import Url
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, string, top)


{-| The routes that this single-page-app accepts.
-}
type Route
    = Home
    | Recipe Int


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Url.Parser.map Home (Url.Parser.s "recipes")
        , Url.Parser.map Recipe (Url.Parser.s "recipes" </> Url.Parser.int)
        ]


{-| The query that we'll send to the graphql server.
-}
query : SelectionSet (List MyRecipe) RootQuery
query =
    Query.recipes identity recipeSelection


{-| The data we'll display on the UI.
-}
type alias MyRecipe =
    { id : Int
    , name : String
    }


recipeSelection : SelectionSet MyRecipe Api.Object.Recipes
recipeSelection =
    SelectionSet.map2 MyRecipe Api.Object.Recipes.id Api.Object.Recipes.name


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "http://localhost:8080/v1/graphql"
        |> Graphql.Http.send (RemoteData.fromResult >> ListRecipesResponse)


type alias Model =
    { key : Browser.Navigation.Key
    , route : Maybe Route
    , recipes : RemoteData (Graphql.Http.Error (List MyRecipe)) (List MyRecipe)
    }


type Msg
    = ListRecipesResponse (RemoteData (Graphql.Http.Error (List MyRecipe)) (List MyRecipe))
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


{-| Start off the graphql call as soon as the application loads.
-}
init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key (Url.Parser.parse routeParser url) RemoteData.NotAsked, makeRequest )


{-| Update the model based off a message.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )

        UrlChanged url ->
            ( { model | route = Url.Parser.parse routeParser url }
            , Cmd.none
            )

        ListRecipesResponse result ->
            ( { model | recipes = result }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


renderRecipesList : RemoteData e (List MyRecipe) -> Html msg
renderRecipesList recipes =
    case recipes of
        RemoteData.NotAsked ->
            text "Not yet requested"

        RemoteData.Failure a ->
            text ("Failed to read from the api: " ++ Debug.toString a)

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success recipesList ->
            ul []
                ([ viewLink "/recipes" ] ++ List.map (\recipe -> li [] [ a [ href ("/recipes/" ++ String.fromInt recipe.id) ] [ text recipe.name ] ]) recipesList)


viewRoute : Maybe Route -> Html msg
viewRoute maybeRoute =
    case maybeRoute of
        Nothing ->
            text "Invalid URL"

        Just route ->
            code [] [ text (routeToString route) ]


routeToString : Route -> String
routeToString route =
    case route of
        Home ->
            "home"

        Recipe id ->
            "show recipe " ++ String.fromInt id


view : Model -> Browser.Document Msg
view model =
    { title = "URL Interceptor"
    , body =
        [ text "The current URL is: "
        , viewRoute model.route
        , renderRecipesList model.recipes
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
