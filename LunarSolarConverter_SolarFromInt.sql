USE [seelove100]
GO

/****** Object:  UserDefinedFunction [dbo].[LunarSolarConverter_SolarFromInt]    Script Date: 2021/1/8 ¤U¤È 03:07:10 ******/
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
CREATE FUNCTION [dbo].[LunarSolarConverter_SolarFromInt]
(
	@g bigint
)
RETURNS @solar Table (solarDay int, solarMonth int, solarYear int)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result VARCHAR(20)

	-- Add the T-SQL statements to compute the return value here
	DECLARE @y int = (10000*@g + 14780)/3652425
	DECLARE @ddd int = @g - (365*@y + @y/4 - @y/100 + @y/400)
	IF (@ddd < 0)
	BEGIN
		SET @y = @y -1
		SET @ddd = @g - (365*@y + @y/4 - @y/100 + @y/400)
	END
	DECLARE @mi int = (100*@ddd + 52)/3060
	DECLARE @mm int = (@mi +2)%12 + 1
	SET @y = @y + ((@mi + 2)/12)
	DECLARE @dd int = @ddd - ((@mi*306 + 5)/10) + 1

	-- Return the result of the function
	INSERT INTO @solar VALUES (@dd,@mm,@y)

	RETURN
END
GO


