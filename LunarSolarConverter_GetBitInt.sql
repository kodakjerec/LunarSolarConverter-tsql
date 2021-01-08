USE [seelove100]
GO

/****** Object:  UserDefinedFunction [dbo].[LunarSolarConverter_GetBitInt]    Script Date: 2021/1/8 ¤U¤È 01:52:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kota
-- Create date: 2021/1/7
-- Description:	°ê¾ä <-> ¹A¾ä
-- SELECT [dbo].[LunarSolarConverter_GetBitInt](1034297, 12, 9)
-- return 2020
-- =============================================
CREATE FUNCTION [dbo].[LunarSolarConverter_GetBitInt]
(
	@data int, @length int, @shift int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int

	-- Add the T-SQL statements to compute the return value here
	SET @result = (@data & (1 * POWER(2,@length) -1) * POWER(2,@shift)) / POWER(2,@shift)

	-- Return the result of the function
	RETURN @result

END
GO


