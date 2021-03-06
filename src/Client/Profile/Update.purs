module Client.Profile.Update where

import Prelude
import Shared.Types

import Client.Common.DOM (nameChanged)
import Client.Common.DOM as CCD
import Client.Common.File as CCF
import Client.Common.Network (request)
import Client.Common.Network as CNN
import Client.Common.Types (RequestStatus(..))
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Maybe as DM
import Data.Newtype as DN
import Data.String as DS
import Data.Symbol (class IsSymbol, SProxy(..))
import Effect (Effect)
import Effect.Aff (Aff, Milliseconds(..))
import Effect.Aff as EA
import Effect.Class (liftEffect)
import Flame.Application.Effectful (AffUpdate, Environment)
import Flame.Application.Effectful as FAE
import Prim.Row (class Cons)
import Prim.Symbol (class Append)
import Record as R
import Shared.JSON as SJ
import Shared.Options.Profile (descriptionMaxCharacters, headlineMaxCharacters, nameMaxCharacters)
import Shared.Profile.View (profileEditionId)
import Shared.Setter as SS
import Type.Data.Symbol as TDS
import Web.DOM (Element)

getFileInput :: Effect Element
getFileInput = CCD.unsafeGetElementByID AvatarFileInput

update :: AffUpdate ProfileModel ProfileMessage
update rc@{ model, message, display } =
      case message of
            SelectAvatar -> selectAvatar
            SetPField setter -> pure setter
            SetAvatar base64 -> pure <<< SS.setUserField (SProxy :: SProxy "avatar") $ Just base64
            SetGenerate what ->
                  case what of
                        Name -> setGenerated rc Name (SProxy :: SProxy "name") nameMaxCharacters
                        Headline -> setGenerated rc Headline (SProxy :: SProxy "headline") headlineMaxCharacters
                        Description -> setGenerated rc Description (SProxy :: SProxy "description") descriptionMaxCharacters
            SetProfileChatExperiment experiment -> setChatExperiment experiment
            SaveProfile -> saveProfile rc

setGenerated :: forall field fieldInputed r u . IsSymbol field => Cons field String r PU => IsSymbol fieldInputed => Append field "Inputed" fieldInputed => Cons fieldInputed (Maybe String) u PM => Environment ProfileModel ProfileMessage -> Generate -> SProxy field -> Int -> Aff (ProfileModel -> ProfileModel)
setGenerated { model, display } what field characters = do
      display $ _ { generating = Just what }
      let   fieldInputed = TDS.append field (SProxy :: SProxy "Inputed")
            trimmed = DS.trim <<< DM.fromMaybe "" $ R.get fieldInputed model

      toSet <- if DS.null trimmed then do
                  result <- request.profile.generate { query: { what } }
                  case result of
                        Right r -> pure <<< _.body $ DN.unwrap r
                        _ -> pure $ R.get field model.user --if the request fails, just pretend it generated the same field
            else
                  pure trimmed
      pure (\model ->  R.set fieldInputed Nothing <<< SS.setUserField field (DS.take characters toSet) $ model {
            generating = Nothing
      })

selectAvatar :: Aff (ProfileModel -> ProfileModel)
selectAvatar = do
      liftEffect do
            input <- getFileInput
            CCF.triggerFileSelect input
      FAE.noChanges

setChatExperiment :: String -> Aff (ProfileModel -> ProfileModel)
setChatExperiment experiment =
      FAE.diff {
            experimenting : case SJ.fromJSON experiment of
                  Left _ -> Nothing
                  Right e -> e
      }

saveProfile :: AffUpdate ProfileModel ProfileMessage
saveProfile {display, model : { user: user@{ name }} } = do
      status <- CNN.formRequest profileEditionId $ request.profile.post { body: user }
      case status of
            Success -> do
                  display $ FAE.diff' { hideSuccessMessage : false }
                  liftEffect <<<
                        --let im know that the name has changed
                        CCD.dispatchCustomEvent $ CCD.createCustomEvent nameChanged name
                  EA.delay $ Milliseconds 3000.0
                  FAE.diff { hideSuccessMessage : true }
            _ -> FAE.noChanges
