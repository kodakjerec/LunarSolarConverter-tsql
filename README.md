# LunarSolarConverter-tsql
T-sql, chinese lunar solar calandar converter  
MS SQL Server 專用, 國曆<->陰曆轉換  
based https://github.com/isee15/Lunar-Solar-Calendar-Converter

# Useage
## Solar -> Lunar
```sql
EXEC [common_LunarSolarConverter] 'SolarToLunar','2021-01-08'
--2020-11-25
```

## Lunar -> Solar
```sql
EXEC [common_LunarSolarConverter] 'LunarToSolar','2021-01-15', 0
--2021-02-26
```

# Installation
1. create three function  
LunarSolarConverter_GetBitInt  
LunarSolarConverter_SolarFromInt  
LunarSolarConverter_SolarToInt
2. create stored-procedure  
common_LunarSolarConverter
