USE INTERNSHIP
GO

INSERT INTO [dbo].[STUDENT] ([st_name], [st_major], [st_status]) VALUES (N'Michelle', N'Communications      ', N'SR')
INSERT INTO [dbo].[STUDENT] ([st_name], [st_major], [st_status]) VALUES (N'Chris', N'Chemistry           ', N'JR')
INSERT INTO [dbo].[STUDENT] ([st_name], [st_major], [st_status]) VALUES (N'Andy', N'Finance             ', N'SO')
INSERT INTO [dbo].[STUDENT] ([st_name], [st_major], [st_status]) VALUES (N'Anna', N'Communications      ', N'SR')
INSERT INTO [dbo].[STUDENT] ([st_name], [st_major], [st_status]) VALUES (N'Amy', N'Communications      ', N'FR')

INSERT INTO [dbo].[COMPANY] ([co_name], [co_size], [co_headquarters]) VALUES (N'A    ', CAST(1000 AS Decimal(4, 0)), N'Boston    ')
INSERT INTO [dbo].[COMPANY] ([co_name], [co_size], [co_headquarters]) VALUES (N'B    ', CAST(500 AS Decimal(4, 0)), N'Chicago   ')
INSERT INTO [dbo].[COMPANY] ([co_name], [co_size], [co_headquarters]) VALUES (N'C    ', CAST(1000 AS Decimal(4, 0)), N'Boston    ')
INSERT INTO [dbo].[COMPANY] ([co_name], [co_size], [co_headquarters]) VALUES (N'D    ', CAST(400 AS Decimal(4, 0)), N'Houston   ')

INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'A    ', N'Chris', CAST(2014 AS Decimal(4, 0)), N'Fall      ', N'Concord        ', CAST(1000 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'A    ', N'Anna', CAST(2014 AS Decimal(4, 0)), N'Fall      ', N'Concord        ', CAST(1000 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'B    ', N'Chris', CAST(2014 AS Decimal(4, 0)), N'Fall      ', N'Concord        ', CAST(600 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'C    ', N'Amy', CAST(2014 AS Decimal(4, 0)), N'Fall      ', N'South Bend     ', CAST(900 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'D    ', N'Andy', CAST(2014 AS Decimal(4, 0)), N'Spring    ', N'South Bend     ', CAST(1000 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'A    ', N'Chris', CAST(2013 AS Decimal(4, 0)), N'Spring    ', N'Concord        ', CAST(1200 AS Decimal(4, 0)))
INSERT INTO [dbo].[INTERNSHIP] ([in_co_name], [in_st_name], [in_year], [in_quarter], [in_location], [in_stipend]) VALUES (N'D    ', N'Anna', CAST(2014 AS Decimal(4, 0)), N'Spring    ', N'Houston        ', NULL)
