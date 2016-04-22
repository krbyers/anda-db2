/*\
Prefix the required number of spaces to bulk up the string
and then replace the spaces with the desired character.

ex:
SELECT	dbo.ufn_String_PadBefore('some string', 20, 'x') AS [Result],
		LEN(dbo.ufn_String_PadBefore('some string', 20, 'x')) AS [Length]
\*/
CREATE FUNCTION [dbo].[ufn_String_PadBefore]
(
	@String		VARCHAR(MAX),
	@DesiredLen	INTEGER,
	@PadChar	CHAR(1)
)
RETURNS VARCHAR(255)
AS  
BEGIN
	RETURN	CASE
				WHEN LEN(@String) < @DesiredLen
					THEN REPLACE(SPACE(@DesiredLen - LEN(@String)), SPACE(1), @PadChar) + @String
				ELSE @String
			END
END
