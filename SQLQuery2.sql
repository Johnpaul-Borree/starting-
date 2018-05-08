create procedure getOpenedTicketsByPersonnelId
AS
BEGIN
SELECT Ticket_ID,Client_Code,Location_Name,Issue_Logged,Time_Left_To_Default
FROM Opened_Tickets
	INNER JOIN Personnel ON OPened_Tickets.Ticket_ID = Personnel.Personnel_ID
	INNER JOIN Client ON OPened_Tickets.Ticket_ID = Client.ID
	INNER JOIN Terminals ON OPened_Tickets.Ticket_ID = Terminals.Terminal_ID
	INNER JOIN Tickets ON OPened_Tickets.Ticket_ID = Tickets.Ticket_ID
	where Personnel_ID = @PersonnelId;
END

select Ticket_ID,Client_Code,Location_Name,Issue_Logged,Time_Left_To_Default from Opened_Tickets
inner join Tickets on Opened_Tickets.Ticket_ID = Tickets.Ticket_ID