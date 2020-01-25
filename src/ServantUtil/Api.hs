{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module ServantUtil.Api
  ( BaseCrudApi
  , GetEntitiesApi
  , PostEntitiesApi
  , UpdateEntitiesApi
  , DeleteEntitiesApi
  ) where

import           Servant
import           ServantUtil.Types ( EntityRecord (..) )

-- API for values of type 'a'
-- indexed by values of type 'i'
type BaseCrudApi a i
   = Get '[ JSON] [EntityRecord i a] -- list 'a's
      :<|> ReqBody '[ JSON] a :> PostNoContent '[ JSON] NoContent -- add an 'a'
      :<|> Capture "id" i :> (Get '[ JSON] (Maybe a) -- view an 'a' given its "identifier" of type 'i'
                               :<|> ReqBody '[ JSON] a :> PutNoContent '[ JSON] NoContent -- update an 'a'
                               :<|> DeleteNoContent '[ JSON] NoContent -- delete an 'a'
                              )

type GetEntitiesApi a i
   = ReqBody '[ JSON] [i] :> Post '[ JSON] [EntityRecord i a] -- list 'a's specified by 'i's

type PostEntitiesApi a i = ReqBody '[ JSON] [a] :> Post '[ JSON] [i] -- add 'a's

type UpdateEntitiesApi a i
   = ReqBody '[ JSON] [EntityRecord i a] :> PutNoContent '[ JSON] NoContent -- update 'a's

type DeleteEntitiesApi a i
   = ReqBody '[ JSON] [i] :> DeleteNoContent '[ JSON] NoContent -- delete 'a's
