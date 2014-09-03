{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TemplateHaskell             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.DeleteNetworkAcl
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified network ACL. You can't delete the ACL if it's
-- associated with any subnets. You can't delete the default network ACL.
-- Example This example deletes the specified network ACL.
-- https://ec2.amazonaws.com/?Action=DeleteNetworkAcl
-- &amp;NetworkAclId=acl-2cb85d45 &amp;AUTHPARAMS &lt;DeleteNetworkAclResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-06-15/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/DeleteNetworkAclResponse&gt;.
module Network.AWS.EC2.V2014_06_15.DeleteNetworkAcl
    (
    -- * Request
      DeleteNetworkAcl
    -- ** Default constructor
    , deleteNetworkAcl
    -- ** Accessors and lenses
    , _dnarNetworkAclId
    , dnarNetworkAclId

    -- * Response
    , DeleteNetworkAclResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DeleteNetworkAcl' request.
deleteNetworkAcl :: Text -- ^ 'dnarNetworkAclId'
                 -> DeleteNetworkAcl
deleteNetworkAcl p1 = DeleteNetworkAcl
    { _dnarNetworkAclId = p1
    }

data DeleteNetworkAcl = DeleteNetworkAcl

makeSiglessLenses ''DeleteNetworkAcl

instance ToQuery DeleteNetworkAcl where
    toQuery = genericQuery def

data DeleteNetworkAclResponse = DeleteNetworkAclResponse
    deriving (Eq, Show, Generic)

makeSiglessLenses ''DeleteNetworkAclResponse

instance AWSRequest DeleteNetworkAcl where
    type Sv DeleteNetworkAcl = EC2
    type Rs DeleteNetworkAcl = DeleteNetworkAclResponse

    request = post "DeleteNetworkAcl"
    response _ = nullaryResponse DeleteNetworkAclResponse

-- | The ID of the network ACL.
dnarNetworkAclId :: Lens' DeleteNetworkAcl (Text)
