/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Entity]
      ,[Initials]
      ,[Year]
      ,[Child_deaths]
  FROM [AdventureWorksDW2019].[dbo].[Child_Mortality]