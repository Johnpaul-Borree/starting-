CREATE PROCEDURE UpdateTicketStatus
	@ticketId varchar(50),
	@status varchar(50),
	@type varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @type='ticket'
	begin
    update tickets set Ticket_Status=@status, ACK_Date=GETDATE(), ACK_Time=convert(time,getdate()) where Ticket_ID=@ticketId 
	end
	else if @type='sla'
	begin
	update tickets set SLA_Status=@status where Ticket_ID=@ticketId 
	end
	else if @type='close'
	begin
	update tickets set SLA_Status='Closed',Closure_Date=getdate(),Closure_Time=convert(time,getdate()) where Ticket_ID=@ticketId 
	end
END

GO
