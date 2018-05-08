select Tickets.Ticket_ID,Client.Client_Code,Terminals.Location_Name,Personnel.Personnel_ID,Tickets.Issue_Diagnossed,Time_Left_To_Default
from Opened_Tickets
join Tickets on Opened_Tickets.Ticket_ID = Tickets.Ticket_ID
join Client on Tickets.Client_ID = Client.ID
join Terminals on Tickets.Terminal_ID = Terminals.Terminal_ID
join Personnel on Tickets.Assigned_Personnel = Personnel.Personnel_ID