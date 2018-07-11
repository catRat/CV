GetCode <- function(carrier.name = 'cosco') {
  # This function use to change the carrier short name to carrier code-name.
  # It have a argument carrier.name that is a object of vector class, and character type.
	
  s <- c()
  for(i in seq(x)) {
  s[i] <- switch((x[i]),
    APL = "APLU",
    CMA = "CMDU",
    COSCO = "COSU",
    EMC = "EGLV",
    HMM = "HDMU",
    HPL = "HLCU",
    MSK = "MAEU",
    MSC = "MSCU",
    OOCL = "OOLU",
    PIL = "PABV",
    SML = "SMLM",
    HBS = "SUDU",
    WHL = "WHLC",
    YML = "YMLU",
    ZIM = "ZIMU",
    ONE = "ONEY",
    cat(x[i], "is not a recognized type\n")
    )
  }
  return(s)
}
GetId <- function(carrier.code = 'COSU') {
  # This function use to change the carrier code-name to contract id.
  # It have a argument carrier.code that is a object of vector class, and character type.
  # The element of carrier.code much be up letter.
  s<-c()
  for(i in seq(x)) {
    s[i] <- switch((x[i]),
      APLU = "EB18/1668",
      CMDU = "18-0807",
      COSU = "ATN18888",
      EGLV = "SC71586",
      HDMU = "1817202",
      HLCU = "S18ANC119",
      MAEU = "37238211",
      MSCU = "18-218TPC",
      OOLU = "PE184717",
      PABV = "ANO170044",
      SMLM = "AEF182888",
      SUDU = "LHKC8000027",
      WHLC = "YTN18-164N",
      YMLU = "651518",
      ZIMU = "Z18462HK",
      ONEY = "SHAN00006",
      cat(x[i], "is not a recognized type\n")
    )
  }
  return(s)
}
