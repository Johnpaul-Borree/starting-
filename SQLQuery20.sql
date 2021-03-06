USE [SIMS]
GO
/****** Object:  StoredProcedure [dbo].[getOpenedTicketsByPersonnelId]    Script Date: 5/2/2018 3:29:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[getOpenedTicketsByPersonnelId]
@PersonnelId nvarchar(50)
AS
BEGIN
SET NOCOUNT ON
SELECT t.Ticket_ID,c.Client_Code,tm.Location_Name,t.Issue_Diagnossed,o.Time_Left_To_Default
FROM Opened_Tickets o
inner join Tickets t ON o.Ticket_ID = t.Ticket_ID
inner join Client c ON t.Client_ID = c.ID
inner join Terminals tm ON t.Terminal_ID = tm.id
inner join Personnel p ON t.Assigned_Personnel = p.Personnel_ID
WHERE t.Assigned_Personnel = @PersonnelId;
END
