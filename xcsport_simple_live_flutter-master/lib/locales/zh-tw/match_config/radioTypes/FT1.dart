//足球
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
      "WMD1RT": "常規賽主勝",
      "WMD1OT": "加時賽主勝",
      "WMD1SO": "點球主勝",
      "WMD2RT": "常規賽客勝",
      "WMD2OT": "加時賽客勝",
      "WMD2SO": "點球客勝"
    },
    "sort": ["WMD1RT", "WMD1OT", "WMD1SO", "WMD2RT", "WMD2OT", "WMD2SO"]
  },
  "LG": {
    "col": 3,
    "col188": 1,
    "text": {"LGH": "{homeTeam}", "LGA": "{awayTeam}", "LGN": "無進球"},
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
    "text": {"OEHTO": "單", "OEHTE": "雙"},
    "sort": ["OEHTO", "OEHTE"]
  },
  "OEAT": {
    "col": 2,
    "text": {"OEATO": "單", "OEATE": "雙"},
    "sort": ["OEATO", "OEATE"]
  },
  "WTTS": {
    "col": 2,
    "col188": 1,
    "text": {"WTTSH": "只有主隊", "WTTSA": "只有客隊", "WTTSB": "主客都進", "WTTSN": "無進球"},
    "sort": ["WTTSH", "WTTSA", "WTTSB", "WTTSN"]
  },
  "CSHT": {
    "col": 2,
    "text": {"CSHTY": "是", "CSHTN": "否"},
    "sort": ["CSHTY", "CSHTN"]
  },
  "CSAT": {
    "col": 2,
    "text": {"CSATY": "是", "CSATN": "否"},
    "sort": ["CSATY", "CSATN"]
  },
  "WHN": {
    "col": 2,
    "text": {"WHNY": "是", "WHNN": "否"},
    "sort": ["WHNY", "WHNN"]
  },
  "WHA": {
    "col": 2,
    "text": {"WHAY": "是", "WHAN": "否"},
    "sort": ["WHAY", "WHAN"]
  },
  "BTTS": {
    "col": 3,
    "col188": 1,
    "text": {
      "BTTSHY": "主勝/是",
      "BTTSHN": "主勝/否",
      "BTTSDY": "平局/是",
      "BTTSDN": "平局/否",
      "BTTSAY": "客勝/是",
      "BTTSAN": "客勝/否"
    },
    "sort": ["BTTSHY", "BTTSHN", "BTTSDY", "BTTSDN", "BTTSAY", "BTTSAN"]
  },
  "TBTS": {
    "col": 2,
    "col188": 1,
    "text": {
      "TBTSOY": "大{total}/是",
      "TBTSUY": "小{total}/是",
      "TBTSON": "大{total}/否",
      "TBTSUN": "小{total}/否"
    },
    "sort": ["TBTSOY", "TBTSUY", "TBTSON", "TBTSUN"]
  },
  "MOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUHO": "主勝/大{total}",
      "MOUHU": "主勝/小{total}",
      "MOUDO": "平局/大{total}",
      "MOUDU": "平局/小{total}",
      "MOUAO": "客勝/大{total}",
      "MOUAU": "客勝/小{total}"
    },
    "sort": ["MOUHO", "MOUHU", "MOUDO", "MOUDU", "MOUAO", "MOUAU"]
  },
  "HTWBH": {
    "col": 2,
    "text": {"HTWBHY": "是", "HTWBHN": "否"},
    "sort": ["HTWBHY", "HTWBHN"]
  },
  "ATWBH": {
    "col": 2,
    "text": {"ATWBHY": "是", "ATWBHN": "否"},
    "sort": ["ATWBHY", "ATWBHN"]
  },
  "HTWEH": {
    "col": 2,
    "text": {"HTWEHY": "是", "HTWEHN": "否"},
    "sort": ["HTWEHY", "HTWEHN"]
  },
  "ATWEH": {
    "col": 2,
    "text": {"ATWEHY": "是", "ATWEHN": "否"},
    "sort": ["ATWEHY", "ATWEHN"]
  },
  "SHSH": {
    "col": 3,
    "col188": 1,
    "text": {"SHSH1": "上半場", "SHSH2": "下半場", "SHSHE": "得分相同"},
    "sort": ["SHSH1", "SHSH2", "SHSHE"]
  },
  "HSHH": {
    "col": 3,
    "col188": 1,
    "text": {"HSHH1": "上半場", "HSHH2": "下半場", "HSHHE": "得分相同"},
    "sort": ["HSHH1", "HSHH2", "HSHHE"]
  },
  "HSHA": {
    "col": 3,
    "col188": 1,
    "text": {"HSHA1": "上半場", "HSHA2": "下半場", "HSHAE": "得分相同"},
    "sort": ["HSHA1", "HSHA2", "HSHAE"]
  },
  "HBTS": {
    "col": 2,
    "col188": 1,
    "text": {
      "HBTSNN": "否/否",
      "HBTSYN": "是/否",
      "HBTSYY": "是/是",
      "HBTSNY": "否/是"
    },
    "sort": ["HBTSNN", "HBTSYN", "HBTSYY", "HBTSNY"]
  },
  "SBH_H": {
    "col": 2,
    "text": {"SBH_HY": "是", "SBH_HN": "否"},
    "sort": ["SBH_HY", "SBH_HN"]
  },
  "SBH_C": {
    "col": 2,
    "text": {"SBH_CY": "是", "SBH_CN": "否"},
    "sort": ["SBH_CY", "SBH_CN"]
  },
  "DC_H": {
    "col": 3,
    "col188": 1,
    "text": {"DC_H1X": "主和", "DC_H12": "主客", "DC_HX2": "和客"},
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
    "text": {"BTS_HY": "是", "BTS_HN": "否"},
    "sort": ["BTS_HY", "BTS_HN"]
  },
  "MBTS_H": {
    "col": 2,
    "col188": 1,
    "text": {
      "MBTS_HHY": "主勝/是",
      "MBTS_HHN": "主勝/否",
      "MBTS_HDY": "平局/是",
      "MBTS_HDN": "平局/否",
      "MBTS_HAY": "客勝/是",
      "MBTS_HAN": "客勝/否"
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
      "MOU_HHO": "主勝/大{total}",
      "MOU_HHU": "主勝/小{total}",
      "MOU_HDO": "平局/大{total}",
      "MOU_HDU": "平局/小{total}",
      "MOU_HAO": "客勝/大{total}",
      "MOU_HAU": "客勝/小{total}"
    },
    "sort": ["MOU_HHO", "MOU_HHU", "MOU_HDO", "MOU_HDU", "MOU_HAO", "MOU_HAU"]
  },
  "HM2": {
    "col": 3,
    "col188": 1,
    "text": {"HM2H": "{homeTeam}", "HM2D": "平", "HM2A": "{awayTeam}"},
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
    "text": {"HOU2O": "大 {ratio}", "HOU2U": "小 {ratio}"},
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
    "text": {"HEO2O": "單", "HEO2E": "雙"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "BTTS2": {
    "col": 2,
    "text": {"BTTS2Y": "是", "BTTS2N": "否"},
    "sort": ["BTTS2Y", "BTTS2N"]
  },
  "AM_FM": {
    "col": 3,
    "col188": 1,
    "text": {"AM_FMH": "{homeTeam}", "AM_FMD": "平", "AM_FMA": "{awayTeam}"},
    "sort": ["AM_FMH", "AM_FMD", "AM_FMA"]
  },
  "AOU_FOU": {
    "col": 2,
    "text": {"AOU_FOUO": "大 {ratio}", "AOU_FOUU": "小 {ratio}"},
    "sort": ["AOU_FOUO", "AOU_FOUU"]
  },
  "TM_FM": {
    "col": 3,
    "col188": 1,
    "text": {"TM_FMH": "{homeTeam}", "TM_FMD": "平", "TM_FMA": "{awayTeam}"},
    "sort": ["TM_FMH", "TM_FMD", "TM_FMA"]
  },
  "TOU_FOU": {
    "col": 2,
    "text": {"TOU_FOUO": "大 {ratio}", "TOU_FOUU": "小 {ratio}"},
    "sort": ["TOU_FOUO", "TOU_FOUU"]
  },
  "OTG": {
    "col": 2,
    "text": {"OTGY": "是", "OTGN": "否"},
    "sort": ["OTGY", "OTGN"]
  },
  "OTM": {
    "col": 3,
    "col188": 1,
    "text": {"OTMH": "{homeTeam}", "OTMD": "平", "OTMA": "{awayTeam}"},
    "sort": ["OTMH", "OTMD", "OTMA"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "大 {ratio}", "OTOUU": "小 {ratio}"},
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
    "text": {"OTHMH": "{homeTeam}", "OTHMD": "平", "OTHMA": "{awayTeam}"},
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
    "text": {"WBPY": "是", "WBPN": "否"},
    "sort": ["WBPY", "WBPN"]
  },
  "B": {
    "col": 3,
    "col188": 1,
    "text": {"BH": "{homeTeam}", "BA": "{awayTeam}", "BN": "無"},
    "sort": ["BH", "BA", "BN"]
  },
  "C": {
    "col": 3,
    "col188": 1,
    "text": {"CH": "{homeTeam}", "CA": "{awayTeam}", "CN": "無"},
    "sort": ["CH", "CA", "CN"]
  },
  "LC": {
    "col": 3,
    "col188": 1,
    "text": {"LCH": "{homeTeam}", "LCA": "{awayTeam}", "LCN": "無"},
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
    "text": {"1M_FOUO": "大 {ratio}", "1M_FOUU": "小 {ratio}"},
    "sort": ["1M_FOUO", "1M_FOUU"]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "是", "OTN": "否"},
    "sort": ["OTY", "OTN"]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "是", "ROTN": "否"},
    "sort": ["ROTY", "ROTN"]
  },
  "W_H": {
    "col": 2,
    "text": {"W_HY": "是", "W_HN": "否"},
    "sort": ["W_HY", "W_HN"]
  },
  "A_H": {
    "col": 2,
    "text": {"A_HY": "是", "A_HN": "否"},
    "sort": ["A_HY", "A_HN"]
  },
  "ANY_W": {
    "col": 2,
    "text": {"ANY_WY": "是", "ANY_WN": "否"},
    "sort": ["ANY_WY", "ANY_WN"]
  },
  "TJG": {
    "col": 2,
    "col188": 1,
    "text": {
      "TJG1": "比賽開始-15:59",
      "TJG2": "16:00-30:59",
      "TJG3": "31:00-45:59",
      "TJG4": "46-60",
      "TJG5": "61-75",
      "TJG6": "76-90",
      "TJGN": "無進球"
    },
    "sort": ["TJG1", "TJG2", "TJG3", "TJG4", "TJG5", "TJG6", "TJGN"]
  },
  "FGT": {
    "col": 3,
    "col188": 1,
    "text": {
      "FGTS": "射門",
      "FGTH": "頭球",
      "FGTN": "烏龍球",
      "FGTP": "點球",
      "FGTF": "任意球",
      "FGTO": "無進球"
    },
    "sort": ["FGTS", "FGTH", "FGTN", "FGTP", "FGTF", "FGTO"]
  },
  "WM1": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM1H1": "主隊-凈贏1球",
      "WM1H2": "主隊-凈贏2球",
      "WM1H3": "主隊-凈贏3球",
      "WM1C1": "客隊-凈贏1球",
      "WM1C2": "客隊-凈贏2球",
      "WM1C3": "客隊-凈贏3球",
      "WM1N": "平"
    },
    "sort": ["WM1H1", "WM1H2", "WM1H3", "WM1C1", "WM1C2", "WM1C3", "WM1N"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "主隊-凈贏1球",
      "WMH2": "主隊-凈贏2球",
      "WMH3": "主隊-凈贏3球",
      "WMHOV": "主隊-凈贏4 球以上",
      "WMC1": "客隊-凈贏1球",
      "WMC2": "客隊-凈贏2球",
      "WMC3": "客隊-凈贏3球",
      "WMCOV": "客隊-凈贏4球以上",
      "WM0": "0-0平局",
      "WMN": "其他比分平局"
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
      "MTSHY": "主勝/是",
      "MTSHN": "主勝/否",
      "MTSNY": "平局/是",
      "MTSNN": "平局/否",
      "MTSCY": "客勝/是",
      "MTSCN": "客勝/否",
      'MTSDY': '平局/是',
      'MTSDN': '平局/否',
      'MTSHW': '主隊/零失球獲勝',
      'MTSCW': '客隊/零失球獲勝'
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
      "RMTSHY": "主勝/是",
      "RMTSHN": "主勝/否",
      "RMTSNY": "平局/是",
      "RMTSNN": "平局/否",
      "RMTSCY": "客勝/是",
      "RMTSCN": "客勝/否"
    },
    "sort": ["RMTSHY", "RMTSHN", "RMTSNY", "RMTSNN", "RMTSCY", "RMTSCN"]
  },
  "OUTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTAOY": "大 1.5 & 是",
      "OUTAON": "大 1.5 & 不是",
      "OUTAUY": "小 1.5 & 是 ",
      "OUTAUN": "小 1.5 & 不是"
    },
    "sort": ["OUTAOY", "OUTAON", "OUTAUY", "OUTAUN"]
  },
  "RUTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTAOY": "大 1.5 & 是",
      "RUTAON": "大 1.5 & 不是",
      "RUTAUY": "小 1.5 & 是 ",
      "RUTAUN": "小 1.5 & 不是"
    },
    "sort": ["RUTAOY", "RUTAON", "RUTAUY", "RUTAUN"]
  },
  "OUTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTBOY": "大 2.5 & 是",
      "OUTBON": "大 2.5 & 不是",
      "OUTBUY": "小 2.5 & 是 ",
      "OUTBUN": "小 2.5 & 不是"
    },
    "sort": ["OUTBOY", "OUTBON", "OUTBUY", "OUTBUN"]
  },
  "RUTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTBOY": "大 2.5 & 是",
      "RUTBON": "大 2.5 & 不是",
      "RUTBUY": "小 2.5 & 是 ",
      "RUTBUN": "小 2.5 & 不是"
    },
    "sort": ["RUTBOY", "RUTBON", "RUTBUY", "RUTBUN"]
  },
  "OUTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTCOY": "大 3.5 & 是",
      "OUTCON": "大 3.5 & 不是",
      "OUTCUY": "小 3.5 & 是 ",
      "OUTCUN": "小 3.5 & 不是"
    },
    "sort": ["OUTCOY", "OUTCON", "OUTCUY", "OUTCUN"]
  },
  "RUTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTCOY": "大 3.5 & 是",
      "RUTCON": "大 3.5 & 不是",
      "RUTCUY": "小 3.5 & 是 ",
      "RUTCUN": "小 3.5 & 不是"
    },
    "sort": ["RUTCOY", "RUTCON", "RUTCUY", "RUTCUN"]
  },
  "OUTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUTDOY": "大 4.5 & 是",
      "OUTDON": "大 4.5 & 不是",
      "OUTDUY": "小 4.5 & 是 ",
      "OUTDUN": "小 4.5 & 不是"
    },
    "sort": ["OUTDOY", "OUTDON", "OUTDUY", "OUTDUN"]
  },
  "RUTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUTDOY": "大 4.5 & 是",
      "RUTDON": "大 4.5 & 不是",
      "RUTDUY": "小 4.5 & 是 ",
      "RUTDUN": "小 4.5 & 不是"
    },
    "sort": ["RUTDOY", "RUTDON", "RUTDUY", "RUTDUN"]
  },
  "MOUA": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUACO": "客勝 & 大 1.5",
      "MOUACU": "客勝 & 小 1.5 ",
      "MOUAHO": "主勝 & 大 1.5",
      "MOUAHU": "主勝 & 小 1.5",
      "MOUANO": "平局 & 大 1.5",
      "MOUANU": "平局 & 小 1.5"
    },
    "sort": ['MOUAHO', 'MOUAHU', 'MOUANO', 'MOUANU', 'MOUACO', 'MOUACU']
  },
  "MOUB": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUBCO": "客勝 & 大 2.5",
      "MOUBCU": "客勝 & 小 2.5 ",
      "MOUBHO": "主勝 & 大 2.5",
      "MOUBHU": "主勝 & 小 2.5",
      "MOUBNO": "平局 & 大 2.5",
      "MOUBNU": "平局 & 小 2.5"
    },
    "sort": ['MOUBHO', 'MOUBHU', 'MOUBNO', 'MOUBNU','MOUBCO', 'MOUBCU']
  },
  "MOUC": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUCCO": "客勝 & 大 3.5",
      "MOUCCU": "客勝 & 小 3.5 ",
      "MOUCHO": "主勝 & 大 3.5",
      "MOUCHU": "主勝 & 小 3.5",
      "MOUCNO": "平局 & 大 3.5",
      "MOUCNU": "平局 & 小 3.5"
    },
    "sort": ['MOUCHO', 'MOUCHU', 'MOUCNO', 'MOUCNU','MOUCCO', 'MOUCCU']
  },
  "MOUD": {
    "col": 2,
    "col188": 1,
    "text": {
      "MOUDCO": "客勝 & 大 4.5",
      "MOUDCU": "客勝 & 小 4.5 ",
      "MOUDHO": "主勝 & 大 4.5",
      "MOUDHU": "主勝 & 小 4.5",
      "MOUDNO": "平局 & 大 4.5",
      "MOUDNU": "平局 & 小 4.5"
    },
    "sort": [ 'MOUDHO', 'MOUDHU', 'MOUDNO', 'MOUDNU','MOUDCO', 'MOUDCU']
  },
  "MG": {
    "col": 3,
    "col188": 1,
    "text": {"MGH": "上半場", "MGC": "下半場", "MGN": "得分相同 "},
    "sort": ["MGH", "MGC", "MGN"]
  },
  "HTS": {
    "col": 2,
    "text": {"HTSY": "是", "HTSN": "否 "},
    "sort": ["HTSY", "HTSN"]
  },
  "RTS2": {
    "col": 2,
    "text": {"RTS2Y": "是", "RTS2N": "否 "},
    "sort": ["RTS2Y", "RTS2N"]
  },
  "RPS": {
    "col": 2,
    "text": {"RPSY": "是", "RPSN": "否 "},
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
      "DGHH": "主隊/和局 & 主隊(最先進球) ",
      "DGHC": "主隊/和局 & 客隊(最先進球) ",
      "DGCC": "客隊/和局 & 客隊(最先進球) ",
      "DGCH": "客隊/和局 & 主隊(最先進球) ",
      "DGSH": "主隊/客隊 & 主隊(最先進球) ",
      "DGSC": "主隊/客隊 & 客隊(最先進球) "
    },
    "sort": ["DGHH", "DGHC", "DGCC", "DGCH", "DGSH", "DGSC"]
  },
  "RDG": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDGHH": "主隊/和局 & 主隊(最先進球) ",
      "RDGHC": "主隊/和局 & 客隊(最先進球) ",
      "RDGCC": "客隊/和局 & 客隊(最先進球) ",
      "RDGCH": "客隊/和局 & 主隊(最先進球) ",
      "RDGSH": "主隊/客隊 & 主隊(最先進球) ",
      "RDGSC": "主隊/客隊 & 客隊(最先進球) "
    },
    "sort": ["RDGHH", "RDGHC", "RDGCC", "RDGCH", "RDGSH", "RDGSC"]
  },
  "DS": {
    "col": 3,
    "col188": 1,
    "text": {
      "DSHY": "主隊/平局 & 是",
      "DSHN": "主隊/平局 & 否",
      "DSSY": "主隊/客隊 & 是",
      "DSSN": "主隊/客隊 & 否",
      "DSCY": "平局/客隊 & 是",
      "DSCN": "平局/客隊 & 否"
    },
    "sort": ["DSHY", "DSHN", "DSSY", "DSSN", "DSCY", "DSCN"]
  },
  "RDS": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDSHY": "主隊/平局 & 是",
      "RDSHN": "主隊/平局 & 否",
      "RDSSY": "主隊/客隊 & 是",
      "RDSSN": "主隊/客隊 & 否",
      "RDSCY": "平局/客隊 & 是",
      "RDSCN": "平局/客隊 & 否"
    },
    "sort": ["RDSHY", "RDSHN", "RDSSY", "RDSSN", "RDSCY", "RDSCN"]
  },
  "DUA": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUAHO": "主隊/和局 & 大 1.5",
      "DUAHU": "主隊/和局 & 小 1.5 ",
      "DUACO": "客隊/和局 & 大 1.5",
      "DUACU": "客隊/和局 & 小 1.5 ",
      "DUASO": "主隊/客隊 & 大 1.5 ",
      "DUASU": "主隊/客隊 & 小 1.5 "
    },
    "sort": ["DUAHO", "DUAHU", "DUACO", "DUACU", "DUASO", "DUASU"]
  },
  "RDUA": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUAHO": "主隊/和局 & 大 1.5",
      "RDUAHU": "主隊/和局 & 小 1.5 ",
      "RDUACO": "客隊/和局 & 大 1.5",
      "RDUACU": "客隊/和局 & 小 1.5 ",
      "RDUASO": "主隊/客隊 & 大 1.5 ",
      "RDUASU": "主隊/客隊 & 小 1.5 "
    },
    "sort": ["RDUAHO", "RDUAHU", "RDUACO", "RDUACU", "RDUASO", "RDUASU"]
  },
  "DUB": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUBHO": "主隊/和局 & 大 2.5",
      "DUBHU": "主隊/和局 & 小 2.5 ",
      "DUBCO": "客隊/和局 & 大 2.5",
      "DUBCU": "客隊/和局 & 小 2.5 ",
      "DUBSO": "主隊/客隊 & 大 2.5 ",
      "DUBSU": "主隊/客隊 & 小 2.5 "
    },
    "sort": ["DUBHO", "DUBHU", "DUBCO", "DUBCU", "DUBSO", "DUBSU"]
  },
  "RDUB": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUBHO": "主隊/和局 & 大 2.5",
      "RDUBHU": "主隊/和局 & 小 2.5 ",
      "RDUBCO": "客隊/和局 & 大 2.5",
      "RDUBCU": "客隊/和局 & 小 2.5 ",
      "RDUBSO": "主隊/客隊 & 大 2.5 ",
      "RDUBSU": "主隊/客隊 & 小 2.5 "
    },
    "sort": ["RDUBHO", "RDUBHU", "RDUBCO", "RDUBCU", "RDUBSO", "RDUBSU"]
  },
  "DUC": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUCHO": "主隊/和局 & 大 3.5",
      "DUCHU": "主隊/和局 & 小 3.5 ",
      "DUCCO": "客隊/和局 & 大 3.5",
      "DUCCU": "客隊/和局 & 小 3.5 ",
      "DUCSO": "主隊/客隊 & 大 3.5 ",
      "DUCSU": "主隊/客隊 & 小 3.5 "
    },
    "sort": ["DUCHO", "DUCHU", "DUCCO", "DUCCU", "DUCSO", "DUCSU"]
  },
  "RDUC": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUCHO": "主隊/和局 & 大 3.5",
      "RDUCHU": "主隊/和局 & 小 3.5 ",
      "RDUCCO": "客隊/和局 & 大 3.5",
      "RDUCCU": "客隊/和局 & 小 3.5 ",
      "RDUCSO": "主隊/客隊 & 大 3.5 ",
      "RDUCSU": "主隊/客隊 & 小 3.5 "
    },
    "sort": ["RDUCHO", "RDUCHU", "RDUCCO", "RDUCCU", "RDUCSO", "RDUCSU"]
  },
  "DUD": {
    "col": 3,
    "col188": 1,
    "text": {
      "DUDHO": "主隊/和局 & 大 4.5",
      "DUDHU": "主隊/和局 & 小 4.5 ",
      "DUDCO": "客隊/和局 & 大 4.5",
      "DUDCU": "客隊/和局 & 小 4.5 ",
      "DUDSO": "主隊/客隊 & 大 4.5 ",
      "DUDSU": "主隊/客隊 & 小 4.5 "
    },
    "sort": ["DUDHO", "DUDHU", "DUDCO", "DUDCU", "DUDSO", "DUDSU"]
  },
  "RDUD": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDUDHO": "主隊/和局 & 大 4.5",
      "RDUDHU": "主隊/和局 & 小 4.5 ",
      "RDUDCO": "客隊/和局 & 大 4.5",
      "RDUDCU": "客隊/和局 & 小 4.5 ",
      "RDUDSO": "主隊/客隊 & 大 4.5 ",
      "RDUDSU": "主隊/客隊 & 小 4.5 "
    },
    "sort": ["RDUDHO", "RDUDHU", "RDUDCO", "RDUDCU", "RDUDSO", "RDUDSU"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "單", "HEOHE": "雙"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "RHEOH": {
    "col": 2,
    "text": {"RHEOHO": "單", "RHEOHE": "雙"},
    "sort": ["RHEOHO", "RHEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "單", "HEOCE": "雙"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "RHEOC": {
    "col": 2,
    "text": {"RHEOCO": "單", "RHEOCE": "雙"},
    "sort": ["RHEOCO", "RHEOCE"]
  },
  "MPG": {
    "col": 2,
    "col188": 1,
    "text": {
      "MPGHH": "主勝 & 主隊最先進球 ",
      "MPGCC": "客勝 & 客隊最先進球 ",
      "MPGHC": "主勝 & 客隊最先進球",
      "MPGCH": "客勝 & 主隊最先進球 ",
      "MPGNH": "平局 & 主隊最先進球 ",
      "MPGNC": "平局 & 客隊最先進球"
    },
    "sort": ["MPGHH", "MPGCC", "MPGHC", "MPGCH", "MPGNH", "MPGNC"]
  },
  "RMPG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RMPGCC": "客勝 & 客隊最先進球 ",
      "RMPGCH": "客勝 & 主隊最先進球 ",
      "RMPGHC": "主勝 & 客隊最先進球",
      "RMPGHH": "主勝 & 主隊最先進球 ",
      "RMPGNC": "平局 & 客隊最先進球",
      "RMPGNH": "平局 & 主隊最先進球 "
    },
    "sort": ["RMPGCC", "RMPGCH", "RMPGHC", "RMPGHH", "RMPGNC", "RMPGNH"]
  },
  "MQ": {
    "col": 2,
    "col188": 1,
    "text": {
      "MQH": "常規賽主勝",
      "MQHOT": "加時賽主勝",
      "MQHPK": "點球主勝",
      "MQC": "常規賽客勝",
      "MQCOT": "加時賽客勝",
      "MQCPK": "點球客勝"
    },
    "sort": ["MQH", "MQHOT", "MQHPK", "MQC", "MQCOT", "MQCPK"]
  },
  "OG": {
    "col": 2,
    "text": {"OGY": "是", "OGN": "否"},
    "sort": ["OGY", "OGN"]
  },
  "OUEA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEAOO": "大 1.5 & 單",
      "OUEAOE": "大 1.5 & 雙",
      "OUEAUO": "小 1.5 & 單",
      "OUEAUE": "小 1.5 & 雙"
    },
    "sort": ["OUEAOO", "OUEAOE", "OUEAUO", "OUEAUE"]
  },
  "RUEA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUEAOO": "大 1.5 & 單",
      "RUEAOE": "大 1.5 & 雙",
      "RUEAUO": "小 1.5 & 單",
      "RUEAUE": "小 1.5 & 雙"
    },
    "sort": ["RUEAOO", "RUEAOE", "RUEAUO", "RUEAUE"]
  },
  "OUEB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEBOO": "大 2.5 & 單",
      "OUEBOE": "大 2.5 & 雙",
      "OUEBUO": "小 2.5 & 單",
      "OUEBUE": "小 2.5 & 雙"
    },
    "sort": ["OUEBOO", "OUEBOE", "OUEBUO", "OUEBUE"]
  },
  "RUEB": {
    "col": 2,
    "text": {
      "RUEBOO": "大 2.5 & 單",
      "RUEBOE": "大 2.5 & 雙",
      "RUEBUO": "小 2.5 & 單",
      "RUEBUE": "小 2.5 & 雙"
    },
    "sort": ["RUEBOO", "RUEBOE", "RUEBUO", "RUEBUE"]
  },
  "OUEC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUECOO": "大 3.5 & 單",
      "OUECOE": "大 3.5 & 雙",
      "OUECUO": "小 3.5 & 單",
      "OUECUE": "小 3.5 & 雙"
    },
    "sort": ["OUECOO", "OUECOE", "OUECUO", "OUECUE"]
  },
  "RUEC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUECOO": "大 3.5 & 單",
      "RUECOE": "大 3.5 & 雙",
      "RUECUO": "小 3.5 & 單",
      "RUECUE": "小 3.5 & 雙"
    },
    "sort": ["RUECOO", "RUECOE", "RUECUO", "RUECUE"]
  },
  "OUED": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUEDOO": "大 4.5 & 單",
      "OUEDOE": "大 4.5 & 雙",
      "OUEDUO": "小 4.5 & 單",
      "OUEDUE": "小 4.5 & 雙"
    },
    "sort": ["OUEDOO", "OUEDOE", "OUEDUO", "OUEDUE"]
  },
  "RUED": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUEDOO": "大 4.5 & 單",
      "RUEDOE": "大 4.5 & 雙",
      "RUEDUO": "小 4.5 & 單",
      "RUEDUE": "小 4.5 & 雙"
    },
    "sort": ["RUEDOO", "RUEDOE", "RUEDUO", "RUEDUE"]
  },
  "OUPA": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPAOH": "大 1.5 & 主隊",
      "OUPAOC": "大 1.5 & 客隊",
      "OUPAUH": "小 1.5 & 主隊",
      "OUPAUC": "小 1.5 & 客隊"
    },
    "sort": ["OUPAOH", "OUPAOC", "OUPAUH", "OUPAUC"]
  },
  "RUPA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPAOH": "大 1.5 & 主隊",
      "RUPAOC": "大 1.5 & 客隊",
      "RUPAUH": "小 1.5 & 主隊",
      "RUPAUC": "小 1.5 & 客隊"
    },
    "sort": ["RUPAOH", "RUPAOC", "RUPAUH", "RUPAUC"]
  },
  "OUPB": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPBOH": "大 2.5 & 主隊",
      "OUPBOC": "大 2.5 & 客隊",
      "OUPBUH": "小 2.5 & 主隊",
      "OUPBUC": "小 2.5 & 客隊"
    },
    "sort": ["OUPBOH", "OUPBOC", "OUPBUH", "OUPBUC"]
  },
  "RUPB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPBOH": "大 2.5 & 主隊",
      "RUPBOC": "大 2.5 & 客隊",
      "RUPBUH": "小 2.5 & 主隊",
      "RUPBUC": "小 2.5 & 客隊"
    },
    "sort": ["RUPBOH", "RUPBOC", "RUPBUH", "RUPBUC"]
  },
  "OUPC": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPCOH": "大 3.5 & 主隊",
      "OUPCOC": "大 3.5 & 客隊",
      "OUPCUH": "小 3.5 & 主隊",
      "OUPCUC": "小 3.5 & 客隊"
    },
    "sort": ["OUPCOH", "OUPCOC", "OUPCUH", "OUPCUC"]
  },
  "RUPC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPCOH": "大 3.5 & 主隊",
      "RUPCOC": "大 3.5 & 客隊",
      "RUPCUH": "小 3.5 & 主隊",
      "RUPCUC": "小 3.5 & 客隊"
    },
    "sort": ["RUPCOH", "RUPCOC", "RUPCUH", "RUPCUC"]
  },
  "OUPD": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUPDOH": "大 4.5 & 主隊",
      "OUPDOC": "大 4.5 & 客隊",
      "OUPDUH": "小 4.5 & 主隊",
      "OUPDUC": "小 4.5 & 客隊"
    },
    "sort": ["OUPDOH", "OUPDOC", "OUPDUH", "OUPDUC"]
  },
  "RUPD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RUPDOH": "大 4.5 & 主隊",
      "RUPDOC": "大 4.5 & 客隊",
      "RUPDUH": "小 4.5 & 主隊",
      "RUPDUC": "小 4.5 & 客隊"
    },
    "sort": ["RUPDOH", "RUPDOC", "RUPDUH", "RUPDUC"]
  },
  "RPF": {
    "col": 2,
    "col188": 1,
    "text": {"RPF1": "第三輪", "RPF2": "第四輪", "RPF3": "第五輪", "RPFOV": "第六輪或之後"},
    "sort": ["RPF1", "RPF2", "RPF3", "RPFOV"]
  },
  "RPXA": {
    "col": 3,
    "col188": 1,
    "text": {"RPXAH": "{homeTeam}", "RPXAN": "平", "RPXAC": "{awayTeam}"},
    "sort": ["RPXAH", "RPXAN", "RPXAC"]
  },
  "RPXB": {
    "col": 3,
    "col188": 1,
    "text": {"RPXBH": "{homeTeam}", "RPXBN": "平", "RPXBC": "{awayTeam}"},
    "sort": ["RPXBH", "RPXBN", "RPXBC"]
  },
  "RPXC": {
    "col": 3,
    "col188": 1,
    "text": {"RPXCH": "{homeTeam}", "RPXCN": "平", "RPXCC": "{awayTeam}"},
    "sort": ["RPXCH", "RPXCN", "RPXCC"]
  },
  "RPXD": {
    "col": 3,
    "col188": 1,
    "text": {"RPXDH": "{homeTeam}", "RPXDN": "平", "RPXDC": "{awayTeam}"},
    "sort": ["RPXDH", "RPXDN", "RPXDC"]
  },
  "RPXE": {
    "col": 3,
    "col188": 1,
    "text": {"RPXEH": "{homeTeam}", "RPXEN": "平", "RPXEC": "{awayTeam}"},
    "sort": ["RPXEH", "RPXEN", "RPXEC"]
  },
  "RPXF": {
    "col": 3,
    "col188": 1,
    "text": {"RPXFH": "{homeTeam}", "RPXFN": "平", "RPXFC": "{awayTeam}"},
    "sort": ["RPXFH", "RPXFN", "RPXFC"]
  },
  "RPXG": {
    "col": 3,
    "col188": 1,
    "text": {"RPXGH": "{homeTeam}", "RPXGN": "平", "RPXGC": "{awayTeam}"},
    "sort": ["RPXGH", "RPXGN", "RPXGC"]
  },
  "RPXH": {
    "col": 3,
    "col188": 1,
    "text": {"RPXHH": "{homeTeam}", "RPXHN": "平", "RPXHC": "{awayTeam}"},
    "sort": ["RPXHH", "RPXHN", "RPXHC"]
  },
  "RPXI": {
    "col": 3,
    "col188": 1,
    "text": {"RPXIH": "{homeTeam}", "RPXIN": "平", "RPXIC": "{awayTeam}"},
    "sort": ["RPXIH", "RPXIN", "RPXIC"]
  },
  "RPXJ": {
    "col": 3,
    "col188": 1,
    "text": {"RPXJH": "{homeTeam}", "RPXJN": "平", "RPXJC": "{awayTeam}"},
    "sort": ["RPXJH", "RPXJN", "RPXJC"]
  },
  "RPXK": {
    "col": 3,
    "col188": 1,
    "text": {"RPXKH": "{homeTeam}", "RPXKN": "平", "RPXKC": "{awayTeam}"},
    "sort": ["RPXKH", "RPXKN", "RPXKC"]
  },
  "RPXL": {
    "col": 3,
    "col188": 1,
    "text": {"RPXLH": "{homeTeam}", "RPXLN": "平", "RPXLC": "{awayTeam}"},
    "sort": ["RPXLH", "RPXLN", "RPXLC"]
  },
  "RPXM": {
    "col": 3,
    "col188": 1,
    "text": {"RPXMH": "{homeTeam}", "RPXMN": "平", "RPXMC": "{awayTeam}"},
    "sort": ["RPXMH", "RPXMN", "RPXMC"]
  },
  "RPXN": {
    "col": 3,
    "col188": 1,
    "text": {"RPXNH": "{homeTeam}", "RPXNN": "平", "RPXNC": "{awayTeam}"},
    "sort": ["RPXNH", "RPXNN", "RPXNC"]
  },
  "RPXO": {
    "col": 3,
    "col188": 1,
    "text": {"RPXOH": "{homeTeam}", "RPXON": "平", "RPXOC": "{awayTeam}"},
    "sort": ["RPXOH", "RPXON", "RPXOC"]
  },
  "RSCA": {
    "col": 2,
    "text": {"RSCAY": "是", "RSCAN": "否"},
    "sort": ["RSCAY", "RSCAN"]
  },
  "RSCB": {
    "col": 2,
    "text": {"RSCBY": "是", "RSCBN": "否"},
    "sort": ["RSCBY", "RSCBN"]
  },
  "RSCC": {
    "col": 2,
    "text": {"RSCCY": "是", "RSCCN": "否"},
    "sort": ["RSCCY", "RSCCN"]
  },
  "RSCD": {
    "col": 2,
    "text": {"RSCDY": "是", "RSCDN": "否"},
    "sort": ["RSCDY", "RSCDN"]
  },
  "RSCE": {
    "col": 2,
    "text": {"RSCEY": "是", "RSCEN": "否"},
    "sort": ["RSCEY", "RSCEN"]
  },
  "RSCF": {
    "col": 2,
    "text": {"RSCFY": "是", "RSCFN": "否"},
    "sort": ["RSCFY", "RSCFN"]
  },
  "RSCG": {
    "col": 2,
    "text": {"RSCGY": "是", "RSCGN": "否"},
    "sort": ["RSCGY", "RSCGN"]
  },
  "RSCH": {
    "col": 2,
    "text": {"RSCHY": "是", "RSCHN": "否"},
    "sort": ["RSCHY", "RSCHN"]
  },
  "RSCI": {
    "col": 2,
    "text": {"RSCIY": "是", "RSCIN": "否"},
    "sort": ["RSCIY", "RSCIN"]
  },
  "RSCJ": {
    "col": 2,
    "text": {"RSCJY": "是", "RSCJN": "否"},
    "sort": ["RSCJY", "RSCJN"]
  },
  "RSCK": {
    "col": 2,
    "text": {"RSCKY": "是", "RSCKN": "否"},
    "sort": ["RSCKY", "RSCKN"]
  },
  "RSCL": {
    "col": 2,
    "text": {"RSCLY": "是", "RSCLN": "否"},
    "sort": ["RSCLY", "RSCLN"]
  },
  "RSCM": {
    "col": 2,
    "text": {"RSCMY": "是", "RSCMN": "否"},
    "sort": ["RSCMY", "RSCMN"]
  },
  "RSCN": {
    "col": 2,
    "text": {"RSCNY": "是", "RSCNN": "否"},
    "sort": ["RSCNY", "RSCNN"]
  },
  "RSCO": {
    "col": 2,
    "text": {"RSCOY": "是", "RSCON": "否"},
    "sort": ["RSCOY", "RSCON"]
  },
  "RSHA": {
    "col": 2,
    "text": {"RSHAY": "是", "RSHAN": "否"},
    "sort": ["RSHAY", "RSHAN"]
  },
  "RSHB": {
    "col": 2,
    "text": {"RSHBY": "是", "RSHBN": "否"},
    "sort": ["RSHBY", "RSHBN"]
  },
  "RSHC": {
    "col": 2,
    "text": {"RSHCY": "是", "RSHCN": "否"},
    "sort": ["RSHCY", "RSHCN"]
  },
  "RSHD": {
    "col": 2,
    "text": {"RSHDY": "是", "RSHDN": "否"},
    "sort": ["RSHDY", "RSHDN"]
  },
  "RSHE": {
    "col": 2,
    "text": {"RSHEY": "是", "RSHEN": "否"},
    "sort": ["RSHEY", "RSHEN"]
  },
  "RSHF": {
    "col": 2,
    "text": {"RSHFY": "是", "RSHFN": "否"},
    "sort": ["RSHFY", "RSHFN"]
  },
  "RSHG": {
    "col": 2,
    "text": {"RSHGY": "是", "RSHGN": "否"},
    "sort": ["RSHGY", "RSHGN"]
  },
  "RSHH": {
    "col": 2,
    "text": {"RSHHY": "是", "RSHHN": "否"},
    "sort": ["RSHHY", "RSHHN"]
  },
  "RSHI": {
    "col": 2,
    "text": {"RSHIY": "是", "RSHIN": "否"},
    "sort": ["RSHIY", "RSHIN"]
  },
  "RSHJ": {
    "col": 2,
    "text": {"RSHJY": "是", "RSHJN": "否"},
    "sort": ["RSHJY", "RSHJN"]
  },
  "RSHK": {
    "col": 2,
    "text": {"RSHKY": "是", "RSHKN": "否"},
    "sort": ["RSHKY", "RSHKN"]
  },
  "RSHL": {
    "col": 2,
    "text": {"RSHLY": "是", "RSHLN": "否"},
    "sort": ["RSHLY", "RSHLN"]
  },
  "RSHM": {
    "col": 2,
    "text": {"RSHMY": "是", "RSHMN": "否"},
    "sort": ["RSHMY", "RSHMN"]
  },
  "RSHN": {
    "col": 2,
    "text": {"RSHNY": "是", "RSHNN": "否"},
    "sort": ["RSHNY", "RSHNN"]
  },
  "RSHO": {
    "col": 2,
    "text": {"RSHOY": "是", "RSHON": "否"},
    "sort": ["RSHOY", "RSHON"]
  },
  "RTW": {
    "col": 2,
    "col188": 1,
    "text": {
      "RTWH1": "主隊凈勝1球",
      "RTWH2": "主隊凈勝2球",
      "RTWHOV": "主隊凈勝3球以上",
      "RTWC1": "客隊凈勝1球",
      "RTWC2": "客隊凈勝2球",
      "RTWCOV": "客隊凈勝3球以上",
      "RTW0": "無進球",
      "RTWN": "其他比分平局"
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
    "text": {"TARUO": "大 {ratio}", "TARUU": "小 {ratio}"},
    "sort": ["TARUO", "TARUU"]
  },
  "TBRU": {
    "col": 2,
    "text": {"TBRUO": "大 {ratio}", "TBRUU": "小 {ratio}"},
    "sort": ["TBRUO", "TBRUU"]
  },
  "TCRU": {
    "col": 2,
    "text": {"TCRUO": "大 {ratio}", "TCRUU": "小 {ratio}"},
    "sort": ["TCRUO", "TCRUU"]
  },
  "TDRU": {
    "col": 2,
    "text": {"TDRUO": "大 {ratio}", "TDRUU": "小 {ratio}"},
    "sort": ["TDRUO", "TDRUU"]
  },
  "TERU": {
    "col": 2,
    "text": {"TERUO": "大 {ratio}", "TERUU": "小 {ratio}"},
    "sort": ["TERUO", "TERUU"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "單", "EOHE": "雙"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "單", "EOCE": "雙"},
    "sort": ["EOCO", "EOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {"REOHO": "單", "REOHE": "雙"},
    "sort": ["REOHO", "REOHE"]
  },
  "REOC": {
    "col": 2,
    "text": {"EOCO": "單", "EOCE": "雙"},
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
      "MPSHY": "主勝 & 是",
      "MPSHN": "主勝 & 否",
      "MPSCY": "客勝 & 是",
      "MPSCN": "客勝 & 否",
      "MPSNY": "平局 & 是",
      "MPSNN": "平局 & 否"
    },
    "sort": ["MPSHY", "MPSHN", "MPSCY", "MPSCN", "MPSNY", "MPSNN"]
  },
  "OTHOUH": {
    "col": 2,
    "text": {"OTHOUHC": "大 {ratio}", "OTHOUHH": "小 {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTHOUC": {
    "col": 2,
    "text": {"OTHOUHC": "大 {ratio}", "OTHOUHH": "小 {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTOUH": {
    "col": 2,
    "text": {"OTOUHC": "大 {ratio}", "OTOUHH": "小 {ratio}"},
    "sort": ["OTOUHC", "OTOUHH"]
  },
  "OTOUC": {
    "col": 2,
    "text": {"OTOUCC": "大 {ratio}", "OTOUCH": "小 {ratio}"},
    "sort": ["OTOUCC", "OTOUCH"]
  },
  "OTTS": {
    "col": 2,
    "text": {"OTTSY": "是", "OTTSN": "否"},
    "sort": ["OTTSY", "OTTSN"]
  },
  "OTARG": {
    "col": 3,
    "col188": 1,
    "text": {"OTARGH": "{homeTeam}", "OTARGC": "{awayTeam}", "OTARGN": "無進球"},
    "sort": ["OTARGH", "OTARGC", "OTARGN"]
  },
  "OTEO": {
    "col": 2,
    "text": {"OTEOO": "單", "OTEOE": "雙"},
    "sort": ["OTEOO", "OTEOE"]
  },
  "OTDC": {
    "col": 3,
    "col188": 1,
    "text": {"OTDCHN": "主和", "OTDCHC": "主客", "OTDCCN": "和客"},
    "sort": ["OTDCHN", "OTDCHC", "OTDCCN"]
  },
  "OTBRG": {
    "col": 3,
    "col188": 1,
    "text": {"OTBRGH": "{homeTeam}", "OTBRGC": "{awayTeam}", "OTBRGN": "無進球"},
    "sort": ["OTBRGH", "OTBRGC", "OTBRGN"]
  },
  "M3": {
    "col": 3,
    "col188": 1,
    "text": {"M3H": "{homeTeam}", "M3N": "平", "M3C": "{awayTeam}"},
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
    "text": {"OTHOUC": "大 {ratio}", "OTHOUH": "小 {ratio}"},
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
    "text": {"OTCRGH": "{homeTeam}", "OTCRGC": "{awayTeam}", "OTCRGN": "無進球"},
    "sort": ["OTCRGH", "OTCRGC", "OTCRGN"]
  },
  "OTDRG": {
    "col": 3,
    "col188": 1,
    "text": {"OTDRGH": "{homeTeam}", "OTDRGC": "{awayTeam}", "OTDRGN": "無進球"},
    "sort": ["OTDRGH", "OTDRGC", "OTDRGN"]
  },
  "T": {
    "col": 2,
    "col188": 1,
    "text": {"T01": "0-1個球", "T23": "2-3個球", "T46": "4-6個球", "OVER": "7個球以上"},
    "sort": ["T01", "T23", "T46", "OVER"]
  },
  "RT": {
    "col": 2,
    "col188": 1,
    "text": {
      "RT01": "0-1個球",
      "RT23": "2-3個球",
      "RT46": "4-6個球",
      "ROVER": "7個球以上",
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
      "MWH": "常規賽主勝",
      "MWHOT": "加時賽主勝",
      "MWHPK": "點球主勝",
      "MWC": "常規賽客勝",
      "MWCOT": "加時賽客勝",
      "MWCPK": "點球客勝"
    },
    "sort": ["MWH", "MWHOT", "MWHPK", "MWC", "MWCOT", "MWCPK"]
  },
  "OUconner": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOconner": {
    "col": 2,
    "text": {"EOO": "單", "EOE": "雙"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOcard": {
    "col": 2,
    "text": {"EOO": "單", "EOE": "雙"},
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
    "text": {"HOUC": "大 {ratio}", "HOUH": "小 {ratio}"},
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
      "OUHC": "{homeTeam} 大 {ratio}",
      "OUHH": "{homeTeam} 小 {ratio}",
      "OUCC": "{awayTeam} 大 {ratio}",
      "OUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RCDOU": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FSM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
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
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {
    "col": 3,
    "col188": 1,
    "text": {"GSPF": "首個進球球員", "GLPA": "任意時間進球球員", "GSPL": "最後進球球員"},
    "sort": ["GSPF", "GLPA", "GSPL"]
  },
  "HG3": {
    "col": 3,
    "col188": 1,
    "text": {"HG3H": "上半場", "HG3N": "和局", "HG3C": "下半場"},
    "sort": ["HG3H", "HG3N", "HG3C"]
  },
  "UPGM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "SOTM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "UPCM": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
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
    "sort": ['HTGH0',  'HTGC0','HTGH1', 'HTGC1', 'HTGH2','HTGC2',  'HTGH3', 'HTGC3','HTGH4', 'HTGC4','HTGH4+',  'HTGC4+']
  },
  "TGOU": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTGOU": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHC": "{homeTeam} 大 {ratio}",
      "OUHH": "{homeTeam} 小 {ratio}",
      "OUCC": "{awayTeam} 大 {ratio}",
      "OUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HW3": {
    "col": 3,
    "col188": 1,
    "text": {
      "HW3H": "{homeTeam} {ratio}",
      "HW3N": "平局 {ratio}",
      "HW3C": "{awayTeam} {ratio}"
    },
    "sort": ["HW3H", "HW3N", "HW3C"]
  },
  "TCS": {
    "col": 2,
    "text": {
      "TCSHY": "是",
      "TCSHN": "否",
      "TCSCY": "是",
      "TCSCN": "否"
    },
    "sort": ["TCSHY", "TCSHN", "TCSCY", "TCSCN"]
  },
  "TSB": {
    "col": 2,
    "text": {
      "TSBHY": "是",
      "TSBHN": "否",
      "TSBCY": "是",
      "TSBCN": "否"
    },
    "sort": ["TSBHY", "TSBHN", "TSBCY", "TSBCN"]
  },

  "HTSB": {
    "col": 2,
    "text": {
      "HTSBHY": "是",
      "HTSBHN": "否",
      "HTSBCY": "是",
      "HTSBCN": "否"
    },
    "sort": ["HTSBHY", "HTSBHN", "HTSBCY", "HTSBCN"]
  },
  "HTSB2": {
    "col": 2,
    "text": {
      "HTSB2HY": "是",
      "HTSB2HN": "否",
      "HTSB2CY": "是",
      "HTSB2CN": "否"
    },
    "sort": ["HTSB2HY", "HTSB2HN", "HTSB2CY", "HTSB2CN"]
  },

  "OUT": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUT01": "0-1個球",
      "OUT02": "0-2個球",
      "OUT03": "0-3個球",
      "OUT23": "2-3個球",
      "OUT46": "4-6個球",
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
    "text": {"TGBY": "是", "TGBN": "否"},
    "sort": ["TGBY", "TGBN"]
  },
  "AHG": {
    "col": 2,
    "col188": 1,
    "text": {
      "AHG0": "0個球",
      "AHG01": "0-1個球",
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
      "BHG0": "0個球",
      "BHG01": "0-1個球",
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
      "T1G1": "比賽開始 - 14:59",
      'T1G2': '上半場15:00 - 29:59',
      'T1G3': '上半場30:00 - 半場結束',
      'T1G4': '下半場開始 - 59:59',
      'T1G5': '下半場60:00 - 74:59',
      'T1G6': '下半場75:00 - 完場',
      "T1GN": "沒有進球",
      "T1G7": "1-10分鐘",
      "T1G8": "11-20分鐘",
      "T1G9": "21-30分鐘",
      "T1G10": "31-40分鐘",
      "T1G11": "41-50分鐘",
      "T1G12": "51-60分鐘",
      "T1G13": "61-70分鐘",
      "T1G14": "71-80分鐘",
      "T1G15": "81-90分鐘"
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
    "text": {"BSOY": "是", "BSON": "否"},
    "sort": ["BSOY", "BSON"]
  },
  "FOUB": {
    "col": 2,
    "col188": 1,
    "text": {
      "FOUBHHO": "主/主 & 大 2.5",
      "FOUBHHU": "主/主 & 小 2.5",
      "FOUBHNO": "主/和 & 大 2.5",
      "FOUBHNU": "主/和 & 小 2.5",
      "FOUBHCO": "主/客 & 大 2.5",
      "FOUBCHO": "客/主 & 大 2.5",
      "FOUBCCO": "客/客 & 大 2.5",
      "FOUBCCU": "客/客 & 小 2.5",
      "FOUBCNO": "客/和 & 大 2.5",
      "FOUBCNU": "客/和 & 小 2.5",
      "FOUBNNO": "和/和 & 大 2.5",
      "FOUBNNU": "和/和 & 小 2.5",
      "FOUBNHO": "和/主 & 大 2.5",
      "FOUBNHU": "和/主 & 小 2.5",
      "FOUBNCO": "和/客 & 大 2.5",
      "FOUBNCU": "和/客 & 小 2.5"
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
      "HMOUAHO": "主勝 & 大1.5",
      "HMOUAHU": "主勝 & 小1.5",
      "HMOUANO": "平局 & 大1.5",
      "HMOUANU": "平局 & 小1.5",
      "HMOUACO": "客勝 & 大1.5",
      "HMOUACU": "客勝 & 小1.5"
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
    "text": {"TGAY": "是", "TGAN": "否"},
    "sort": ["TGAY", "TGAN"]
  },
  "TGC": {
    "col": 2,
    "text": {"TGCY": "是", "TGCN": "否"},
    "sort": ["TGCY", "TGCN"]
  },
  "TGD": {
    "col": 2,
    "text": {"TGDY": "是", "TGDN": "否"},
    "sort": ["TGDY", "TGDN"]
  },
  "TGE": {
    "col": 2,
    "text": {"TGEY": "是", "TGEN": "否"},
    "sort": ["TGEY", "TGEN"]
  },
  "TGF": {
    "col": 2,
    "text": {"TGFY": "是", "TGFN": "否"},
    "sort": ["TGFY", "TGFN"]
  },
  "TGG": {
    "col": 2,
    "text": {"TGGY": "是", "TGGN": "否"},
    "sort": ["TGGY", "TGGN"]
  },
  "HM2_conner": {
    "col": 3,
    "col188": 1,
    "text": {"HM2H": "{homeTeam}", "HM2N": "平", "HM2C": "{awayTeam}"},
    "sort": ["HM2H", "HM2N", "HM2C"]
  },
  "HOU2_conner": {
    "col": 2,
    "text": {"HOU2C": "大 {ratio}", "HOU2H": "小 {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "OU3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"OUC": "大 {ratio}", "OUE": "正好 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUE", "OUH"]
  },
  "W3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "平 {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "BTSH": {
    "col": 2,
    "text": {"BTSHY": "是", "BTSHN": "否"},
    "sort": ["BTSHY", "BTSHN"]
  },
  "FGTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTAS": "射門",
      "FGTAH": "頭球",
      "FGTAN": "無進球",
      "FGTAP": "點球",
      "FGTAF": "任意球",
      "FGTAO": "烏龍球"
    },
    "sort": ["FGTAS", "FGTAH", "FGTAN", "FGTAP", "FGTAF", "FGTAO"]
  },
  "FGTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTBS": "射門",
      "FGTBH": "頭球",
      "FGTBN": "無進球",
      "FGTBP": "點球",
      "FGTBF": "任意球",
      "FGTBO": "烏龍球"
    },
    "sort": ["FGTBS", "FGTBH", "FGTBN", "FGTBP", "FGTBF", "FGTBO"]
  },
  "FGTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTCS": "射門",
      "FGTCH": "頭球",
      "FGTCN": "無進球",
      "FGTCP": "點球",
      "FGTCF": "任意球",
      "FGTCO": "烏龍球"
    },
    "sort": ["FGTCS", "FGTCH", "FGTCN", "FGTCP", "FGTCF", "FGTCO"]
  },
  "FGTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTDS": "射門",
      "FGTDH": "頭球",
      "FGTDN": "無進球",
      "FGTDP": "點球",
      "FGTDF": "任意球",
      "FGTDO": "烏龍球"
    },
    "sort": ["FGTDS", "FGTDH", "FGTDN", "FGTDP", "FGTDF", "FGTDO"]
  },
  "FGTE": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTES": "射門",
      "FGTEH": "頭球",
      "FGTEN": "無進球",
      "FGTEP": "點球",
      "FGTEF": "任意球",
      "FGTEO": "烏龍球"
    },
    "sort": ["FGTES", "FGTEH", "FGTEN", "FGTEP", "FGTEF", "FGTEO"]
  },
  "FGTF": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTFS": "射門",
      "FGTFH": "頭球",
      "FGTFN": "無進球",
      "FGTFP": "點球",
      "FGTFF": "任意球",
      "FGTFO": "烏龍球"
    },
    "sort": ["FGTFS", "FGTFH", "FGTFN", "FGTFP", "FGTFF", "FGTFO"]
  },
  "FGTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTGS": "射門",
      "FGTGH": "頭球",
      "FGTGN": "無進球",
      "FGTGP": "點球",
      "FGTGF": "任意球",
      "FGTGO": "烏龍球"
    },
    "sort": ["FGTGS", "FGTGH", "FGTGN", "FGTGP", "FGTGF", "FGTGO"]
  },
  "FGTH": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTHS": "射門",
      "FGTHH": "頭球",
      "FGTHN": "無進球",
      "FGTHP": "點球",
      "FGTHF": "任意球",
      "FGTHO": "烏龍球"
    },
    "sort": ["FGTHS", "FGTHH", "FGTHN", "FGTHP", "FGTHF", "FGTHO"]
  },
  "FGTI": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTIS": "射門",
      "FGTIH": "頭球",
      "FGTIN": "無進球",
      "FGTIP": "點球",
      "FGTIF": "任意球",
      "FGTIO": "烏龍球"
    },
    "sort": ["FGTIS", "FGTIH", "FGTIN", "FGTIP", "FGTIF", "FGTIO"]
  },
  "FGTJ": {
    "col": 2,
    "col188": 1,
    "text": {
      "FGTJS": "射門",
      "FGTJH": "頭球",
      "FGTJN": "無進球",
      "FGTJP": "點球",
      "FGTJF": "任意球",
      "FGTJO": "烏龍球"
    },
    "sort": ["FGTJS", "FGTJH", "FGTJN", "FGTJP", "FGTJF", "FGTJO"]
  },
  "RT3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT3H": "{homeTeam}", "RT3N": "都不是", "RT3C": "{awayTeam}"},
    "sort": ["RT3H", "RT3N", "RT3C"]
  },
  "RT5_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT5H": "{homeTeam}", "RT5N": "都不是", "RT5C": "{awayTeam}"},
    "sort": ["RT5H", "RT5N", "RT5C"]
  },
  "RT7_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT7H": "{homeTeam}", "RT7N": "都不是", "RT7C": "{awayTeam}"},
    "sort": ["RT7H", "RT7N", "RT7C"]
  },
  "RT9_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RT9H": "{homeTeam}", "RT9N": "都不是", "RT9C": "{awayTeam}"},
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
    "text": {"HGC1": "上半場大於 0.5 & 下半場大於 0.5"},
    "sort": ["HGC1"]
  },
  "HGC2": {
    "col": 1,
    "col188": 1,
    "text": {"HGC2": "上半場大於 0.5 & 下半場大於 1.5"},
    "sort": ["HGC2"]
  },
  "HGC3": {
    "col": 1,
    "col188": 1,
    "text": {"HGC3": "上半場大於 1.5 & 下半場大於 1.5"},
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
      "TTBHO": "{homeTeam} 大 {ratio}",
      "TTBHU": "{homeTeam} 小 {ratio}",
      "TTBCO": "{awayTeam} 大 {ratio}",
      "TTBCU": "{awayTeam} 小 {ratio}"
    },
    "sort": ["TTBHO", "TTBHU", "TTBCO", "TTBCU"]
  },
  "HSR": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CSR": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HFS": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CFS": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOS": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "COS": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "PAOU": {
    "col": 2,
    "text": {"OUC": " 大 {ratio}", "OUH": " 小 {ratio}"},
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
      "ROUHC": "{homeTeam} 大 {ratio}",
      "ROUHH": "{homeTeam} 小 {ratio}",
      "ROUCC": "{awayTeam} 大 {ratio}",
      "ROUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RLG": {
    "col": 3,
    "col188": 1,
    "text": {"RLGH": "{homeTeam}", "RLGA": "{awayTeam}", "RLGN": "無進球"},
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
    "sort": ['HRTGH0',  'HRTGC0','HRTGH1', 'HRTGC1',  'HRTGH2', 'HRTGC2','HRTGH3', 'HRTGC3','HRTGH4','HRTGC4','HRTGH4+', 'HRTGC4+']
  },
  "RHTS": {
    "col": 2,
    "text": {"HRTSY": "是", "HRTSN": "否 "},
    "sort": ["HRTSY", "HRTSN"]
  },
  "RTGOU": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRTTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "HROUHC": "{homeTeam} 大 {ratio}",
      "HROUHH": "{homeTeam} 小 {ratio}",
      "HROUCC": "{awayTeam} 大 {ratio}",
      "HROUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["HROUHC", "HROUHH", "HROUCC", "HROUCH"]
  },

  "RTM": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "平", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "ROU3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"ROUC": "大 {ratio}", "ROUE": "正好 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUE", "ROUH"]
  },
  "RW3_conner": {
    "col": 3,
    "col188": 1,
    "text": {
      "RW3H": "{homeTeam} {ratio}",
      "RW3N": "平 {ratio}",
      "RW3C": "{awayTeam} {ratio}"
    },
    "sort": ["RW3H", "RW3N", "RW3C"]
  },
  "NM5A": {
    "col": 3,
    "col188": 1,
    "text": {
      "NM5AGY": "進球 是",
      "NM5AGN": "進球 否",
      "NM5ACY": "角球 是",
      "NM5ACN": "角球 否",
      "NM5AFY": "任意球 是",
      "NM5AFN": "任意球 否",
      "NM5AKY": "球門球 是",
      "NM5AKN": "球門球 否",
      "NM5ABY": "界外球 是",
      "NM5ABN": "界外球 否",
      "NM5APY": "點球 是",
      "NM5APN": "點球 否"
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
      "NM5BGY": "進球 是",
      "NM5BGN": "進球 否",
      "NM5BCY": "角球 是",
      "NM5BCN": "角球 否",
      "NM5BFY": "任意球 是",
      "NM5BFN": "任意球 否",
      "NM5BKY": "球門球 是",
      "NM5BKN": "球門球 否",
      "NM5BBY": "界外球 是",
      "NM5BBN": "界外球 否",
      "NM5BPY": "點球 是",
      "NM5BPN": "點球 否"
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
      "NM5CGY": "進球 是",
      "NM5CGN": "進球 否",
      "NM5CCY": "角球 是",
      "NM5CCN": "角球 否",
      "NM5CFY": "任意球 是",
      "NM5CFN": "任意球 否",
      "NM5CKY": "球門球 是",
      "NM5CKN": "球門球 否",
      "NM5CBY": "界外球 是",
      "NM5CBN": "界外球 否",
      "NM5CPY": "點球 是",
      "NM5CPN": "點球 否"
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
      "NM5DGY": "進球 是",
      "NM5DGN": "進球 否",
      "NM5DCY": "角球 是",
      "NM5DCN": "角球 否",
      "NM5DFY": "任意球 是",
      "NM5DFN": "任意球 否",
      "NM5DKY": "球門球 是",
      "NM5DKN": "球門球 否",
      "NM5DBY": "界外球 是",
      "NM5DBN": "界外球 否",
      "NM5DPY": "點球 是",
      "NM5DPN": "點球 否"
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
      "NM1AGY": "進球 是",
      "NM1AGN": "進球 否",
      "NM1ACY": "角球 是",
      "NM1ACN": "角球 否",
      "NM1AFY": "任意球 是",
      "NM1AFN": "任意球 否",
      "NM1AKY": "球門球 是",
      "NM1AKN": "球門球 否",
      "NM1ABY": "界外球 是",
      "NM1ABN": "界外球 否"
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
      "NM1BGY": "進球 是",
      "NM1BGN": "進球 否",
      "NM1BCY": "角球 是",
      "NM1BCN": "角球 否",
      "NM1BFY": "任意球 是",
      "NM1BFN": "任意球 否",
      "NM1BKY": "球門球 是",
      "NM1BKN": "球門球 否",
      "NM1BBY": "界外球 是",
      "NM1BBN": "界外球 否"
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
      "NM1CGY": "進球 是",
      "NM1CGN": "進球 否",
      "NM1CCY": "角球 是",
      "NM1CCN": "角球 否",
      "NM1CFY": "任意球 是",
      "NM1CFN": "任意球 否",
      "NM1CKY": "球門球 是",
      "NM1CKN": "球門球 否",
      "NM1CBY": "界外球 是",
      "NM1CBN": "界外球 否"
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
      "NM1DGY": "進球 是",
      "NM1DGN": "進球 否",
      "NM1DCY": "角球 是",
      "NM1DCN": "角球 否",
      "NM1DFY": "任意球 是",
      "NM1DFN": "任意球 否",
      "NM1DKY": "球門球 是",
      "NM1DKN": "球門球 否",
      "NM1DBY": "界外球 是",
      "NM1DBN": "界外球 否"
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
      "WH5MAG": '進球',
      "WH5MAC": '角球',
      "WH5MAP": '點球',
      "WH5MAD": '罰牌',
      "WH5MAF": '任意球',
      "WH5MAK": '球門球',
      "WH5MAB": '界外球',
      "WH5MAN": '沒有任何事件',
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
      'WH5MBG': '進球',
      'WH5MBC': '角球',
      'WH5MBP': '點球',
      'WH5MBD': '罰牌',
      'WH5MBF': '任意球',
      'WH5MBK': '球門球',
      'WH5MBB': '界外球',
      'WH5MBN': '沒有任何事件',
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
      'WH5MCG': '進球',
      'WH5MCC': '角球',
      'WH5MCP': '點球',
      'WH5MCD': '罰牌',
      'WH5MCF': '任意球',
      'WH5MCK': '球門球',
      'WH5MCB': '界外球',
      'WH5MCN': '沒有任何事件',
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
      'WH5MDG': '進球',
      'WH5MDC': '角球',
      'WH5MDP': '點球',
      'WH5MDD': '罰牌',
      'WH5MDF': '任意球',
      'WH5MDK': '球門球',
      'WH5MDB': '界外球',
      'WH5MDN': '沒有任何事件',
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
      "WH1MAG": "進球",
      "WH1MAC": "角球",
      'WH1MAD': '罰牌',
      'WH1MAP': '點球',
      "WH1MAF": "任意球",
      "WH1MAK": "球門球",
      "WH1MAB": "界外球",
      "WH1MAN": "沒有任何事件"
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
      "WH1MBG": "進球",
      "WH1MBC": "角球",
      'WH1MBD': '罰牌',
      'WH1MBP': '點球',
      "WH1MBF": "任意球",
      "WH1MBK": "球門球",
      "WH1MBB": "界外球",
      "WH1MBN": "沒有任何事件"
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
      "WH1MCG": "進球",
      "WH1MCC": "角球",
      'WH1MCD': '罰牌',
      'WH1MCP': '點球',
      "WH1MCF": "任意球",
      "WH1MCK": "球門球",
      "WH1MCB": "界外球",
      "WH1MCN": "沒有任何事件"
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
      "WH1MDG": "進球",
      "WH1MDC": "角球",
      'WH1MDD': '罰牌',
      'WH1MDP': '點球',
      "WH1MDF": "任意球",
      "WH1MDK": "球門球",
      "WH1MDB": "界外球",
      "WH1MDN": "沒有任何事件"
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
    "text": {"TEARMH": "{homeTeam}", "TEARMN": "平", "TEARMC": "{awayTeam}"},
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
    "text": {"TEAROUO": "大 {ratio}", "TEAROUU": "小 {ratio}"},
    "sort": ["TEAROUO", "TEAROUU"]
  },
  "FIARM": {
    "col": 3,
    "col188": 1,
    "text": {"FIARMH": "{homeTeam}", "FIARMN": "平", "FIARMC": "{awayTeam}"},
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
    "col188": 1,
    "text": {"FIBROUO": "大 {ratio}", "FIBROUU": "小 {ratio}"},
    "sort": ["FIBROUO", "FIBROUU"]
  },
  "TEBRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEBRMH": "{homeTeam}", "TEBRMN": "平", "TEBRMC": "{awayTeam}"},
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
    "text": {"TEBROUO": "大 {ratio}", "TEBROUU": "小 {ratio}"},
    "sort": ["TEBROUO", "TEBROUU"]
  },
  "SAARM": {
    "col": 3,
    "col188": 1,
    "text": {"SAARMH": "{homeTeam}", "SAARMN": "平", "SAARMC": "{awayTeam}"},
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
    "text": {"SAAROUO": "大 {ratio}", "SAAROUU": "小 {ratio}"},
    "sort": ["SAAROUO", "SAAROUU"]
  },
  "FICRM": {
    "col": 3,
    "col188": 1,
    "text": {"FICRMH": "{homeTeam}", "FICRMN": "平", "FICRMC": "{awayTeam}"},
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
    "text": {"FICROUO": "大 {ratio}", "FICROUU": "小 {ratio}"},
    "sort": ["FICROUO", "FICROUU"]
  },
  "FIDRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIDRMH": "{homeTeam}", "FIDRMN": "平", "FIDRMC": "{awayTeam}"},
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
    "text": {"FIDROUO": "大 {ratio}", "FIDROUU": "小 {ratio}"},
    "sort": ["FIDROUO", "FIDROUU"]
  },
  "FIERM": {
    "col": 3,
    "col188": 1,
    "text": {"FIERMH": "{homeTeam}", "FIERMN": "平", "FIERMC": "{awayTeam}"},
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
    "text": {"FIEROUO": "大 {ratio}", "FIEROUU": "小 {ratio}"},
    "sort": ["FIEROUO", "FIEROUU"]
  },
  "FIFRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIFRMH": "{homeTeam}", "FIFRMN": "平", "FIFRMC": "{awayTeam}"},
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
    "text": {"FIFROUO": "大 {ratio}", "FIFROUU": "小 {ratio}"},
    "sort": ["FIFROUO", "FIFROUU"]
  },
  "FIGRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIGRMH": "{homeTeam}", "FIGRMN": "平", "FIGRMC": "{awayTeam}"},
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
    "text": {"FIGROUO": "大 {ratio}", "FIGROUU": "小 {ratio}"},
    "sort": ["FIGROUO", "FIGROUU"]
  },
  "FIHRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIHRMH": "{homeTeam}", "FIHRMN": "平", "FIHRMC": "{awayTeam}"},
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
    "text": {"FIHROUO": "大 {ratio}", "FIHROUU": "小 {ratio}"},
    "sort": ["FIHROUO", "FIHROUU"]
  },
  "FIIRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIIRMH": "{homeTeam}", "FIIRMN": "平", "FIIRMC": "{awayTeam}"},
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
    "text": {"FIIROUO": "大 {ratio}", "FIIROUU": "小 {ratio}"},
    "sort": ["FIIROUO", "FIIROUU"]
  },
  "FIJRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIJRMH": "{homeTeam}", "FIJRMN": "平", "FIJRMC": "{awayTeam}"},
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
    "text": {"FIJROUO": "大 {ratio}", "FIJROUU": "小 {ratio}"},
    "sort": ["FIJROUO", "FIJROUU"]
  },
  "FIKRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIKRMH": "{homeTeam}", "FIKRMN": "平", "FIKRMC": "{awayTeam}"},
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
    "text": {"FIKROUO": "大 {ratio}", "FIKROUU": "小 {ratio}"},
    "sort": ["FIKROUO", "FIKROUU"]
  },
  "FILRM": {
    "col": 3,
    "col188": 1,
    "text": {"FILRMH": "{homeTeam}", "FILRMN": "平", "FILRMC": "{awayTeam}"},
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
    "text": {"FILROUO": "大 {ratio}", "FILROUU": "小 {ratio}"},
    "sort": ["FILROUO", "FILROUU"]
  },
  "FIMRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIMRMH": "{homeTeam}", "FIMRMN": "平", "FIMRMC": "{awayTeam}"},
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
    "text": {"FIMROUO": "大 {ratio}", "FIMROUU": "小 {ratio}"},
    "sort": ["FIMROUO", "FIMROUU"]
  },
  "FINRM": {
    "col": 3,
    "col188": 1,
    "text": {"FINRMH": "{homeTeam}", "FINRMN": "平", "FINRMC": "{awayTeam}"},
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
    "text": {"FINROUO": "大 {ratio}", "FINROUU": "小 {ratio}"},
    "sort": ["FINROUO", "FINROUU"]
  },
  "FIORM": {
    "col": 3,
    "col188": 1,
    "text": {"FIORMH": "{homeTeam}", "FIORMN": "平", "FIORMC": "{awayTeam}"},
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
    "text": {"FIOROUO": "大 {ratio}", "FIOROUU": "小 {ratio}"},
    "sort": ["FIOROUO", "FIOROUU"]
  },
  "FIPRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIPRMH": "{homeTeam}", "FIPRMN": "平", "FIPRMC": "{awayTeam}"},
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
    "text": {"FIPROUO": "大 {ratio}", "FIPROUU": "小 {ratio}"},
    "sort": ["FIPROUO", "FIPROUU"]
  },
  "FIQRM": {
    "col": 3,
    "col188": 1,
    "text": {"FIQRMH": "{homeTeam}", "FIQRMN": "平", "FIQRMC": "{awayTeam}"},
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
    "text": {"FIQROUO": "大 {ratio}", "FIQROUU": "小 {ratio}"},
    "sort": ["FIQROUO", "FIQROUU"]
  },
  "TECRM": {
    "col": 3,
    "col188": 1,
    "text": {"TECRMH": "{homeTeam}", "TECRMN": "平", "TECRMC": "{awayTeam}"},
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
    "text": {"TECROUO": "大 {ratio}", "TECROUU": "小 {ratio}"},
    "sort": ["TECROUO", "TECROUU"]
  },
  "TEDRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEDRMH": "{homeTeam}", "TEDRMN": "平", "TEDRMC": "{awayTeam}"},
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
    "text": {"TEDROUO": "大 {ratio}", "TEDROUU": "小 {ratio}"},
    "sort": ["TEDROUO", "TEDROUU"]
  },
  "TEERM": {
    "col": 3,
    "col188": 1,
    "text": {"TEERMH": "{homeTeam}", "TEERMN": "平", "TEERMC": "{awayTeam}"},
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
    "text": {"TEEROUO": "大 {ratio}", "TEEROUU": "小 {ratio}"},
    "sort": ["TEEROUO", "TEEROUU"]
  },
  "TEFRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEFRMH": "{homeTeam}", "TEFRMN": "平", "TEFRMC": "{awayTeam}"},
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
    "text": {"TEFROUO": "大 {ratio}", "TEFROUU": "小 {ratio}"},
    "sort": ["TEFROUO", "TEFROUU"]
  },
  "TEGRM": {
    "col": 2,
    "col188": 1,
    "text": {"TEGRMH": "{homeTeam}", "TEGRMN": "平", "TEGRMC": "{awayTeam}"},
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
    "text": {"TEGROUO": "大 {ratio}", "TEGROUU": "小 {ratio}"},
    "sort": ["TEGROUO", "TEGROUU"]
  },
  "TEHRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEHRMH": "{homeTeam}", "TEHRMN": "平", "TEHRMC": "{awayTeam}"},
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
    "text": {"TEHROUO": "大 {ratio}", "TEHROUU": "小 {ratio}"},
    "sort": ["TEHROUO", "TEHROUU"]
  },
  "TEIRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEIRMH": "{homeTeam}", "TEIRMN": "平", "TEIRMC": "{awayTeam}"},
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
    "text": {"TEIROUO": "大 {ratio}", "TEIROUU": "小 {ratio}"},
    "sort": ["TEIROUO", "TEIROUU"]
  },
  "TEJRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEJRMH": "{homeTeam}", "TEJRMN": "平", "TEJRMC": "{awayTeam}"},
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
    "text": {"TEJROUO": "大 {ratio}", "TEJROUU": "小 {ratio}"},
    "sort": ["TEJROUO", "TEJROUU"]
  },
  "TEKRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEKRMH": "{homeTeam}", "TEKRMN": "平", "TEKRMC": "{awayTeam}"},
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
    "text": {"TEKROUO": "大 {ratio}", "TEKROUU": "小 {ratio}"},
    "sort": ["TEKROUO", "TEKROUU"]
  },
  "TELRM": {
    "col": 3,
    "col188": 1,
    "text": {"TELRMH": "{homeTeam}", "TELRMN": "平", "TELRMC": "{awayTeam}"},
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
    "text": {"TELROUO": "大 {ratio}", "TELROUU": "小 {ratio}"},
    "sort": ["TELROUO", "TELROUU"]
  },
  "TEMRM": {
    "col": 3,
    "col188": 1,
    "text": {"TEMRMH": "{homeTeam}", "TEMRMN": "平", "TEMRMC": "{awayTeam}"},
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
    "text": {"TEMROUO": "大 {ratio}", "TEMROUU": "小 {ratio}"},
    "sort": ["TEMROUO", "TEMROUU"]
  },
  "TENRM": {
    "col": 3,
    "col188": 1,
    "text": {"TENRMH": "{homeTeam}", "TENRMN": "平", "TENRMC": "{awayTeam}"},
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
    "text": {"TENROUO": "大 {ratio}", "TENROUU": "小 {ratio}"},
    "sort": ["TENROUO", "TENROUU"]
  },
  "TEORM": {
    "col": 3,
    "col188": 1,
    "text": {"TEORMH": "{homeTeam}", "TEORMN": "平", "TEORMC": "{awayTeam}"},
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
    "text": {"TEOROUO": "大 {ratio}", "TEOROUU": "小 {ratio}"},
    "sort": ["TEOROUO", "TEOROUU"]
  },
  "SABRM": {
    "col": 3,
    "col188": 1,
    "text": {"SABRMH": "{homeTeam}", "SABRMN": "平", "SABRMC": "{awayTeam}"},
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
    "text": {"SABROUO": "大 {ratio}", "SABROUU": "小 {ratio}"},
    "sort": ["SABROUO", "SABROUU"]
  },
  "BM": {
    "col": 3,
    "col188": 1,
    "text": {"BMH": "{homeTeam}", "BMN": "平", "BMC": "{awayTeam}"},
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
    "text": {"BROUO": "大 {ratio}", "BROUU": "小 {ratio}"},
    "sort": ["BROUO", "BROUU"]
  },
  "SACRM": {
    "col": 3,
    "col188": 1,
    "text": {"SACRMH": "{homeTeam}", "SACRMN": "平", "SACRMC": "{awayTeam}"},
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
    "text": {"SACROUO": "大 {ratio}", "SACROUU": "小 {ratio}"},
    "sort": ["SACROUO", "SACROUU"]
  },
  "SADRM": {
    "col": 3,
    "col188": 1,
    "text": {"SADRMH": "{homeTeam}", "SADRMN": "平", "SADRMC": "{awayTeam}"},
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
    "text": {"SADROUO": "大 {ratio}", "SADROUU": "小 {ratio}"},
    "sort": ["SADROUO", "SADROUU"]
  },
  "SAERM": {
    "col": 3,
    "col188": 1,
    "text": {"SAERMH": "{homeTeam}", "SAERMN": "平", "SAERMC": "{awayTeam}"},
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
    "text": {"SAEROUO": "大 {ratio}", "SAEROUU": "小 {ratio}"},
    "sort": ["SAEROUO", "SAEROUU"]
  },
  "SAFRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAFRMH": "{homeTeam}", "SAFRMN": "平", "SAFRMC": "{awayTeam}"},
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
    "text": {"SAFROUO": "大 {ratio}", "SAFROUU": "小 {ratio}"},
    "sort": ["SAFROUO", "SAFROUU"]
  },
  "SAGRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAGRMH": "{homeTeam}", "SAGRMN": "平", "SAGRMC": "{awayTeam}"},
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
    "text": {"SAGROUO": "大 {ratio}", "SAGROUU": "小 {ratio}"},
    "sort": ["SAGROUO", "SAGROUU"]
  },
  "SAHRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAHRMH": "{homeTeam}", "SAHRMN": "平", "SAHRMC": "{awayTeam}"},
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
    "text": {"SAHROUO": "大 {ratio}", "SAHROUU": "小 {ratio}"},
    "sort": ["SAHROUO", "SAHROUU"]
  },
  "SAIRM": {
    "col": 3,
    "col188": 1,
    "text": {"SAIRMH": "{homeTeam}", "SAIRMN": "平", "SAIRMC": "{awayTeam}"},
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
    "text": {"SAIROUO": "大 {ratio}", "SAIROUU": "小 {ratio}"},
    "sort": ["SAIROUO", "SAIROUU"]
  },
  "RTTG_conner": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHC": "{homeTeam} 大 {ratio}",
      "OUHH": "{homeTeam} 小 {ratio}",
      "OUCC": "{awayTeam} 大 {ratio}",
      "OUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RFGTA": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTAS": "射門",
      "RFGTAH": "頭球",
      "RFGTAN": "無進球",
      "RFGTAP": "點球",
      "RFGTAF": "任意球",
      "RFGTAO": "烏龍球"
    },
    "sort": ["RFGTAS", "RFGTAH", "RFGTAN", "RFGTAP", "RFGTAF", "RFGTAO"]
  },
  "RFGTB": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTBS": "射門",
      "RFGTBH": "頭球",
      "RFGTBN": "無進球",
      "RFGTBP": "點球",
      "RFGTBF": "任意球",
      "RFGTBO": "烏龍球"
    },
    "sort": ["RFGTBS", "RFGTBH", "RFGTBN", "RFGTBP", "RFGTBF", "RFGTBO"]
  },
  "RFGTC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTCS": "射門",
      "RFGTCH": "頭球",
      "RFGTCN": "無進球",
      "RFGTCP": "點球",
      "RFGTCF": "任意球",
      "RFGTCO": "烏龍球"
    },
    "sort": ["RFGTCS", "RFGTCH", "RFGTCN", "RFGTCP", "RFGTCF", "RFGTCO"]
  },
  "RFGTD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTDS": "射門",
      "RFGTDH": "頭球",
      "RFGTDN": "無進球",
      "RFGTDP": "點球",
      "RFGTDF": "任意球",
      "RFGTDO": "烏龍球"
    },
    "sort": ["RFGTDS", "RFGTDH", "RFGTDN", "RFGTDP", "RFGTDF", "RFGTDO"]
  },
  "RFGTE": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTES": "射門",
      "RFGTEH": "頭球",
      "RFGTEN": "無進球",
      "RFGTEP": "點球",
      "RFGTEF": "任意球",
      "RFGTEO": "烏龍球"
    },
    "sort": ["RFGTES", "RFGTEH", "RFGTEN", "RFGTEP", "RFGTEF", "RFGTEO"]
  },
  "RFGTF": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTFS": "射門",
      "RFGTFH": "頭球",
      "RFGTFN": "無進球",
      "RFGTFP": "點球",
      "RFGTFF": "任意球",
      "RFGTFO": "烏龍球"
    },
    "sort": ["RFGTFS", "RFGTFH", "RFGTFN", "RFGTFP", "RFGTFF", "RFGTFO"]
  },
  "RFGTG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTGS": "射門",
      "RFGTGH": "頭球",
      "RFGTGN": "無進球",
      "RFGTGP": "點球",
      "RFGTGF": "任意球",
      "RFGTGO": "烏龍球"
    },
    "sort": ["RFGTGS", "RFGTGH", "RFGTGN", "RFGTGP", "RFGTGF", "RFGTGO"]
  },
  "RFGTH": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTHS": "射門",
      "RFGTHH": "頭球",
      "RFGTHN": "無進球",
      "RFGTHP": "點球",
      "RFGTHF": "任意球",
      "RFGTHO": "烏龍球"
    },
    "sort": ["RFGTHS", "RFGTHH", "RFGTHN", "RFGTHP", "RFGTHF", "RFGTHO"]
  },
  "RFGTI": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTIS": "射門",
      "RFGTIH": "頭球",
      "RFGTIN": "無進球",
      "RFGTIP": "點球",
      "RFGTIF": "任意球",
      "RFGTIO": "烏龍球"
    },
    "sort": ["RFGTIS", "RFGTIH", "RFGTIN", "RFGTIP", "RFGTIF", "RFGTIO"]
  },
  "RFGTJ": {
    "col": 2,
    "col188": 1,
    "text": {
      "RFGTJS": "射門",
      "RFGTJH": "頭球",
      "RFGTJN": "無進球",
      "RFGTJP": "點球",
      "RFGTJF": "任意球",
      "RFGTJO": "烏龍球"
    },
    "sort": ["RFGTJS", "RFGTJH", "RFGTJN", "RFGTJP", "RFGTJF", "RFGTJO"]
  },
  "RRT3_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT3H": "{homeTeam}", "RRT3N": "都不是", "RRT3C": "{awayTeam}"},
    "sort": ["RRT3H", "RRT3N", "RRT3C"]
  },
  "RRT5_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT5H": "{homeTeam}", "RRT5N": "都不是", "RRT5C": "{awayTeam}"},
    "sort": ["RRT5H", "RRT5N", "RRT5C"]
  },
  "RRT7_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT7H": "{homeTeam}", "RRT7N": "都不是", "RRT7C": "{awayTeam}"},
    "sort": ["RRT7H", "RRT7N", "RRT7C"]
  },
  "RRT9_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RRT9H": "{homeTeam}", "RRT9N": "都不是", "RRT9C": "{awayTeam}"},
    "sort": ["RRT9H", "RRT9N", "RRT9C"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "單",
      "RTEOHE": "雙",
      "RTEOCO": "單",
      "RTEOCE": "雙"
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
    "text": {"HRTSY": "是", "HRTSN": "否"},
    "sort": ["HRTSY", "HRTSN"]
  },
  "R2OU_conner": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "TSNT": {
    "col": 2,
    "text": {"TSNTY": "是", "TSNTN": "否"},
    "sort": ["TSNTY", "TSNTN"]
  },
  "M_conner": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RM_conner": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "平", "RMC": "{awayTeam}"},
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
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_conner": {
    "col": 3,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMN": "平", "HRMC": "{awayTeam}"},
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
    "text": {"HROUC": "大 {ratio}", "HROUH": "小 {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "HROU2_conner": {
    "col": 2,
    "text": {"HOU2C": "大 {ratio}", "HOU2H": "小 {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "RM_OT": {
    "col": 3,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMN": "平", "RMC": "{awayTeam}"},
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
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_OT": {
    "col": 3,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMN": "平", "HRMC": "{awayTeam}"},
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
    "text": {"HROUC": "大 {ratio}", "HROUH": "小 {ratio}"},
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
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RDC_OT": {
    "col": 3,
    "col188": 1,
    "text": {"RDCHN": "主和", "RDCHC": "主客", "RDCCN": "和客"},
    "sort": ["RDCHN", "RDCHC", "RDCCN"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "單", "REOE": "雙"},
    "sort": ["REOO", "REOE"]
  },
  "ARG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"ARGH": "{homeTeam}", "ARGN": "沒有進球", "ARGC": "{awayTeam}"},
    "sort": ["ARGH", "ARGC", "ARGN"]
  },
  "BRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"BRGH": "{homeTeam}", "BRGN": "沒有進球", "BRGC": "{awayTeam}"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"CRGH": "{homeTeam}", "CRGN": "沒有進球", "CRGC": "{awayTeam}"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"DRGH": "{homeTeam}", "DRGN": "沒有進球", "DRGC": "{awayTeam}"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"ERGH": "{homeTeam}", "ERGN": "沒有進球", "ERGC": "{awayTeam}"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"FRGH": "{homeTeam}", "FRGN": "沒有進球", "FRGC": "{awayTeam}"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"GRGH": "{homeTeam}", "GRGN": "沒有進球", "GRGC": "{awayTeam}"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"HRGH": "{homeTeam}", "HRGN": "沒有進球", "HRGC": "{awayTeam}"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"IRGH": "{homeTeam}", "IRGN": "沒有進球", "IRGC": "{awayTeam}"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG_OT": {
    "col": 3,
    "col188": 1,
    "text": {"JRGH": "{homeTeam}", "JRGN": "沒有進球", "JRGC": "{awayTeam}"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "RTS_OT": {
    "col": 2,
    "text": {"RTSY": "是", "RTSN": "否"},
    "sort": ["RTSY", "RTSN"]
  },
  "RTEO_OT": {
    "col": 2,
    "text":
    {
      'RTEOHO': '單',
      'RTEOHE': '雙',
      'RTEOCO': '單',
      'RTEOCE': '雙'
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  'RW3_OT': {
    'col': 3,
    "col188": 1,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': '平 {ratio}',
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
      'ROUHC': '{homeTeam} 大 {ratio}',
      'ROUHH': '{homeTeam} 小 {ratio}',
      'ROUCC': '{awayTeam} 大 {ratio}',
      'ROUCH': '{awayTeam} 小 {ratio}'
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
      'RSAHY': '{homeTeam} 射進點球',
      'RSAHN': '{homeTeam} 射失點球',
      'RSACY': '{awayTeam} 射進點球',
      'RSACN': '{awayTeam} 射失點球'
    },
    'sort': ['RSAHY', 'RSAHN', 'RSACY', 'RSACN']
  },
  'RSB_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSBHY': '{homeTeam} 射進點球',
      'RSBHN': '{homeTeam} 射失點球',
      'RSBCY': '{awayTeam} 射進點球',
      'RSBCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSBHY', 'RSBHN', 'RSBCY', 'RSBCN']
  },
  'RSC_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSCHY': '{homeTeam} 射進點球',
      'RSCHN': '{homeTeam} 射失點球',
      'RSCCY': '{awayTeam} 射進點球',
      'RSCCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSCHY', 'RSCHN', 'RSCCY', 'RSCCN']
  },
  'RSD_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSDHY': '{homeTeam} 射進點球',
      'RSDHN': '{homeTeam} 射失點球',
      'RSDCY': '{awayTeam} 射進點球',
      'RSDCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSDHY', 'RSDHN', 'RSDCY', 'RSDCN']
  },
  'RSE_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSEHY': '{homeTeam} 射進點球',
      'RSEHN': '{homeTeam} 射失點球',
      'RSECY': '{awayTeam} 射進點球',
      'RSECN': '{awayTeam} 射失點球'
    },
    'sort': ['RSEHY', 'RSEHN', 'RSECY', 'RSECN']
  },
  'RSF_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSFHY': '{homeTeam} 射進點球',
      'RSFHN': '{homeTeam} 射失點球',
      'RSFCY': '{awayTeam} 射進點球',
      'RSFCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSFHY', 'RSFHN', 'RSFCY', 'RSFCN']
  },
  'RSG_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSGHY': '{homeTeam} 射進點球',
      'RSGHN': '{homeTeam} 射失點球',
      'RSGCY': '{awayTeam} 射進點球',
      'RSGCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSGHY', 'RSGHN', 'RSGCY', 'RSGCN']
  },
  'RSH_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSHHY': '{homeTeam} 射進點球',
      'RSHHN': '{homeTeam} 射失點球',
      'RSHCY': '{awayTeam} 射進點球',
      'RSHCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSHHY', 'RSHHN', 'RSHCY', 'RSHCN']
  },
  'RSI_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSIHY': '{homeTeam} 射進點球',
      'RSIHN': '{homeTeam} 射失點球',
      'RSICY': '{awayTeam} 射進點球',
      'RSICN': '{awayTeam} 射失點球'
    },
    'sort': ['RSIHY', 'RSIHN', 'RSICY', 'RSICN']
  },
  'RSJ_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSJHY': '{homeTeam} 射進點球',
      'RSJHN': '{homeTeam} 射失點球',
      'RSJCY': '{awayTeam} 射進點球',
      'RSJCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSJHY', 'RSJHN', 'RSJCY', 'RSJCN']
  },
  'RSK_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSKHY': '{homeTeam} 射進點球',
      'RSKHN': '{homeTeam} 射失點球',
      'RSKCY': '{awayTeam} 射進點球',
      'RSKCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSKHY', 'RSKHN', 'RSKCY', 'RSKCN']
  },
  'RSL_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSLHY': '{homeTeam} 射進點球',
      'RSLHN': '{homeTeam} 射失點球',
      'RSLCY': '{awayTeam} 射進點球',
      'RSLCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSLHY', 'RSLHN', 'RSLCY', 'RSLCN']
  },
  'RSM_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSMHY': '{homeTeam} 射進點球',
      'RSMHN': '{homeTeam} 射失點球',
      'RSMCY': '{awayTeam} 射進點球',
      'RSMCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSMHY', 'RSMHN', 'RSMCY', 'RSMCN']
  },
  'RSN_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSNHY': '{homeTeam} 射進點球',
      'RSNHN': '{homeTeam} 射失點球',
      'RSNCY': '{awayTeam} 射進點球',
      'RSNCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSNHY', 'RSNHN', 'RSNCY', 'RSNCN']
  },
  'RSO_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSOHY': '{homeTeam} 射進點球',
      'RSOHN': '{homeTeam} 射失點球',
      'RSOCY': '{awayTeam} 射進點球',
      'RSOCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSOHY', 'RSOHN', 'RSOCY', 'RSOCN']
  },
  'RSP_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSPHY': '{homeTeam} 射進點球',
      'RSPHN': '{homeTeam} 射失點球',
      'RSPCY': '{awayTeam} 射進點球',
      'RSPCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSPHY', 'RSPHN', 'RSPCY', 'RSPCN']
  },
  'RSQ_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSQHY': '{homeTeam} 射進點球',
      'RSQHN': '{homeTeam} 射失點球',
      'RSQCY': '{awayTeam} 射進點球',
      'RSQCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSQHY', 'RSQHN', 'RSQCY', 'RSQCN']
  },
  'RSR_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSRHY': '{homeTeam} 射進點球',
      'RSRHN': '{homeTeam} 射失點球',
      'RSRCY': '{awayTeam} 射進點球',
      'RSRCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSRHY', 'RSRHN', 'RSRCY', 'RSRCN']
  },
  'RSS_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSSHY': '{homeTeam} 射進點球',
      'RSSHN': '{homeTeam} 射失點球',
      'RSSCY': '{awayTeam} 射進點球',
      'RSSCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSSHY', 'RSSHN', 'RSSCY', 'RSSCN']
  },
  'RST_PS': {
    'col': 2,
    "col188": 1,
    'text': {
      'RSTHY': '{homeTeam} 射進點球',
      'RSTHN': '{homeTeam} 射失點球',
      'RSTCY': '{awayTeam} 射進點球',
      'RSTCN': '{awayTeam} 射失點球'
    },
    'sort': ['RSTHY', 'RSTHN', 'RSTCY', 'RSTCN']
  },
  'RPSD_PS': {
    'col': 2,
    'text': {'RPSDY': '是', 'RPSDN': '否'},
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
      'ROUHC': '{homeTeam} 大 {ratio}',
      'ROUHH': '{homeTeam} 小 {ratio}',
      'ROUCC': '{awayTeam} 大 {ratio}',
      'ROUCH': '{awayTeam} 小 {ratio}'
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
    "text": {"FSGH": "{homeTeam}", "FSGA": "{awayTeam}", "FSGN": "無進球"},
    "sort": ["FSGH", "FSGA", "FSGN"]
  },
  "HTSBH2": {
    "col": 2,
    "text": {
      "HTSB2HY": "是",
      "HTSB2HN": "否",
    },
    "sort": ["HTSB2HY", "HTSB2HN"]
  },
  "HTSBC2": {
    "col": 2,
    "text": {
      "HTSB2CY": "是",
      "HTSB2CN": "否",
    },
    "sort": ["HTSB2CY", "HTSB2CN"]
  },
  "TSBH": {
    "col": 2,
    "text": {
      "TSBHY": "是",
      "TSBHN": "否",
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "TSBC": {
    "col": 2,
    "text": {
      "TSBCY": "是",
      "TSBCN": "否"
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "HOU_conner": {
    "col": 2,
    "text": {'HOUC': '大 {ratio}', 'HOUH': '小 {ratio}'},
    "sort": ['HOUC', 'HOUH']
  },
};
