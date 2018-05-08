create procedure getOpenedTicketsByPersonnelId
@PersonnelId nvarchar(50)
AS
BEGIN
SET NOCOUNT ON
SELECT Tickets.Ticket_ID,Client.Client_Code,Terminals.Location_Name,Tickets.Issue_Diagnossed,Time_Left_To_Default
FROM Opened_Tickets
JOIN Tickets ON Opened_Tickets.Ticket_ID = Tickets.Ticket_ID
JOIN Client ON Tickets.Client_ID = Client.ID
JOIN Terminals ON Tickets.Terminal_ID = Terminals.Terminal_ID
JOIN Personnel ON Tickets.Assigned_Personnel = Personnel.Personnel_ID
WHERE Personnel_ID = @PersonnelId;
END

EXEC getOpenedTicketsByPersonnelId "maduka"