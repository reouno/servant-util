module ServantUtil
  ( BaseCrudApi
  , DeleteEntitiesApi
  , GetEntitiesApi
  , PostEntitiesApi
  , UpdateEntitiesApi
  -- Handler
  , BaseCrudApiPureHandler(..)
  , Entity(..)
  , EntityKey(..)
  ) where

import           ServantUtil.Api     ( BaseCrudApi, DeleteEntitiesApi, GetEntitiesApi,
                                       PostEntitiesApi, UpdateEntitiesApi )
import           ServantUtil.Handler ( BaseCrudApiPureHandler (..), Entity (..), EntityKey (..) )
