//Football
const dynamic ftRadioTypes = {
  "WTW": {
    "col": 2,
    "col188": 1,
    "text": {"WTWH": "{homeTeam}", "WTWC": "{awayTeam}"},
    "sort": ["WTWH", "WTWC"]
  },
  "WMD": {
    "col": 3,
    "col188": 1,
    "text": {
      "WMD1RT": "Home Team won over Regulation time",
      "WMD1OT": "Home Team won over Overtime",
      "WMD1SO": "Home Team won over PK",
      "WMD2RT": "Away Team won over Regulation time",
      "WMD2OT": "Away Team won over Overtime",
      "WMD2SO": "Away Team won over PK"
    },
    "sort": ["WMD1RT", "WMD1OT", "WMD1SO", "WMD2RT", "WMD2OT", "WMD2SO"]
  },
  "LG": {
    "col": 3,
    "col188": 1,
    "text": {"LGH": "{homeTeam}", "LGA": "{awayTeam}", "LGN": "No Goal"},
    "sort": ["LGH", "LGA", "LGN"]
  },
  "EGS": {
    "col": 2,
    "col188": 1,
    "text": {
      "EGS1_0": "0",
      "EGS1_1": "1",
      "EGS1_2": "2",
      "EGS1_3": "3",
      "EGS1_4": "4",
      "EGS1_5+": "5+",
      "EGS2_0": "0",
      "EGS2_1": "1",
      "EGS2_2": "2",
      "EGS2_3": "3",
      "EGS2_4": "4",
      "EGS2_5": "5",
      "EGS2_6+": "6+",
      "EGS3_0": "0",
      "EGS3_1": "1",
      "EGS3_2": "2",
      "EGS3_3": "3",
      "EGS3_4": "4",
      "EGS3_5": "5",
      "EGS3_6": "6",
      "EGS3_7": "7",
      "EGS3_8": "8",
      "EGS3_9+": "9+"
    },
    "sort": [
      "EGS1_0",
      "EGS1_1",
      "EGS1_2",
      "EGS1_3",
      "EGS1_4",
      "EGS1_5+",
      "EGS2_0",
      "EGS2_1",
      "EGS2_2",
      "EGS2_3",
      "EGS2_4",
      "EGS2_5",
      "EGS2_6+",
      "EGS3_0",
      "EGS3_1",
      "EGS3_2",
      "EGS3_3",
      "EGS3_4",
      "EGS3_5",
      "EGS3_6",
      "EGS3_7",
      "EGS3_8",
      "EGS3_9+"
    ]
  },
  "EGHT": {
    "col": 2,
    "col188": 1,
    "text": {"EGHT0": "0", "EGHT1": "1", "EGHT2": "2", "EGHT3+": "3+"},
    "sort": ["EGHT0", "EGHT1", "EGHT2", "EGHT3+"]
  },
  "EGAT": {
    "col": 2,
    "col188": 1,
    "text": {"EGAT0": "0", "EGAT1": "1", "EGAT2": "2", "EGAT3+": "3+"},
    "sort": ["EGAT0", "EGAT1", "EGAT2", "EGAT3+"]
  },
  "OEHT": {
    "col": 2,
    "text": {"OEHTO": "Odd", "OEHTE": "Even"},
    "sort": ["OEHTO", "OEHTE"]
  },
  "OEAT": {
    "col": 2,
    "text": {"OEATO": "Odd", "OEATE": "Even"},
    "sort": ["OEATO", "OEATE"]
  },
  "WTTS": {
    "col": 2,
    "col188": 1,
    "text": {
      "WTTSH": "Only Home Team Goal",
      "WTTSA": "Only Away Team Goal",
      "WTTSB": "Both Team Goal",
      "WTTSN": "No Goal"
    },
    "sort": ["WTTSH", "WTTSA", "WTTSB", "WTTSN"]
  },
  "CSHT": {
    "col": 2,
    "text": {"CSHTY": "Yes", "CSHTN": "No"},
    "sort": ["CSHTY", "CSHTN"]
  },
  "CSAT": {
    "col": 2,
    "text": {"CSATY": "Yes", "CSATN": "No"},
    "sort": ["CSATY", "CSATN"]
  },
  "WHN": {
    "col": 2,
    "text": {"WHNY": "Yes", "WHNN": "No"},
    "sort": ["WHNY", "WHNN"]
  },
  "WHA": {
    "col": 2,
    "text": {"WHAY": "Yes", "WHAN": "No"},
    "sort": ["WHAY", "WHAN"]
  },
  "BTTS": {
    "col": 3,
    "col188": 1,
    "text": {
      "BTTSHY": "Home Won/Yes",
      "BTTSHN": "Home Won/No",
      "BTTSDY": "Draw/Yes",
      "BTTSDN": "Draw/No",
      "BTTSAY": "Away Won/Yes",
      "BTTSAN": "Away Won/No"
    },
    "sort": ["BTTSHY", "BTTSHN", "BTTSDY", "BTTSDN", "BTTSAY", "BTTSAN"]
  },
  "TBTS": {
    "col": 2,
    "col188": 1,
    "text": {
      "TBTSOY": "Over{total}/Yes",
      "TBTSUY": "Under{total}/Yes",
      "TBTSON": "Over{total}/No",
      "TBTSUN": "Under{total}/No"
    },
    "sort": ["TBTSOY", "TBTSUY", "TBTSON", "TBTSUN"]
  },
  "MOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUHO": "Home Won/Over{total}",
      "MOUHU": "Home Won/Under{total}",
      "MOUDO": "Draw/Over{total}",
      "MOUDU": "Draw/Under{total}",
      "MOUAO": "Away Won/Over{total}",
      "MOUAU": "Away Won/Under{total}"
    },
    "sort": ["MOUHO", "MOUHU", "MOUDO", "MOUDU", "MOUAO", "MOUAU"]
  },
  "HTWBH": {
    "col": 2,
    "text": {"HTWBHY": "Yes", "HTWBHN": "No"},
    "sort": ["HTWBHY", "HTWBHN"]
  },
  "ATWBH": {
    "col": 2,
    "text": {"ATWBHY": "Yes", "ATWBHN": "No"},
    "sort": ["ATWBHY", "ATWBHN"]
  },
  "HTWEH": {
    "col": 2,
    "text": {"HTWEHY": "Yes", "HTWEHN": "No"},
    "sort": ["HTWEHY", "HTWEHN"]
  },
  "ATWEH": {
    "col": 2,
    "text": {"ATWEHY": "Yes", "ATWEHN": "No"},
    "sort": ["ATWEHY", "ATWEHN"]
  },
  "SHSH": {
    "col": 3,
    "col188": 1,
    "text": {"SHSH1": "1st Half", "SHSH2": "2nd Half", "SHSHE": "Same Goal"},
    "sort": ["SHSH1", "SHSH2", "SHSHE"]
  },
  "HSHH": {
    "col": 3,
    "col188": 1,
    "text": {"HSHH1": "1st Half", "HSHH2": "2nd Half", "HSHHE": "Same Goal"},
    "sort": ["HSHH1", "HSHH2", "HSHHE"]
  },
  "HSHA": {
    "col": 3,
    "col188": 1,
    "text": {"HSHA1": "1st Half", "HSHA2": "2nd Half", "HSHAE": "Same Goal"},
    "sort": ["HSHA1", "HSHA2", "HSHAE"]
  },
  "HBTS": {
    "col": 2,
    "col188": 1,
    "text": {
      "HBTSNN": "No/No",
      "HBTSYN": "Yes/No",
      "HBTSYY": "Yes/Yes",
      "HBTSNY": "No/Yes"
    },
    "sort": ["HBTSNN", "HBTSYN", "HBTSYY", "HBTSNY"]
  },
  "SBH_H": {
    "col": 2,
    "text": {"SBH_HY": "Yes", "SBH_HN": "No"},
    "sort": ["SBH_HY", "SBH_HN"]
  },
  "SBH_C": {
    "col": 2,
    "text": {"SBH_CY": "Yes", "SBH_CN": "No"},
    "sort": ["SBH_CY", "SBH_CN"]
  },
  "DC_H": {
    "col": 3,
    "col188": 1,
    "text": {
      "DC_H1X": "Home/ Draw",
      "DC_H12": "Home/Away",
      "DC_HX2": "Draw/ Away"
    },
    "sort": ["DC_H1X", "DC_H12", "DC_HX2"]
  },
  "DNB_H": {
    "col": 2,
    "col188": 1,
    "text": {"DNB_HH": "{homeTeam}", "DNB_HA": "{awayTeam}"},
    "sort": ["DNB_HH", "DNB_HA"]
  },
  "HEG": {
    "col": 2,
    "col188": 1,
    "text": {
      "HEG10": "0",
      "HEG11": "1",
      "HEG12": "2+",
      "HEG20": "0",
      "HEG21": "1",
      "HEG22": "2",
      "HEG23": "3+",
      "HEG30": "0",
      "HEG31": "1",
      "HEG32": "2",
      "HEG33": "3",
      "HEG34": "4+"
    },
    "sort": [
      "HEG10",
      "HEG11",
      "HEG12",
      "HEG20",
      "HEG21",
      "HEG22",
      "HEG23",
      "HEG30",
      "HEG31",
      "HEG32",
      "HEG33",
      "HEG34"
    ]
  },
  "BTS_H": {
    "col": 2,
    "text": {"BTS_HY": "Yes", "BTS_HN": "No"},
    "sort": ["BTS_HY", "BTS_HN"]
  },
  "MBTS_H": {
    "col": 2,
    "col188": 1,
    "text": {
      "MBTS_HHY": "Home Won/Yes",
      "MBTS_HHN": "Home Won/No",
      "MBTS_HDY": "Draw/Yes",
      "MBTS_HDN": "Draw/No",
      "MBTS_HAY": "Away Won/Yes",
      "MBTS_HAN": "Away Won/No"
    },
    "sort": [
      "MBTS_HHY",
      "MBTS_HHN",
      "MBTS_HDY",
      "MBTS_HDN",
      "MBTS_HAY",
      "MBTS_HAN"
    ]
  },
  "MOU_H": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOU_HHO": "Home Won/Over{total}",
      "MOU_HHU": "Home Won/Under{total}",
      "MOU_HDO": "Draw/Over{total}",
      "MOU_HDU": "Draw/Under{total}",
      "MOU_HAO": "Away Won/Over{total}",
      "MOU_HAU": "Away Won/Under{total}"
    },
    "sort": ["MOU_HHO", "MOU_HHU", "MOU_HDO", "MOU_HDU", "MOU_HAO", "MOU_HAU"]
  },
  "HM2": {
    "col": 3,
    "col188": 1,
    "text": {"HM2H": "{homeTeam}", "HM2D": "Draw", "HM2A": "{awayTeam}"},
    "sort": ["HM2H", "HM2D", "HM2A"]
  },
  "HR2": {
    "col": 2,
    "col188": 1,
    "text": {"HR2H": "{homeTeam} {ratio}", "HR2C": "{awayTeam} {ratio}"},
    "sort": ["HR2H", "HR2C"]
  },
  "HOU2": {
    "col": 2,
    "text": {"HOU2O": "Over {ratio}", "HOU2U": "Under {ratio}"},
    "sort": ["HOU2O", "HOU2U"]
  },
  "HEG2": {
    "col": 3,
    "col188": 1,
    "text": {"HEG2_0": "0", "HEG2_1": "1", "HEG2_2": "2+"},
    "sort": ["HEG2_0", "HEG2_1", "HEG2_2"]
  },
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "Odd", "HEO2E": "Even"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "BTTS2": {
    "col": 2,
    "text": {"BTTS2Y": "Yes", "BTTS2N": "No"},
    "sort": ["BTTS2Y", "BTTS2N"]
  },
  "AM_FM": {
    "col": 3,
    "col188": 1,
    "text": {"AM_FMH": "{homeTeam}", "AM_FMD": "Draw", "AM_FMA": "{awayTeam}"},
    "sort": ["AM_FMH", "AM_FMD", "AM_FMA"]
  },
  "AOU_FOU": {
    "col": 2,
    "text": {"AOU_FOUO": "Over {ratio}", "AOU_FOUU": "Under {ratio}"},
    "sort": ["AOU_FOUO", "AOU_FOUU"]
  },
  "TM_FM": {
    "col": 3,
    "col188": 1,
    "text": {"TM_FMH": "{homeTeam}", "TM_FMD": "Draw", "TM_FMA": "{awayTeam}"},
    "sort": ["TM_FMH", "TM_FMD", "TM_FMA"]
  },
  "TOU_FOU": {
    "col": 2,
    "text": {"TOU_FOUO": "Over {ratio}", "TOU_FOUU": "Under {ratio}"},
    "sort": ["TOU_FOUO", "TOU_FOUU"]
  },
  "OTG": {
    "col": 2,
    "text": {"OTGY": "Yes", "OTGN": "No"},
    "sort": ["OTGY", "OTGN"]
  },
  "OTM": {
    "col": 3,
    "col188": 1,
    "text": {"OTMH": "{homeTeam}", "OTMD": "Draw", "OTMA": "{awayTeam}"},
    "sort": ["OTMH", "OTMD", "OTMA"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "Over {ratio}", "OTOUU": "Under {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "OTR": {
    "col": 2,
    "col188": 1,
    "text": {"OTRH": "{homeTeam} {ratio}", "OTRC": "{awayTeam} {ratio}"},
    "sort": ["OTRH", "OTRC"]
  },
  "OTHM": {
    "col": 3,
    "col188": 1,
    "text": {"OTHMH": "{homeTeam}", "OTHMD": "Draw", "OTHMA": "{awayTeam}"},
    "sort": ["OTHMH", "OTHMD", "OTHMA"]
  },
  "OTHR": {
    "col": 2,
    "col188": 1,
    "text": {"OTHRH": "{homeTeam} {ratio}", "OTHRC": "{awayTeam} {ratio}"},
    "sort": ["OTHRH", "OTHRC"]
  },
  "WBP": {
    "col": 2,
    "text": {"WBPY": "Yes", "WBPN": "No"},
    "sort": ["WBPY", "WBPN"]
  },
  "B": {
    "col": 3,
    "col188": 1,
    "text": {"BH": "{homeTeam}", "BA": "{awayTeam}", "BN": "No"},
    "sort": ["BH", "BA", "BN"]
  },
  "C": {
    "col": 3,
    "col188": 1,
    "text": {"CH": "{homeTeam}", "CA": "{awayTeam}", "CN": "No"},
    "sort": ["CH", "CA", "CN"]
  },
  "LC": {
    "col": 3,
    "col188": 1,
    "text": {"LCH": "{homeTeam}", "LCA": "{awayTeam}", "LCN": "No"},
    "sort": ["LCH", "LCA", "LCN"]
  },
  "RA": {
    "col": 3,
    "col188": 1,
    "text": {"RA08": "0-8", "RA911": "9-11", "RA12": "12+"},
    "sort": ["RA08", "RA911", "RA12"]
  },
  "1M_FOU": {
    "col": 2,
    "text": {"1M_FOUO": "Over {ratio}", "1M_FOUU": "Under {ratio}"},
    "sort": ["1M_FOUO", "1M_FOUU"]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "Yes", "OTN": "No"},
    "sort": ["OTY", "OTN"]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "Yes", "ROTN": "No"},
    "sort": ["ROTY", "ROTN"]
  },
  "W_H": {
    "col": 2,
    "text": {"W_HY": "Yes", "W_HN": "No"},
    "sort": ["W_HY", "W_HN"]
  },
  "A_H": {
    "col": 2,
    "text": {"A_HY": "Yes", "A_HN": "No"},
    "sort": ["A_HY", "A_HN"]
  },
  "ANY_W": {
    "col": 2,
    "text": {"ANY_WY": "Yes", "ANY_WN": "No"},
    "sort": ["ANY_WY", "ANY_WN"]
  },
  "TJG": {
    "col": 2,
    "col188": 1,
    "text": {
      "TJG1": "00:00-15:59",
      "TJG2": "16:00-30:59",
      "TJG3": "31:00-45:59",
      "TJG4": "46-60",
      "TJG5": "61-75",
      "TJG6": "76-90",
      "TJGN": "No Goal"
    },
    "sort": ["TJG1", "TJG2", "TJG3", "TJG4", "TJG5", "TJG6", "TJGN"]
  },
  "FGT": {
    "col": 3,
    "col188": 1,
    "text": {
      "FGTS": "shoot",
      "FGTH": "header",
      "FGTN": "own goal",
      "FGTP": "penalty kick",
      "FGTF": "free kick",
      "FGTO": "No Goal"
    },
    "sort": ["FGTS", "FGTH", "FGTN", "FGTP", "FGTF", "FGTO"]
  },
  "WM1": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM1H1": "Home Team-Net winning by 1",
      "WM1H2": "Home Team-Net winning by 2",
      "WM1H3": "Home Team-Net winning by 3",
      "WM1C1": "Away Team-Net winning by 1",
      "WM1C2": "Away Team-Net winning by 2",
      "WM1C3": "Away Team-Net winning by 3",
      "WM1N": "Draw"
    },
    "sort": ["WM1H1", "WM1H2", "WM1H3", "WM1C1", "WM1C2", "WM1C3", "WM1N"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "Home Team-Net winning by 1",
      "WMH2": "Home Team-Net winning by 2",
      "WMH3": "Home Team-Net winning by 3",
      "WMHOV": "Home Team-Net winning by 4+",
      "WMC1": "Away Team-Net winning by 1",
      "WMC2": "Away Team-Net winning by 2",
      "WMC3": "Away Team-Net winning by 3",
      "WMCOV": "Away Team-Net winning by 4+",
      "WM0": "0-0Draw",
      "WMN": "Other type of draw with goal"
    },
    "sort": [
      "WMH1",
      "WMC1",
      "WMH2",
      "WMC2",
      "WMH3",
      "WMC3",
      "WMHOV",
      "WMCOV",
      "WM0",
      "WMN"
    ]
  },
  "MTS": {
    "col": 3,
    "col188": 1,
    "text": {
      "MTSHY": "Home Won/Yes",
      "MTSHN": "Home Won/No",
      "MTSNY": "Draw/Yes",
      "MTSNN": "Draw/No",
      "MTSCY": "Away Won/Yes",
      "MTSCN": "Away Won/No",
      'MTSDY': 'Draw/Yes',
      'MTSDN': 'Draw/No',
      'MTSHW': 'Home Team/Winning by Not losing any goal',
      'MTSCW': 'Away Team/Winning by Not losing any goal'
    },
    "sort": [
      'MTSHY',
      'MTSHN',
      'MTSNY',
      'MTSNN',
      'MTSCY',
      'MTSCN',
      'MTSDY',
      'MTSDN',
      'MTSHW',
      'MTSCW'
    ]
  },
  "RMTS": {
    "col": 3,
    "col188": 1,
    "text": {
      "RMTSHY": "Home Won/Yes",
      "RMTSHN": "Home Won/No",
      "RMTSNY": "Draw/Yes",
      "RMTSNN": "Draw/No",
      "RMTSCY": "Away Won/Yes",
      "RMTSCN": "Away Won/No"
    },
    "sort": ["RMTSHY", "RMTSHN", "RMTSNY", "RMTSNN", "RMTSCY", "RMTSCN"]
  },
  "OUTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTAOY": "Over 1.5 & Yes",
      "OUTAON": "Over 1.5 & No",
      "OUTAUY": "Under 1.5 & Yes ",
      "OUTAUN": "Under 1.5 & No"
    },
    "sort": ["OUTAOY", "OUTAON", "OUTAUY", "OUTAUN"]
  },
  "RUTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTAOY": "Over 1.5 & Yes",
      "RUTAON": "Over 1.5 & No",
      "RUTAUY": "Under 1.5 & Yes ",
      "RUTAUN": "Under 1.5 & No"
    },
    "sort": ["RUTAOY", "RUTAON", "RUTAUY", "RUTAUN"]
  },
  "OUTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTBOY": "Over 2.5 & Yes",
      "OUTBON": "Over 2.5 & No",
      "OUTBUY": "Under 2.5 & Yes ",
      "OUTBUN": "Under 2.5 & No"
    },
    "sort": ["OUTBOY", "OUTBON", "OUTBUY", "OUTBUN"]
  },
  "RUTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTBOY": "Over 2.5 & Yes",
      "RUTBON": "Over 2.5 & No",
      "RUTBUY": "Under 2.5 & Yes ",
      "RUTBUN": "Under 2.5 & No"
    },
    "sort": ["RUTBOY", "RUTBON", "RUTBUY", "RUTBUN"]
  },
  "OUTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTCOY": "Over 3.5 & Yes",
      "OUTCON": "Over 3.5 & No",
      "OUTCUY": "Under 3.5 & Yes ",
      "OUTCUN": "Under 3.5 & No"
    },
    "sort": ["OUTCOY", "OUTCON", "OUTCUY", "OUTCUN"]
  },
  "RUTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTCOY": "Over 3.5 & Yes",
      "RUTCON": "Over 3.5 & No",
      "RUTCUY": "Under 3.5 & Yes ",
      "RUTCUN": "Under 3.5 & No"
    },
    "sort": ["RUTCOY", "RUTCON", "RUTCUY", "RUTCUN"]
  },
  "OUTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTDOY": "Over 4.5 & Yes",
      "OUTDON": "Over 4.5 & No",
      "OUTDUY": "Under 4.5 & Yes ",
      "OUTDUN": "Under 4.5 & No"
    },
    "sort": ["OUTDOY", "OUTDON", "OUTDUY", "OUTDUN"]
  },
  "RUTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTDOY": "Over 4.5 & Yes",
      "RUTDON": "Over 4.5 & No",
      "RUTDUY": "Under 4.5 & Yes ",
      "RUTDUN": "Under 4.5 & No"
    },
    "sort": ["RUTDOY", "RUTDON", "RUTDUY", "RUTDUN"]
  },
  "MOUA": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUACO": "Away Won & Over 1.5",
      "MOUACU": "Away Won & Under 1.5 ",
      "MOUAHO": "Home Won & Over 1.5",
      "MOUAHU": "Home Won & Under 1.5",
      "MOUANO": "Draw & Over 1.5",
      "MOUANU": "Draw & Under 1.5"
    },
    "sort": ['MOUAHO', 'MOUAHU', 'MOUANO', 'MOUANU', 'MOUACO', 'MOUACU']
  },
  "MOUB": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUBCO": "Away Won & Over 2.5",
      "MOUBCU": "Away Won & Under 2.5 ",
      "MOUBHO": "Home Won & Over 2.5",
      "MOUBHU": "Home Won & Under 2.5",
      "MOUBNO": "Draw & Over 2.5",
      "MOUBNU": "Draw & Under 2.5"
    },
    "sort": ['MOUBHO', 'MOUBHU', 'MOUBNO', 'MOUBNU', 'MOUBCO', 'MOUBCU']
  },
  "MOUC": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUCCO": "Away Won & Over 3.5",
      "MOUCCU": "Away Won & Under 3.5 ",
      "MOUCHO": "Home Won & Over 3.5",
      "MOUCHU": "Home Won & Under 3.5",
      "MOUCNO": "Draw & Over 3.5",
      "MOUCNU": "Draw & Under 3.5"
    },
    "sort": ['MOUCHO', 'MOUCHU', 'MOUCNO', 'MOUCNU', 'MOUCCO', 'MOUCCU']
  },
  "MOUD": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUDCO": "Away Won & Over 4.5",
      "MOUDCU": "Away Won & Under 4.5 ",
      "MOUDHO": "Home Won & Over 4.5",
      "MOUDHU": "Home Won & Under 4.5",
      "MOUDNO": "Draw & Over 4.5",
      "MOUDNU": "Draw & Under 4.5"
    },
    "sort": [ 'MOUDHO', 'MOUDHU', 'MOUDNO', 'MOUDNU', 'MOUDCO', 'MOUDCU']
  },
  "MG": {
    "col": 3,
    "col188": 1,
    "text": {"MGH": "1st Half", "MGC": "2nd Half", "MGN": "Same Goal "},
    "sort": ["MGH", "MGC", "MGN"]
  },
  "HTS": {
    "col": 2,
    "text": {"HTSY": "Yes", "HTSN": "No "},
    "sort": ["HTSY", "HTSN"]
  },
  "RTS2": {
    "col": 2,
    "text": {"RTS2Y": "Yes", "RTS2N": "No "},
    "sort": ["RTS2Y", "RTS2N"]
  },
  "RPS": {
    "col": 2,
    "text": {"RPSY": "Yes", "RPSN": "No "},
    "sort": ["RPSY", "RPSN"]
  },
  "RNBA": {
    "col": 2,
    "col188": 1,
    "text": {"RNBAH": "{homeTeam}", "RNBAC": "{awayTeam}"},
    "sort": ["RNBAH", "RNBAC"]
  },
  "RNBB": {
    "col": 2,
    "col188": 1,
    "text": {"RNBBH": "{homeTeam}", "RNBBC": "{awayTeam}"},
    "sort": ["RNBBH", "RNBBC"]
  },
  "RNBC": {
    "col": 2,
    "col188": 1,
    "text": {"RNBCH": "{homeTeam}", "RNBCC": "{awayTeam}"},
    "sort": ["RNBCH", "RNBCC"]
  },
  "RNBD": {
    "col": 2,
    "col188": 1,
    "text": {"RNBDH": "{homeTeam}", "RNBDC": "{awayTeam}"},
    "sort": ["RNBDH", "RNBDC"]
  },
  "RNBE": {
    "col": 2,
    "col188": 1,
    "text": {"RNBEH": "{homeTeam}", "RNBEC": "{awayTeam}"},
    "sort": ["RNBEH", "RNBEC"]
  },
  "RNBF": {
    "col": 2,
    "col188": 1,
    "text": {"RNBFH": "{homeTeam}", "RNBFC": "{awayTeam}"},
    "sort": ["RNBFH", "RNBFC"]
  },
  "RNBG": {
    "col": 2,
    "col188": 1,
    "text": {"RNBGH": "{homeTeam}", "RNBGC": "{awayTeam}"},
    "sort": ["RNBGH", "RNBGC"]
  },
  "RNBH": {
    "col": 2,
    "col188": 1,
    "text": {"RNBHH": "{homeTeam}", "RNBHC": "{awayTeam}"},
    "sort": ["RNBHH", "RNBHC"]
  },
  "RNBI": {
    "col": 2,
    "col188": 1,
    "text": {"RNBIH": "{homeTeam}", "RNBIC": "{awayTeam}"},
    "sort": ["RNBIH", "RNBIC"]
  },
  "RNBJ": {
    "col": 2,
    "col188": 1,
    "text": {"RNBJH": "{homeTeam}", "RNBJC": "{awayTeam}"},
    "sort": ["RNBJH", "RNBJC"]
  },
  "RNBK": {
    "col": 2,
    "col188": 1,
    "text": {"RNBKH": "{homeTeam}", "RNBKC": "{awayTeam}"},
    "sort": ["RNBKH", "RNBKC"]
  },
  "RNBL": {
    "col": 2,
    "col188": 1,
    "text": {"RNBLH": "{homeTeam}", "RNBLC": "{awayTeam}"},
    "sort": ["RNBLH", "RNBLC"]
  },
  "RNBM": {
    "col": 2,
    "col188": 1,
    "text": {"RNBMH": "{homeTeam}", "RNBMC": "{awayTeam}"},
    "sort": ["RNBMH", "RNBMC"]
  },
  "RNBN": {
    "col": 2,
    "col188": 1,
    "text": {"RNBNH": "{homeTeam}", "RNBNC": "{awayTeam}"},
    "sort": ["RNBNH", "RNBNC"]
  },
  "RNBO": {
    "col": 2,
    "col188": 1,
    "text": {"RNBOH": "{homeTeam}", "RNBOC": "{awayTeam}"},
    "sort": ["RNBOH", "RNBOC"]
  },
  "RNC1": {
    "col": 2,
    "col188": 1,
    "text": {"RNC1H": "{homeTeam}", "RNC1C": "{awayTeam}"},
    "sort": ["RNC1H", "RNC1C"]
  },
  "RNC2": {
    "col": 2,
    "col188": 1,
    "text": {"RNC2H": "{homeTeam}", "RNC2C": "{awayTeam}"},
    "sort": ["RNC2H", "RNC2C"]
  },
  "RNC3": {
    "col": 2,
    "col188": 1,
    "text": {"RNC3H": "{homeTeam}", "RNC3C": "{awayTeam}"},
    "sort": ["RNC3H", "RNC3C"]
  },
  "RNC4": {
    "col": 2,
    "col188": 1,
    "text": {"RNC4H": "{homeTeam}", "RNC4C": "{awayTeam}"},
    "sort": ["RNC4H", "RNC4C"]
  },
  "RNC5": {
    "col": 2,
    "col188": 1,
    "text": {"RNC5H": "{homeTeam}", "RNC5C": "{awayTeam}"},
    "sort": ["RNC5H", "RNC5C"]
  },
  "RNC6": {
    "col": 2,
    "col188": 1,
    "text": {"RNC6H": "{homeTeam}", "RNC6C": "{awayTeam}"},
    "sort": ["RNC6H", "RNC6C"]
  },
  "RNC7": {
    "col": 2,
    "col188": 1,
    "text": {"RNC7H": "{homeTeam}", "RNC7C": "{awayTeam}"},
    "sort": ["RNC7H", "RNC7C"]
  },
  "RNC8": {
    "col": 2,
    "col188": 1,
    "text": {"RNC8H": "{homeTeam}", "RNC8C": "{awayTeam}"},
    "sort": ["RNC8H", "RNC8C"]
  },
  "RNC9": {
    "col": 2,
    "col188": 1,
    "text": {"RNC9H": "{homeTeam}", "RNC9C": "{awayTeam}"},
    "sort": ["RNC9H", "RNC9C"]
  },
  "RNCA": {
    "col": 2,
    "col188": 1,
    "text": {"RNCAH": "{homeTeam}", "RNCAC": "{awayTeam}"},
    "sort": ["RNCAH", "RNCAC"]
  },
  "RNCB": {
    "col": 2,
    "col188": 1,
    "text": {"RNCBH": "{homeTeam}", "RNCBC": "{awayTeam}"},
    "sort": ["RNCBH", "RNCBC"]
  },
  "RNCC": {
    "col": 2,
    "col188": 1,
    "text": {"RNCCH": "{homeTeam}", "RNCCC": "{awayTeam}"},
    "sort": ["RNCCH", "RNCCC"]
  },
  "RNCD": {
    "col": 2,
    "col188": 1,
    "text": {"RNCDH": "{homeTeam}", "RNCDC": "{awayTeam}"},
    "sort": ["RNCDH", "RNCDC"]
  },
  "RNCE": {
    "col": 2,
    "col188": 1,
    "text": {"RNCEH": "{homeTeam}", "RNCEC": "{awayTeam}"},
    "sort": ["RNCEH", "RNCEC"]
  },
  "RNCF": {
    "col": 2,
    "col188": 1,
    "text": {"RNCFH": "{homeTeam}", "RNCFC": "{awayTeam}"},
    "sort": ["RNCFH", "RNCFC"]
  },
  "RNCG": {
    "col": 2,
    "col188": 1,
    "text": {"RNCGH": "{homeTeam}", "RNCGC": "{awayTeam}"},
    "sort": ["RNCGH", "RNCGC"]
  },
  "RNCH": {
    "col": 2,
    "col188": 1,
    "text": {"RNCHH": "{homeTeam}", "RNCHC": "{awayTeam}"},
    "sort": ["RNCHH", "RNCHC"]
  },
  "RNCI": {
    "col": 2,
    "col188": 1,
    "text": {"RNCIH": "{homeTeam}", "RNCIC": "{awayTeam}"},
    "sort": ["RNCIH", "RNCIC"]
  },
  "RNCJ": {
    "col": 2,
    "col188": 1,
    "text": {"RNCJH": "{homeTeam}", "RNCJC": "{awayTeam}"},
    "sort": ["RNCJH", "RNCJC"]
  },
  "RNCK": {
    "col": 2,
    "col188": 1,
    "text": {"RNCKH": "{homeTeam}", "RNCKC": "{awayTeam}"},
    "sort": ["RNCKH", "RNCKC"]
  },
  "RNCL": {
    "col": 2,
    "col188": 1,
    "text": {"RNCLH": "{homeTeam}", "RNCLC": "{awayTeam}"},
    "sort": ["RNCLH", "RNCLC"]
  },
  "RNCM": {
    "col": 2,
    "col188": 1,
    "text": {"RNCMH": "{homeTeam}", "RNCMC": "{awayTeam}"},
    "sort": ["RNCMH", "RNCMC"]
  },
  "RNCN": {
    "col": 2,
    "col188": 1,
    "text": {"RNCNH": "{homeTeam}", "RNCNC": "{awayTeam}"},
    "sort": ["RNCNH", "RNCNC"]
  },
  "RNCO": {
    "col": 2,
    "col188": 1,
    "text": {"RNCOH": "{homeTeam}", "RNCOC": "{awayTeam}"},
    "sort": ["RNCOH", "RNCOC"]
  },
  "RNCP": {
    "col": 2,
    "col188": 1,
    "text": {"RNCPH": "{homeTeam}", "RNCPC": "{awayTeam}"},
    "sort": ["RNCPH", "RNCPC"]
  },
  "RNCQ": {
    "col": 2,
    "col188": 1,
    "text": {"RNCQH": "{homeTeam}", "RNCQC": "{awayTeam}"},
    "sort": ["RNCQH", "RNCQC"]
  },
  "RNCR": {
    "col": 2,
    "col188": 1,
    "text": {"RNCRH": "{homeTeam}", "RNCRC": "{awayTeam}"},
    "sort": ["RNCRH", "RNCRC"]
  },
  "RNCS": {
    "col": 2,
    "col188": 1,
    "text": {"RNCSH": "{homeTeam}", "RNCSC": "{awayTeam}"},
    "sort": ["RNCSH", "RNCSC"]
  },
  "RNCT": {
    "col": 2,
    "col188": 1,
    "text": {"RNCTH": "{homeTeam}", "RNCTC": "{awayTeam}"},
    "sort": ["RNCTH", "RNCTC"]
  },
  "RNCU": {
    "col": 2,
    "col188": 1,
    "text": {"RNCUH": "{homeTeam}", "RNCUC": "{awayTeam}"},
    "sort": ["RNCUH", "RNCUC"]
  },
  "DG": {
    "col": 3,
    "col188": 1,
    "text": {
      "DGHH": "Home Team/Draw & Home Team(First Goal) ",
      "DGHC": "Home Team/Draw & Away Team(First Goal) ",
      "DGCC": "Away Team/Draw & Away Team(First Goal) ",
      "DGCH": "Away Team/Draw & Home Team(First Goal) ",
      "DGSH": "Home Team/Away Team & Home Team(First Goal) ",
      "DGSC": "Home Team/Away Team & Away Team(First Goal) "
    },
    "sort": ["DGHH", "DGHC", "DGCC", "DGCH", "DGSH", "DGSC"]
  },
  "RDG": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDGHH": "Home Team/Draw & Home Team(First Goal) ",
      "RDGHC": "Home Team/Draw & Away Team(First Goal) ",
      "RDGCC": "Away Team/Draw & Away Team(First Goal) ",
      "RDGCH": "Away Team/Draw & Home Team(First Goal) ",
      "RDGSH": "Home Team/Away Team & Home Team(First Goal) ",
      "RDGSC": "Home Team/Away Team & Away Team(First Goal) "
    },
    "sort": ["RDGHH", "RDGHC", "RDGCC", "RDGCH", "RDGSH", "RDGSC"]
  },
  "DS": {
    "col": 3,
    "col188": 1,
    "text": {
      "DSHY": "Home Team/Draw & Yes",
      "DSHN": "Home Team/Draw & No",
      "DSSY": "Home Team/Away Team & Yes",
      "DSSN": "Home Team/Away Team & No",
      "DSCY": "Draw/Away Team & Yes",
      "DSCN": "Draw/Away Team & No"
    },
    "sort": ["DSHY", "DSHN", "DSSY", "DSSN", "DSCY", "DSCN"]
  },
  "RDS": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDSHY": "Home Team/Draw & Yes",
      "RDSHN": "Home Team/Draw & No",
      "RDSSY": "Home Team/Away Team & Yes",
      "RDSSN": "Home Team/Away Team & No",
      "RDSCY": "Draw/Away Team & Yes",
      "RDSCN": "Draw/Away Team & No"
    },
    "sort": ["RDSHY", "RDSHN", "RDSSY", "RDSSN", "RDSCY", "RDSCN"]
  },
  "DUA": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUAHO": "Home Team/Draw & Over 1.5",
      "DUAHU": "Home Team/Draw & Under 1.5 ",
      "DUACO": "Away Team/Draw & Over 1.5",
      "DUACU": "Away Team/Draw & Under 1.5 ",
      "DUASO": "Home Team/Away Team & Over 1.5 ",
      "DUASU": "Home Team/Away Team & Under 1.5 "
    },
    "sort": ["DUAHO", "DUAHU", "DUACO", "DUACU", "DUASO", "DUASU"]
  },
  "RDUA": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUAHO": "Home Team/Draw & Over 1.5",
      "RDUAHU": "Home Team/Draw & Under 1.5 ",
      "RDUACO": "Away Team/Draw & Over 1.5",
      "RDUACU": "Away Team/Draw & Under 1.5 ",
      "RDUASO": "Home Team/Away Team & Over 1.5 ",
      "RDUASU": "Home Team/Away Team & Under 1.5 "
    },
    "sort": ["RDUAHO", "RDUAHU", "RDUACO", "RDUACU", "RDUASO", "RDUASU"]
  },
  "DUB": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUBHO": "Home Team/Draw & Over 2.5",
      "DUBHU": "Home Team/Draw & Under 2.5 ",
      "DUBCO": "Away Team/Draw & Over 2.5",
      "DUBCU": "Away Team/Draw & Under 2.5 ",
      "DUBSO": "Home Team/Away Team & Over 2.5 ",
      "DUBSU": "Home Team/Away Team & Under 2.5 "
    },
    "sort": ["DUBHO", "DUBHU", "DUBCO", "DUBCU", "DUBSO", "DUBSU"]
  },
  "RDUB": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUBHO": "Home Team/Draw & Over 2.5",
      "RDUBHU": "Home Team/Draw & Under 2.5 ",
      "RDUBCO": "Away Team/Draw & Over 2.5",
      "RDUBCU": "Away Team/Draw & Under 2.5 ",
      "RDUBSO": "Home Team/Away Team & Over 2.5 ",
      "RDUBSU": "Home Team/Away Team & Under 2.5 "
    },
    "sort": ["RDUBHO", "RDUBHU", "RDUBCO", "RDUBCU", "RDUBSO", "RDUBSU"]
  },
  "DUC": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUCHO": "Home Team/Draw & Over 3.5",
      "DUCHU": "Home Team/Draw & Under 3.5 ",
      "DUCCO": "Away Team/Draw & Over 3.5",
      "DUCCU": "Away Team/Draw & Under 3.5 ",
      "DUCSO": "Home Team/Away Team & Over 3.5 ",
      "DUCSU": "Home Team/Away Team & Under 3.5 "
    },
    "sort": ["DUCHO", "DUCHU", "DUCCO", "DUCCU", "DUCSO", "DUCSU"]
  },
  "RDUC": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUCHO": "Home Team/Draw & Over 3.5",
      "RDUCHU": "Home Team/Draw & Under 3.5 ",
      "RDUCCO": "Away Team/Draw & Over 3.5",
      "RDUCCU": "Away Team/Draw & Under 3.5 ",
      "RDUCSO": "Home Team/Away Team & Over 3.5 ",
      "RDUCSU": "Home Team/Away Team & Under 3.5 "
    },
    "sort": ["RDUCHO", "RDUCHU", "RDUCCO", "RDUCCU", "RDUCSO", "RDUCSU"]
  },
  "DUD": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUDHO": "Home Team/Draw & Over 4.5",
      "DUDHU": "Home Team/Draw & Under 4.5 ",
      "DUDCO": "Away Team/Draw & Over 4.5",
      "DUDCU": "Away Team/Draw & Under 4.5 ",
      "DUDSO": "Home Team/Away Team & Over 4.5 ",
      "DUDSU": "Home Team/Away Team & Under 4.5 "
    },
    "sort": ["DUDHO", "DUDHU", "DUDCO", "DUDCU", "DUDSO", "DUDSU"]
  },
  "RDUD": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUDHO": "Home Team/Draw & Over 4.5",
      "RDUDHU": "Home Team/Draw & Under 4.5 ",
      "RDUDCO": "Away Team/Draw & Over 4.5",
      "RDUDCU": "Away Team/Draw & Under 4.5 ",
      "RDUDSO": "Home Team/Away Team & Over 4.5 ",
      "RDUDSU": "Home Team/Away Team & Under 4.5 "
    },
    "sort": ["RDUDHO", "RDUDHU", "RDUDCO", "RDUDCU", "RDUDSO", "RDUDSU"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "Odd", "HEOHE": "Even"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "RHEOH": {
    "col": 2,
    "text": {"RHEOHO": "Odd", "RHEOHE": "Even"},
    "sort": ["RHEOHO", "RHEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "Odd", "HEOCE": "Even"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "RHEOC": {
    "col": 2,
    "text": {"RHEOCO": "Odd", "RHEOCE": "Even"},
    "sort": ["RHEOCO", "RHEOCE"]
  },
  "MPG": {
    "col": 2,
    "col188": 1,
    "text": {
      "MPGHH": "Home Won & Home TeamFirst Goal ",
      "MPGCC": "Away Won & Away TeamFirst Goal ",
      "MPGHC": "Home Won & Away TeamFirst Goal",
      "MPGCH": "Away Won & Home TeamFirst Goal ",
      "MPGNH": "Draw & Home TeamFirst Goal ",
      "MPGNC": "Draw & Away TeamFirst Goal"
    },
    "sort": ["MPGHH", "MPGCC", "MPGHC", "MPGCH", "MPGNH", "MPGNC"]
  },
  "RMPG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RMPGCC": "Away Won & Away TeamFirst Goal ",
      "RMPGCH": "Away Won & Home TeamFirst Goal ",
      "RMPGHC": "Home Won & Away TeamFirst Goal",
      "RMPGHH": "Home Won & Home TeamFirst Goal ",
      "RMPGNC": "Draw & Away TeamFirst Goal",
      "RMPGNH": "Draw & Home TeamFirst Goal "
    },
    "sort": ["RMPGCC", "RMPGCH", "RMPGHC", "RMPGHH", "RMPGNC", "RMPGNH"]
  },
  "MQ": {
    "col": 2,
    "col188": 1,
    "text": {
      "MQH": "Home Team won over Regulation time",
      "MQHOT": "Home Team won over Overtime",
      "MQHPK": "Home Team won over PK",
      "MQC": "Away Team won over Regulation time",
      "MQCOT": "Away Team won over Overtime",
      "MQCPK": "Away Team won over PK"
    },
    "sort": ["MQH", "MQHOT", "MQHPK", "MQC", "MQCOT", "MQCPK"]
  },
  "OG": {
    "col": 2,
    "text": {"OGY": "Yes", "OGN": "No"},
    "sort": ["OGY", "OGN"]
  },
  "OUEA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEAOO": "Over 1.5 & Odd",
      "OUEAOE": "Over 1.5 & Even",
      "OUEAUO": "Under 1.5 & Odd",
      "OUEAUE": "Under 1.5 & Even"
    },
    "sort": ["OUEAOO", "OUEAOE", "OUEAUO", "OUEAUE"]
  },
  "RUEA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUEAOO": "Over 1.5 & Odd",
      "RUEAOE": "Over 1.5 & Even",
      "RUEAUO": "Under 1.5 & Odd",
      "RUEAUE": "Under 1.5 & Even"
    },
    "sort": ["RUEAOO", "RUEAOE", "RUEAUO", "RUEAUE"]
  },
  "OUEB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEBOO": "Over 2.5 & Odd",
      "OUEBOE": "Over 2.5 & Even",
      "OUEBUO": "Under 2.5 & Odd",
      "OUEBUE": "Under 2.5 & Even"
    },
    "sort": ["OUEBOO", "OUEBOE", "OUEBUO", "OUEBUE"]
  },
  "RUEB": {
    "col": 2,
    "text": {
      "RUEBOO": "Over 2.5 & Odd",
      "RUEBOE": "Over 2.5 & Even",
      "RUEBUO": "Under 2.5 & Odd",
      "RUEBUE": "Under 2.5 & Even"
    },
    "sort": ["RUEBOO", "RUEBOE", "RUEBUO", "RUEBUE"]
  },
  "OUEC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUECOO": "Over 3.5 & Odd",
      "OUECOE": "Over 3.5 & Even",
      "OUECUO": "Under 3.5 & Odd",
      "OUECUE": "Under 3.5 & Even"
    },
    "sort": ["OUECOO", "OUECOE", "OUECUO", "OUECUE"]
  },
  "RUEC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUECOO": "Over 3.5 & Odd",
      "RUECOE": "Over 3.5 & Even",
      "RUECUO": "Under 3.5 & Odd",
      "RUECUE": "Under 3.5 & Even"
    },
    "sort": ["RUECOO", "RUECOE", "RUECUO", "RUECUE"]
  },
  "OUED": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEDOO": "Over 4.5 & Odd",
      "OUEDOE": "Over 4.5 & Even",
      "OUEDUO": "Under 4.5 & Odd",
      "OUEDUE": "Under 4.5 & Even"
    },
    "sort": ["OUEDOO", "OUEDOE", "OUEDUO", "OUEDUE"]
  },
  "RUED": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUEDOO": "Over 4.5 & Odd",
      "RUEDOE": "Over 4.5 & Even",
      "RUEDUO": "Under 4.5 & Odd",
      "RUEDUE": "Under 4.5 & Even"
    },
    "sort": ["RUEDOO", "RUEDOE", "RUEDUO", "RUEDUE"]
  },
  "OUPA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPAOH": "Over 1.5 & Home Team",
      "OUPAOC": "Over 1.5 & Away Team",
      "OUPAUH": "Under 1.5 & Home Team",
      "OUPAUC": "Under 1.5 & Away Team"
    },
    "sort": ["OUPAOH", "OUPAOC", "OUPAUH", "OUPAUC"]
  },
  "RUPA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPAOH": "Over 1.5 & Home Team",
      "RUPAOC": "Over 1.5 & Away Team",
      "RUPAUH": "Under 1.5 & Home Team",
      "RUPAUC": "Under 1.5 & Away Team"
    },
    "sort": ["RUPAOH", "RUPAOC", "RUPAUH", "RUPAUC"]
  },
  "OUPB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPBOH": "Over 2.5 & Home Team",
      "OUPBOC": "Over 2.5 & Away Team",
      "OUPBUH": "Under 2.5 & Home Team",
      "OUPBUC": "Under 2.5 & Away Team"
    },
    "sort": ["OUPBOH", "OUPBOC", "OUPBUH", "OUPBUC"]
  },
  "RUPB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPBOH": "Over 2.5 & Home Team",
      "RUPBOC": "Over 2.5 & Away Team",
      "RUPBUH": "Under 2.5 & Home Team",
      "RUPBUC": "Under 2.5 & Away Team"
    },
    "sort": ["RUPBOH", "RUPBOC", "RUPBUH", "RUPBUC"]
  },
  "OUPC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPCOH": "Over 3.5 & Home Team",
      "OUPCOC": "Over 3.5 & Away Team",
      "OUPCUH": "Under 3.5 & Home Team",
      "OUPCUC": "Under 3.5 & Away Team"
    },
    "sort": ["OUPCOH", "OUPCOC", "OUPCUH", "OUPCUC"]
  },
  "RUPC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPCOH": "Over 3.5 & Home Team",
      "RUPCOC": "Over 3.5 & Away Team",
      "RUPCUH": "Under 3.5 & Home Team",
      "RUPCUC": "Under 3.5 & Away Team"
    },
    "sort": ["RUPCOH", "RUPCOC", "RUPCUH", "RUPCUC"]
  },
  "OUPD": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPDOH": "Over 4.5 & Home Team",
      "OUPDOC": "Over 4.5 & Away Team",
      "OUPDUH": "Under 4.5 & Home Team",
      "OUPDUC": "Under 4.5 & Away Team"
    },
    "sort": ["OUPDOH", "OUPDOC", "OUPDUH", "OUPDUC"]
  },
  "RUPD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPDOH": "Over 4.5 & Home Team",
      "RUPDOC": "Over 4.5 & Away Team",
      "RUPDUH": "Under 4.5 & Home Team",
      "RUPDUC": "Under 4.5 & Away Team"
    },
    "sort": ["RUPDOH", "RUPDOC", "RUPDUH", "RUPDUC"]
  },
  "RPF": {
    "col": 2,
    "col188": 1,
    "text": {
      "RPF1": "Third Round",
      "RPF2": "Fourth Round",
      "RPF3": "Fifth Round",
      "RPFOV": "Sixth Round or more"
    },
    "sort": ["RPF1", "RPF2", "RPF3", "RPFOV"]
  },
  "RPXA": {
    "col": 3,
    "col188": 1,
    "text": {"RPXAH": "{homeTeam}", "RPXAN": "Draw", "RPXAC": "{awayTeam}"},
    "sort": ["RPXAH", "RPXAN", "RPXAC"]
  },
  "RPXB": {
    "col": 3,
    "col188": 1,
    "text": {"RPXBH": "{homeTeam}", "RPXBN": "Draw", "RPXBC": "{awayTeam}"},
    "sort": ["RPXBH", "RPXBN", "RPXBC"]
  },
  "RPXC": {
    "col": 3,
    "col188": 1,
    "text": {"RPXCH": "{homeTeam}", "RPXCN": "Draw", "RPXCC": "{awayTeam}"},
    "sort": ["RPXCH", "RPXCN", "RPXCC"]
  },
  "RPXD": {
    "col": 3,
    "col188": 1,
    "text": {"RPXDH": "{homeTeam}", "RPXDN": "Draw", "RPXDC": "{awayTeam}"},
    "sort": ["RPXDH", "RPXDN", "RPXDC"]
  },
  "RPXE": {
    "col": 3,
    "col188": 1,
    "text": {"RPXEH": "{homeTeam}", "RPXEN": "Draw", "RPXEC": "{awayTeam}"},
    "sort": ["RPXEH", "RPXEN", "RPXEC"]
  },
  "RPXF": {
    "col": 3,
    "col188": 1,
    "text": {"RPXFH": "{homeTeam}", "RPXFN": "Draw", "RPXFC": "{awayTeam}"},
    "sort": ["RPXFH", "RPXFN", "RPXFC"]
  },
  "RPXG": {
    "col": 3,
    "col188": 1,
    "text": {"RPXGH": "{homeTeam}", "RPXGN": "Draw", "RPXGC": "{awayTeam}"},
    "sort": ["RPXGH", "RPXGN", "RPXGC"]
  },
  "RPXH": {
    "col": 3,
    "col188": 1,
    "text": {"RPXHH": "{homeTeam}", "RPXHN": "Draw", "RPXHC": "{awayTeam}"},
    "sort": ["RPXHH", "RPXHN", "RPXHC"]
  },
  "RPXI": {
    "col": 3,
    "col188": 1,
    "text": {"RPXIH": "{homeTeam}", "RPXIN": "Draw", "RPXIC": "{awayTeam}"},
    "sort": ["RPXIH", "RPXIN", "RPXIC"]
  },
  "RPXJ": {
    "col": 3,
    "col188": 1,
    "text": {"RPXJH": "{homeTeam}", "RPXJN": "Draw", "RPXJC": "{awayTeam}"},
    "sort": ["RPXJH", "RPXJN", "RPXJC"]
  },
  "RPXK": {
    "col": 3,
    "col188": 1,
    "text": {"RPXKH": "{homeTeam}", "RPXKN": "Draw", "RPXKC": "{awayTeam}"},
    "sort": ["RPXKH", "RPXKN", "RPXKC"]
  },
  "RPXL": {
    "col": 3,
    "col188": 1,
    "text": {"RPXLH": "{homeTeam}", "RPXLN": "Draw", "RPXLC": "{awayTeam}"},
    "sort": ["RPXLH", "RPXLN", "RPXLC"]
  },
  "RPXM": {
    "col": 3,
    "col188": 1,
    "text": {"RPXMH": "{homeTeam}", "RPXMN": "Draw", "RPXMC": "{awayTeam}"},
    "sort": ["RPXMH", "RPXMN", "RPXMC"]
  },
  "RPXN": {
    "col": 3,
    "col188": 1,
    "text": {"RPXNH": "{homeTeam}", "RPXNN": "Draw", "RPXNC": "{awayTeam}"},
    "sort": ["RPXNH", "RPXNN", "RPXNC"]
  },
  "RPXO": {
    "col": 3,
    "col188": 1,
    "text": {"RPXOH": "{homeTeam}", "RPXON": "Draw", "RPXOC": "{awayTeam}"},
    "sort": ["RPXOH", "RPXON", "RPXOC"]
  },
  "RSCA": {
    "col": 2,
    "text": {"RSCAY": "Yes", "RSCAN": "No"},
    "sort": ["RSCAY", "RSCAN"]
  },
  "RSCB": {
    "col": 2,
    "text": {"RSCBY": "Yes", "RSCBN": "No"},
    "sort": ["RSCBY", "RSCBN"]
  },
  "RSCC": {
    "col": 2,
    "text": {"RSCCY": "Yes", "RSCCN": "No"},
    "sort": ["RSCCY", "RSCCN"]
  },
  "RSCD": {
    "col": 2,
    "text": {"RSCDY": "Yes", "RSCDN": "No"},
    "sort": ["RSCDY", "RSCDN"]
  },
  "RSCE": {
    "col": 2,
    "text": {"RSCEY": "Yes", "RSCEN": "No"},
    "sort": ["RSCEY", "RSCEN"]
  },
  "RSCF": {
    "col": 2,
    "text": {"RSCFY": "Yes", "RSCFN": "No"},
    "sort": ["RSCFY", "RSCFN"]
  },
  "RSCG": {
    "col": 2,
    "text": {"RSCGY": "Yes", "RSCGN": "No"},
    "sort": ["RSCGY", "RSCGN"]
  },
  "RSCH": {
    "col": 2,
    "text": {"RSCHY": "Yes", "RSCHN": "No"},
    "sort": ["RSCHY", "RSCHN"]
  },
  "RSCI": {
    "col": 2,
    "text": {"RSCIY": "Yes", "RSCIN": "No"},
    "sort": ["RSCIY", "RSCIN"]
  },
  "RSCJ": {
    "col": 2,
    "text": {"RSCJY": "Yes", "RSCJN": "No"},
    "sort": ["RSCJY", "RSCJN"]
  },
  "RSCK": {
    "col": 2,
    "text": {"RSCKY": "Yes", "RSCKN": "No"},
    "sort": ["RSCKY", "RSCKN"]
  },
  "RSCL": {
    "col": 2,
    "text": {"RSCLY": "Yes", "RSCLN": "No"},
    "sort": ["RSCLY", "RSCLN"]
  },
  "RSCM": {
    "col": 2,
    "text": {"RSCMY": "Yes", "RSCMN": "No"},
    "sort": ["RSCMY", "RSCMN"]
  },
  "RSCN": {
    "col": 2,
    "text": {"RSCNY": "Yes", "RSCNN": "No"},
    "sort": ["RSCNY", "RSCNN"]
  },
  "RSCO": {
    "col": 2,
    "text": {"RSCOY": "Yes", "RSCON": "No"},
    "sort": ["RSCOY", "RSCON"]
  },
  "RSHA": {
    "col": 2,
    "text": {"RSHAY": "Yes", "RSHAN": "No"},
    "sort": ["RSHAY", "RSHAN"]
  },
  "RSHB": {
    "col": 2,
    "text": {"RSHBY": "Yes", "RSHBN": "No"},
    "sort": ["RSHBY", "RSHBN"]
  },
  "RSHC": {
    "col": 2,
    "text": {"RSHCY": "Yes", "RSHCN": "No"},
    "sort": ["RSHCY", "RSHCN"]
  },
  "RSHD": {
    "col": 2,
    "text": {"RSHDY": "Yes", "RSHDN": "No"},
    "sort": ["RSHDY", "RSHDN"]
  },
  "RSHE": {
    "col": 2,
    "text": {"RSHEY": "Yes", "RSHEN": "No"},
    "sort": ["RSHEY", "RSHEN"]
  },
  "RSHF": {
    "col": 2,
    "text": {"RSHFY": "Yes", "RSHFN": "No"},
    "sort": ["RSHFY", "RSHFN"]
  },
  "RSHG": {
    "col": 2,
    "text": {"RSHGY": "Yes", "RSHGN": "No"},
    "sort": ["RSHGY", "RSHGN"]
  },
  "RSHH": {
    "col": 2,
    "text": {"RSHHY": "Yes", "RSHHN": "No"},
    "sort": ["RSHHY", "RSHHN"]
  },
  "RSHI": {
    "col": 2,
    "text": {"RSHIY": "Yes", "RSHIN": "No"},
    "sort": ["RSHIY", "RSHIN"]
  },
  "RSHJ": {
    "col": 2,
    "text": {"RSHJY": "Yes", "RSHJN": "No"},
    "sort": ["RSHJY", "RSHJN"]
  },
  "RSHK": {
    "col": 2,
    "text": {"RSHKY": "Yes", "RSHKN": "No"},
    "sort": ["RSHKY", "RSHKN"]
  },
  "RSHL": {
    "col": 2,
    "text": {"RSHLY": "Yes", "RSHLN": "No"},
    "sort": ["RSHLY", "RSHLN"]
  },
  "RSHM": {
    "col": 2,
    "text": {"RSHMY": "Yes", "RSHMN": "No"},
    "sort": ["RSHMY", "RSHMN"]
  },
  "RSHN": {
    "col": 2,
    "text": {"RSHNY": "Yes", "RSHNN": "No"},
    "sort": ["RSHNY", "RSHNN"]
  },
  "RSHO": {
    "col": 2,
    "text": {"RSHOY": "Yes", "RSHON": "No"},
    "sort": ["RSHOY", "RSHON"]
  },
  "RTW": {
    "col": 2,
    "col188": 1,
    "text": {
      "RTWH1": "Home Team Net winning by 1",
      "RTWH2": "Home Team Net winning by 2",
      "RTWHOV": "Home Team Net winning by 3+",
      "RTWC1": "Away Team Net winning by 1",
      "RTWC2": "Away Team Net winning by 2",
      "RTWCOV": "Away Team Net winning by 3+",
      "RTW0": "No Goal",
      "RTWN": "Other type of draw with goal"
    },
    "sort": [
      "RTWH1 ",
      "RTWH2",
      "RTWHOV",
      "RTWC1",
      "RTWC2",
      "RTWCOV",
      "RTW0",
      "RTWN"
    ]
  },
  "TARU": {
    "col": 2,
    "text": {"TARUO": "Over {ratio}", "TARUU": "Under {ratio}"},
    "sort": ["TARUO", "TARUU"]
  },
  "TBRU": {
    "col": 2,
    "text": {"TBRUO": "Over {ratio}", "TBRUU": "Under {ratio}"},
    "sort": ["TBRUO", "TBRUU"]
  },
  "TCRU": {
    "col": 2,
    "text": {"TCRUO": "Over {ratio}", "TCRUU": "Under {ratio}"},
    "sort": ["TCRUO", "TCRUU"]
  },
  "TDRU": {
    "col": 2,
    "text": {"TDRUO": "Over {ratio}", "TDRUU": "Under {ratio}"},
    "sort": ["TDRUO", "TDRUU"]
  },
  "TERU": {
    "col": 2,
    "text": {"TERUO": "Over {ratio}", "TERUU": "Under {ratio}"},
    "sort": ["TERUO", "TERUU"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "Odd", "EOHE": "Even"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "Odd", "EOCE": "Even"},
    "sort": ["EOCO", "EOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {"REOHO": "Odd", "REOHE": "Even"},
    "sort": ["REOHO", "REOHE"]
  },
  "REOC": {
    "col": 2,
    "text": {"EOCO": "Odd", "EOCE": "Even"},
    "sort": ["REOCO", "REOCE"]
  },
  "F2G2": {
    "col": 2,
    "col188": 1,
    "text": {"F2G2H": "{homeTeam}", "F2G2C": "{awayTeam}"},
    "sort": ["F2G2H", "F2G2C"]
  },
  "F3G2": {
    "col": 2,
    "col188": 1,
    "text": {"F3G2H": "{homeTeam}", "F3G2C": "{awayTeam}"},
    "sort": ["F3G2H", "F3G2C"]
  },
  "MPS": {
    "col": 2,
    "col188": 1,
    "text": {
      "MPSHY": "Home Won & Yes",
      "MPSHN": "Home Won & No",
      "MPSCY": "Away Won & Yes",
      "MPSCN": "Away Won & No",
      "MPSNY": "Draw & Yes",
      "MPSNN": "Draw & No"
    },
    "sort": ["MPSHY", "MPSHN", "MPSCY", "MPSCN", "MPSNY", "MPSNN"]
  },
  "OTHOUH": {
    "col": 2,
    "text": {"OTHOUHC": "Over {ratio}", "OTHOUHH": "Under {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTHOUC": {
    "col": 2,
    "text": {"OTHOUHC": "Over {ratio}", "OTHOUHH": "Under {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTOUH": {
    "col": 2,
    "text": {"OTOUHC": "Over {ratio}", "OTOUHH": "Under {ratio}"},
    "sort": ["OTOUHC", "OTOUHH"]
  },
  "OTOUC": {
    "col": 2,
    "text": {"OTOUCC": "Over {ratio}", "OTOUCH": "Under {ratio}"},
    "sort": ["OTOUCC", "OTOUCH"]
  },
  "OTTS": {
    "col": 2,
    "text": {"OTTSY": "Yes", "OTTSN": "No"},
    "sort": ["OTTSY", "OTTSN"]
  },
  "OTARG": {
    "col": 3,
    "col188": 1,
    "text": {
      "OTARGH": "{homeTeam}",
      "OTARGC": "{awayTeam}",
      "OTARGN": "No Goal"
    },
    "sort": ["OTARGH", "OTARGC", "OTARGN"]
  },
  "OTEO": {
    "col": 2,
    "text": {"OTEOO": "Odd", "OTEOE": "Even"},
    "sort": ["OTEOO", "OTEOE"]
  },
  "OTDC": {
    "col": 3,
    "col188": 1,
    "text": {
      "OTDCHN": "Home/ Draw",
      "OTDCHC": "Home/Away",
      "OTDCCN": "Draw/ Away"
    },
    "sort": ["OTDCHN", "OTDCHC", "OTDCCN"]
  },
  "OTBRG": {
    "col": 3,
    "col188": 1,
    "text": {
      "OTBRGH": "{homeTeam}",
      "OTBRGC": "{awayTeam}",
      "OTBRGN": "No Goal"
    },
    "sort": ["OTBRGH", "OTBRGC", "OTBRGN"]
  },
  "M3": {
    "col": 3,
    "col188": 1,
    "text": {"M3H": "{homeTeam}", "M3N": "Draw", "M3C": "{awayTeam}"},
    "sort": ["M3H", "M3N", "M3C"]
  },
  "SCO1ST": {
    "col": 2,
    "col188": 1,
    "text": {"SCO1ST1": "SCO1ST1", "SCO1ST2": "SCO1ST2"},
    "sort": ["SCO1ST1", "SCO1ST2"]
  },
  "SCOLAST": {
    "col": 2,
    "col188": 1,
    "text": {"SCOLAST1": "SCOLAST1", "SCOLAST2": "SCOLAST2"},
    "sort": ["SCOLAST1", "SCOLAST2"]
  },
  "SCOANT": {
    "col": 2,
    "col188": 1,
    "text": {"SCOANT1": "SCOANT1", "SCOANT2": "SCOANT2"},
    "sort": ["SCOANT1", "SCOANT2"]
  },
  "R_promote": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SDFC": {
    "col": 2,
    "col188": 1,
    "text": {"SDFCH": "{homeTeam}", "SDFCC": "{awayTeam}"},
    "sort": ["SDFCH", "SDFCC"]
  },
  "SDLC": {
    "col": 2,
    "col188": 1,
    "text": {"SDLCH": "{homeTeam}", "SDLCC": "{awayTeam}"},
    "sort": ["SDLCH", "SDLCC"]
  },
  "SDFT": {
    "col": 2,
    "col188": 1,
    "text": {"SDFTH": "{homeTeam}", "SDFTC": "{awayTeam}"},
    "sort": ["SDFTH", "SDFTC"]
  },
  "SDLT": {
    "col": 2,
    "col188": 1,
    "text": {"SDLTH": "{homeTeam}", "SDLTC": "{awayTeam}"},
    "sort": ["SDLTH", "SDLTC"]
  },
  "LO": {
    "col": 2,
    "col188": 1,
    "text": {"LOH": "{homeTeam}", "LOC": "{awayTeam}"},
    "sort": ["LOH", "LOC"]
  },
  "LS": {
    "col": 2,
    "col188": 1,
    "text": {"LSH": "{homeTeam}", "LSC": "{awayTeam}"},
    "sort": ["LSH", "LSC"]
  },
  "OTRNC1": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNC1H": "{homeTeam}", "OTRNC1C": "{awayTeam}"},
    "sort": ["OTRNC1H", "OTRNC1C"]
  },
  "OTRNC2": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNC2H": "{homeTeam}", "OTRNC2C": "{awayTeam}"},
    "sort": ["OTRNC2H", "OTRNC2C"]
  },
  "OTRNC3": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNC3H": "{homeTeam}", "OTRNC3C": "{awayTeam}"},
    "sort": ["OTRNC3H", "OTRNC3C"]
  },
  "OTRNC4": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNC4H": "{homeTeam}", "OTRNC4C": "{awayTeam}"},
    "sort": ["OTRNC4H", "OTRNC4C"]
  },
  "OTRNC5": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNC5H": "{homeTeam}", "OTRNC5C": "{awayTeam}"},
    "sort": ["OTRNC5H", "OTRNC5C"]
  },
  "OTRNBA": {
    "col": 2,
    "col188": 1,
    "text": {"OTRNBAH": "{homeTeam}", "OTRNBAC": "{awayTeam}"},
    "sort": ["OTRNBAH", "OTRNBAC"]
  },
  "OTHOU": {
    "col": 2,
    "text": {"OTHOUC": "Over {ratio}", "OTHOUH": "Under {ratio}"},
    "sort": ["OTHOUC", "OTHOUH"]
  },
  "FO": {
    "col": 2,
    "col188": 1,
    "text": {"FOH": "{homeTeam}", "FOC": "{awayTeam}"},
    "sort": ["FOH", "FOC"]
  },
  "FS": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC"]
  },
  "FGK": {
    "col": 2,
    "col188": 1,
    "text": {"FGKH": "{homeTeam}", "FGKC": "{awayTeam}"},
    "sort": ["FGKH", "FGKC"]
  },
  "LGK": {
    "col": 2,
    "col188": 1,
    "text": {"LGKH": "{homeTeam}", "LGKC": "{awayTeam}"},
    "sort": ["LGKH", "LGKC"]
  },
  "FTI": {
    "col": 2,
    "col188": 1,
    "text": {"FTIH": "{homeTeam}", "FTIC": "{awayTeam}"},
    "sort": ["FTIH", "FTIC"]
  },
  "LTI": {
    "col": 2,
    "col188": 1,
    "text": {"LTIH": "{homeTeam}", "LTIC": "{awayTeam}"},
    "sort": ["LTIH", "LTIC"]
  },
  "FFK": {
    "col": 2,
    "col188": 1,
    "text": {"FFKH": "{homeTeam}", "FFKC": "{awayTeam}"},
    "sort": ["FFKH", "FFKC"]
  },
  "LFK": {
    "col": 2,
    "col188": 1,
    "text": {"LFKH": "{homeTeam}", "LFKC": "{awayTeam}"},
    "sort": ["LFKH", "LFKC"]
  },
  "OTCRG": {
    "col": 3,
    "col188": 1,
    "text": {
      "OTCRGH": "{homeTeam}",
      "OTCRGC": "{awayTeam}",
      "OTCRGN": "No Goal"
    },
    "sort": ["OTCRGH", "OTCRGC", "OTCRGN"]
  },
  "OTDRG": {
    "col": 3,
    "col188": 1,
    "text": {
      "OTDRGH": "{homeTeam}",
      "OTDRGC": "{awayTeam}",
      "OTDRGN": "No Goal"
    },
    "sort": ["OTDRGH", "OTDRGC", "OTDRGN"]
  },
  "T": {
    "col": 2,
    "col188": 1,
    "text": {"T01": "0-1 ", "T23": "2-3 ", "T46": "4-6 ", "OVER": "7+"},
    "sort": ["T01", "T23", "T46", "OVER"]
  },
  "RT": {
    "col": 2,
    "col188": 1,
    "text": {
      "RT01": "0-1 ",
      "RT23": "2-3 ",
      "RT46": "4-6 ",
      "ROVER": "7+",
      "RT0": "0",
      "RT1": "1",
      "RT2": "2",
      "RTOV": "3+"
    },
    "sort": ["RT01", "RT23", "RT46", "ROVER", "RT0", "RT1", "RT2", "RTOV"]
  },
  "MW": {
    "col": 2,
    "col188": 1,
    "text": {
      "MWH": "Home Team won over Regulation time",
      "MWHOT": "Home Team won over Overtime",
      "MWHPK": "Home Team won over PK",
      "MWC": "Away Team won over Regulation time",
      "MWCOT": "Away Team won over Overtime",
      "MWCPK": "Away Team won over PK"
    },
    "sort": ["MWH", "MWHOT", "MWHPK", "MWC", "MWCOT", "MWCPK"]
  },
  "OUconner": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOconner": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "Rconner": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUcard": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOcard": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "Rcard": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "HOUcard": {
    "col": 2,
    "text": {"HOUC": "Over {ratio}", "HOUH": "Under {ratio}"},
    "sort": ["HOUC", "HOUH"]
  },
  "HRconner": {
    "col": 2,
    "col188": 1,
    "text": {"HRH": "{homeTeam} {ratio}", "HRC": "{awayTeam} {ratio}"},
    "sort": ["HRH", "HRC"]
  },
  "RDT": {
    "col": 2,
    "col188": 1,
    "text": {"RDT0": "0", "RDT1": "1", "RDT2": "2", "RDTOV": "3+"},
    "sort": ["RDT0", "RDT1", "RDT2", "RDTOV"]
  },
  "TTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHC": "{homeTeam} Over {ratio}",
      "OUHH": "{homeTeam} Under {ratio}",
      "OUCC": "{awayTeam} Over {ratio}",
      "OUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RCDOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FSM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "FSR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FSOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "BP": {
    "col": 2,
    "col188": 1,
    "text": {"BPH": "{homeTeam} {ratio}", "BPC": "{awayTeam} {ratio}"},
    "sort": ["BPH", "BPC"]
  },
  "OSM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "OSR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OSOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {
    "col": 3,
    "col188": 1,
    "text": {
      "GSPF": "The player who shoot the first goal",
      "GLPA": "The player who goal in anytime",
      "GSPL": "The player who shoot the last goal"
    },
    "sort": ["GSPF", "GLPA", "GSPL"]
  },
  "HG3": {
    "col": 3,
    "col188": 1,
    "text": {"HG3H": "1st Half", "HG3N": "Draw", "HG3C": "2nd Half"},
    "sort": ["HG3H", "HG3N", "HG3C"]
  },
  "UPGM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPGR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPGOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "SOTM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "SOTR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SOTOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "UPCM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPCR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPCOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "TG": {
    "col": 2,
    "col188": 1,
    "text": {
      "TGH0": "{homeTeam} 0",
      "TGH1": "{homeTeam} 1",
      "TGH2": "{homeTeam} 2",
      "TGH3": "{homeTeam} 3",
      "TGH4+": "{homeTeam} 4+",
      "TGC0": "{awayTeam} 0",
      "TGC1": "{awayTeam} 1",
      "TGC2": "{awayTeam} 2",
      "TGC3": "{awayTeam} 3",
      "TGC4+": "{awayTeam} 4+"
    },
    "sort": [
      "TGH0",
      "TGH1",
      "TGH2",
      "TGH3",
      "TGH4+",
      "TGC0",
      "TGC1",
      "TGC2",
      "TGC3",
      "TGC4+"
    ]
  },
  "HTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTGH0": "{homeTeam} 0",
      "HTGH1": "{homeTeam} 1",
      "HTGH2": "{homeTeam} 2",
      "HTGH3": "{homeTeam} 3",
      "HTGH4": '{homeTeam} 4',
      "HTGH4+": "{homeTeam} 4+",
      "HTGC0": "{awayTeam} 0",
      "HTGC1": "{awayTeam} 1",
      "HTGC2": "{awayTeam} 2",
      "HTGC3": "{awayTeam} 3",
      "HTGC4": '{awayTeam} 4',
      "HTGC4+": "{awayTeam} 4+"
    },
    "sort": [
      'HTGH0',
      'HTGC0',
      'HTGH1',
      'HTGC1',
      'HTGH2',
      'HTGC2',
      'HTGH3',
      'HTGC3',
      'HTGH4',
      'HTGC4',
      'HTGH4+',
      'HTGC4+'
    ]
  },
  "TGOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTGOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHC": "{homeTeam} Over {ratio}",
      "OUHH": "{homeTeam} Under {ratio}",
      "OUCC": "{awayTeam} Over {ratio}",
      "OUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HW3": {
    "col": 3,
    "col188": 1,
    "text": {
      "HW3H": "{homeTeam} {ratio}",
      "HW3N": "Draw {ratio}",
      "HW3C": "{awayTeam} {ratio}"
    },
    "sort": ["HW3H", "HW3N", "HW3C"]
  },
  "TCS": {
    "col": 2,
    "text": {
      "TCSHY": "Yes",
      "TCSHN": "No",
      "TCSCY": "Yes",
      "TCSCN": "No"
    },
    "sort": ["TCSHY", "TCSHN", "TCSCY", "TCSCN"]
  },
  "TSB": {
    "col": 2,
    "text": {
      "TSBHY": "Yes",
      "TSBHN": "No",
      "TSBCY": "Yes",
      "TSBCN": "No"
    },
    "sort": ["TSBHY", "TSBHN", "TSBCY", "TSBCN"]
  },

  "HTSB": {
    "col": 2,
    "text": {
      "HTSBHY": "Yes",
      "HTSBHN": "No",
      "HTSBCY": "Yes",
      "HTSBCN": "No"
    },
    "sort": ["HTSBHY", "HTSBHN", "HTSBCY", "HTSBCN"]
  },
  "HTSB2": {
    "col": 2,
    "text": {
      "HTSB2HY": "Yes",
      "HTSB2HN": "No",
      "HTSB2CY": "Yes",
      "HTSB2CN": "No"
    },
    "sort": ["HTSB2HY", "HTSB2HN", "HTSB2CY", "HTSB2CN"]
  },

  "OUT": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUT01": "0-1",
      "OUT02": "0-2",
      "OUT03": "0-3",
      "OUT23": "2-3",
      "OUT46": "4-6",
      "OUT2O": "2+",
      "OUT3O": "3+",
      "OUT4O": "4+",
      "OUT5O": "5+",
      "OUT6O": "6+",
      "OUT7O": "7+"
    },
    "sort": [
      "OUT01",
      "OUT02",
      "OUT03",
      "OUT23",
      "OUT46",
      "OUT2O",
      "OUT3O",
      "OUT4O",
      "OUT5O",
      "OUT6O",
      "OUT7O"
    ]
  },
  "TGB": {
    "col": 2,
    "text": {"TGBY": "Yes", "TGBN": "No"},
    "sort": ["TGBY", "TGBN"]
  },
  "AHG": {
    "col": 2,
    "col188": 1,
    "text": {
      "AHG0": "0 ",
      "AHG01": "0-1 ",
      "AHG1+": "1+",
      "AHG2+": "2+",
      "AHG3+": "3+"
    },
    "sort": ["AHG0", "AHG01", "AHG1+", "AHG2+", "AHG3+"]
  },
  "BHG": {
    "col": 2,
    "col188": 1,
    "text": {
      "BHG0": "0 ",
      "BHG01": "0-1 ",
      "BHG1+": "1+",
      "BHG2+": "2+",
      "BHG3+": "3+"
    },
    "sort": ["BHG0", "BHG01", "BHG1+", "BHG2+", "BHG3+"]
  },
  "T1G": {
    "col": 2,
    "col188": 1,
    "text": {
      "T1G1": "00:00 - 14:59",
      'T1G2': '1st Half 15:00 - 29:59',
      'T1G3': '1st Half 30:00 - Half Ended',
      'T1G4': '2nd Half - 59:59',
      'T1G5': '2nd Half 60:00 - 74:59',
      'T1G6': '2nd Half 75:00 - Full Court Ended',
      "T1GN": "No Goal",
      "T1G7": "1-10minutes",
      "T1G8": "11-20minutes",
      "T1G9": "21-30minutes",
      "T1G10": "31-40minutes",
      "T1G11": "41-50minutes",
      "T1G12": "51-60minutes",
      "T1G13": "61-70minutes",
      "T1G14": "71-80minutes",
      "T1G15": "81-90minutes"
    },
    "sort": [
      "T1G1",
      "T1G2",
      "T1G3",
      "T1G4",
      "T1G5",
      "T1G6",
      "T1GN",
      "T1G7",
      "T1G8",
      "T1G9",
      "T1G10",
      "T1G11",
      "T1G12",
      "T1G13",
      "T1G14",
      "T1G15"
    ]
  },
  "BSO": {
    "col": 2,
    "text": {"BSOY": "Yes", "BSON": "No"},
    "sort": ["BSOY", "BSON"]
  },
  "FOUB": {
    "col": 2,
    "col188": 1,
    "text": {
      "FOUBHHO": "Home/Home & Over 2.5",
      "FOUBHHU": "Home/Home & Under 2.5",
      "FOUBHNO": "Home/Draw & Over 2.5",
      "FOUBHNU": "Home/Draw & Under 2.5",
      "FOUBHCO": "Home/Away & Over 2.5",
      "FOUBCHO": "Away/Home & Over 2.5",
      "FOUBCCO": "Away/Away & Over 2.5",
      "FOUBCCU": "Away/Away & Under 2.5",
      "FOUBCNO": "Away/Draw & Over 2.5",
      "FOUBCNU": "Away/Draw & Under 2.5",
      "FOUBNNO": "Draw/Draw & Over 2.5",
      "FOUBNNU": "Draw/Draw & Under 2.5",
      "FOUBNHO": "Draw/Home & Over 2.5",
      "FOUBNHU": "Draw/Home & Under 2.5",
      "FOUBNCO": "Draw/Away & Over 2.5",
      "FOUBNCU": "Draw/Away & Under 2.5"
    },
    "sort": [
      "FOUBHHO",
      "FOUBHHU",
      "FOUBHNO",
      "FOUBHNU",
      "FOUBHCO",
      "FOUBCHO",
      "FOUBCCO",
      "FOUBCCU",
      "FOUBCNO",
      "FOUBCNU",
      "FOUBNNO",
      "FOUBNNU",
      "FOUBNHO",
      "FOUBNHU",
      "FOUBNCO",
      "FOUBNCU"
    ]
  },
  "HMOUA": {
    "col": 3,
    "col188": 1,
    "text": {
      "HMOUAHO": "Home Won & Over1.5",
      "HMOUAHU": "Home Won & Under1.5",
      "HMOUANO": "Draw & Over1.5",
      "HMOUANU": "Draw & Under1.5",
      "HMOUACO": "Away Won & Over1.5",
      "HMOUACU": "Away Won & Under1.5"
    },
    "sort": ["HMOUAHO", "HMOUAHU", "HMOUANO", "HMOUANU", "HMOUACO", "HMOUACU"]
  },
  "PDD": {
    "col": 2,
    "col188": 1,
    "text": {
      "PDD1": "1-0, 2-0, 3-0",
      "PDD2": "4-0, 5-0, 6-0",
      "PDD3": "2-1, 3-1, 4-1",
      "PDD4": "3-2, 4-2, 4-3, 5-1",
      "PDD5": "0-1, 0-2, 0-3",
      "PDD6": "0-4, 0-5, 0-6",
      "PDD7": "1-2, 1-3, 1-4",
      "PDD8": "2-3, 2-4, 3-4, 1-5"
    },
    "sort": ["PDD1", "PDD2", "PDD3", "PDD4", "PDD5", "PDD6", "PDD7", "PDD8"]
  },
  "TGA": {
    "col": 2,
    "text": {"TGAY": "Yes", "TGAN": "No"},
    "sort": ["TGAY", "TGAN"]
  },
  "TGC": {
    "col": 2,
    "text": {"TGCY": "Yes", "TGCN": "No"},
    "sort": ["TGCY", "TGCN"]
  },
  "TGD": {
    "col": 2,
    "text": {"TGDY": "Yes", "TGDN": "No"},
    "sort": ["TGDY", "TGDN"]
  },
  "TGE": {
    "col": 2,
    "text": {"TGEY": "Yes", "TGEN": "No"},
    "sort": ["TGEY", "TGEN"]
  },
  "TGF": {
    "col": 2,
    "text": {"TGFY": "Yes", "TGFN": "No"},
    "sort": ["TGFY", "TGFN"]
  },
  "TGG": {
    "col": 2,
    "text": {"TGGY": "Yes", "TGGN": "No"},
    "sort": ["TGGY", "TGGN"]
  },
  "HM2_conner": {
    "col": 3,
    "col188": 1,
    "text": {"HM2H": "{homeTeam}", "HM2N": "Draw", "HM2C": "{awayTeam}"},
    "sort": ["HM2H", "HM2N", "HM2C"]
  },
  "HOU2_conner": {
    "col": 2,
    "text": {"HOU2C": "Over {ratio}", "HOU2H": "Under {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "OU3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "OUC": "Over {ratio}",
      "OUE": "Just Right {ratio}",
      "OUH": "Under {ratio}"
    },
    "sort": ["OUC", "OUE", "OUH"]
  },
  "W3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "Draw {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "BTSH": {
    "col": 2,
    "text": {"BTSHY": "Yes", "BTSHN": "No"},
    "sort": ["BTSHY", "BTSHN"]
  },
  "FGTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTAS": "shoot",
      "FGTAH": "header",
      "FGTAN": "No Goal",
      "FGTAP": "penalty kick",
      "FGTAF": "free kick",
      "FGTAO": "own goal"
    },
    "sort": ["FGTAS", "FGTAH", "FGTAN", "FGTAP", "FGTAF", "FGTAO"]
  },
  "FGTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTBS": "shoot",
      "FGTBH": "header",
      "FGTBN": "No Goal",
      "FGTBP": "penalty kick",
      "FGTBF": "free kick",
      "FGTBO": "own goal"
    },
    "sort": ["FGTBS", "FGTBH", "FGTBN", "FGTBP", "FGTBF", "FGTBO"]
  },
  "FGTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTCS": "shoot",
      "FGTCH": "header",
      "FGTCN": "No Goal",
      "FGTCP": "penalty kick",
      "FGTCF": "free kick",
      "FGTCO": "own goal"
    },
    "sort": ["FGTCS", "FGTCH", "FGTCN", "FGTCP", "FGTCF", "FGTCO"]
  },
  "FGTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTDS": "shoot",
      "FGTDH": "header",
      "FGTDN": "No Goal",
      "FGTDP": "penalty kick",
      "FGTDF": "free kick",
      "FGTDO": "own goal"
    },
    "sort": ["FGTDS", "FGTDH", "FGTDN", "FGTDP", "FGTDF", "FGTDO"]
  },
  "FGTE": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTES": "shoot",
      "FGTEH": "header",
      "FGTEN": "No Goal",
      "FGTEP": "penalty kick",
      "FGTEF": "free kick",
      "FGTEO": "own goal"
    },
    "sort": ["FGTES", "FGTEH", "FGTEN", "FGTEP", "FGTEF", "FGTEO"]
  },
  "FGTF": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTFS": "shoot",
      "FGTFH": "header",
      "FGTFN": "No Goal",
      "FGTFP": "penalty kick",
      "FGTFF": "free kick",
      "FGTFO": "own goal"
    },
    "sort": ["FGTFS", "FGTFH", "FGTFN", "FGTFP", "FGTFF", "FGTFO"]
  },
  "FGTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTGS": "shoot",
      "FGTGH": "header",
      "FGTGN": "No Goal",
      "FGTGP": "penalty kick",
      "FGTGF": "free kick",
      "FGTGO": "own goal"
    },
    "sort": ["FGTGS", "FGTGH", "FGTGN", "FGTGP", "FGTGF", "FGTGO"]
  },
  "FGTH": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTHS": "shoot",
      "FGTHH": "header",
      "FGTHN": "No Goal",
      "FGTHP": "penalty kick",
      "FGTHF": "free kick",
      "FGTHO": "own goal"
    },
    "sort": ["FGTHS", "FGTHH", "FGTHN", "FGTHP", "FGTHF", "FGTHO"]
  },
  "FGTI": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTIS": "shoot",
      "FGTIH": "header",
      "FGTIN": "No Goal",
      "FGTIP": "penalty kick",
      "FGTIF": "free kick",
      "FGTIO": "own goal"
    },
    "sort": ["FGTIS", "FGTIH", "FGTIN", "FGTIP", "FGTIF", "FGTIO"]
  },
  "FGTJ": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTJS": "shoot",
      "FGTJH": "header",
      "FGTJN": "No Goal",
      "FGTJP": "penalty kick",
      "FGTJF": "free kick",
      "FGTJO": "own goal"
    },
    "sort": ["FGTJS", "FGTJH", "FGTJN", "FGTJP", "FGTJF", "FGTJO"]
  },
  "RT3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT3H": "{homeTeam}", "RT3N": "Neither", "RT3C": "{awayTeam}"},
    "sort": ["RT3H", "RT3N", "RT3C"]
  },
  "RT5_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT5H": "{homeTeam}", "RT5N": "Neither", "RT5C": "{awayTeam}"},
    "sort": ["RT5H", "RT5N", "RT5C"]
  },
  "RT7_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT7H": "{homeTeam}", "RT7N": "Neither", "RT7C": "{awayTeam}"},
    "sort": ["RT7H", "RT7N", "RT7C"]
  },
  "RT9_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT9H": "{homeTeam}", "RT9N": "Neither", "RT9C": "{awayTeam}"},
    "sort": ["RT9H", "RT9N", "RT9C"]
  },
  "PC": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "PRC": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "PP": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "HGC1": {
    "col": 1,
    "col188": 1,
    "text": {"HGC1": "1st Half Over 0.5 & 2nd Half Over 0.5"},
    "sort": ["HGC1"]
  },
  "HGC2": {
    "col": 1,
    "col188": 1,
    "text": {"HGC2": "1st Half Over 0.5 & 2nd Half Over 1.5"},
    "sort": ["HGC2"]
  },
  "HGC3": {
    "col": 1,
    "col188": 1,
    "text": {"HGC3": "1st Half Over 1.5 & 2nd Half Over 1.5"},
    "sort": ["HGC3"]
  },
  "W2M": {
    "col": 2,
    "col188": 1,
    "text": {"W2MH": "{homeTeam}", "W2MC": "{awayTeam}"},
    "sort": ["W2MH", "W2MC"]
  },
  "TTB_card": {
    "col": 2,
    "col188": 1,
    "text": {
      "TTBHO": "{homeTeam} Over {ratio}",
      "TTBHU": "{homeTeam} Under {ratio}",
      "TTBCO": "{awayTeam} Over {ratio}",
      "TTBCU": "{awayTeam} Under {ratio}"
    },
    "sort": ["TTBHO", "TTBHU", "TTBCO", "TTBCU"]
  },
  "HSR": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CSR": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HFS": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CFS": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOS": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "COS": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "PAOU": {
    "col": 2,
    "text": {"OUC": " Over {ratio}", "OUH": " Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HAR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RTTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "ROUHC": "{homeTeam} Over {ratio}",
      "ROUHH": "{homeTeam} Under {ratio}",
      "ROUCC": "{awayTeam} Over {ratio}",
      "ROUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RLG": {
    "col": 3,
    "col188": 1,
    "text": {"RLGH": "{homeTeam}", "RLGA": "{awayTeam}", "RLGN": "No Goal"},
    "sort": ["RLGH", "RLGA", "RLGN"]
  },
  "RTG": {
    'col': 2,
    "col188": 1,
    'text': {
      'RTGH0': '{homeTeam} 0',
      'RTGH1': '{homeTeam} 1',
      'RTGH2': '{homeTeam} 2',
      'RTGH3': '{homeTeam} 3',
      'RTGH4': '{homeTeam} 4',
      'RTGH5': '{homeTeam} 5',
      'RTGH6': '{homeTeam} 6',
      'RTGH4+': '{homeTeam} 4+',
      'RTGH5+': '{homeTeam} 5+',
      'RTGH6+': '{homeTeam} 6+',
      'RTGC0': '{awayTeam} 0',
      'RTGC1': '{awayTeam} 1',
      'RTGC2': '{awayTeam} 2',
      'RTGC3': '{awayTeam} 3',
      'RTGC4': '{awayTeam} 4',
      'RTGC5': '{awayTeam} 5',
      'RTGC6': '{awayTeam} 6',
      'RTGC4+': '{awayTeam} 4+',
      'RTGC5+': '{awayTeam} 5+',
      'RTGC6+': '{awayTeam} 6+'
    },
    'sort': [
      'RTGH0',
      'RTGH1',
      'RTGH2',
      'RTGH3',
      'RTGH4',
      'RTGH5',
      'RTGH6',
      'RTGH4+',
      'RTGH5+',
      'RTGH6+',
      'RTGC0',
      'RTGC1',
      'RTGC2',
      'RTGC3',
      'RTGC4',
      'RTGC5',
      'RTGC6',
      'RTGC4+',
      'RTGC5+',
      'RTGC6+']
  },
  "HRTG": {
    "col": 2,
    "col188": 1,
    "text": {
      'HRTGH0': '{homeTeam} 0',
      'HRTGH1': '{homeTeam} 1',
      'HRTGH2': '{homeTeam} 2',
      'HRTGH3': '{homeTeam} 3',
      'HRTGH4': '{homeTeam} 4',
      'HRTGH4+': '{homeTeam} 4+',
      'HRTGC0': '{awayTeam} 0',
      'HRTGC1': '{awayTeam} 1',
      'HRTGC2': '{awayTeam} 2',
      'HRTGC3': '{awayTeam} 3',
      'HRTGC4': '{awayTeam} 4',
      'HRTGC4+': '{awayTeam} 4+'
    },
    "sort": [
      'HRTGH0',
      'HRTGC0',
      'HRTGH1',
      'HRTGC1',
      'HRTGH2',
      'HRTGC2',
      'HRTGH3',
      'HRTGC3',
      'HRTGH4',
      'HRTGC4',
      'HRTGH4+',
      'HRTGC4+'
    ]
  },
  "RHTS": {
    "col": 2,
    "text": {"HRTSY": "Yes", "HRTSN": "No "},
    "sort": ["HRTSY", "HRTSN"]
  },
  "RTGOU": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRTTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "HROUHC": "{homeTeam} Over {ratio}",
      "HROUHH": "{homeTeam} Under {ratio}",
      "HROUCC": "{awayTeam} Over {ratio}",
      "HROUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["HROUHC", "HROUHH", "HROUCC", "HROUCH"]
  },

  "RTM": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "Draw", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "ROU3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "ROUC": "Over {ratio}",
      "ROUE": "Just Right {ratio}",
      "ROUH": "Under {ratio}"
    },
    "sort": ["ROUC", "ROUE", "ROUH"]
  },
  "RW3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "RW3H": "{homeTeam} {ratio}",
      "RW3N": "Draw {ratio}",
      "RW3C": "{awayTeam} {ratio}"
    },
    "sort": ["RW3H", "RW3N", "RW3C"]
  },
  "NM5A": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM5AGY": "Goal  Yes",
      "NM5AGN": "Goal  No",
      "NM5ACY": "Corner KIck Yes",
      "NM5ACN": "Corner KIck No",
      "NM5AFY": "free kick Yes",
      "NM5AFN": "free kick No",
      "NM5AKY": "Goal KIck Yes",
      "NM5AKN": "Goal KIck No",
      "NM5ABY": "Throw-in Yes",
      "NM5ABN": "Throw-in No",
      "NM5APY": "penalty kick Yes",
      "NM5APN": "penalty kick No"
    },
    "sort": [
      "NM5AGY",
      "NM5AGN",
      "NM5ACY",
      "NM5ACN",
      "NM5AFY",
      "NM5AFN",
      "NM5AKY",
      "NM5AKN",
      "NM5ABY",
      "NM5ABN",
      "NM5APY",
      "NM5APN"
    ]
  },
  "NM5B": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM5BGY": "Goal  Yes",
      "NM5BGN": "Goal  No",
      "NM5BCY": "Corner KIck Yes",
      "NM5BCN": "Corner KIck No",
      "NM5BFY": "free kick Yes",
      "NM5BFN": "free kick No",
      "NM5BKY": "Goal KIck Yes",
      "NM5BKN": "Goal KIck No",
      "NM5BBY": "Throw-in Yes",
      "NM5BBN": "Throw-in No",
      "NM5BPY": "penalty kick Yes",
      "NM5BPN": "penalty kick No"
    },
    "sort": [
      "NM5BGY",
      "NM5BGN",
      "NM5BCY",
      "NM5BCN",
      "NM5BFY",
      "NM5BFN",
      "NM5BKY",
      "NM5BKN",
      "NM5BBY",
      "NM5BBN",
      "NM5BPY",
      "NM5BPN"
    ]
  },
  "NM5C": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM5CGY": "Goal  Yes",
      "NM5CGN": "Goal  No",
      "NM5CCY": "Corner KIck Yes",
      "NM5CCN": "Corner KIck No",
      "NM5CFY": "free kick Yes",
      "NM5CFN": "free kick No",
      "NM5CKY": "Goal KIck Yes",
      "NM5CKN": "Goal KIck No",
      "NM5CBY": "Throw-in Yes",
      "NM5CBN": "Throw-in No",
      "NM5CPY": "penalty kick Yes",
      "NM5CPN": "penalty kick No"
    },
    "sort": [
      "NM5CGY",
      "NM5CGN",
      "NM5CCY",
      "NM5CCN",
      "NM5CFY",
      "NM5CFN",
      "NM5CKY",
      "NM5CKN",
      "NM5CBY",
      "NM5CBN",
      "NM5CPY",
      "NM5CPN"
    ]
  },
  "NM5D": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM5DGY": "Goal  Yes",
      "NM5DGN": "Goal  No",
      "NM5DCY": "Corner KIck Yes",
      "NM5DCN": "Corner KIck No",
      "NM5DFY": "free kick Yes",
      "NM5DFN": "free kick No",
      "NM5DKY": "Goal KIck Yes",
      "NM5DKN": "Goal KIck No",
      "NM5DBY": "Throw-in Yes",
      "NM5DBN": "Throw-in No",
      "NM5DPY": "penalty kick Yes",
      "NM5DPN": "penalty kick No"
    },
    "sort": [
      "NM5DGY",
      "NM5DGN",
      "NM5DCY",
      "NM5DCN",
      "NM5DFY",
      "NM5DFN",
      "NM5DKY",
      "NM5DKN",
      "NM5DBY",
      "NM5DBN",
      "NM5DPY",
      "NM5DPN"
    ]
  },
  "NM1A": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM1AGY": "Goal  Yes",
      "NM1AGN": "Goal  No",
      "NM1ACY": "Corner KIck Yes",
      "NM1ACN": "Corner KIck No",
      "NM1AFY": "free kick Yes",
      "NM1AFN": "free kick No",
      "NM1AKY": "Goal KIck Yes",
      "NM1AKN": "Goal KIck No",
      "NM1ABY": "Throw-in Yes",
      "NM1ABN": "Throw-in No"
    },
    "sort": [
      "NM1AGY",
      "NM1AGN",
      "NM1ACY",
      "NM1ACN",
      "NM1AFY",
      "NM1AFN",
      "NM1AKY",
      "NM1AKN",
      "NM1ABY",
      "NM1ABN"
    ]
  },
  "NM1B": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM1BGY": "Goal  Yes",
      "NM1BGN": "Goal  No",
      "NM1BCY": "Corner KIck Yes",
      "NM1BCN": "Corner KIck No",
      "NM1BFY": "free kick Yes",
      "NM1BFN": "free kick No",
      "NM1BKY": "Goal KIck Yes",
      "NM1BKN": "Goal KIck No",
      "NM1BBY": "Throw-in Yes",
      "NM1BBN": "Throw-in No"
    },
    "sort": [
      "NM1BGY",
      "NM1BGN",
      "NM1BCY",
      "NM1BCN",
      "NM1BFY",
      "NM1BFN",
      "NM1BKY",
      "NM1BKN",
      "NM1BBY",
      "NM1BBN"
    ]
  },
  "NM1C": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM1CGY": "Goal  Yes",
      "NM1CGN": "Goal  No",
      "NM1CCY": "Corner KIck Yes",
      "NM1CCN": "Corner KIck No",
      "NM1CFY": "free kick Yes",
      "NM1CFN": "free kick No",
      "NM1CKY": "Goal KIck Yes",
      "NM1CKN": "Goal KIck No",
      "NM1CBY": "Throw-in Yes",
      "NM1CBN": "Throw-in No"
    },
    "sort": [
      "NM1CGY",
      "NM1CGN",
      "NM1CCY",
      "NM1CCN",
      "NM1CFY",
      "NM1CFN",
      "NM1CKY",
      "NM1CKN",
      "NM1CBY",
      "NM1CBN"
    ]
  },
  "NM1D": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM1DGY": "Goal  Yes",
      "NM1DGN": "Goal  No",
      "NM1DCY": "Corner KIck Yes",
      "NM1DCN": "Corner KIck No",
      "NM1DFY": "free kick Yes",
      "NM1DFN": "free kick No",
      "NM1DKY": "Goal KIck Yes",
      "NM1DKN": "Goal KIck No",
      "NM1DBY": "Throw-in Yes",
      "NM1DBN": "Throw-in No"
    },
    "sort": [
      "NM1DGY",
      "NM1DGN",
      "NM1DCY",
      "NM1DCN",
      "NM1DFY",
      "NM1DFN",
      "NM1DKY",
      "NM1DKN",
      "NM1DBY",
      "NM1DBN"
    ]
  },
  "WH5MA": {
    "col": 3,
    "col188": 1,
    "text": {
      "WH5MAG": 'Goal ',
      "WH5MAC": 'Corner KIck',
      "WH5MAP": 'penalty kick',
      "WH5MAD": 'Card',
      "WH5MAF": 'free kick',
      "WH5MAK": 'Goal KIck',
      "WH5MAB": 'Throw-in',
      "WH5MAN": 'No event',
    },
    'sort': [
      'WH5MAG',
      'WH5MAC',
      'WH5MAP',
      'WH5MAD',
      'WH5MAF',
      'WH5MAK',
      'WH5MAB',
      'WH5MAN'
    ]
  },
  'WH5MB': {
    'col': 3,
    "col188": 1,
    'text': {
      'WH5MBG': 'Goal ',
      'WH5MBC': 'Corner KIck',
      'WH5MBP': 'penalty kick',
      'WH5MBD': 'Card',
      'WH5MBF': 'free kick',
      'WH5MBK': 'Goal KIck',
      'WH5MBB': 'Throw-in',
      'WH5MBN': 'No event',
    },
    'sort': [
      'WH5MBG',
      'WH5MBC',
      'WH5MBP',
      'WH5MBD',
      'WH5MBF',
      'WH5MBK',
      'WH5MBB',
      'WH5MBN'
    ]
  },
  'WH5MC': {
    'col': 3,
    "col188": 1,
    'text': {
      'WH5MCG': 'Goal ',
      'WH5MCC': 'Corner KIck',
      'WH5MCP': 'penalty kick',
      'WH5MCD': 'Card',
      'WH5MCF': 'free kick',
      'WH5MCK': 'Goal KIck',
      'WH5MCB': 'Throw-in',
      'WH5MCN': 'No event',
    },
    'sort': [
      'WH5MCG',
      'WH5MCC',
      'WH5MCD',
      'WH5MCP',
      'WH5MCF',
      'WH5MCK',
      'WH5MCB',
      'WH5MCN'
    ]
  },
  'WH5MD': {
    'col': 3,
    "col188": 1,
    'text': {
      'WH5MDG': 'Goal ',
      'WH5MDC': 'Corner KIck',
      'WH5MDP': 'penalty kick',
      'WH5MDD': 'Card',
      'WH5MDF': 'free kick',
      'WH5MDK': 'Goal KIck',
      'WH5MDB': 'Throw-in',
      'WH5MDN': 'No event',
    },
    'sort': [
      'WH5MDG',
      'WH5MDC',
      'WH5MDD',
      'WH5MDP',
      'WH5MDF',
      'WH5MDK',
      'WH5MDB',
      'WH5MDN'
    ]
  },
  "WH1MA": {
    "col": 3,
    "col188": 1,
    "text": {
      "WH1MAG": "Goal ",
      "WH1MAC": "Corner KIck",
      'WH1MAD': 'Card',
      'WH1MAP': 'penalty kick',
      "WH1MAF": "free kick",
      "WH1MAK": "Goal KIck",
      "WH1MAB": "Throw-in",
      "WH1MAN": "No event"
    },
    "sort": [
      'WH1MAG',
      'WH1MAC',
      'WH1MAD',
      'WH1MAP',
      'WH1MAF',
      'WH1MAK',
      'WH1MAB',
      'WH1MAN'
    ]
  },
  "WH1MB": {
    "col": 3,
    "col188": 1,
    "text": {
      "WH1MBG": "Goal ",
      "WH1MBC": "Corner KIck",
      'WH1MBD': 'Card',
      'WH1MBP': 'penalty kick',
      "WH1MBF": "free kick",
      "WH1MBK": "Goal KIck",
      "WH1MBB": "Throw-in",
      "WH1MBN": "No event"
    },
    "sort": [
      'WH1MBG',
      'WH1MBC',
      'WH1MBD',
      'WH1MBP',
      'WH1MBF',
      'WH1MBK',
      'WH1MBB',
      'WH1MBN'
    ]
  },
  "WH1MC": {
    "col": 3,
    "col188": 1,
    "text": {
      "WH1MCG": "Goal ",
      "WH1MCC": "Corner KIck",
      'WH1MCD': 'Card',
      'WH1MCP': 'penalty kick',
      "WH1MCF": "free kick",
      "WH1MCK": "Goal KIck",
      "WH1MCB": "Throw-in",
      "WH1MCN": "No event"
    },
    "sort": [
      'WH1MCG',
      'WH1MCC',
      'WH1MCD',
      'WH1MCP',
      'WH1MCF',
      'WH1MCK',
      'WH1MCB',
      'WH1MCN'
    ]
  },
  "WH1MD": {
    "col": 3,
    "col188": 1,
    "text": {
      "WH1MDG": "Goal ",
      "WH1MDC": "Corner KIck",
      'WH1MDD': 'Card',
      'WH1MDP': 'penalty kick',
      "WH1MDF": "free kick",
      "WH1MDK": "Goal KIck",
      "WH1MDB": "Throw-in",
      "WH1MDN": "No event"
    },
    "sort": [
      'WH1MDG',
      'WH1MDC',
      'WH1MDD',
      'WH1MDP',
      'WH1MDF',
      'WH1MDK',
      'WH1MDB',
      'WH1MDN'
    ]
  },
  "REC2_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC3_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC4_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC5_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC6_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC7_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC8_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC9_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC10_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC11_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC12_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC13_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC14_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC15_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC16_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC17_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC18_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC19_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC20_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "GS1": {"col": 2, "text": {}, "sort": []},
  "GS2": {"col": 2, "text": {}, "sort": []},
  "GS3": {"col": 2, "text": {}, "sort": []},
  "GS4": {"col": 2, "text": {}, "sort": []},
  "GS5": {"col": 2, "text": {}, "sort": []},
  "GS6": {"col": 2, "text": {}, "sort": []},
  "GS7": {"col": 2, "text": {}, "sort": []},
  "GS8": {"col": 2, "text": {}, "sort": []},
  "GS9": {"col": 2, "text": {}, "sort": []},
  "GS10": {"col": 2, "text": {}, "sort": []},
  "TEARM": {
    "col": 3,
    "col188": 1,
    "text": {"TEARMH": "{homeTeam}", "TEARMN": "Draw", "TEARMC": "{awayTeam}"},
    "sort": ["TEARMH", "TEARMN", "TEARMC"]
  },
  "TEAR": {
    "col": 2,
    "col188": 1,
    "text": {"TEARH": "{homeTeam} {ratio}", "TEARC": "{awayTeam} {ratio}"},
    "sort": ["TEARH", "TEARC"]
  },
  "TEAROU": {
    "col": 2,
    "text": {"TEAROUO": "Over {ratio}", "TEAROUU": "Under {ratio}"},
    "sort": ["TEAROUO", "TEAROUU"]
  },
  "FIARM": {
    "col": 3,
    "col188": 1,
    "text": {"FIARMH": "{homeTeam}", "FIARMN": "Draw", "FIARMC": "{awayTeam}"},
    "sort": ["FIARMH", "FIARMN", "FIARMC"]
  },
  "FIAR": {
    "col": 2,
    "col188": 1,
    "text": {"FIARH": "{homeTeam} {ratio}", "FIARC": "{awayTeam} {ratio}"},
    "sort": ["FIARH", "FIARC"]
  },
  "FIBROU": {
    "col": 2,
    "text": {"FIBROUO": "Over {ratio}", "FIBROUU": "Under {ratio}"},
    "sort": ["FIBROUO", "FIBROUU"]
  },
  "TEBRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEBRMH": "{homeTeam}", "TEBRMN": "Draw", "TEBRMC": "{awayTeam}"},
    "sort": ["TEBRMH", "TEBRMN", "TEBRMC"]
  },
  "TEBR": {
    "col": 2,
    "col188": 1,
    "text": {"TEBRH": "{homeTeam} {ratio}", "TEBRC": "{awayTeam} {ratio}"},
    "sort": ["TEBRH", "TEBRC"]
  },
  "TEBROU": {
    "col": 2,
    "text": {"TEBROUO": "Over {ratio}", "TEBROUU": "Under {ratio}"},
    "sort": ["TEBROUO", "TEBROUU"]
  },
  "SAARM": {
    "col": 3,
    "col188": 1,
    "text": {"SAARMH": "{homeTeam}", "SAARMN": "Draw", "SAARMC": "{awayTeam}"},
    "sort": ["SAARMH", "SAARMN", "SAARMC"]
  },
  "SAAR": {
    "col": 2,
    "col188": 1,
    "text": {"SAARH": "{homeTeam} {ratio}", "SAARC": "{awayTeam} {ratio}"},
    "sort": ["SAARH", "SAARC"]
  },
  "SAAROU": {
    "col": 2,
    "text": {"SAAROUO": "Over {ratio}", "SAAROUU": "Under {ratio}"},
    "sort": ["SAAROUO", "SAAROUU"]
  },
  "FICRM": {
    "col": 3,
    "col188": 1,
    "text": {"FICRMH": "{homeTeam}", "FICRMN": "Draw", "FICRMC": "{awayTeam}"},
    "sort": ["FICRMH", "FICRMN", "FICRMC"]
  },
  "FICR": {
    "col": 2,
    "col188": 1,
    "text": {"FICRH": "{homeTeam} {ratio}", "FICRC": "{awayTeam} {ratio}"},
    "sort": ["FICRH", "FICRC"]
  },
  "FICROU": {
    "col": 2,
    "text": {"FICROUO": "Over {ratio}", "FICROUU": "Under {ratio}"},
    "sort": ["FICROUO", "FICROUU"]
  },
  "FIDRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIDRMH": "{homeTeam}", "FIDRMN": "Draw", "FIDRMC": "{awayTeam}"},
    "sort": ["FIDRMH", "FIDRMN", "FIDRMC"]
  },
  "FIDR": {
    "col": 2,
    "col188": 1,
    "text": {"FIDRH": "{homeTeam} {ratio}", "FIDRC": "{awayTeam} {ratio}"},
    "sort": ["FIDRH", "FIDRC"]
  },
  "FIDROU": {
    "col": 2,
    "text": {"FIDROUO": "Over {ratio}", "FIDROUU": "Under {ratio}"},
    "sort": ["FIDROUO", "FIDROUU"]
  },
  "FIERM": {
    "col": 3,
    "col188": 1,
    "text": {"FIERMH": "{homeTeam}", "FIERMN": "Draw", "FIERMC": "{awayTeam}"},
    "sort": ["FIERMH", "FIERMN", "FIERMC"]
  },
  "FIER": {
    "col": 2,
    "col188": 1,
    "text": {"FIERH": "{homeTeam} {ratio}", "FIERC": "{awayTeam} {ratio}"},
    "sort": ["FIERH", "FIERC"]
  },
  "FIEROU": {
    "col": 2,
    "text": {"FIEROUO": "Over {ratio}", "FIEROUU": "Under {ratio}"},
    "sort": ["FIEROUO", "FIEROUU"]
  },
  "FIFRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIFRMH": "{homeTeam}", "FIFRMN": "Draw", "FIFRMC": "{awayTeam}"},
    "sort": ["FIFRMH", "FIFRMN", "FIFRMC"]
  },
  "FIFR": {
    "col": 2,
    "col188": 1,
    "text": {"FIFRH": "{homeTeam} {ratio}", "FIFRC": "{awayTeam} {ratio}"},
    "sort": ["FIFRH", "FIFRC"]
  },
  "FIFROU": {
    "col": 2,
    "text": {"FIFROUO": "Over {ratio}", "FIFROUU": "Under {ratio}"},
    "sort": ["FIFROUO", "FIFROUU"]
  },
  "FIGRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIGRMH": "{homeTeam}", "FIGRMN": "Draw", "FIGRMC": "{awayTeam}"},
    "sort": ["FIGRMH", "FIGRMN", "FIGRMC"]
  },
  "FIGR": {
    "col": 2,
    "col188": 1,
    "text": {"FIGRH": "{homeTeam} {ratio}", "FIGRC": "{awayTeam} {ratio}"},
    "sort": ["FIGRH", "FIGRC"]
  },
  "FIGROU": {
    "col": 2,
    "text": {"FIGROUO": "Over {ratio}", "FIGROUU": "Under {ratio}"},
    "sort": ["FIGROUO", "FIGROUU"]
  },
  "FIHRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIHRMH": "{homeTeam}", "FIHRMN": "Draw", "FIHRMC": "{awayTeam}"},
    "sort": ["FIHRMH", "FIHRMN", "FIHRMC"]
  },
  "FIHR": {
    "col": 2,
    "col188": 1,
    "text": {"FIHRH": "{homeTeam} {ratio}", "FIHRC": "{awayTeam} {ratio}"},
    "sort": ["FIHRH", "FIHRC"]
  },
  "FIHROU": {
    "col": 2,
    "text": {"FIHROUO": "Over {ratio}", "FIHROUU": "Under {ratio}"},
    "sort": ["FIHROUO", "FIHROUU"]
  },
  "FIIRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIIRMH": "{homeTeam}", "FIIRMN": "Draw", "FIIRMC": "{awayTeam}"},
    "sort": ["FIIRMH", "FIIRMN", "FIIRMC"]
  },
  "FIIR": {
    "col": 2,
    "col188": 1,
    "text": {"FIIRH": "{homeTeam} {ratio}", "FIIRC": "{awayTeam} {ratio}"},
    "sort": ["FIIRH", "FIIRC"]
  },
  "FIIROU": {
    "col": 2,
    "text": {"FIIROUO": "Over {ratio}", "FIIROUU": "Under {ratio}"},
    "sort": ["FIIROUO", "FIIROUU"]
  },
  "FIJRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIJRMH": "{homeTeam}", "FIJRMN": "Draw", "FIJRMC": "{awayTeam}"},
    "sort": ["FIJRMH", "FIJRMN", "FIJRMC"]
  },
  "FIJR": {
    "col": 2,
    "col188": 1,
    "text": {"FIJRH": "{homeTeam} {ratio}", "FIJRC": "{awayTeam} {ratio}"},
    "sort": ["FIJRH", "FIJRC"]
  },
  "FIJROU": {
    "col": 2,
    "text": {"FIJROUO": "Over {ratio}", "FIJROUU": "Under {ratio}"},
    "sort": ["FIJROUO", "FIJROUU"]
  },
  "FIKRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIKRMH": "{homeTeam}", "FIKRMN": "Draw", "FIKRMC": "{awayTeam}"},
    "sort": ["FIKRMH", "FIKRMN", "FIKRMC"]
  },
  "FIKR": {
    "col": 2,
    "col188": 1,
    "text": {"FIKRH": "{homeTeam} {ratio}", "FIKRC": "{awayTeam} {ratio}"},
    "sort": ["FIKRH", "FIKRC"]
  },
  "FIKROU": {
    "col": 2,
    "text": {"FIKROUO": "Over {ratio}", "FIKROUU": "Under {ratio}"},
    "sort": ["FIKROUO", "FIKROUU"]
  },
  "FILRM": {
    "col": 3,
    "col188": 1,
    "text": {"FILRMH": "{homeTeam}", "FILRMN": "Draw", "FILRMC": "{awayTeam}"},
    "sort": ["FILRMH", "FILRMN", "FILRMC"]
  },
  "FILR": {
    "col": 2,
    "col188": 1,
    "text": {"FILRH": "{homeTeam} {ratio}", "FILRC": "{awayTeam} {ratio}"},
    "sort": ["FILRH", "FILRC"]
  },
  "FILROU": {
    "col": 2,
    "text": {"FILROUO": "Over {ratio}", "FILROUU": "Under {ratio}"},
    "sort": ["FILROUO", "FILROUU"]
  },
  "FIMRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIMRMH": "{homeTeam}", "FIMRMN": "Draw", "FIMRMC": "{awayTeam}"},
    "sort": ["FIMRMH", "FIMRMN", "FIMRMC"]
  },
  "FIMR": {
    "col": 2,
    "col188": 1,
    "text": {"FIMRH": "{homeTeam} {ratio}", "FIMRC": "{awayTeam} {ratio}"},
    "sort": ["FIMRH", "FIMRC"]
  },
  "FIMROU": {
    "col": 2,
    "text": {"FIMROUO": "Over {ratio}", "FIMROUU": "Under {ratio}"},
    "sort": ["FIMROUO", "FIMROUU"]
  },
  "FINRM": {
    "col": 3,
    "col188": 1,
    "text": {"FINRMH": "{homeTeam}", "FINRMN": "Draw", "FINRMC": "{awayTeam}"},
    "sort": ["FINRMH", "FINRMN", "FINRMC"]
  },
  "FINR": {
    "col": 2,
    "col188": 1,
    "text": {"FINRH": "{homeTeam} {ratio}", "FINRC": "{awayTeam} {ratio}"},
    "sort": ["FINRH", "FINRC"]
  },
  "FINROU": {
    "col": 2,
    "text": {"FINROUO": "Over {ratio}", "FINROUU": "Under {ratio}"},
    "sort": ["FINROUO", "FINROUU"]
  },
  "FIORM": {
    "col": 3,
    "col188": 1,
    "text": {"FIORMH": "{homeTeam}", "FIORMN": "Draw", "FIORMC": "{awayTeam}"},
    "sort": ["FIORMH", "FIORMN", "FIORMC"]
  },
  "FIOR": {
    "col": 2,
    "col188": 1,
    "text": {"FIORH": "{homeTeam} {ratio}", "FIORC": "{awayTeam} {ratio}"},
    "sort": ["FIORH", "FIORC"]
  },
  "FIOROU": {
    "col": 2,
    "text": {"FIOROUO": "Over {ratio}", "FIOROUU": "Under {ratio}"},
    "sort": ["FIOROUO", "FIOROUU"]
  },
  "FIPRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIPRMH": "{homeTeam}", "FIPRMN": "Draw", "FIPRMC": "{awayTeam}"},
    "sort": ["FIPRMH", "FIPRMN", "FIPRMC"]
  },
  "FIPR": {
    "col": 2,
    "col188": 1,
    "text": {"FIPRH": "{homeTeam} {ratio}", "FIPRC": "{awayTeam} {ratio}"},
    "sort": ["FIPRH", "FIPRC"]
  },
  "FIPROU": {
    "col": 2,
    "text": {"FIPROUO": "Over {ratio}", "FIPROUU": "Under {ratio}"},
    "sort": ["FIPROUO", "FIPROUU"]
  },
  "FIQRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIQRMH": "{homeTeam}", "FIQRMN": "Draw", "FIQRMC": "{awayTeam}"},
    "sort": ["FIQRMH", "FIQRMN", "FIQRMC"]
  },
  "FIQR": {
    "col": 2,
    "col188": 1,
    "text": {"FIQRH": "{homeTeam} {ratio}", "FIQRC": "{awayTeam} {ratio}"},
    "sort": ["FIQRH", "FIQRC"]
  },
  "FIQROU": {
    "col": 2,
    "text": {"FIQROUO": "Over {ratio}", "FIQROUU": "Under {ratio}"},
    "sort": ["FIQROUO", "FIQROUU"]
  },
  "TECRM": {
    "col": 3,
    "col188": 1,
    "text": {"TECRMH": "{homeTeam}", "TECRMN": "Draw", "TECRMC": "{awayTeam}"},
    "sort": ["TECRMH", "TECRMN", "TECRMC"]
  },
  "TECR": {
    "col": 2,
    "col188": 1,
    "text": {"TECRH": "{homeTeam} {ratio}", "TECRC": "{awayTeam} {ratio}"},
    "sort": ["TECRH", "TECRC"]
  },
  "TECROU": {
    "col": 2,
    "text": {"TECROUO": "Over {ratio}", "TECROUU": "Under {ratio}"},
    "sort": ["TECROUO", "TECROUU"]
  },
  "TEDRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEDRMH": "{homeTeam}", "TEDRMN": "Draw", "TEDRMC": "{awayTeam}"},
    "sort": ["TEDRMH", "TEDRMN", "TEDRMC"]
  },
  "TEDR": {
    "col": 2,
    "col188": 1,
    "text": {"TEDRH": "{homeTeam} {ratio}", "TEDRC": "{awayTeam} {ratio}"},
    "sort": ["TEDRH", "TEDRC"]
  },
  "TEDROU": {
    "col": 2,
    "text": {"TEDROUO": "Over {ratio}", "TEDROUU": "Under {ratio}"},
    "sort": ["TEDROUO", "TEDROUU"]
  },
  "TEERM": {
    "col": 3,
    "col188": 1,
    "text": {"TEERMH": "{homeTeam}", "TEERMN": "Draw", "TEERMC": "{awayTeam}"},
    "sort": ["TEERMH", "TEERMN", "TEERMC"]
  },
  "TEER": {
    "col": 2,
    "col188": 1,
    "text": {"TEERH": "{homeTeam} {ratio}", "TEERC": "{awayTeam} {ratio}"},
    "sort": ["TEERH", "TEERC"]
  },
  "TEEROU": {
    "col": 2,
    "text": {"TEEROUO": "Over {ratio}", "TEEROUU": "Under {ratio}"},
    "sort": ["TEEROUO", "TEEROUU"]
  },
  "TEFRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEFRMH": "{homeTeam}", "TEFRMN": "Draw", "TEFRMC": "{awayTeam}"},
    "sort": ["TEFRMH", "TEFRMN", "TEFRMC"]
  },
  "TEFR": {
    "col": 2,
    "col188": 1,
    "text": {"TEFRH": "{homeTeam} {ratio}", "TEFRC": "{awayTeam} {ratio}"},
    "sort": ["TEFRH", "TEFRC"]
  },
  "TEFROU": {
    "col": 2,
    "text": {"TEFROUO": "Over {ratio}", "TEFROUU": "Under {ratio}"},
    "sort": ["TEFROUO", "TEFROUU"]
  },
  "TEGRM": {
    "col": 2,
    "col188": 1,
    "text": {"TEGRMH": "{homeTeam}", "TEGRMN": "Draw", "TEGRMC": "{awayTeam}"},
    "sort": ["TEGRMH", "TEGRMN", "TEGRMC"]
  },
  "TEGR": {
    "col": 2,
    "col188": 1,
    "text": {"TEGRH": "{homeTeam} {ratio}", "TEGRC": "{awayTeam} {ratio}"},
    "sort": ["TEGRH", "TEGRC"]
  },
  "TEGROU": {
    "col": 2,
    "text": {"TEGROUO": "Over {ratio}", "TEGROUU": "Under {ratio}"},
    "sort": ["TEGROUO", "TEGROUU"]
  },
  "TEHRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEHRMH": "{homeTeam}", "TEHRMN": "Draw", "TEHRMC": "{awayTeam}"},
    "sort": ["TEHRMH", "TEHRMN", "TEHRMC"]
  },
  "TEHR": {
    "col": 2,
    "col188": 1,
    "text": {"TEHRH": "{homeTeam} {ratio}", "TEHRC": "{awayTeam} {ratio}"},
    "sort": ["TEHRH", "TEHRC"]
  },
  "TEHROU": {
    "col": 2,
    "text": {"TEHROUO": "Over {ratio}", "TEHROUU": "Under {ratio}"},
    "sort": ["TEHROUO", "TEHROUU"]
  },
  "TEIRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEIRMH": "{homeTeam}", "TEIRMN": "Draw", "TEIRMC": "{awayTeam}"},
    "sort": ["TEIRMH", "TEIRMN", "TEIRMC"]
  },
  "TEIR": {
    "col": 2,
    "col188": 1,
    "text": {"TEIRH": "{homeTeam} {ratio}", "TEIRC": "{awayTeam} {ratio}"},
    "sort": ["TEIRH", "TEIRC"]
  },
  "TEIROU": {
    "col": 2,
    "text": {"TEIROUO": "Over {ratio}", "TEIROUU": "Under {ratio}"},
    "sort": ["TEIROUO", "TEIROUU"]
  },
  "TEJRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEJRMH": "{homeTeam}", "TEJRMN": "Draw", "TEJRMC": "{awayTeam}"},
    "sort": ["TEJRMH", "TEJRMN", "TEJRMC"]
  },
  "TEJR": {
    "col": 2,
    "col188": 1,
    "text": {"TEJRH": "{homeTeam} {ratio}", "TEJRC": "{awayTeam} {ratio}"},
    "sort": ["TEJRH", "TEJRC"]
  },
  "TEJROU": {
    "col": 2,
    "text": {"TEJROUO": "Over {ratio}", "TEJROUU": "Under {ratio}"},
    "sort": ["TEJROUO", "TEJROUU"]
  },
  "TEKRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEKRMH": "{homeTeam}", "TEKRMN": "Draw", "TEKRMC": "{awayTeam}"},
    "sort": ["TEKRMH", "TEKRMN", "TEKRMC"]
  },
  "TEKR": {
    "col": 2,
    "col188": 1,
    "text": {"TEKRH": "{homeTeam} {ratio}", "TEKRC": "{awayTeam} {ratio}"},
    "sort": ["TEKRH", "TEKRC"]
  },
  "TEKROU": {
    "col": 2,
    "text": {"TEKROUO": "Over {ratio}", "TEKROUU": "Under {ratio}"},
    "sort": ["TEKROUO", "TEKROUU"]
  },
  "TELRM": {
    "col": 3,
    "col188": 1,
    "text": {"TELRMH": "{homeTeam}", "TELRMN": "Draw", "TELRMC": "{awayTeam}"},
    "sort": ["TELRMH", "TELRMN", "TELRMC"]
  },
  "TELR": {
    "col": 2,
    "col188": 1,
    "text": {"TELRH": "{homeTeam} {ratio}", "TELRC": "{awayTeam} {ratio}"},
    "sort": ["TELRH", "TELRC"]
  },
  "TELROU": {
    "col": 2,
    "text": {"TELROUO": "Over {ratio}", "TELROUU": "Under {ratio}"},
    "sort": ["TELROUO", "TELROUU"]
  },
  "TEMRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEMRMH": "{homeTeam}", "TEMRMN": "Draw", "TEMRMC": "{awayTeam}"},
    "sort": ["TEMRMH", "TEMRMN", "TEMRMC"]
  },
  "TEMR": {
    "col": 2,
    "col188": 1,
    "text": {"TEMRH": "{homeTeam} {ratio}", "TEMRC": "{awayTeam} {ratio}"},
    "sort": ["TEMRH", "TEMRC"]
  },
  "TEMROU": {
    "col": 2,
    "text": {"TEMROUO": "Over {ratio}", "TEMROUU": "Under {ratio}"},
    "sort": ["TEMROUO", "TEMROUU"]
  },
  "TENRM": {
    "col": 3,
    "col188": 1,
    "text": {"TENRMH": "{homeTeam}", "TENRMN": "Draw", "TENRMC": "{awayTeam}"},
    "sort": ["TENRMH", "TENRMN", "TENRMC"]
  },
  "TENR": {
    "col": 2,
    "col188": 1,
    "text": {"TENRH": "{homeTeam} {ratio}", "TENRC": "{awayTeam} {ratio}"},
    "sort": ["TENRH", "TENRC"]
  },
  "TENROU": {
    "col": 2,
    "text": {"TENROUO": "Over {ratio}", "TENROUU": "Under {ratio}"},
    "sort": ["TENROUO", "TENROUU"]
  },
  "TEORM": {
    "col": 3,
    "col188": 1,
    "text": {"TEORMH": "{homeTeam}", "TEORMN": "Draw", "TEORMC": "{awayTeam}"},
    "sort": ["TEORMH", "TEORMN", "TEORMC"]
  },
  "TEOR": {
    "col": 2,
    "col188": 1,
    "text": {"TEORH": "{homeTeam} {ratio}", "TEORC": "{awayTeam} {ratio}"},
    "sort": ["TEORH", "TEORC"]
  },
  "TEOROU": {
    "col": 2,
    "text": {"TEOROUO": "Over {ratio}", "TEOROUU": "Under {ratio}"},
    "sort": ["TEOROUO", "TEOROUU"]
  },
  "SABRM": {
    "col": 3,
    "col188": 1,
    "text": {"SABRMH": "{homeTeam}", "SABRMN": "Draw", "SABRMC": "{awayTeam}"},
    "sort": ["SABRMH", "SABRMN", "SABRMC"]
  },
  "SABR": {
    "col": 2,
    "col188": 1,
    "text": {"SABRH": "{homeTeam} {ratio}", "SABRC": "{awayTeam} {ratio}"},
    "sort": ["SABRH", "SABRC"]
  },
  "SABROU": {
    "col": 2,
    "text": {"SABROUO": "Over {ratio}", "SABROUU": "Under {ratio}"},
    "sort": ["SABROUO", "SABROUU"]
  },
  "BM": {
    "col": 3,
    "col188": 1,
    "text": {"BMH": "{homeTeam}", "BMN": "Draw", "BMC": "{awayTeam}"},
    "sort": ["BMH", "BMN", "BMC"]
  },
  "BR": {
    "col": 2,
    "col188": 1,
    "text": {"BRH": "{homeTeam} {ratio}", "BRC": "{awayTeam} {ratio}"},
    "sort": ["BRH", "BRC"]
  },
  "BROU": {
    "col": 2,
    "text": {"BROUO": "Over {ratio}", "BROUU": "Under {ratio}"},
    "sort": ["BROUO", "BROUU"]
  },
  "SACRM": {
    "col": 3,
    "col188": 1,
    "text": {"SACRMH": "{homeTeam}", "SACRMN": "Draw", "SACRMC": "{awayTeam}"},
    "sort": ["SACRMH", "SACRMN", "SACRMC"]
  },
  "SACR": {
    "col": 2,
    "col188": 1,
    "text": {"SACRH": "{homeTeam} {ratio}", "SACRC": "{awayTeam} {ratio}"},
    "sort": ["SACRH", "SACRC"]
  },
  "SACROU": {
    "col": 2,
    "text": {"SACROUO": "Over {ratio}", "SACROUU": "Under {ratio}"},
    "sort": ["SACROUO", "SACROUU"]
  },
  "SADRM": {
    "col": 3,
    "col188": 1,
    "text": {"SADRMH": "{homeTeam}", "SADRMN": "Draw", "SADRMC": "{awayTeam}"},
    "sort": ["SADRMH", "SADRMN", "SADRMC"]
  },
  "SADR": {
    "col": 2,
    "col188": 1,
    "text": {"SADRH": "{homeTeam} {ratio}", "SADRC": "{awayTeam} {ratio}"},
    "sort": ["SADRH", "SADRC"]
  },
  "SADROU": {
    "col": 2,
    "text": {"SADROUO": "Over {ratio}", "SADROUU": "Under {ratio}"},
    "sort": ["SADROUO", "SADROUU"]
  },
  "SAERM": {
    "col": 3,
    "col188": 1,
    "text": {"SAERMH": "{homeTeam}", "SAERMN": "Draw", "SAERMC": "{awayTeam}"},
    "sort": ["SAERMH", "SAERMN", "SAERMC"]
  },
  "SAER": {
    "col": 2,
    "col188": 1,
    "text": {"SAERH": "{homeTeam} {ratio}", "SAERC": "{awayTeam} {ratio}"},
    "sort": ["SAERH", "SAERC"]
  },
  "SAEROU": {
    "col": 2,
    "text": {"SAEROUO": "Over {ratio}", "SAEROUU": "Under {ratio}"},
    "sort": ["SAEROUO", "SAEROUU"]
  },
  "SAFRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAFRMH": "{homeTeam}", "SAFRMN": "Draw", "SAFRMC": "{awayTeam}"},
    "sort": ["SAFRMH", "SAFRMN", "SAFRMC"]
  },
  "SAFR": {
    "col": 2,
    "col188": 1,
    "text": {"SAFRH": "{homeTeam} {ratio}", "SAFRC": "{awayTeam} {ratio}"},
    "sort": ["SAFRH", "SAFRC"]
  },
  "SAFROU": {
    "col": 2,
    "text": {"SAFROUO": "Over {ratio}", "SAFROUU": "Under {ratio}"},
    "sort": ["SAFROUO", "SAFROUU"]
  },
  "SAGRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAGRMH": "{homeTeam}", "SAGRMN": "Draw", "SAGRMC": "{awayTeam}"},
    "sort": ["SAGRMH", "SAGRMN", "SAGRMC"]
  },
  "SAGR": {
    "col": 2,
    "col188": 1,
    "text": {"SAGRH": "{homeTeam} {ratio}", "SAGRC": "{awayTeam} {ratio}"},
    "sort": ["SAGRH", "SAGRC"]
  },
  "SAGROU": {
    "col": 2,
    "text": {"SAGROUO": "Over {ratio}", "SAGROUU": "Under {ratio}"},
    "sort": ["SAGROUO", "SAGROUU"]
  },
  "SAHRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAHRMH": "{homeTeam}", "SAHRMN": "Draw", "SAHRMC": "{awayTeam}"},
    "sort": ["SAHRMH", "SAHRMN", "SAHRMC"]
  },
  "SAHR": {
    "col": 2,
    "col188": 1,
    "text": {"SAHRH": "{homeTeam} {ratio}", "SAHRC": "{awayTeam} {ratio}"},
    "sort": ["SAHRH", "SAHRC"]
  },
  "SAHROU": {
    "col": 2,
    "text": {"SAHROUO": "Over {ratio}", "SAHROUU": "Under {ratio}"},
    "sort": ["SAHROUO", "SAHROUU"]
  },
  "SAIRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAIRMH": "{homeTeam}", "SAIRMN": "Draw", "SAIRMC": "{awayTeam}"},
    "sort": ["SAIRMH", "SAIRMN", "SAIRMC"]
  },
  "SAIR": {
    "col": 2,
    "col188": 1,
    "text": {"SAIRH": "{homeTeam} {ratio}", "SAIRC": "{awayTeam} {ratio}"},
    "sort": ["SAIRH", "SAIRC"]
  },
  "SAIROU": {
    "col": 2,
    "text": {"SAIROUO": "Over {ratio}", "SAIROUU": "Under {ratio}"},
    "sort": ["SAIROUO", "SAIROUU"]
  },
  "RTTG_conner": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHC": "{homeTeam} Over {ratio}",
      "OUHH": "{homeTeam} Under {ratio}",
      "OUCC": "{awayTeam} Over {ratio}",
      "OUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RFGTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTAS": "shoot",
      "RFGTAH": "header",
      "RFGTAN": "No Goal",
      "RFGTAP": "penalty kick",
      "RFGTAF": "free kick",
      "RFGTAO": "own goal"
    },
    "sort": ["RFGTAS", "RFGTAH", "RFGTAN", "RFGTAP", "RFGTAF", "RFGTAO"]
  },
  "RFGTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTBS": "shoot",
      "RFGTBH": "header",
      "RFGTBN": "No Goal",
      "RFGTBP": "penalty kick",
      "RFGTBF": "free kick",
      "RFGTBO": "own goal"
    },
    "sort": ["RFGTBS", "RFGTBH", "RFGTBN", "RFGTBP", "RFGTBF", "RFGTBO"]
  },
  "RFGTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTCS": "shoot",
      "RFGTCH": "header",
      "RFGTCN": "No Goal",
      "RFGTCP": "penalty kick",
      "RFGTCF": "free kick",
      "RFGTCO": "own goal"
    },
    "sort": ["RFGTCS", "RFGTCH", "RFGTCN", "RFGTCP", "RFGTCF", "RFGTCO"]
  },
  "RFGTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTDS": "shoot",
      "RFGTDH": "header",
      "RFGTDN": "No Goal",
      "RFGTDP": "penalty kick",
      "RFGTDF": "free kick",
      "RFGTDO": "own goal"
    },
    "sort": ["RFGTDS", "RFGTDH", "RFGTDN", "RFGTDP", "RFGTDF", "RFGTDO"]
  },
  "RFGTE": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTES": "shoot",
      "RFGTEH": "header",
      "RFGTEN": "No Goal",
      "RFGTEP": "penalty kick",
      "RFGTEF": "free kick",
      "RFGTEO": "own goal"
    },
    "sort": ["RFGTES", "RFGTEH", "RFGTEN", "RFGTEP", "RFGTEF", "RFGTEO"]
  },
  "RFGTF": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTFS": "shoot",
      "RFGTFH": "header",
      "RFGTFN": "No Goal",
      "RFGTFP": "penalty kick",
      "RFGTFF": "free kick",
      "RFGTFO": "own goal"
    },
    "sort": ["RFGTFS", "RFGTFH", "RFGTFN", "RFGTFP", "RFGTFF", "RFGTFO"]
  },
  "RFGTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTGS": "shoot",
      "RFGTGH": "header",
      "RFGTGN": "No Goal",
      "RFGTGP": "penalty kick",
      "RFGTGF": "free kick",
      "RFGTGO": "own goal"
    },
    "sort": ["RFGTGS", "RFGTGH", "RFGTGN", "RFGTGP", "RFGTGF", "RFGTGO"]
  },
  "RFGTH": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTHS": "shoot",
      "RFGTHH": "header",
      "RFGTHN": "No Goal",
      "RFGTHP": "penalty kick",
      "RFGTHF": "free kick",
      "RFGTHO": "own goal"
    },
    "sort": ["RFGTHS", "RFGTHH", "RFGTHN", "RFGTHP", "RFGTHF", "RFGTHO"]
  },
  "RFGTI": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTIS": "shoot",
      "RFGTIH": "header",
      "RFGTIN": "No Goal",
      "RFGTIP": "penalty kick",
      "RFGTIF": "free kick",
      "RFGTIO": "own goal"
    },
    "sort": ["RFGTIS", "RFGTIH", "RFGTIN", "RFGTIP", "RFGTIF", "RFGTIO"]
  },
  "RFGTJ": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTJS": "shoot",
      "RFGTJH": "header",
      "RFGTJN": "No Goal",
      "RFGTJP": "penalty kick",
      "RFGTJF": "free kick",
      "RFGTJO": "own goal"
    },
    "sort": ["RFGTJS", "RFGTJH", "RFGTJN", "RFGTJP", "RFGTJF", "RFGTJO"]
  },
  "RRT3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT3H": "{homeTeam}", "RRT3N": "Neither", "RRT3C": "{awayTeam}"},
    "sort": ["RRT3H", "RRT3N", "RRT3C"]
  },
  "RRT5_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT5H": "{homeTeam}", "RRT5N": "Neither", "RRT5C": "{awayTeam}"},
    "sort": ["RRT5H", "RRT5N", "RRT5C"]
  },
  "RRT7_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT7H": "{homeTeam}", "RRT7N": "Neither", "RRT7C": "{awayTeam}"},
    "sort": ["RRT7H", "RRT7N", "RRT7C"]
  },
  "RRT9_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT9H": "{homeTeam}", "RRT9N": "Neither", "RRT9C": "{awayTeam}"},
    "sort": ["RRT9H", "RRT9N", "RRT9C"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "Odd",
      "RTEOHE": "Even",
      "RTEOCO": "Odd",
      "RTEOCE": "Even"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "SP": {
    "col": 2,
    "col188": 1,
    "text": {"SPH": "{homeTeam}", "SPC": "{awayTeam}"},
    "sort": ["SPH", "SPC"]
  },
  "MP": {
    "col": 2,
    "col188": 1,
    "text": {"MPH": "{homeTeam}", "MPC": "{awayTeam}"},
    "sort": ["MPH", "MPC"]
  },
  "GZ": {
    "col": 3,
    "col188": 1,
    "text": {
      "GZ01": "0-1",
      'GZ12': '1-2',
      "GZ23": "2-3",
      'GZ34': '3-4',
      "GZ45": "4-5",
      "GZ56": "5-6",
      "GZ78": "7-8",
      "GZ4OV": "4+",
      "GZ5OV": "5+",
      "GZ6OV": "6+",
      "GZ7OV": "7+",
      "GZ8OV": "8+",
      "GZ9OV": "9+"
    },
    "sort": [
      'GZ01',
      'GZ12',
      'GZ23',
      'GZ34',
      'GZ45',
      'GZ56',
      'GZ78',
      'GZ4OV',
      'GZ5OV',
      'GZ6OV',
      'GZ7OV',
      'GZ8OV',
      'GZ9OV'
    ]
  },
  "HRTS": {
    "col": 2,
    "text": {"HRTSY": "Yes", "HRTSN": "No"},
    "sort": ["HRTSY", "HRTSN"]
  },
  "R2OU_conner": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "TSNT": {
    "col": 2,
    "text": {"TSNTY": "Yes", "TSNTN": "No"},
    "sort": ["TSNTY", "TSNTN"]
  },
  "M_conner": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R_conner": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU_conner": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RM_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "Draw", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_conner": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_conner": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_conner": {
    "col": 3,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMN": "Draw", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_conner": {
    "col": 2,
    "col188": 1,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_conner": {
    "col": 2,
    "text": {"HROUC": "Over {ratio}", "HROUH": "Under {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "HROU2_conner": {
    "col": 2,
    "text": {"HOU2C": "Over {ratio}", "HOU2H": "Under {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "RM_OT": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "Draw", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_OT": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_OT": {
    "col": 3,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMN": "Draw", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_OT": {
    "col": 2,
    "col188": 1,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_OT": {
    "col": 2,
    "text": {"HROUC": "Over {ratio}", "HROUH": "Under {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "RE_PS": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_PS": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RDC_OT": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDCHN": "Home/ Draw",
      "RDCHC": "Home/Away",
      "RDCCN": "Draw/ Away"
    },
    "sort": ["RDCHN", "RDCHC", "RDCCN"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "Odd", "REOE": "Even"},
    "sort": ["REOO", "REOE"]
  },
  "ARG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"ARGH": "{homeTeam}", "ARGN": "No Goal", "ARGC": "{awayTeam}"},
    "sort": ["ARGH", "ARGC", "ARGN"]
  },
  "BRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"BRGH": "{homeTeam}", "BRGN": "No Goal", "BRGC": "{awayTeam}"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"CRGH": "{homeTeam}", "CRGN": "No Goal", "CRGC": "{awayTeam}"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"DRGH": "{homeTeam}", "DRGN": "No Goal", "DRGC": "{awayTeam}"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"ERGH": "{homeTeam}", "ERGN": "No Goal", "ERGC": "{awayTeam}"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"FRGH": "{homeTeam}", "FRGN": "No Goal", "FRGC": "{awayTeam}"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"GRGH": "{homeTeam}", "GRGN": "No Goal", "GRGC": "{awayTeam}"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"HRGH": "{homeTeam}", "HRGN": "No Goal", "HRGC": "{awayTeam}"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"IRGH": "{homeTeam}", "IRGN": "No Goal", "IRGC": "{awayTeam}"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"JRGH": "{homeTeam}", "JRGN": "No Goal", "JRGC": "{awayTeam}"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "RTS_OT": {
    "col": 2,
    "text": {"RTSY": "Yes", "RTSN": "No"},
    "sort": ["RTSY", "RTSN"]
  },
  "RTEO_OT": {
    "col": 2,
    "text":
    {
      'RTEOHO': 'Odd',
      'RTEOHE': 'Even',
      'RTEOCO': 'Odd',
      'RTEOCE': 'Even'
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  'RW3_OT': {
    'col': 3,
    "col188": 1,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'Draw {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'GZ_OT': {
    'col': 3,
    "col188": 1,
    'text': {
      'GZ01': '0-1',
      'GZ23': '2-3',
      'GZ45': '4-5',
      'GZ56': '5-6',
      'GZ78': '7-8',
      'GZ4OV': '4+',
      'GZ5OV': '5+',
      'GZ6OV': '6+',
      'GZ7OV': '7+',
      'GZ8OV': '8+',
      'GZ9OV': '9+',
    },
    'sort': [
      'GZ01',
      'GZ23',
      'GZ45',
      'GZ56',
      'GZ78',
      'GZ4OV',
      'GZ5OV',
      'GZ6OV',
      'GZ7OV',
      'GZ8OV',
      'GZ9OV'
    ]
  },
  'RTTG_OT': {
    'col': 2,
    "col188": 1,
    'text': {
      'ROUHC': '{homeTeam} Over {ratio}',
      'ROUHH': '{homeTeam} Under {ratio}',
      'ROUCC': '{awayTeam} Over {ratio}',
      'ROUCH': '{awayTeam} Under {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'RTG_OT': {
    'col': 2,
    "col188": 1,
    'text': {
      'RTGH0': '{homeTeam} 0',
      'RTGH1': '{homeTeam} 1',
      'RTGH2': '{homeTeam} 2',
      'RTGH3': '{homeTeam} 3',
      'RTGH4+': '{homeTeam} 4+',
      'RTGC0': '{awayTeam} 0',
      'RTGC1': '{awayTeam} 1',
      'RTGC2': '{awayTeam} 2',
      'RTGC3': '{awayTeam} 3',
      'RTGC4+': '{awayTeam} 4+'
    },
    'sort': [
      'RTGH0',
      'RTGH1',
      'RTGH2',
      'RTGH3',
      'RTGH4+',
      'RTGC0',
      'RTGC1',
      'RTGC2',
      'RTGC3',
      'RTGC4+',
    ]
  },
  'RWN_OT': {
    'col': 2,
    "col188": 1,
    'text': {'RWNH': '{homeTeam}', 'RWNC': '{awayTeam}'},
    'sort': ['RWNH', 'RWNC']
  },
  'DNB': {
    'col': 2,
    "col188": 1,
    'text': {'DNBH': '{homeTeam}', 'DNBA': '{awayTeam}'},
    'sort': ['DNBH', 'DNBA']
  },
  'RM2_PS': {
    'col': 2,
    "col188": 1,
    'text': {'RM2H': '{homeTeam}', 'RM2C': '{awayTeam}'},
    'sort': ['RM2H', 'RM2C']
  },
  'RSA_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSAHY': '{homeTeam} made the penalty kick',
      'RSAHN': '{homeTeam} miss the penalty kick',
      'RSACY': '{awayTeam} made the penalty kick',
      'RSACN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSAHY', 'RSAHN', 'RSACY', 'RSACN']
  },
  'RSB_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSBHY': '{homeTeam} made the penalty kick',
      'RSBHN': '{homeTeam} miss the penalty kick',
      'RSBCY': '{awayTeam} made the penalty kick',
      'RSBCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSBHY', 'RSBHN', 'RSBCY', 'RSBCN']
  },
  'RSC_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSCHY': '{homeTeam} made the penalty kick',
      'RSCHN': '{homeTeam} miss the penalty kick',
      'RSCCY': '{awayTeam} made the penalty kick',
      'RSCCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSCHY', 'RSCHN', 'RSCCY', 'RSCCN']
  },
  'RSD_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSDHY': '{homeTeam} made the penalty kick',
      'RSDHN': '{homeTeam} miss the penalty kick',
      'RSDCY': '{awayTeam} made the penalty kick',
      'RSDCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSDHY', 'RSDHN', 'RSDCY', 'RSDCN']
  },
  'RSE_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSEHY': '{homeTeam} made the penalty kick',
      'RSEHN': '{homeTeam} miss the penalty kick',
      'RSECY': '{awayTeam} made the penalty kick',
      'RSECN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSEHY', 'RSEHN', 'RSECY', 'RSECN']
  },
  'RSF_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSFHY': '{homeTeam} made the penalty kick',
      'RSFHN': '{homeTeam} miss the penalty kick',
      'RSFCY': '{awayTeam} made the penalty kick',
      'RSFCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSFHY', 'RSFHN', 'RSFCY', 'RSFCN']
  },
  'RSG_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSGHY': '{homeTeam} made the penalty kick',
      'RSGHN': '{homeTeam} miss the penalty kick',
      'RSGCY': '{awayTeam} made the penalty kick',
      'RSGCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSGHY', 'RSGHN', 'RSGCY', 'RSGCN']
  },
  'RSH_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSHHY': '{homeTeam} made the penalty kick',
      'RSHHN': '{homeTeam} miss the penalty kick',
      'RSHCY': '{awayTeam} made the penalty kick',
      'RSHCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSHHY', 'RSHHN', 'RSHCY', 'RSHCN']
  },
  'RSI_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSIHY': '{homeTeam} made the penalty kick',
      'RSIHN': '{homeTeam} miss the penalty kick',
      'RSICY': '{awayTeam} made the penalty kick',
      'RSICN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSIHY', 'RSIHN', 'RSICY', 'RSICN']
  },
  'RSJ_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSJHY': '{homeTeam} made the penalty kick',
      'RSJHN': '{homeTeam} miss the penalty kick',
      'RSJCY': '{awayTeam} made the penalty kick',
      'RSJCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSJHY', 'RSJHN', 'RSJCY', 'RSJCN']
  },
  'RSK_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSKHY': '{homeTeam} made the penalty kick',
      'RSKHN': '{homeTeam} miss the penalty kick',
      'RSKCY': '{awayTeam} made the penalty kick',
      'RSKCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSKHY', 'RSKHN', 'RSKCY', 'RSKCN']
  },
  'RSL_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSLHY': '{homeTeam} made the penalty kick',
      'RSLHN': '{homeTeam} miss the penalty kick',
      'RSLCY': '{awayTeam} made the penalty kick',
      'RSLCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSLHY', 'RSLHN', 'RSLCY', 'RSLCN']
  },
  'RSM_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSMHY': '{homeTeam} made the penalty kick',
      'RSMHN': '{homeTeam} miss the penalty kick',
      'RSMCY': '{awayTeam} made the penalty kick',
      'RSMCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSMHY', 'RSMHN', 'RSMCY', 'RSMCN']
  },
  'RSN_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSNHY': '{homeTeam} made the penalty kick',
      'RSNHN': '{homeTeam} miss the penalty kick',
      'RSNCY': '{awayTeam} made the penalty kick',
      'RSNCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSNHY', 'RSNHN', 'RSNCY', 'RSNCN']
  },
  'RSO_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSOHY': '{homeTeam} made the penalty kick',
      'RSOHN': '{homeTeam} miss the penalty kick',
      'RSOCY': '{awayTeam} made the penalty kick',
      'RSOCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSOHY', 'RSOHN', 'RSOCY', 'RSOCN']
  },
  'RSP_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSPHY': '{homeTeam} made the penalty kick',
      'RSPHN': '{homeTeam} miss the penalty kick',
      'RSPCY': '{awayTeam} made the penalty kick',
      'RSPCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSPHY', 'RSPHN', 'RSPCY', 'RSPCN']
  },
  'RSQ_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSQHY': '{homeTeam} made the penalty kick',
      'RSQHN': '{homeTeam} miss the penalty kick',
      'RSQCY': '{awayTeam} made the penalty kick',
      'RSQCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSQHY', 'RSQHN', 'RSQCY', 'RSQCN']
  },
  'RSR_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSRHY': '{homeTeam} made the penalty kick',
      'RSRHN': '{homeTeam} miss the penalty kick',
      'RSRCY': '{awayTeam} made the penalty kick',
      'RSRCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSRHY', 'RSRHN', 'RSRCY', 'RSRCN']
  },
  'RSS_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSSHY': '{homeTeam} made the penalty kick',
      'RSSHN': '{homeTeam} miss the penalty kick',
      'RSSCY': '{awayTeam} made the penalty kick',
      'RSSCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSSHY', 'RSSHN', 'RSSCY', 'RSSCN']
  },
  'RST_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSTHY': '{homeTeam} made the penalty kick',
      'RSTHN': '{homeTeam} miss the penalty kick',
      'RSTCY': '{awayTeam} made the penalty kick',
      'RSTCN': '{awayTeam} miss the penalty kick'
    },
    'sort': ['RSTHY', 'RSTHN', 'RSTCY', 'RSTCN']
  },
  'RPSD_PS': {
    'col': 2,
    'text': {'RPSDY': 'Yes', 'RPSDN': 'No'},
    'sort': ['RPSDY', 'RPSDN']
  },
  'RLS_PS': {
    'col': 2,
    "col188": 1,
    'text': {'RLSH': '{homeTeam}', 'RLSC': '{awayTeam}'},
    'sort': ['RLSH', 'RLSC']
  },
  'RTTG_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'ROUHC': '{homeTeam} Over {ratio}',
      'ROUHH': '{homeTeam} Under {ratio}',
      'ROUCC': '{awayTeam} Over {ratio}',
      'ROUCH': '{awayTeam} Under {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'TQ': {
    'col': 2,
    "col188": 1,
    'text': {'TQH': '{homeTeam}', 'TQC': '{awayTeam}'},
    'sort': ['TQH', 'TQC']
  },
  "FSG": {
    "col": 3,
    "col188": 1,
    "text": {"FSGH": "{homeTeam}", "FSGA": "{awayTeam}", "FSGN": "No Goal"},
    "sort": ["FSGH", "FSGA", "FSGN"]
  },

  "HTSBH2": {
    "col": 2,
    "text": {
      "HTSB2HY": "Yes",
      "HTSB2HN": "No",
    },
    "sort": ["HTSB2HY", "HTSB2HN"]
  },
  "HTSBC2": {
    "col": 2,
    "text": {
      "HTSB2CY": "Yes",
      "HTSB2CN": "No",
    },
    "sort": ["HTSB2CY", "HTSB2CN"]
  },
  "TSBH": {
    "col": 2,
    "text": {
      "TSBHY": "Yes",
      "TSBHN": "No",
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "TSBC": {
    "col": 2,
    "text": {
      "TSBCY": "Yes",
      "TSBCN": "No"
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "HOU_conner": {
    "col": 2,
    "text": {'HOUC': 'Over {ratio}', 'HOUH': 'Under {ratio}'},
    "sort": ['HOUC', 'HOUH']
  },
  

};

