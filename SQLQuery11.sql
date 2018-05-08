USE [SIMS]
GO

/****** Object:  StoredProcedure [dbo].[getAssignetTickets_ID]    Script Date: 4/30/2018 1:43:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[getAssignetTickets_ID]
@PersonnelId nvarchar(50)
As
Begin
	select Ticket_ID,Client_Code,Location_Name,Issue_Logged,Closure_Time
	from Tickets
	INNER JOIN Personnel ON Tickets.Assigned_Personnel = Personnel.Personnel_ID
	INNER JOIN Client ON Tickets.Client_ID = Client.ID
	INNER JOIN Terminals ON Tickets.Terminal_ID = Terminals.Terminal_ID
	where Personnel_ID = @PersonnelId;
End
GO


