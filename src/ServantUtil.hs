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
  -- Types
  , EntityRecord(..)
  ) where

import           ServantUtil.Api     ( BaseCrudApi, DeleteEntitiesApi, GetEntitiesApi,
                                       PostEntitiesApi, UpdateEntitiesApi )
import           ServantUtil.Handler ( BaseCrudApiPureHandler (..), Entity (..), EntityKey (..) )
import           ServantUtil.Types   ( EntityRecord (..) )
