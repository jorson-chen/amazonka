{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TemplateHaskell             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.CreateSnapshot
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a snapshot of an Amazon EBS volume and stores it in Amazon S3. You
-- can use snapshots for backups, to make copies of Amazon EBS volumes, and to
-- save data before shutting down an instance. When a snapshot is created, any
-- AWS Marketplace product codes that are associated with the source volume
-- are propagated to the snapshot. You can take a snapshot of an attached
-- volume that is in use. However, snapshots only capture data that has been
-- written to your Amazon EBS volume at the time the snapshot command is
-- issued; this may exclude any data that has been cached by any applications
-- or the operating system. If you can pause any file systems on the volume
-- long enough to take a snapshot, your snapshot should be complete. However,
-- if you cannot pause all file writes to the volume, you should unmount the
-- volume from within the instance, issue the snapshot command, and then
-- remount the volume to ensure a consistent and complete snapshot. You may
-- remount and use your volume while the snapshot status is pending. To create
-- a snapshot for Amazon EBS volumes that serve as root devices, you should
-- stop the instance before taking the snapshot. Snapshots that are taken from
-- encrypted volumes are automatically encrypted. Volumes that are created
-- from encrypted snapshots are also automatically encrypted. Your encrypted
-- volumes and any associated snapshots always remain protected. For more
-- information, see Amazon Elastic Block Store and Amazon EBS Encryption in
-- the Amazon Elastic Compute Cloud User Guide. Example This example creates a
-- snapshot of the volume with the ID vol-1a2b3c4d.
-- https://ec2.amazonaws.com/?Action=CreateSnapshot &amp;VolumeId=vol-1a2b3c4d
-- &amp;Description=Daily+Backup &amp;AUTHPARAMS &lt;CreateSnapshotResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-05-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;snapshotId&gt;snap-1a2b3c4d&lt;/snapshotId&gt;
-- &lt;volumeId&gt;vol-1a2b3c4d&lt;/volumeId&gt;
-- &lt;status&gt;pending&lt;/status&gt;
-- &lt;startTime&gt;YYYY-MM-DDTHH:MM:SS.000Z&lt;/startTime&gt;
-- &lt;progress&gt;60%&lt;/progress&gt;
-- &lt;ownerId&gt;111122223333&lt;/ownerId&gt;
-- &lt;volumeSize&gt;30&lt;/volumeSize&gt; &lt;description&gt;Daily
-- Backup&lt;/description&gt; &lt;/CreateSnapshotResponse&gt;.
module Network.AWS.EC2.V2014_06_15.CreateSnapshot
    (
    -- * Request
      CreateSnapshot
    -- ** Default constructor
    , createSnapshot
    -- ** Accessors and lenses
    , _cstVolumeId
    , cstVolumeId
    , _cstDescription
    , cstDescription

    -- * Response
    , CreateSnapshotResponse
    -- ** Accessors and lenses
    , _svEncrypted
    , svEncrypted
    , _svStartTime
    , svStartTime
    , _svVolumeSize
    , svVolumeSize
    , _svState
    , svState
    , _svSnapshotId
    , svSnapshotId
    , _svVolumeId
    , svVolumeId
    , _svProgress
    , svProgress
    , _svOwnerId
    , svOwnerId
    , _svDescription
    , svDescription
    , _svOwnerAlias
    , svOwnerAlias
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'CreateSnapshot' request.
createSnapshot :: Text -- ^ 'cstVolumeId'
               -> CreateSnapshot
createSnapshot p1 = CreateSnapshot
    { _cstVolumeId = p1
    , _cstDescription = Nothing
    }

data CreateSnapshot = CreateSnapshot

makeSiglessLenses ''CreateSnapshot

instance ToQuery CreateSnapshot where
    toQuery = genericQuery def

data CreateSnapshotResponse = CreateSnapshotResponse
    { _svEncrypted :: Maybe Bool
      -- ^ Indicates whether the snapshot is encrypted.
    , _svStartTime :: Maybe ISO8601
      -- ^ The time stamp when the snapshot was initiated.
    , _svVolumeSize :: Maybe Integer
      -- ^ The size of the volume, in GiB.
    , _svState :: Maybe SnapshotState
      -- ^ The snapshot state.
    , _svSnapshotId :: Maybe Text
      -- ^ The ID of the snapshot.
    , _svVolumeId :: Maybe Text
      -- ^ The ID of the volume.
    , _svProgress :: Maybe Text
      -- ^ The progress of the snapshot, as a percentage.
    , _svOwnerId :: Maybe Text
      -- ^ The AWS account ID of the Amazon EBS snapshot owner.
    , _svDescription :: Maybe Text
      -- ^ The description for the snapshot.
    , _svOwnerAlias :: Maybe Text
      -- ^ The AWS account alias (for example, amazon, self) or AWS account
      -- ID that owns the snapshot.
    } deriving (Show, Generic)

makeSiglessLenses ''CreateSnapshotResponse

instance FromXML CreateSnapshotResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateSnapshot where
    type Sv CreateSnapshot = EC2
    type Rs CreateSnapshot = CreateSnapshotResponse

    request = post "CreateSnapshot"
    response _ = xmlResponse

-- | The ID of the Amazon EBS volume.
cstVolumeId :: Lens' CreateSnapshot (Text)

-- | A description for the snapshot.
cstDescription :: Lens' CreateSnapshot (Maybe Text)

-- | Indicates whether the snapshot is encrypted.
svEncrypted :: Lens' CreateSnapshotResponse (Maybe Bool)

-- | The time stamp when the snapshot was initiated.
svStartTime :: Lens' CreateSnapshotResponse (Maybe ISO8601)

-- | The size of the volume, in GiB.
svVolumeSize :: Lens' CreateSnapshotResponse (Maybe Integer)

-- | The snapshot state.
svState :: Lens' CreateSnapshotResponse (Maybe SnapshotState)

-- | The ID of the snapshot.
svSnapshotId :: Lens' CreateSnapshotResponse (Maybe Text)

-- | The ID of the volume.
svVolumeId :: Lens' CreateSnapshotResponse (Maybe Text)

-- | The progress of the snapshot, as a percentage.
svProgress :: Lens' CreateSnapshotResponse (Maybe Text)

-- | The AWS account ID of the Amazon EBS snapshot owner.
svOwnerId :: Lens' CreateSnapshotResponse (Maybe Text)

-- | The description for the snapshot.
svDescription :: Lens' CreateSnapshotResponse (Maybe Text)

-- | The AWS account alias (for example, amazon, self) or AWS account ID that
-- owns the snapshot.
svOwnerAlias :: Lens' CreateSnapshotResponse (Maybe Text)
