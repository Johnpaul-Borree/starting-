USE [SIMS]
GO

/****** Object:  StoredProcedure [dbo].[getAssignedTickets]    Script Date: 4/30/2018 1:41:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getAssignedTickets]
As
Begin
	select Assigned_Personnel,Ticket_ID,Client_Code,Location_Name,Issue_Logged,Closure_Time
	From Tickets
	INNER JOIN Personnel ON Tickets.Assigned_Personnel = Personnel.Personnel_ID
	INNER JOIN Client ON Tickets.Client_ID = Client.ID
	INNER JOIN Terminals ON Tickets.Terminal_ID = Terminals.Terminal_ID
End
GO


