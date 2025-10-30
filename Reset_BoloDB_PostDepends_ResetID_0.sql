USE AltBoloDB
Go
Delete from BoloUserPost
Delete from BoloUserPostComment
Delete from BoloUserPostCommentReaction
Delete from BoloUserPostFeed
Delete from PostSave
Delete from PostTag
Delete from Room
Delete from RoomMember
Delete from RoomPost
Delete from ShareSelector
Delete from UserPostMedia
Go
DBCC CHECKIDENT(BoloUserPost, RESEED, 0)
DBCC CHECKIDENT(BoloUserPostComment, RESEED, 0)
DBCC CHECKIDENT(BoloUserPostCommentReaction, RESEED, 0)
DBCC CHECKIDENT(BoloUserPostFeed, RESEED, 0)
DBCC CHECKIDENT(PostSave, RESEED, 0)
DBCC CHECKIDENT(PostTag, RESEED, 0)
DBCC CHECKIDENT(Room, RESEED, 0)
DBCC CHECKIDENT(RoomMember, RESEED, 0)
DBCC CHECKIDENT(RoomPost, RESEED, 0)
DBCC CHECKIDENT(ShareSelector, RESEED, 0)
DBCC CHECKIDENT(UserPostMedia, RESEED, 0)
Go



USE ShieldAppMasterDB
Go
Delete from FeedHandlerQueue
Delete from BoloSync

Go
DBCC CHECKIDENT(FeedHandlerQueue, RESEED, 0)
DBCC CHECKIDENT(BoloSync, RESEED, 0)

Go