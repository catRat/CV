# 此代码为了完成透视表，它的任务仅仅是把一个
# 二维表化为变量更少的二维表，从而方便透视表的筛选
library(readxl)
booking <- 
  read_excel("C:\\Users\\sz0108\\Downloads\\volume_detail.xls")
library(reshape)
bookingMelt <- melt(booking, id = (c("Salesman", "SalesGroup",
  "SalesmanType","FCL/LCL", "SvcType", "BookingNo",
  "JobNo", "LoadPlanNo", "I/E", "Office", "Trade",
  "ShCode", "ShName", "CnCode", "CnName","NpCode",
  "NpName", "AgtCode", "AgtName", "Vessel/Voyage",
  "AMS Vsl/Voy","POR", "POL", "VIA", "POD", "PLD",
  "Cluster", "Region", "Etd","Year", "Month", "Week",
  "Eta", "Month__1", "20'", "40'", "40'HQ","45'", "wgt",
  "cbm", "PKG", "PKGUnit", "Principle", "Comodity",
  "ContractCommodity", "Contract No", "RateType",
  "SC_Owner", "POD ETA","Service", "NAC", "MBL PLD",
  "AMS SHIPPER", "AMS CNSIGNEE", "FromOffice","MBLNo",
  "CarrierCode", "CarrierName", "ToOffice")))
bookingCast <- cast(bookingMelt, Office+Service~variable, sum)
library(writexl)
write_xlsx(bookingCast, "bookingCast.xlsx")
cat(date())