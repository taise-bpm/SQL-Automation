EXEC sp_rename 'BoloAgency.ParticipantApproval',  'RequirePostApproval', 'COLUMN';
EXEC sp_rename 'History.BoloAgency.ParticipantApproval',  'RequirePostApproval', 'COLUMN';

EXEC sp_rename 'BoloAgencyDivision.ParticipantApproval',  'RequirePostApproval', 'COLUMN';
EXEC sp_rename 'History.BoloAgencyDivision.ParticipantApproval',  'RequirePostApproval', 'COLUMN';

EXEC sp_rename 'Room.ParticipantApproval',  'RequirePostApproval', 'COLUMN';
EXEC sp_rename 'History.Room.ParticipantApproval',  'RequirePostApproval', 'COLUMN';