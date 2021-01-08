USE [seelove100]
GO

/****** Object:  UserDefinedFunction [dbo].[LunarSolarConverter_SolarToInt]    Script Date: 2021/1/8 ¤U¤È 01:52:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kota
-- Create date: 2021/1/7
-- Description:	°ê¾ä <-> ¹A¾ä
-- SELECT [dbo].[LunarSolarConverter_SolarToInt](2021, 1, 7)
-- return 738102
-- =============================================
CREATE FUNCTION [dbo].[LunarSolarConverter_SolarToInt]
(
	@y int, @m int, @d int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int

	-- Add the T-SQL statements to compute the return value here
	SET @m = (@m + 9) % 12
	SET @y = @y - @m/10
	SET @result = 365*@y + @y/4 - @y/100 + @y/400 + ((@m*306 + 5)/10) + (@d -1)

	-- Return the result of the function
	RETURN @result

END
GO


