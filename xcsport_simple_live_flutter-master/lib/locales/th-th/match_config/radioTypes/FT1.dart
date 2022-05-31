//บอล
const dynamic ftRadioTypes = {
  "WTW": {
    "col": 2,
    "text": {"WTWH": "{homeTeam}", "WTWC": "{awayTeam}"},
    "sort": ["WTWH", "WTWC"]
  },
  "WMD": {
    "col": 3,
    "text": {
      "WMD1RT": "เกมส์ฤดูกาลปกติเจ้าบ้านชนะ",
      "WMD1OT": "ช่วงต่อเวลาเจ้าบ้านชนะ", 
      "WMD1SO": "ลูกโทษเจ้าบ้านชนะ",
      "WMD2RT": "เกมส์ฤดูกาลปกติมีมเยือนชนะ",
      "WMD2OT": "ช่วงต่อเวลาทีมเยือนชนะ",
      "WMD2SO": "ลูกโทษทีมเยือนชนะ"
    },
    "sort": ["WMD1RT", "WMD1OT", "WMD1SO", "WMD2RT", "WMD2OT", "WMD2SO"]
  },
  "LG": {
    "col": 3,
    "text": {"LGH": "{homeTeam}", "LGA": "{awayTeam}", "LGN": "ไม่มีลูกที่เข้า"},
    "sort": ["LGH", "LGA", "LGN"]
  },
  "EGS": {
    "col": 2,
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
    "text": {"EGHT0": "0", "EGHT1": "1", "EGHT2": "2", "EGHT3+": "3+"},
    "sort": ["EGHT0", "EGHT1", "EGHT2", "EGHT3+"]
  },
  "EGAT": {
    "col": 2,
    "text": {"EGAT0": "0", "EGAT1": "1", "EGAT2": "2", "EGAT3+": "3+"},
    "sort": ["EGAT0", "EGAT1", "EGAT2", "EGAT3+"]
  },
  "OEHT": {
    "col": 2,
    "text": {"OEHTO": "คี่", "OEHTE": "คู่"},
    "sort": ["OEHTO", "OEHTE"]
  },
  "OEAT": {
    "col": 2,
    "text": {"OEATO": "คี่", "OEATE": "คุ่"},
    "sort": ["OEATO", "OEATE"]
  },
  "WTTS": {
    "col": 2,
    "text": {"WTTSH": "มีแค่ทีมเจ้าบ้าน", "WTTSA": "มีแค่ทีมเยือน", "WTTSB": "เข้าทั้งทีมเจ้าบ้านและทีมเยือน", "WTTSN": "ไม่มีลูกที่เข้า"},
    "sort": ["WTTSH", "WTTSA", "WTTSB", "WTTSN"]
  },
  "CSHT": {
    "col": 2,
    "text": {"CSHTY": "ใช่", "CSHTN": "ไม่่"},
    "sort": ["CSHTY", "CSHTN"]
  },
  "CSAT": {
    "col": 2,
    "text": {"CSATY": "ใช่", "CSATN": "ไม่"},
    "sort": ["CSATY", "CSATN"]
  },
  "WHN": {
    "col": 2,
    "text": {"WHNY": "ใช่", "WHNN": "ไม่"},
    "sort": ["WHNY", "WHNN"]
  },
  "WHA": {
    "col": 2,
    "text": {"WHAY": "ใช่", "WHAN": "ไม่"},
    "sort": ["WHAY", "WHAN"]
  },
  "BTTS": {
    "col": 3,
    "text": {
      "BTTSHY": "เจ้าบ้านชนะ/ใช่",
      "BTTSHN": "เจ้าบ้านชนะ/ไม่",
      "BTTSDY": "เสมอ/ใช่",
      "BTTSDN": "เสมอ/ไม่",
      "BTTSAY": "ทีมเยืนชนะ/ใช่",
      "BTTSAN": "ทีมเยือนชนะ/ไม่"
    },
    "sort": ["BTTSHY", "BTTSHN", "BTTSDY", "BTTSDN", "BTTSAY", "BTTSAN"]
  },
  "TBTS": {
    "col": 2,
    "text": {
      "TBTSOY": "ใหญ่{total}/ใช่",
      "TBTSUY": "เล็ก{total}/ใช่",
      "TBTSON": "ใหญ่{total}/ไม่",
      "TBTSUN": "เล็ก{total}/ไม่"
    },
    "sort": ["TBTSOY", "TBTSUY", "TBTSON", "TBTSUN"]
  },
  "MOU": {
    "col": 2,
    "text": {
      "MOUHO": "เจ้าบ้านชนะ/ใหญ่{total}",
      "MOUHU": "เจ้าบ้านชนะ/เล็ก{total}",
      "MOUDO": "เสมอ/ใหญ่{total}",
      "MOUDU": "เสมอ/ใหญ่{total}",
      "MOUAO": "ทีมเยือนชนะ/ใหญ่{total}",
      "MOUAU": "ทีมเยือนชนะ/เล็ก{total}"
    },
    "sort": ["MOUHO", "MOUHU", "MOUDO", "MOUDU", "MOUAO", "MOUAU"]
  },
  "HTWBH": {
    "col": 2,
    "text": {"HTWBHY": "ใช่", "HTWBHN": "ไม่"},
    "sort": ["HTWBHY", "HTWBHN"]
  },
  "ATWBH": {
    "col": 2,
    "text": {"ATWBHY": "ใช่", "ATWBHN": "ไม่"},
    "sort": ["ATWBHY", "ATWBHN"]
  },
  "HTWEH": {
    "col": 2,
    "text": {"HTWEHY": "ใช่", "HTWEHN": "ไม่"},
    "sort": ["HTWEHY", "HTWEHN"]
  },
  "ATWEH": {
    "col": 2,
    "text": {"ATWEHY": "ใช่", "ATWEHN": "ไม่"},
    "sort": ["ATWEHY", "ATWEHN"]
  },
  "SHSH": {
    "col": 3,
    "text": {"SHSH1": "ครึ่งแรก", "SHSH2": "ครึ่งหลัง", "SHSHE": "ได้คะแนนเท่ากัน"},
    "sort": ["SHSH1", "SHSH2", "SHSHE"]
  },
  "HSHH": {
    "col": 3,
    "text": {"HSHH1": "ครึ่งแรก", "HSHH2": "ครึ่งหลัง", "HSHHE": "ได้คะแนนเท่ากัน"},
    "sort": ["HSHH1", "HSHH2", "HSHHE"]
  },
  "HSHA": {
    "col": 3,
    "text": {"HSHA1": "ครึ่งแรก", "HSHA2": "ครึ่งหลัง", "HSHAE": "ได้คะแนนเท่ากัน"},
    "sort": ["HSHA1", "HSHA2", "HSHAE"]
  },
  "HBTS": {
    "col": 2,
    "text": {
      "HBTSNN": "ไม่/ไม่",
      "HBTSYN": "ใช่/ไม่",
      "HBTSYY": "ใช่/ใช่",
      "HBTSNY": "ไม่/ใช่"
    },
    "sort": ["HBTSNN", "HBTSYN", "HBTSYY", "HBTSNY"]
  },
  "SBH_H": {
    "col": 2,
    "text": {"SBH_HY": "ใช่", "SBH_HN": "ไม่"},
    "sort": ["SBH_HY", "SBH_HN"]
  },
  "SBH_C": {
    "col": 2,
    "text": {"SBH_CY": "ใช่", "SBH_CN": "ไม่"},
    "sort": ["SBH_CY", "SBH_CN"]
  },
  "DC_H": {
    "col": 3,
    "text": {"DC_H1X": "ทีมเจ้าบ้านกับทีมรวม", "DC_H12": "ทีมเจ้าภาพกับทีมเยือน", "DC_HX2": "ทีมรวมกับทีมเยือน"},
    "sort": ["DC_H1X", "DC_H12", "DC_HX2"]
  },
  "DNB_H": {
    "col": 2,
    "text": {"DNB_HH": "{homeTeam}", "DNB_HA": "{awayTeam}"},
    "sort": ["DNB_HH", "DNB_HA"]
  },
  "HEG": {
    "col": 2,
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
    "text": {"BTS_HY": "ใช่", "BTS_HN": "ไม่"},
    "sort": ["BTS_HY", "BTS_HN"]
  },
  "MBTS_H": {
    "col": 2,
    "text": {
      "MBTS_HHY": "ทีมเจ้าบ้านชนะ/ใช่",
      "MBTS_HHN": "ทีมเจ้าบ้านชนะ/ไม่",
      "MBTS_HDY": "เสมอ/ใช่",
      "MBTS_HDN": "เสมอ/ไม่",
      "MBTS_HAY": "ทีมเยือนชนะ/ใช่",
      "MBTS_HAN": "ทีมเยือนชนะ/ไม่"
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
    "text": {
      "MOU_HHO": "ทีมเจ้าบ้านชนะ/ใหญ่{total}",
      "MOU_HHU": "หลักชนะ/ต่ำ{total}",
      "MOU_HDO": "เสมอ/ใหญ่{total}",
      "MOU_HDU": "เสมอ/เล็ก{total}",
      "MOU_HAO": "ทีมเยือนชนะ/ใหญ่{total}",
      "MOU_HAU": "ทีมเยือนชนะ/เล็ก{total}"
    },
    "sort": ["MOU_HHO", "MOU_HHU", "MOU_HDO", "MOU_HDU", "MOU_HAO", "MOU_HAU"]
  },
  "HM2": {
    "col": 3,
    "text": {"HM2H": "{homeTeam}", "HM2D": "เสมอ", "HM2A": "{awayTeam}"},
    "sort": ["HM2H", "HM2D", "HM2A"]
  },
  "HR2": {
    "col": 2,
    "text": {"HR2H": "{homeTeam} {ratio}", "HR2C": "{awayTeam} {ratio}"},
    "sort": ["HR2H", "HR2C"]
  },
  "HOU2": {
    "col": 2,
    "text": {"HOU2O": "สูง {ratio}", "HOU2U": "ต่ำ {ratio}"},
    "sort": ["HOU2O", "HOU2U"]
  },
  "HEG2": {
    "col": 3,
    "text": {"HEG2_0": "0", "HEG2_1": "1", "HEG2_2": "2+"},
    "sort": ["HEG2_0", "HEG2_1", "HEG2_2"]
  },
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "คี่", "HEO2E": "คู่"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "BTTS2": {
    "col": 2,
    "text": {"BTTS2Y": "ใช่", "BTTS2N": "ไม่"},
    "sort": ["BTTS2Y", "BTTS2N"]
  },
  "AM_FM": {
    "col": 3,
    "text": {"AM_FMH": "{homeTeam}", "AM_FMD": "เสมอ", "AM_FMA": "{awayTeam}"},
    "sort": ["AM_FMH", "AM_FMD", "AM_FMA"]
  },
  "AOU_FOU": {
    "col": 2,
    "text": {"AOU_FOUO": "สูง {ratio}", "AOU_FOUU": "ต่ำ{ratio}"},
    "sort": ["AOU_FOUO", "AOU_FOUU"]
  },
  "TM_FM": {
    "col": 3,
    "text": {"TM_FMH": "{homeTeam}", "TM_FMD": "เสมอ", "TM_FMA": "{awayTeam}"},
    "sort": ["TM_FMH", "TM_FMD", "TM_FMA"]
  },
  "TOU_FOU": {
    "col": 2,
    "text": {"TOU_FOUO": "สูง{ratio}", "TOU_FOUU": "ต่ำ {ratio}"},
    "sort": ["TOU_FOUO", "TOU_FOUU"]
  },
  "OTG": {
    "col": 2,
    "text": {"OTGY": "ใช่", "OTGN": "ไม่"},
    "sort": ["OTGY", "OTGN"]
  },
  "OTM": {
    "col": 3,
    "text": {"OTMH": "{homeTeam}", "OTMD": "เสมอ", "OTMA": "{awayTeam}"},
    "sort": ["OTMH", "OTMD", "OTMA"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "สูง {ratio}", "OTOUU": "ต่ำ {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "OTR": {
    "col": 2,
    "text": {"OTRH": "{homeTeam} {ratio}", "OTRC": "{awayTeam} {ratio}"},
    "sort": ["OTRH", "OTRC"]
  },
  "OTHM": {
    "col": 3,
    "text": {"OTHMH": "{homeTeam}", "OTHMD": "เสมอ", "OTHMA": "{awayTeam}"},
    "sort": ["OTHMH", "OTHMD", "OTHMA"]
  },
  "OTHR": {
    "col": 2,
    "text": {"OTHRH": "{homeTeam} {ratio}", "OTHRC": "{awayTeam} {ratio}"},
    "sort": ["OTHRH", "OTHRC"]
  },
  "WBP": {
    "col": 2,
    "text": {"WBPY": "ใช่", "WBPN": "ไม่"},
    "sort": ["WBPY", "WBPN"]
  },
  "B": {
    "col": 3,
    "text": {"BH": "{homeTeam}", "BA": "{awayTeam}", "BN": "ไม่"},
    "sort": ["BH", "BA", "BN"]
  },
  "C": {
    "col": 3,
    "text": {"CH": "{homeTeam}", "CA": "{awayTeam}", "CN": "ไม่"},
    "sort": ["CH", "CA", "CN"]
  },
  "LC": {
    "col": 3,
    "text": {"LCH": "{homeTeam}", "LCA": "{awayTeam}", "LCN": "ไม่"},
    "sort": ["LCH", "LCA", "LCN"]
  },
  "RA": {
    "col": 3,
    "text": {"RA08": "0-8", "RA911": "9-11", "RA12": "12+"},
    "sort": ["RA08", "RA911", "RA12"]
  },
  "1M_FOU": {
    "col": 2,
    "text": {"1M_FOUO": "ใช่ {ratio}", "1M_FOUU": "เล็ก {ratio}"},
    "sort": ["1M_FOUO", "1M_FOUU"]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "ใช่", "OTN": "ไม่"},
    "sort": ["OTY", "OTN"]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "ใช่", "ROTN": "ไม่"},
    "sort": ["ROTY", "ROTN"]
  },
  "W_H": {
    "col": 2,
    "text": {"W_HY": "ใช่", "W_HN": "ไม่"},
    "sort": ["W_HY", "W_HN"]
  },
  "A_H": {
    "col": 2,
    "text": {"A_HY": "ใช่", "A_HN": "ไม่"},
    "sort": ["A_HY", "A_HN"]
  },
  "ANY_W": {
    "col": 2,
    "text": {"ANY_WY": "ใช่", "ANY_WN": "ไม่"},
    "sort": ["ANY_WY", "ANY_WN"]
  },
  "TJG": {
    "col": 2,
    "text": {
      "TJG1": "เริ่มการแข่งขัน-15:59",
      "TJG2": "16:00-30:59",
      "TJG3": "31:00-45:59",
      "TJG4": "46-60",
      "TJG5": "61-75",
      "TJG6": "76-90",
      "TJGN": "ไม่มีลูกที่เข้า"
    },
    "sort": ["TJG1", "TJG2", "TJG3", "TJG4", "TJG5", "TJG6", "TJGN"]
  },
  "FGT": {
    "col": 3,
    "text": {
      "FGTS": "ยิงประตู",
      "FGTH": "โหม่งบอล",
      "FGTN": "ออนโกล",
      "FGTP": "โหม่งบอล",
      "FGTF": "ฟรีคิก",
      "FGTO": "ไม่มีลูกที่เข้า"
    },
    "sort": ["FGTS", "FGTH", "FGTN", "FGTP", "FGTF", "FGTO"]
  },
  "WM1": {
    "col": 2,
    "text": {
      "WM1H1": "ทีมเจ้าบ้าน-ผลชนะ1ลูก",
      "WM1H2": "ทีมเจ้าบ้าน-ผลชนะ2ลูก",
      "WM1H3": "ทีมเจ้าบ้าน-ผลชนะ3ลูก",
      "WM1C1": "ทีมเยือน-ผลชนะ1ลูก",
      "WM1C2": "ทีมเยือน-ผลชนะ2ลูก",
      "WM1C3": "ทีมเยือน-ผลชนะ3ลูก",
      "WM1N": "เสมอ"
    },
    "sort": ["WM1H1", "WM1H2", "WM1H3", "WM1C1", "WM1C2", "WM1C3", "WM1N"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "ทีมเจ้าบ้าน-ผลชนะ1ลูก",
      "WMH2": "ทีมเจ้าบ้าน-ผลชนะ2ลูก",
      "WMH3": "ทีมเจ้าบ้าน-ผลชนะ3ลูก",
      "WMHOV": "ทีมเจ้าบ้าน-ผลชนะ4 ลูกขึ้นไป",
      "WMC1": "ทีมเยือน-ผลชนะ1ลูก",
      "WMC2": "ทีมเยือน-ผลชนะ2ลูก",
      "WMC3": "ทีมเยือน-ผลชนะ3ลูก",
      "WMCOV": "ทีมเยือน-ผลชนะ4ลุกขึ้นไป",
      "WM0": "0-0เสมอ",
      "WMN": "คะแนนอื่นๆเสมอกัน"
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
    "text": {
      "MTSHY": "เจ้าบ้านชนะ/ใช่",
      "MTSHN": "เจ้าบ้านชนะ/ไม่่",
      "MTSNY": "เสมอ/ใช่",
      "MTSNN": "เสมอ/ไม่่",
      "MTSCY": "ทีมเยือนชนะ/ใช่",
      "MTSCN": "ทีมเยือนชนะ/ไม่่",
      'MTSDY': 'เสมอ/ใช่',
      'MTSDN': 'เสมอ/ไม่',
      'MTSHW': 'ทีมเจ้าบ้าน/ชนะแบบไม่เสียบอลสักลูก',
      'MTSCW': 'ทีมเยือน/ชนะแบบไม่เสียบอลสักลูก'
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
    "text": {
      "RMTSHY": "เจ้าบ้านชนะ/ใช่",
      "RMTSHN": "เจ้าบ้านชนะ/ไม่",
      "RMTSNY": "เสมอ/ไม่",
      "RMTSNN": "เสมอ/ไม่",
      "RMTSCY": "ทีมเยือนชนะ/ใช่",
      "RMTSCN": "ทีมเยือนชนะ/ไม่"
    },
    "sort": ["RMTSHY", "RMTSHN", "RMTSNY", "RMTSNN", "RMTSCY", "RMTSCN"]
  },
  "OUTA": {
    "col": 2,
    "text": {
      "OUTAOY": "สูง 1.5 & ใช่",
      "OUTAON": "สูง 1.5 & ไม่ใช่",
      "OUTAUY": "ต่ำ 1.5 & ใช่ ",
      "OUTAUN": "ต่ำ 1.5 & ไม่ใช่"
    },
    "sort": ["OUTAOY", "OUTAON", "OUTAUY", "OUTAUN"]
  },
  "RUTA": {
    "col": 2,
    "text": {
      "RUTAOY": "สูง 1.5 & ใช่",
      "RUTAON": "สูง 1.5 & ไม่ใช่",
      "RUTAUY": "ต่ำ 1.5 & ใช่ ",
      "RUTAUN": "ต่ำ 1.5 & ไม่ใช่"
    },
    "sort": ["RUTAOY", "RUTAON", "RUTAUY", "RUTAUN"]
  },
  "OUTB": {
    "col": 2,
    "text": {
      "OUTBOY": "สูง2.5 & ใช่",
      "OUTBON": "สูง 2.5 & ไม่ใช่",
      "OUTBUY": "ต่ำ 2.5 & ใช่ ",
      "OUTBUN": "ต่ำ 2.5 & ไม่ใช่"
    },
    "sort": ["OUTBOY", "OUTBON", "OUTBUY", "OUTBUN"]
  },
  "RUTB": {
    "col": 2,
    "text": {
      "RUTBOY": "สูง 2.5 & ใช่",
      "RUTBON": "สูง 2.5 & ไม่ใช่",
      "RUTBUY": "ต่า 2.5 & ใช่ ",
      "RUTBUN": "ต่ำ 2.5 & ไม่ใช่"
    },
    "sort": ["RUTBOY", "RUTBON", "RUTBUY", "RUTBUN"]
  },
  "OUTC": {
    "col": 2,
    "text": {
      "OUTCOY": "สูง 3.5 & ใช่",
      "OUTCON": "สูง 3.5 & ไม่ใช่",
      "OUTCUY": "ต่ำ 3.5 & ใช่ ",
      "OUTCUN": "ต่ำ 3.5 & ไม่ใช่"
    },
    "sort": ["OUTCOY", "OUTCON", "OUTCUY", "OUTCUN"]
  },
  "RUTC": {
    "col": 2,
    "text": {
      "RUTCOY": "สูง 3.5 & ใช่",
      "RUTCON": "สูง 3.5 & ไม่ใช่",
      "RUTCUY": "ต่ำ3.5 & ใช่ ",
      "RUTCUN": "ต่ำ 3.5 & ไม่ใช่"
    },
    "sort": ["RUTCOY", "RUTCON", "RUTCUY", "RUTCUN"]
  },
  "OUTD": {
    "col": 2,
    "text": {
      "OUTDOY": "สูง 4.5 & ใช่",
      "OUTDON": "สูง 4.5 & ไม่ใช่",
      "OUTDUY": "ต่ำ 4.5 & ใช่",
      "OUTDUN": "ต่ำ 4.5 & ไม่ใช่"
    },
    "sort": ["OUTDOY", "OUTDON", "OUTDUY", "OUTDUN"]
  },
  "RUTD": {
    "col": 2,
    "text": {
      "RUTDOY": "สูง4.5 & ใช่",
      "RUTDON": "สูง 4.5 & ไม่ใช่",
      "RUTDUY": "ต่ำ 4.5 & ใช่ ",
      "RUTDUN": "ต่ำ 4.5 & ไม่ใช่"
    },
    "sort": ["RUTDOY", "RUTDON", "RUTDUY", "RUTDUN"]
  },
  "MOUA": {
    "col": 2,
    "text": {
      "MOUACO": "ทีมเยือนชนะ & สูง 1.5",
      "MOUACU": "ทีมเยือนชนะ & ต่ำ 1.5 ",
      "MOUAHO": "เจ้าบ้านชนะ & สูง 1.5",
      "MOUAHU": "เจ้าบ้านชนะ & ต่ำ 1.5",
      "MOUANO": "เสมอ & สูง 1.5",
      "MOUANU": "เสมอ & ต่ำ 1.5"
    },
    "sort": ['MOUAHO', 'MOUAHU', 'MOUACO', 'MOUACU', 'MOUANO', 'MOUANU']
  },
  "MOUB": {
    "col": 2,
    "text": {
      "MOUBCO": "ทีมเยือนชนะ & สูง 2.5",
      "MOUBCU": "ทีมเยือนชนะ & ต่ำ 2.5 ",
      "MOUBHO": "เจ้าบ้านชนะ & สูง 2.5",
      "MOUBHU": "เจ้าบ้านชนะ & ต่ำ 2.5",
      "MOUBNO": "เสมอ& สูง 2.5",
      "MOUBNU": "เสมอ & ต่ำ 2.5"
    },
    "sort": ["MOUBCO", "MOUBCU", "MOUBHO", "MOUBHU", "MOUBNO", "MOUBNU"]
  },
  "MOUC": {
    "col": 2,
    "text": {
      "MOUCCO": "ทีมเยือนชนะ& สูง 3.5",
      "MOUCCU": "ทีมเยือนชนะ & ต่ำ 3.5 ",
      "MOUCHO": "เจ้าบ้านชนะ & ต่ำ 3.5",
      "MOUCHU": "เจ้าบ้านชนะ & ต่ำ 3.5",
      "MOUCNO": "เสมอ & สูง 3.5",
      "MOUCNU": "เสมอ& ต่ำ 3.5"
    },
    "sort": ["MOUCCO", "MOUCCU", "MOUCHO", "MOUCHU", "MOUCNO", "MOUCNU"]
  },
  "MOUD": {
    "col": 2,
    "text": {
      "MOUDCO": "ทีมเยือนชนะ & สูง4.5",
      "MOUDCU": "ทีมเยือนชนะ & ต่ำ 4.5 ",
      "MOUDHO": "เจ้าบ้านชนะ & สูง 4.5",
      "MOUDHU": "เจ้าบ้านชนะ & ต่ำ 4.5",
      "MOUDNO": "เสมอ & สูง 4.5",
      "MOUDNU": "เสมอ & ต่ำ4.5"
    },
    "sort": ["MOUDCO", "MOUDCU", "MOUDHO", "MOUDHU", "MOUDNO", "MOUDNU"]
  },
  "MG": {
    "col": 3,
    "text": {"MGH": "ครึ่งแรก", "MGC": "ครึ่งหลัง", "MGN": "ได้คะแนนเท่ากัน"},
    "sort": ["MGH", "MGC", "MGN"]
  },
  "HTS": {
    "col": 2,
    "text": {"HTSY": "ใช่", "HTSN": "ไม่่ "},
    "sort": ["HTSY", "HTSN"]
  },
  "RTS2": {
    "col": 2,
    "text": {"RTS2Y": "ใช่", "RTS2N": "ไม่ "},
    "sort": ["RTS2Y", "RTS2N"]
  },
  "RPS": {
    "col": 2,
    "text": {"RPSY": "ใช่", "RPSN": "ไม่ "},
    "sort": ["RPSY", "RPSN"]
  },
  "RNBA": {
    "col": 2,
    "text": {"RNBAH": "{homeTeam}", "RNBAC": "{awayTeam}"},
    "sort": ["RNBAH", "RNBAC"]
  },
  "RNBB": {
    "col": 2,
    "text": {"RNBBH": "{homeTeam}", "RNBBC": "{awayTeam}"},
    "sort": ["RNBBH", "RNBBC"]
  },
  "RNBC": {
    "col": 2,
    "text": {"RNBCH": "{homeTeam}", "RNBCC": "{awayTeam}"},
    "sort": ["RNBCH", "RNBCC"]
  },
  "RNBD": {
    "col": 2,
    "text": {"RNBDH": "{homeTeam}", "RNBDC": "{awayTeam}"},
    "sort": ["RNBDH", "RNBDC"]
  },
  "RNBE": {
    "col": 2,
    "text": {"RNBEH": "{homeTeam}", "RNBEC": "{awayTeam}"},
    "sort": ["RNBEH", "RNBEC"]
  },
  "RNBF": {
    "col": 2,
    "text": {"RNBFH": "{homeTeam}", "RNBFC": "{awayTeam}"},
    "sort": ["RNBFH", "RNBFC"]
  },
  "RNBG": {
    "col": 2,
    "text": {"RNBGH": "{homeTeam}", "RNBGC": "{awayTeam}"},
    "sort": ["RNBGH", "RNBGC"]
  },
  "RNBH": {
    "col": 2,
    "text": {"RNBHH": "{homeTeam}", "RNBHC": "{awayTeam}"},
    "sort": ["RNBHH", "RNBHC"]
  },
  "RNBI": {
    "col": 2,
    "text": {"RNBIH": "{homeTeam}", "RNBIC": "{awayTeam}"},
    "sort": ["RNBIH", "RNBIC"]
  },
  "RNBJ": {
    "col": 2,
    "text": {"RNBJH": "{homeTeam}", "RNBJC": "{awayTeam}"},
    "sort": ["RNBJH", "RNBJC"]
  },
  "RNBK": {
    "col": 2,
    "text": {"RNBKH": "{homeTeam}", "RNBKC": "{awayTeam}"},
    "sort": ["RNBKH", "RNBKC"]
  },
  "RNBL": {
    "col": 2,
    "text": {"RNBLH": "{homeTeam}", "RNBLC": "{awayTeam}"},
    "sort": ["RNBLH", "RNBLC"]
  },
  "RNBM": {
    "col": 2,
    "text": {"RNBMH": "{homeTeam}", "RNBMC": "{awayTeam}"},
    "sort": ["RNBMH", "RNBMC"]
  },
  "RNBN": {
    "col": 2,
    "text": {"RNBNH": "{homeTeam}", "RNBNC": "{awayTeam}"},
    "sort": ["RNBNH", "RNBNC"]
  },
  "RNBO": {
    "col": 2,
    "text": {"RNBOH": "{homeTeam}", "RNBOC": "{awayTeam}"},
    "sort": ["RNBOH", "RNBOC"]
  },
  "RNC1": {
    "col": 2,
    "text": {"RNC1H": "{homeTeam}", "RNC1C": "{awayTeam}"},
    "sort": ["RNC1H", "RNC1C"]
  },
  "RNC2": {
    "col": 2,
    "text": {"RNC2H": "{homeTeam}", "RNC2C": "{awayTeam}"},
    "sort": ["RNC2H", "RNC2C"]
  },
  "RNC3": {
    "col": 2,
    "text": {"RNC3H": "{homeTeam}", "RNC3C": "{awayTeam}"},
    "sort": ["RNC3H", "RNC3C"]
  },
  "RNC4": {
    "col": 2,
    "text": {"RNC4H": "{homeTeam}", "RNC4C": "{awayTeam}"},
    "sort": ["RNC4H", "RNC4C"]
  },
  "RNC5": {
    "col": 2,
    "text": {"RNC5H": "{homeTeam}", "RNC5C": "{awayTeam}"},
    "sort": ["RNC5H", "RNC5C"]
  },
  "RNC6": {
    "col": 2,
    "text": {"RNC6H": "{homeTeam}", "RNC6C": "{awayTeam}"},
    "sort": ["RNC6H", "RNC6C"]
  },
  "RNC7": {
    "col": 2,
    "text": {"RNC7H": "{homeTeam}", "RNC7C": "{awayTeam}"},
    "sort": ["RNC7H", "RNC7C"]
  },
  "RNC8": {
    "col": 2,
    "text": {"RNC8H": "{homeTeam}", "RNC8C": "{awayTeam}"},
    "sort": ["RNC8H", "RNC8C"]
  },
  "RNC9": {
    "col": 2,
    "text": {"RNC9H": "{homeTeam}", "RNC9C": "{awayTeam}"},
    "sort": ["RNC9H", "RNC9C"]
  },
  "RNCA": {
    "col": 2,
    "text": {"RNCAH": "{homeTeam}", "RNCAC": "{awayTeam}"},
    "sort": ["RNCAH", "RNCAC"]
  },
  "RNCB": {
    "col": 2,
    "text": {"RNCBH": "{homeTeam}", "RNCBC": "{awayTeam}"},
    "sort": ["RNCBH", "RNCBC"]
  },
  "RNCC": {
    "col": 2,
    "text": {"RNCCH": "{homeTeam}", "RNCCC": "{awayTeam}"},
    "sort": ["RNCCH", "RNCCC"]
  },
  "RNCD": {
    "col": 2,
    "text": {"RNCDH": "{homeTeam}", "RNCDC": "{awayTeam}"},
    "sort": ["RNCDH", "RNCDC"]
  },
  "RNCE": {
    "col": 2,
    "text": {"RNCEH": "{homeTeam}", "RNCEC": "{awayTeam}"},
    "sort": ["RNCEH", "RNCEC"]
  },
  "RNCF": {
    "col": 2,
    "text": {"RNCFH": "{homeTeam}", "RNCFC": "{awayTeam}"},
    "sort": ["RNCFH", "RNCFC"]
  },
  "RNCG": {
    "col": 2,
    "text": {"RNCGH": "{homeTeam}", "RNCGC": "{awayTeam}"},
    "sort": ["RNCGH", "RNCGC"]
  },
  "RNCH": {
    "col": 2,
    "text": {"RNCHH": "{homeTeam}", "RNCHC": "{awayTeam}"},
    "sort": ["RNCHH", "RNCHC"]
  },
  "RNCI": {
    "col": 2,
    "text": {"RNCIH": "{homeTeam}", "RNCIC": "{awayTeam}"},
    "sort": ["RNCIH", "RNCIC"]
  },
  "RNCJ": {
    "col": 2,
    "text": {"RNCJH": "{homeTeam}", "RNCJC": "{awayTeam}"},
    "sort": ["RNCJH", "RNCJC"]
  },
  "RNCK": {
    "col": 2,
    "text": {"RNCKH": "{homeTeam}", "RNCKC": "{awayTeam}"},
    "sort": ["RNCKH", "RNCKC"]
  },
  "RNCL": {
    "col": 2,
    "text": {"RNCLH": "{homeTeam}", "RNCLC": "{awayTeam}"},
    "sort": ["RNCLH", "RNCLC"]
  },
  "RNCM": {
    "col": 2,
    "text": {"RNCMH": "{homeTeam}", "RNCMC": "{awayTeam}"},
    "sort": ["RNCMH", "RNCMC"]
  },
  "RNCN": {
    "col": 2,
    "text": {"RNCNH": "{homeTeam}", "RNCNC": "{awayTeam}"},
    "sort": ["RNCNH", "RNCNC"]
  },
  "RNCO": {
    "col": 2,
    "text": {"RNCOH": "{homeTeam}", "RNCOC": "{awayTeam}"},
    "sort": ["RNCOH", "RNCOC"]
  },
  "RNCP": {
    "col": 2,
    "text": {"RNCPH": "{homeTeam}", "RNCPC": "{awayTeam}"},
    "sort": ["RNCPH", "RNCPC"]
  },
  "RNCQ": {
    "col": 2,
    "text": {"RNCQH": "{homeTeam}", "RNCQC": "{awayTeam}"},
    "sort": ["RNCQH", "RNCQC"]
  },
  "RNCR": {
    "col": 2,
    "text": {"RNCRH": "{homeTeam}", "RNCRC": "{awayTeam}"},
    "sort": ["RNCRH", "RNCRC"]
  },
  "RNCS": {
    "col": 2,
    "text": {"RNCSH": "{homeTeam}", "RNCSC": "{awayTeam}"},
    "sort": ["RNCSH", "RNCSC"]
  },
  "RNCT": {
    "col": 2,
    "text": {"RNCTH": "{homeTeam}", "RNCTC": "{awayTeam}"},
    "sort": ["RNCTH", "RNCTC"]
  },
  "RNCU": {
    "col": 2,
    "text": {"RNCUH": "{homeTeam}", "RNCUC": "{awayTeam}"},
    "sort": ["RNCUH", "RNCUC"]
  },
  "DG": {
    "col": 3,
    "text": {
      "DGHH": "เจ้าบ้าน/เกมส์เสมอ & เจ้าบ้าน(ลูกบอลเข้าก่อน) ",
      "DGHC": "เจ้าบ้าน/เกมส์เสมอ & ทีมเยือน(ลูกบอลเข้าก่อน) ",
      "DGCC": "ทีมเยือน/เกมส์เสมอ & ทีมเยือน(ลูกบอลเข้าก่อน) ",
      "DGCH": "ทีมเยือน/เกมส์เสมอ & เจ้าบ้าน(ลูกบอลเข้าก่อน) ",
      "DGSH": "เจ้าบ้าน/ทีมเยือน & ทีมเยือน(ลูกบอลเข้าก่อน) ",
      "DGSC": "ทีมเจ้าบ้าน/ทีมเยือน & ทีมเยือน(ลูกบอลเข้าก่อน) "
    },
    "sort": ["DGHH", "DGHC", "DGCC", "DGCH", "DGSH", "DGSC"]
  },
  "RDG": {
    "col": 3,
    "text": {
      "RDGHH": "เจ้าบ้าน/เกมส์เสมอ & เจ้าบ้าน(ลูกบอลเข้าก่อน) ",
      "RDGHC": "เจ้าบ้าน/เกมส์เสมอ & ทีมเยือน(ลูกบอลเข้าก่อน) ",
      "RDGCC": "ทีมเยือน/เกมส์เสมอ & ทีมเยือน(ลูกบอลเข้าก่อน) ",
      "RDGCH": "ทีมเยือน/เกมส์เสมอ & เจ้าบ้าน(ลูกบอลเข้าก่อน) ",
      "RDGSH": "เจ้าบ้าน/เกมส์เสมอ & เจ้าบ้าน(ลูกบอลเข้าก่อน) ",
      "RDGSC": "เจ้าบ้าน/เกมส์เสมอ & ทีมเยือน(ลูกบอลเข้าก่อน) "
    },
    "sort": ["RDGHH", "RDGHC", "RDGCC", "RDGCH", "RDGSH", "RDGSC"]
  },
  "DS": {
    "col": 3,
    "text": {
      "DSHY": "เจ้าบ้าน/เสมอ & ใช่",
      "DSHN": "เจ้าบ้าน/เสมอ & ไม่",
      "DSSY": "เจ้าบ้าน/ทีมเยือน & ใช่",
      "DSSN": "เจ้าบ้าน/ทีมเยือน & ไม่",
      "DSCY": "เสมอ/ทีมเยือน & ใช่",
      "DSCN": "เสมอ/ทีมเยือน & ไม่"
    },
    "sort": ["DSHY", "DSHN", "DSSY", "DSSN", "DSCY", "DSCN"]
  },
  "RDS": {
    "col": 3,
    "text": {
      "RDSHY": "เจ้าบ้าน/เสมอ & ใช่",
      "RDSHN": "เจ้าบ้าน/เสมอ & ไม่",
      "RDSSY": "เจ้าบ้าน/ทีมเยือน & ใช่",
      "RDSSN": "เจ้าบ้าน/ทีมเยือน & ไม่",
      "RDSCY": "เสมอ/ทีมเยือน & ใช่",
      "RDSCN": "เสมอ/ทีมเยือน & ไม่"
    },
    "sort": ["RDSHY", "RDSHN", "RDSSY", "RDSSN", "RDSCY", "RDSCN"]
  },
  "DUA": {
    "col": 3,
    "text": {
      "DUAHO": "เจ้าบ้าน/เกมส์เสมอ & สูง 1.5",
      "DUAHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 1.5 ",
      "DUACO": "ทีมเยือน/เกมส์เสมอ & สูง 1.5",
      "DUACU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 1.5 ",
      "DUASO": "เจ้าบ้าน/ทีมเยือน & สูง 1.5 ",
      "DUASU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 1.5 "
    },
    "sort": ["DUAHO", "DUAHU", "DUACO", "DUACU", "DUASO", "DUASU"]
  },
  "RDUA": {
    "col": 3,
    "text": {
      "RDUAHO": "เจ้าบ้าน/้เกมส์เสมอ & สูง 1.5",
      "RDUAHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 1.5 ",
      "RDUACO": "ทีมเยือน/เกมส์เสมอ & สูง 1.5",
      "RDUACU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 1.5 ",
      "RDUASO": "เจ้าบ้าน/ทีมเยือน & สูง 1.5 ",
      "RDUASU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 1.5 "
    },
    "sort": ["RDUAHO", "RDUAHU", "RDUACO", "RDUACU", "RDUASO", "RDUASU"]
  },
  "DUB": {
    "col": 3,
    "text": {
      "DUBHO": "เจ้าบ้าน/เกมส์เสมอ & สูง2.5",
      "DUBHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 2.5 ",
      "DUBCO": "ทีมเยือน/เกมส์เสมอ & สูง 2.5",
      "DUBCU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 2.5 ",
      "DUBSO": "เจ้าบ้าน/ทีมเยือน& สูง2.5 ",
      "DUBSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 2.5 "
    },
    "sort": ["DUBHO", "DUBHU", "DUBCO", "DUBCU", "DUBSO", "DUBSU"]
  },
  "RDUB": {
    "col": 3,
    "text": {
      "RDUBHO": "เจ้าบ้าน/เกมส์เสมอ & สูง 2.5",
      "RDUBHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 2.5 ",
      "RDUBCO": "ทีมเยือน/เกมส์เสมอ & สูง 2.5",
      "RDUBCU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 2.5 ",
      "RDUBSO": "เจ้าบ้าน/ทีมเยือน & สูง 2.5 ",
      "RDUBSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 2.5 "
    },
    "sort": ["RDUBHO", "RDUBHU", "RDUBCO", "RDUBCU", "RDUBSO", "RDUBSU"]
  },
  "DUC": {
    "col": 3,
    "text": {
      "DUCHO": "เจ้าบ้าน/เกมส์เสมอ& สูง 3.5",
      "DUCHU": "เจ้าบ้าน/เกมส์เสมอ &ต่ำ 3.5 ",
      "DUCCO": "ทีมเยือน/เกมส์เสมอ & สูง 3.5",
      "DUCCU": "ีทีมเยือน/เกมส์เสมอ& ต่ำ 3.5 ",
      "DUCSO": "เจ้าบ้าน/ทีมเยือน & สูง 3.5 ",
      "DUCSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 3.5 "
    },
    "sort": ["DUCHO", "DUCHU", "DUCCO", "DUCCU", "DUCSO", "DUCSU"]
  },
  "RDUC": {
    "col": 3,
    "text": {
      "RDUCHO": "เจ้าบ้าน/เกมส์เสมอ &สูง 3.5",
      "RDUCHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 3.5 ",
      "RDUCCO": "ทีมเยือน/เกมส์เสมอ & สูง 3.5",
      "RDUCCU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 3.5 ",
      "RDUCSO": "เจ้าบ้าน/ทีมเยือน & สูง 3.5 ",
      "RDUCSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 3.5 "
    },
    "sort": ["RDUCHO", "RDUCHU", "RDUCCO", "RDUCCU", "RDUCSO", "RDUCSU"]
  },
  "DUD": {
    "col": 3,
    "text": {
      "DUDHO": "เจ้าบ้าน/เกมส์เสมอ & สูง 4.5",
      "DUDHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 4.5 ",
      "DUDCO": "ทีมเยือน/เกมส์เสมอ &สูง 4.5",
      "DUDCU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 4.5 ",
      "DUDSO": "เจ้าบ้าน/ทีมเยือน & สูง 4.5 ",
      "DUDSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 4.5 "
    },
    "sort": ["DUDHO", "DUDHU", "DUDCO", "DUDCU", "DUDSO", "DUDSU"]
  },
  "RDUD": {
    "col": 3,
    "text": {
      "RDUDHO": "เจ้าบ้าน/เกมส์เสมอ & สูง 4.5",
      "RDUDHU": "เจ้าบ้าน/เกมส์เสมอ & ต่ำ 4.5 ",
      "RDUDCO": "ทีมเยือน/เกมส์เสมอ & สูง 4.5",
      "RDUDCU": "ทีมเยือน/เกมส์เสมอ & ต่ำ 4.5 ",
      "RDUDSO": "เจ้าบ้าน/ทีมเยือน & สูง 4.5 ",
      "RDUDSU": "เจ้าบ้าน/ทีมเยือน & ต่ำ 4.5 "
    },
    "sort": ["RDUDHO", "RDUDHU", "RDUDCO", "RDUDCU", "RDUDSO", "RDUDSU"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "คี่", "HEOHE": "คุ่"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "RHEOH": {
    "col": 2,
    "text": {"RHEOHO": "คี่", "RHEOHE": "คุ่"},
    "sort": ["RHEOHO", "RHEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "คี่", "HEOCE": "คุ่"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "RHEOC": {
    "col": 2,
    "text": {"RHEOCO": "คี่", "RHEOCE": "คุ่"},
    "sort": ["RHEOCO", "RHEOCE"]
  },
  "MPG": {
    "col": 2,
    "text": {
      "MPGHH": "เจ้าบ้านชนะ & เจ้าบ้านลูกบอลเข้าก่อน ",
      "MPGCC": "ทีมเยือนชนะ & ทีมเยือนลูกบอลเข้าก่อน ",
      "MPGHC": "เจ้าบ้านชนะ & ทีมเยือนลูกบอลเข้าก่อน",
      "MPGCH": "ทีมเยือนชนะ & เจ้าบ้านลูกบอลเข้าก่อน ",
      "MPGNH": "เกมส์เสมอ & เจ้าบ้านลูกบอลเข้าก่อน ",
      "MPGNC": "เกมส์เสมอ & ทีมเยือนลูกบอลเข้าก่อน"
    },
    "sort": ["MPGHH", "MPGCC", "MPGHC", "MPGCH", "MPGNH", "MPGNC"]
  },
  "RMPG": {
    "col": 2,
    "text": {
      "RMPGCC": "ทีมเยืนชนะ & ทีมเยือนลูกบอลเข้าก่อน ",
      "RMPGCH": "ทีมเยือนชนะ & เจ้าบ้านลูกบอลเข้าก่อน",
      "RMPGHC": "เจ้าบ้านชนะ & ทีมเยือนลูกบอลเข้าก่อน",
      "RMPGHH": "เจ้าบ้านชนะ & เจ้าบ้านลูกบอลเข้าก่อน ",
      "RMPGNC": "เกมส์เสมอ & ทีมเยือนลูกบอลเข้าก่อน",
      "RMPGNH": "เกมส์เสมอ & ทีมเยือนลูกบอลเข้าก่อน "
    },
    "sort": ["RMPGCC", "RMPGCH", "RMPGHC", "RMPGHH", "RMPGNC", "RMPGNH"]
  },
  "MQ": {
    "col": 2,
    "text": {
      "MQH": "เกมส์ฤดูกาลปกติเจ้าบ้านชนะ",
      "MQHOT": "ช่วงต่อเวลาเจ้าบ้านชนะ",
      "MQHPK": "ลูกโทษเจ้าบ้านชนะ",
      "MQC": "เกมส์ฤดูกาลปกติทีมเยือนชนะ",
      "MQCOT": "ช่วงต่อเวลาทีมเยือนชนะ",
      "MQCPK": "ลูกโทษทีมเยือนชนะ"
    },
    "sort": ["MQH", "MQHOT", "MQHPK", "MQC", "MQCOT", "MQCPK"]
  },
  "OG": {
    "col": 2,
    "text": {"OGY": "ใช่", "OGN": "ไม่"},
    "sort": ["OGY", "OGN"]
  },
  "OUEA": {
    "col": 2,
    "text": {
      "OUEAOO": "สูง 1.5 & คี่",
      "OUEAOE": "ต่ำ 1.5 & คุ่",
      "OUEAUO": "ต่ำ 1.5 & คี่",
      "OUEAUE": "ต่ำ 1.5 & คู่"
    },
    "sort": ["OUEAOO", "OUEAOE", "OUEAUO", "OUEAUE"]
  },
  "RUEA": {
    "col": 2,
    "text": {
      "RUEAOO": "สูง 1.5 & คี่",
      "RUEAOE": "สูง 1.5 & คู่",
      "RUEAUO": "ต่ำ 1.5 & คี่",
      "RUEAUE": "ต่ำ1.5 &คู่"
    },
    "sort": ["RUEAOO", "RUEAOE", "RUEAUO", "RUEAUE"]
  },
  "OUEB": {
    "col": 2,
    "text": {
      "OUEBOO": "สูง 2.5 & คี่",
      "OUEBOE": "สูง2.5 & คู่",
      "OUEBUO": "ต่ำ 2.5 & คี่",
      "OUEBUE": "ต่ำ 2.5 & คู่"
    },
    "sort": ["OUEBOO", "OUEBOE", "OUEBUO", "OUEBUE"]
  },
  "RUEB": {
    "col": 2,
    "text": {
      "RUEBOO": "สูง 2.5 & คี่",
      "RUEBOE": "สูง 2.5 & คู่",
      "RUEBUO": "ต่ำ 2.5 & คี่",
      "RUEBUE": "ต่ำ 2.5 & คู่"
    },
    "sort": ["RUEBOO", "RUEBOE", "RUEBUO", "RUEBUE"]
  },
  "OUEC": {
    "col": 2,
    "text": {
      "OUECOO": "สูง 3.5 & คี่",
      "OUECOE": "ต่ำ 3.5 & คู่",
      "OUECUO": "สูง 3.5 & คี่",
      "OUECUE": "ต่ำ 3.5 & คู่"
    },
    "sort": ["OUECOO", "OUECOE", "OUECUO", "OUECUE"]
  },
  "RUEC": {
    "col": 2,
    "text": {
      "RUECOO": "สูง 3.5 & คี่",
      "RUECOE": "สูง 3.5 & คู่",
      "RUECUO": "ต่ำ 3.5 & คี่",
      "RUECUE": "ต่ำ 3.5 & คู่"
    },
    "sort": ["RUECOO", "RUECOE", "RUECUO", "RUECUE"]
  },
  "OUED": {
    "col": 2,
    "text": {
      "OUEDOO": "สูง 4.5 & คี่",
      "OUEDOE": "สูง 4.5 & คู่",
      "OUEDUO": "ต่ำ 4.5 &คี่",
      "OUEDUE": "ต่ำ 4.5 & คู่"
    },
    "sort": ["OUEDOO", "OUEDOE", "OUEDUO", "OUEDUE"]
  },
  "RUED": {
    "col": 2,
    "text": {
      "RUEDOO": "สูง 4.5 & คี่",
      "RUEDOE": "สูง 4.5 & คู่",
      "RUEDUO": "ต่ำ 4.5 & คี่",
      "RUEDUE": "ต่า 4.5 & คู่"
    },
    "sort": ["RUEDOO", "RUEDOE", "RUEDUO", "RUEDUE"]
  },
  "OUPA": {
    "col": 2,
    "text": {
      "OUPAOH": "สูง 1.5 & ทีมเจ้าบ้าน",
      "OUPAOC": "สูง 1.5 & ทีมเยือน",
      "OUPAUH": "ต่า 1.5 & เจ้าบ้าน",
      "OUPAUC": "ต่า 1.5 & ทีมเยือน"
    },
    "sort": ["OUPAOH", "OUPAOC", "OUPAUH", "OUPAUC"]
  },
  "RUPA": {
    "col": 2,
    "text": {
      "RUPAOH": "สูง 1.5 & เจ้าบ้าน",
      "RUPAOC": "สูง 1.5 & ทีมเยือน",
      "RUPAUH": "ต่า 1.5 & ทีมเจ้าบ้าน",
      "RUPAUC": "ต่ำ 1.5 & ทีมเยือน"
    },
    "sort": ["RUPAOH", "RUPAOC", "RUPAUH", "RUPAUC"]
  },
  "OUPB": {
    "col": 2,
    "text": {
      "OUPBOH": "สูง 2.5 & เจ้าบ้าน",
      "OUPBOC": "สูง 2.5 & ทีมเยือน",
      "OUPBUH": "ต่ำ 2.5 & เจ้าบ้าน",
      "OUPBUC": "ต่ำ 2.5 & ทีมเยือน"
    },
    "sort": ["OUPBOH", "OUPBOC", "OUPBUH", "OUPBUC"]
  },
  "RUPB": {
    "col": 2,
    "text": {
      "RUPBOH": "สูง 2.5 & เจ้าบ้าน",
      "RUPBOC": "สูง 2.5 & ทีมเยือน",
      "RUPBUH": "ต่ำ 2.5 & เจ้าบ้าน",
      "RUPBUC": "ต่ำ 2.5 & ทีมเยือน"
    },
    "sort": ["RUPBOH", "RUPBOC", "RUPBUH", "RUPBUC"]
  },
  "OUPC": {
    "col": 2,
    "text": {
      "OUPCOH": "สูง3.5 & เจ้าบ้าน",
      "OUPCOC": "สูง 3.5 & ทีมเยือน",
      "OUPCUH": "ต่ำ 3.5 & เจ้าบ้าน",
      "OUPCUC": "ต่ำ 3.5 & ทีมเยือน"
    },
    "sort": ["OUPCOH", "OUPCOC", "OUPCUH", "OUPCUC"]
  },
  "RUPC": {
    "col": 2,
    "text": {
      "RUPCOH": "สูง 3.5 & ทีมเจ้าบ้าน",
      "RUPCOC": "สูง 3.5 & ทีมเยือน",
      "RUPCUH": "ต่ำ 3.5 & ทีมเจ้าบ้าน",
      "RUPCUC": "ต่ำ 3.5 & ทีมเยือน"
    },
    "sort": ["RUPCOH", "RUPCOC", "RUPCUH", "RUPCUC"]
  },
  "OUPD": {
    "col": 2,
    "text": {
      "OUPDOH": "สูง 4.5 & ทีมเจ้าบ้าน",
      "OUPDOC": "สูง 4.5 & ทีมเยือน",
      "OUPDUH": "ต่ำ 4.5 & ทีมเจ้าบ้าน",
      "OUPDUC": "ต่ำ 4.5 & ทีมเยือน"
    },
    "sort": ["OUPDOH", "OUPDOC", "OUPDUH", "OUPDUC"]
  },
  "RUPD": {
    "col": 2,
    "text": {
      "RUPDOH": "สูง 4.5 & เจ้าบ้าน",
      "RUPDOC": "สูง 4.5 & ทีมเยือน",
      "RUPDUH": "ต่ำ 4.5 & เจ้าบ้าน",
      "RUPDUC": "ต่ำ 4.5 & ทีมเยือน"
    },
    "sort": ["RUPDOH", "RUPDOC", "RUPDUH", "RUPDUC"]
  },
  "RPF": {
    "col": 2,
    "text": {"RPF1": "รอบที่3", "RPF2": "รอบที่4", "RPF3": "รอบที่5", "RPFOV": "รอบที่6หรือต่อไป"},
    "sort": ["RPF1", "RPF2", "RPF3", "RPFOV"]
  },
  "RPXA": {
    "col": 3,
    "text": {"RPXAH": "{homeTeam}", "RPXAN": "เสมอ", "RPXAC": "{awayTeam}"},
    "sort": ["RPXAH", "RPXAN", "RPXAC"]
  },
  "RPXB": {
    "col": 3,
    "text": {"RPXBH": "{homeTeam}", "RPXBN": "เสมอ", "RPXBC": "{awayTeam}"},
    "sort": ["RPXBH", "RPXBN", "RPXBC"]
  },
  "RPXC": {
    "col": 3,
    "text": {"RPXCH": "{homeTeam}", "RPXCN": "เสมอ", "RPXCC": "{awayTeam}"},
    "sort": ["RPXCH", "RPXCN", "RPXCC"]
  },
  "RPXD": {
    "col": 3,
    "text": {"RPXDH": "{homeTeam}", "RPXDN": "เสมอ", "RPXDC": "{awayTeam}"},
    "sort": ["RPXDH", "RPXDN", "RPXDC"]
  },
  "RPXE": {
    "col": 3,
    "text": {"RPXEH": "{homeTeam}", "RPXEN": "เสมอ", "RPXEC": "{awayTeam}"},
    "sort": ["RPXEH", "RPXEN", "RPXEC"]
  },
  "RPXF": {
    "col": 3,
    "text": {"RPXFH": "{homeTeam}", "RPXFN": "เสมอ", "RPXFC": "{awayTeam}"},
    "sort": ["RPXFH", "RPXFN", "RPXFC"]
  },
  "RPXG": {
    "col": 3,
    "text": {"RPXGH": "{homeTeam}", "RPXGN": "เสมอ", "RPXGC": "{awayTeam}"},
    "sort": ["RPXGH", "RPXGN", "RPXGC"]
  },
  "RPXH": {
    "col": 3,
    "text": {"RPXHH": "{homeTeam}", "RPXHN": "เสมอ", "RPXHC": "{awayTeam}"},
    "sort": ["RPXHH", "RPXHN", "RPXHC"]
  },
  "RPXI": {
    "col": 3,
    "text": {"RPXIH": "{homeTeam}", "RPXIN": "เสมอ", "RPXIC": "{awayTeam}"},
    "sort": ["RPXIH", "RPXIN", "RPXIC"]
  },
  "RPXJ": {
    "col": 3,
    "text": {"RPXJH": "{homeTeam}", "RPXJN": "เสมอ", "RPXJC": "{awayTeam}"},
    "sort": ["RPXJH", "RPXJN", "RPXJC"]
  },
  "RPXK": {
    "col": 3,
    "text": {"RPXKH": "{homeTeam}", "RPXKN": "เสมอ", "RPXKC": "{awayTeam}"},
    "sort": ["RPXKH", "RPXKN", "RPXKC"]
  },
  "RPXL": {
    "col": 3,
    "text": {"RPXLH": "{homeTeam}", "RPXLN": "เสมอ", "RPXLC": "{awayTeam}"},
    "sort": ["RPXLH", "RPXLN", "RPXLC"]
  },
  "RPXM": {
    "col": 3,
    "text": {"RPXMH": "{homeTeam}", "RPXMN": "เสมอ", "RPXMC": "{awayTeam}"},
    "sort": ["RPXMH", "RPXMN", "RPXMC"]
  },
  "RPXN": {
    "col": 3,
    "text": {"RPXNH": "{homeTeam}", "RPXNN": "เสมอ", "RPXNC": "{awayTeam}"},
    "sort": ["RPXNH", "RPXNN", "RPXNC"]
  },
  "RPXO": {
    "col": 3,
    "text": {"RPXOH": "{homeTeam}", "RPXON": "เสมอ", "RPXOC": "{awayTeam}"},
    "sort": ["RPXOH", "RPXON", "RPXOC"]
  },
  "RSCA": {
    "col": 2,
    "text": {"RSCAY": "ใช่", "RSCAN": "ไม่่"},
    "sort": ["RSCAY", "RSCAN"]
  },
  "RSCB": {
    "col": 2,
    "text": {"RSCBY": "ใช่", "RSCBN": "ไม่่"},
    "sort": ["RSCBY", "RSCBN"]
  },
  "RSCC": {
    "col": 2,
    "text": {"RSCCY": "ใช่", "RSCCN": "ไม่่"},
    "sort": ["RSCCY", "RSCCN"]
  },
  "RSCD": {
    "col": 2,
    "text": {"RSCDY": "ใช่", "RSCDN": "ไม่"},
    "sort": ["RSCDY", "RSCDN"]
  },
  "RSCE": {
    "col": 2,
    "text": {"RSCEY": "ใช่", "RSCEN": "ไม่่"},
    "sort": ["RSCEY", "RSCEN"]
  },
  "RSCF": {
    "col": 2,
    "text": {"RSCFY": "ใช่", "RSCFN": "ไม่่"},
    "sort": ["RSCFY", "RSCFN"]
  },
  "RSCG": {
    "col": 2,
    "text": {"RSCGY": "ใช่", "RSCGN": "ไม่"},
    "sort": ["RSCGY", "RSCGN"]
  },
  "RSCH": {
    "col": 2,
    "text": {"RSCHY": "ใช่", "RSCHN": "ไม่"},
    "sort": ["RSCHY", "RSCHN"]
  },
  "RSCI": {
    "col": 2,
    "text": {"RSCIY": "ใช่", "RSCIN": "ไม่"},
    "sort": ["RSCIY", "RSCIN"]
  },
  "RSCJ": {
    "col": 2,
    "text": {"RSCJY": "ใช่", "RSCJN": "ไม่"},
    "sort": ["RSCJY", "RSCJN"]
  },
  "RSCK": {
    "col": 2,
    "text": {"RSCKY": "ใช่", "RSCKN": "ไม่"},
    "sort": ["RSCKY", "RSCKN"]
  },
  "RSCL": {
    "col": 2,
    "text": {"RSCLY": "ใช่", "RSCLN": "ไม่"},
    "sort": ["RSCLY", "RSCLN"]
  },
  "RSCM": {
    "col": 2,
    "text": {"RSCMY": "ใช่", "RSCMN": "ไม่"},
    "sort": ["RSCMY", "RSCMN"]
  },
  "RSCN": {
    "col": 2,
    "text": {"RSCNY": "ใช่", "RSCNN": "ไม่"},
    "sort": ["RSCNY", "RSCNN"]
  },
  "RSCO": {
    "col": 2,
    "text": {"RSCOY": "ใช่", "RSCON": "ไม่"},
    "sort": ["RSCOY", "RSCON"]
  },
  "RSHA": {
    "col": 2,
    "text": {"RSHAY": "ใช่", "RSHAN": "ไม่"},
    "sort": ["RSHAY", "RSHAN"]
  },
  "RSHB": {
    "col": 2,
    "text": {"RSHBY": "ใช่", "RSHBN": "ไม่"},
    "sort": ["RSHBY", "RSHBN"]
  },
  "RSHC": {
    "col": 2,
    "text": {"RSHCY": "ใช่", "RSHCN": "ไม่"},
    "sort": ["RSHCY", "RSHCN"]
  },
  "RSHD": {
    "col": 2,
    "text": {"RSHDY": "ใช่", "RSHDN": "ไม่"},
    "sort": ["RSHDY", "RSHDN"]
  },
  "RSHE": {
    "col": 2,
    "text": {"RSHEY": "ใช่", "RSHEN": "ไม่"},
    "sort": ["RSHEY", "RSHEN"]
  },
  "RSHF": {
    "col": 2,
    "text": {"RSHFY": "ใช่", "RSHFN": "ไม่"},
    "sort": ["RSHFY", "RSHFN"]
  },
  "RSHG": {
    "col": 2,
    "text": {"RSHGY": "ใช่", "RSHGN": "ไม่"},
    "sort": ["RSHGY", "RSHGN"]
  },
  "RSHH": {
    "col": 2,
    "text": {"RSHHY": "ใช่", "RSHHN": "ไม่"},
    "sort": ["RSHHY", "RSHHN"]
  },
  "RSHI": {
    "col": 2,
    "text": {"RSHIY": "ใช่", "RSHIN": "ไม่"},
    "sort": ["RSHIY", "RSHIN"]
  },
  "RSHJ": {
    "col": 2,
    "text": {"RSHJY": "ใช่", "RSHJN": "ไม่"},
    "sort": ["RSHJY", "RSHJN"]
  },
  "RSHK": {
    "col": 2,
    "text": {"RSHKY": "ใช่", "RSHKN": "ไม่"},
    "sort": ["RSHKY", "RSHKN"]
  },
  "RSHL": {
    "col": 2,
    "text": {"RSHLY": "ใช่", "RSHLN": "ไม่"},
    "sort": ["RSHLY", "RSHLN"]
  },
  "RSHM": {
    "col": 2,
    "text": {"RSHMY": "ใช่", "RSHMN": "ไม่"},
    "sort": ["RSHMY", "RSHMN"]
  },
  "RSHN": {
    "col": 2,
    "text": {"RSHNY": "ใช่", "RSHNN": "ไม่"},
    "sort": ["RSHNY", "RSHNN"]
  },
  "RSHO": {
    "col": 2,
    "text": {"RSHOY": "ใช่", "RSHON": "ไม่"},
    "sort": ["RSHOY", "RSHON"]
  },
  "RTW": {
    "col": 2,
    "text": {
      "RTWH1": "เจ้าบ้านผลต่าง1ลูก",
      "RTWH2": "เจ้าบ้านผลต่าง2ลูก",
      "RTWHOV": "เจ้าบ้านผลต่าง3ลูกขึ้นไป",
      "RTWC1": "ทีมเยือนผลต่าง1ลูก",
      "RTWC2": "ทีมเยือนผลต่าง2ลูก",
      "RTWCOV": "ทีมเยือนผลต่าง3ลูกขึ้นไป",
      "RTW0": "ไม่มีลูกที่เข้า",
      "RTWN": "คะแนนอื่นๆเสมอกัน"
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
    "text": {"TARUO": "สูง {ratio}", "TARUU": "ต่ำ {ratio}"},
    "sort": ["TARUO", "TARUU"]
  },
  "TBRU": {
    "col": 2,
    "text": {"TBRUO": "สูง {ratio}", "TBRUU": "ต่ำ {ratio}"},
    "sort": ["TBRUO", "TBRUU"]
  },
  "TCRU": {
    "col": 2,
    "text": {"TCRUO": "สูง {ratio}", "TCRUU": "ต่ำ {ratio}"},
    "sort": ["TCRUO", "TCRUU"]
  },
  "TDRU": {
    "col": 2,
    "text": {"TDRUO": "สูง {ratio}", "TDRUU": "ต่ำ {ratio}"},
    "sort": ["TDRUO", "TDRUU"]
  },
  "TERU": {
    "col": 2,
    "text": {"TERUO": "สูง {ratio}", "TERUU": "ต่ำ {ratio}"},
    "sort": ["TERUO", "TERUU"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "คี่", "EOHE": "คู่"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "คี่", "EOCE": "คู่"},
    "sort": ["EOCO", "EOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {"REOHO": "คี่", "REOHE": "คู่"},
    "sort": ["REOHO", "REOHE"]
  },
  "REOC": {
    "col": 2,
    "text": {"EOCO": "คี่", "EOCE": "คู่"},
    "sort": ["REOCO", "REOCE"]
  },
  "F2G2": {
    "col": 2,
    "text": {"F2G2H": "{homeTeam}", "F2G2C": "{awayTeam}"},
    "sort": ["F2G2H", "F2G2C"]
  },
  "F3G2": {
    "col": 2,
    "text": {"F3G2H": "{homeTeam}", "F3G2C": "{awayTeam}"},
    "sort": ["F3G2H", "F3G2C"]
  },
  "MPS": {
    "col": 2,
    "text": {
      "MPSHY": "เจ้าบ้านชนะ & ใช่",
      "MPSHN": "เจ้าบ้านชนะ & ไม่",
      "MPSCY": "ทีมเยือนชนะ & ใช่",
      "MPSCN": "ทีมเยือนชนะ & ไม่",
      "MPSNY": "เกมส์เสมอ & ใช่",
      "MPSNN": "เกมส์เสมอ & ไม่"
    },
    "sort": ["MPSHY", "MPSHN", "MPSCY", "MPSCN", "MPSNY", "MPSNN"]
  },
  "OTHOUH": {
    "col": 2,
    "text": {"OTHOUHC": "สูง {ratio}", "OTHOUHH": "ต่ำ {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTHOUC": {
    "col": 2,
    "text": {"OTHOUHC": "สูง {ratio}", "OTHOUHH": "ต่ำ {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTOUH": {
    "col": 2,
    "text": {"OTOUHC": "สูง{ratio}", "OTOUHH": "ต่ำ {ratio}"},
    "sort": ["OTOUHC", "OTOUHH"]
  },
  "OTOUC": {
    "col": 2,
    "text": {"OTOUCC": "สูง {ratio}", "OTOUCH": "ต่ำ {ratio}"},
    "sort": ["OTOUCC", "OTOUCH"]
  },
  "OTTS": {
    "col": 2,
    "text": {"OTTSY": "ใช่", "OTTSN": "ไม่"},
    "sort": ["OTTSY", "OTTSN"]
  },
  "OTARG": {
    "col": 3,
    "text": {"OTARGH": "{homeTeam}", "OTARGC": "{awayTeam}", "OTARGN": "ไม่มีลูกที่เข้า"},
    "sort": ["OTARGH", "OTARGC", "OTARGN"]
  },
  "OTEO": {
    "col": 2,
    "text": {"OTEOO": "คี่", "OTEOE": "คู่"},
    "sort": ["OTEOO", "OTEOE"]
  },
  "OTDC": {
    "col": 3,
    "text": {"OTDCHN": "ทีมเจ้าบ้านกับทีมรวม", "OTDCHC": "ทีมเจ้าบ้านกับทีมเยือน", "OTDCCN": "ทีมรวมและทีมเยือน"},
    "sort": ["OTDCHN", "OTDCHC", "OTDCCN"]
  },
  "OTBRG": {
    "col": 3,
    "text": {"OTBRGH": "{homeTeam}", "OTBRGC": "{awayTeam}", "OTBRGN": "ไม่มีลูกที่เข้า"},
    "sort": ["OTBRGH", "OTBRGC", "OTBRGN"]
  },
  "M3": {
    "col": 3,
    "text": {"M3H": "{homeTeam}", "M3N": "เสมอ", "M3C": "{awayTeam}"},
    "sort": ["M3H", "M3N", "M3C"]
  },
  "SCO1ST": {
    "col": 2,
    "text": {"SCO1ST1": "SCO1ST1", "SCO1ST2": "SCO1ST2"},
    "sort": ["SCO1ST1", "SCO1ST2"]
  },
  "SCOLAST": {
    "col": 2,
    "text": {"SCOLAST1": "SCOLAST1", "SCOLAST2": "SCOLAST2"},
    "sort": ["SCOLAST1", "SCOLAST2"]
  },
  "SCOANT": {
    "col": 2,
    "text": {"SCOANT1": "SCOANT1", "SCOANT2": "SCOANT2"},
    "sort": ["SCOANT1", "SCOANT2"]
  },
  "R_promote": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SDFC": {
    "col": 2,
    "text": {"SDFCH": "{homeTeam}", "SDFCC": "{awayTeam}"},
    "sort": ["SDFCH", "SDFCC"]
  },
  "SDLC": {
    "col": 2,
    "text": {"SDLCH": "{homeTeam}", "SDLCC": "{awayTeam}"},
    "sort": ["SDLCH", "SDLCC"]
  },
  "SDFT": {
    "col": 2,
    "text": {"SDFTH": "{homeTeam}", "SDFTC": "{awayTeam}"},
    "sort": ["SDFTH", "SDFTC"]
  },
  "SDLT": {
    "col": 2,
    "text": {"SDLTH": "{homeTeam}", "SDLTC": "{awayTeam}"},
    "sort": ["SDLTH", "SDLTC"]
  },
  "LO": {
    "col": 2,
    "text": {"LOH": "{homeTeam}", "LOC": "{awayTeam}"},
    "sort": ["LOH", "LOC"]
  },
  "LS": {
    "col": 2,
    "text": {"LSH": "{homeTeam}", "LSC": "{awayTeam}"},
    "sort": ["LSH", "LSC"]
  },
  "OTRNC1": {
    "col": 2,
    "text": {"OTRNC1H": "{homeTeam}", "OTRNC1C": "{awayTeam}"},
    "sort": ["OTRNC1H", "OTRNC1C"]
  },
  "OTRNC2": {
    "col": 2,
    "text": {"OTRNC2H": "{homeTeam}", "OTRNC2C": "{awayTeam}"},
    "sort": ["OTRNC2H", "OTRNC2C"]
  },
  "OTRNC3": {
    "col": 2,
    "text": {"OTRNC3H": "{homeTeam}", "OTRNC3C": "{awayTeam}"},
    "sort": ["OTRNC3H", "OTRNC3C"]
  },
  "OTRNC4": {
    "col": 2,
    "text": {"OTRNC4H": "{homeTeam}", "OTRNC4C": "{awayTeam}"},
    "sort": ["OTRNC4H", "OTRNC4C"]
  },
  "OTRNC5": {
    "col": 2,
    "text": {"OTRNC5H": "{homeTeam}", "OTRNC5C": "{awayTeam}"},
    "sort": ["OTRNC5H", "OTRNC5C"]
  },
  "OTRNBA": {
    "col": 2,
    "text": {"OTRNBAH": "{homeTeam}", "OTRNBAC": "{awayTeam}"},
    "sort": ["OTRNBAH", "OTRNBAC"]
  },
  "OTHOU": {
    "col": 2,
    "text": {"OTHOUC": "สูง {ratio}", "OTHOUH": "ต่ำ {ratio}"},
    "sort": ["OTHOUC", "OTHOUH"]
  },
  "FO": {
    "col": 2,
    "text": {"FOH": "{homeTeam}", "FOC": "{awayTeam}"},
    "sort": ["FOH", "FOC"]
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC"]
  },
  "FGK": {
    "col": 2,
    "text": {"FGKH": "{homeTeam}", "FGKC": "{awayTeam}"},
    "sort": ["FGKH", "FGKC"]
  },
  "LGK": {
    "col": 2,
    "text": {"LGKH": "{homeTeam}", "LGKC": "{awayTeam}"},
    "sort": ["LGKH", "LGKC"]
  },
  "FTI": {
    "col": 2,
    "text": {"FTIH": "{homeTeam}", "FTIC": "{awayTeam}"},
    "sort": ["FTIH", "FTIC"]
  },
  "LTI": {
    "col": 2,
    "text": {"LTIH": "{homeTeam}", "LTIC": "{awayTeam}"},
    "sort": ["LTIH", "LTIC"]
  },
  "FFK": {
    "col": 2,
    "text": {"FFKH": "{homeTeam}", "FFKC": "{awayTeam}"},
    "sort": ["FFKH", "FFKC"]
  },
  "LFK": {
    "col": 2,
    "text": {"LFKH": "{homeTeam}", "LFKC": "{awayTeam}"},
    "sort": ["LFKH", "LFKC"]
  },
  "OTCRG": {
    "col": 3,
    "text": {"OTCRGH": "{homeTeam}", "OTCRGC": "{awayTeam}", "OTCRGN": "ไม่มีลูกที่เข้า"},
    "sort": ["OTCRGH", "OTCRGC", "OTCRGN"]
  },
  "OTDRG": {
    "col": 3,
    "text": {"OTDRGH": "{homeTeam}", "OTDRGC": "{awayTeam}", "OTDRGN": "ไม่มีลูกที่เข้า"},
    "sort": ["OTDRGH", "OTDRGC", "OTDRGN"]
  },
  "T": {
    "col": 2,
    "text": {"T01": "0-1ลูก", "T23": "2-3ลูก", "T46": "4-6ลูก", "OVER": "7ลูก"},
    "sort": ["T01", "T23", "T46", "OVER"]
  },
  "RT": {
    "col": 2,
    "text": {
      "RT01": "0-1ลูก",
      "RT23": "2-3ลูก",
      "RT46": "4-6ลูก",
      "ROVER": "7ลูกขึ้นไป",
      "RT0": "0",
      "RT1": "1",
      "RT2": "2",
      "RTOV": "3+"
    },
    "sort": ["RT01", "RT23", "RT46", "ROVER", "RT0", "RT1", "RT2", "RTOV"]
  },
  "MW": {
    "col": 2,
    "text": {
      "MWH": "เกมส์ฤดูกาลปกติเจ้าบ้านชนะ",
      "MWHOT": "ช่วงต่อเวลาเจ้าบ้านชนะ",
      "MWHPK": "ลูกโทษเจ้าบ้านชนะ",
      "MWC": "เกมส์ฤดูกาลเปกติทีมเยือนชนะ",
      "MWCOT": "ช่วงต่อเวลาทีมเยือนชนะ",
      "MWCPK": "ลูกโทษทีมเยือนชนะ"
    },
    "sort": ["MWH", "MWHOT", "MWHPK", "MWC", "MWCOT", "MWCPK"]
  },
  "OUconner": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOconner": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "Rconner": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUcard": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOcard": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "Rcard": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "HOUcard": {
    "col": 2,
    "text": {"HOUC": "สูง {ratio}", "HOUH": "ต่ำ {ratio}"},
    "sort": ["HOUC", "HOUH"]
  },
  "HRconner": {
    "col": 2,
    "text": {"HRH": "{homeTeam} {ratio}", "HRC": "{awayTeam} {ratio}"},
    "sort": ["HRH", "HRC"]
  },
  "RDT": {
    "col": 2,
    "text": {"RDT0": "0", "RDT1": "1", "RDT2": "2", "RDTOV": "3+"},
    "sort": ["RDT0", "RDT1", "RDT2", "RDTOV"]
  },
  "TTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam}สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RCDOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FSM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เกมส์เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "FSR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FSOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "BP": {
    "col": 2,
    "text": {"BPH": "{homeTeam} {ratio}", "BPC": "{awayTeam} {ratio}"},
    "sort": ["BPH", "BPC"]
  },
  "OSM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เกมส์เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "OSR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OSOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {
    "col": 3,
    "text": {"GSPF": "ผู้ทำประตูแรก", "GLPA": "ผู้กล่นจะเข้าประตูเวลาไหนก็ได้", "GSPL": "ผู้ทำประตูสุดท้าย"},
    "sort": ["GSPF", "GLPA", "GSPL"]
  },
  "HG3": {
    "col": 3,
    "text": {"HG3H": "ครึ่งแรก", "HG3N": "เกมส์เสมอ", "HG3C": "ครึ่งหลัง"},
    "sort": ["HG3H", "HG3N", "HG3C"]
  },
  "UPGM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เกมส์เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPGR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPGOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "SOTM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "SOTR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SOTOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "UPCM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เกมส์เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPCR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPCOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "TG": {
    "col": 2,
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
    "text": {"OUC": "สูง{ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTGOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HW3": {
    "col": 3,
    "text": {
      "HW3H": "{homeTeam} {ratio}",
      "HW3N": "เกมส์เสมอ {ratio}",
      "HW3C": "{awayTeam} {ratio}"
    },
    "sort": ["HW3H", "HW3N", "HW3C"]
  },
  "TCS": {
    "col": 2,
    "text": {
      "TCSHY": "ใช่",
      "TCSHN": "ไม่",
      "TCSCY": "ใช่",
      "TCSCN": "ไม่"
    },
    "sort": ["TCSHY", "TCSHN", "TCSCY", "TCSCN"]
  },
  "TSB": {
    "col": 2,
    "text": {
      "TSBHY": "ใช่",
      "TSBHN": "ไม่",
      "TSBCY": "ใช่",
      "TSBCN": "ไม่"
    },
    "sort": ["TSBHY", "TSBHN", "TSBCY", "TSBCN"]
  },
  
  "HTSB": {
    "col": 2,
    "text": {
      "HTSBHY": "ใช่",
      "HTSBHN": "ไม่",
      "HTSBCY": "ใช่",
      "HTSBCN": "ไม่"
    },
    "sort": ["HTSBHY", "HTSBHN", "HTSBCY", "HTSBCN"]
  },
  "HTSB2": {
    "col": 2,
    "text": {
      "HTSB2HY": "ใช่",
      "HTSB2HN": "ไม่",
      "HTSB2CY": "ใช่",
      "HTSB2CN": "ไม่"
    },
    "sort": ["HTSB2HY", "HTSB2HN", "HTSB2CY", "HTSB2CN"]
  },
  
  "OUT": {
    "col": 2,
    "text": {
      "OUT01": "0-1ลูก",
      "OUT02": "0-2ลูก",
      "OUT03": "0-3ลูก",
      "OUT23": "2-3ลูก",
      "OUT46": "4-6ลูก",
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
    "text": {"TGBY": "ใช่", "TGBN": "ไม่"},
    "sort": ["TGBY", "TGBN"]
  },
  "AHG": {
    "col": 2,
    "text": {
      "AHG0": "0ลูก",
      "AHG01": "0-1ลูก",
      "AHG1+": "1+",
      "AHG2+": "2+",
      "AHG3+": "3+"
    },
    "sort": ["AHG0", "AHG01", "AHG1+", "AHG2+", "AHG3+"]
  },
  "BHG": {
    "col": 2,
    "text": {
      "BHG0": "0ลูก",
      "BHG01": "0-1ลูก",
      "BHG1+": "1+",
      "BHG2+": "2+",
      "BHG3+": "3+"
    },
    "sort": ["BHG0", "BHG01", "BHG1+", "BHG2+", "BHG3+"]
  },
  "T1G": {
    "col": 2,
    "text": {
      "T1G1": "เริ่มการแข่งขัน - 14:59",
      'T1G2': 'ครึ่งแรก15:00 - 29:59',
      'T1G3': 'ครึ่งแรก30:00 - ครึ่งเกมส์เสร็จสิ้น',
      'T1G4': 'เริ่มครึ่งหลัง - 59:59',
      'T1G5': 'ครึ่งหลัง60:00 - 74:59',
      'T1G6': 'ครึ่งหลัง75:00 - เสร็จสิ้น',
      "T1GN": "ไม่มีลูกที่เข้า",
      "T1G7": "1-10นาที",
      "T1G8": "11-20นาที",
      "T1G9": "21-30นาที",
      "T1G10": "31-40นาที",
      "T1G11": "41-50นาที",
      "T1G12": "51-60นาที",
      "T1G13": "61-70นาที",
      "T1G14": "71-80นาที",
      "T1G15": "81-90นาที"
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
    "text": {"BSOY": "ใช่", "BSON": "ไม่"},
    "sort": ["BSOY", "BSON"]
  },
  "FOUB": {
    "col": 2,
    "text": {
      "FOUBHHO": "เจ้าบ้าน/เจ้าบ้าน & สูง 2.5",
      "FOUBHHU": "เจ้าบ้าน/เจ้าบ้าน & ต่ำ 2.5",
      "FOUBHNO": "เจ้าบ้าน/ทีมรวม & สูง 2.5",
      "FOUBHNU": "เจ้าบ้าน/ทีมรวม & ต่ำ 2.5",
      "FOUBHCO": "เจ้าบ้าน/ทีมเยือน& สูง 2.5",
      "FOUBCHO": "ทีมเยือน/เจ้าบ้าน & สูง 2.5",
      "FOUBCCO": "ทีมเยือน/ทีมเยือน & สูง 2.5",
      "FOUBCCU": "ทีมเยือน/ทีมเยือน & ต่ำ 2.5",
      "FOUBCNO": "ทีมเยือน/ทีมรวม &สูง 2.5",
      "FOUBCNU": "ทีมเยือน/ทีมรวม & ต่ำ 2.5",
      "FOUBNNO": "ทีมรวม/ทีมรวม& สูง 2.5",
      "FOUBNNU": "ทีมรวม/ทีมรวม & ต่ำ 2.5",
      "FOUBNHO": "ทีมรวม/เจ้าบ้าน & สูง 2.5",
      "FOUBNHU": "ทีมรวม/เจ้าบ้าน & ต่า 2.5",
      "FOUBNCO": "ทีมรวม/ทีมเยือน & สูง 2.5",
      "FOUBNCU": "ทีมรวม/ทีมเยือน & ต่ำ 2.5"
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
    "text": {
      "HMOUAHO": "เจ้าบ้านชนะ & สูง1.5",
      "HMOUAHU": "เจ้าบ้านชนะ& ต่ำ1.5",
      "HMOUANO": "เกมส์เสมอ & สูง1.5",
      "HMOUANU": "เกมส์เสมอ & ต่ำ1.5",
      "HMOUACO": "ทีมเยือนชนะ & สูง1.5",
      "HMOUACU": "ทีมเยือนชนะ& ต่ำ1.5"
    },
    "sort": ["HMOUAHO", "HMOUAHU", "HMOUANO", "HMOUANU", "HMOUACO", "HMOUACU"]
  },
  "PDD": {
    "col": 2,
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
    "text": {"TGAY": "ใช่", "TGAN": "ไม่"},
    "sort": ["TGAY", "TGAN"]
  },
  "TGC": {
    "col": 2,
    "text": {"TGCY": "ใช่", "TGCN": "ไม่"},
    "sort": ["TGCY", "TGCN"]
  },
  "TGD": {
    "col": 2,
    "text": {"TGDY": "ใช่", "TGDN": "ไม่"},
    "sort": ["TGDY", "TGDN"]
  },
  "TGE": {
    "col": 2,
    "text": {"TGEY": "ใช่", "TGEN": "ไม่"},
    "sort": ["TGEY", "TGEN"]
  },
  "TGF": {
    "col": 2,
    "text": {"TGFY": "ใช่", "TGFN": "ไม่"},
    "sort": ["TGFY", "TGFN"]
  },
  "TGG": {
    "col": 2,
    "text": {"TGGY": "ใช่", "TGGN": "ไม่"},
    "sort": ["TGGY", "TGGN"]
  },
  "HM2_conner": {
    "col": 3,
    "text": {"HM2H": "{homeTeam}", "HM2N": "เสมอ", "HM2C": "{awayTeam}"},
    "sort": ["HM2H", "HM2N", "HM2C"]
  },
  "HOU2_conner": {
    "col": 2,
    "text": {"HOU2C": "สูง {ratio}", "HOU2H": "ต่ำ {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "OU3_conner": {
    "col": 3,
    "text": {"OUC": "สูง {ratio}", "OUE": "พอดี {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUE", "OUH"]
  },
  "W3_conner": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "เสมอ {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "BTSH": {
    "col": 2,
    "text": {"BTSHY": "ใช่", "BTSHN": "ไม่"},
    "sort": ["BTSHY", "BTSHN"]
  },
  "FGTA": {
    "col": 2,
    "text": {
      "FGTAS": "ยิงประตู",
      "FGTAH": "โหม่งบอล",
      "FGTAN": "ไม่มีลูกที่เข้า",
      "FGTAP": "ลูกโทษ",
      "FGTAF": "ฟรีคิก",
      "FGTAO": "ออนโกล"
    },
    "sort": ["FGTAS", "FGTAH", "FGTAN", "FGTAP", "FGTAF", "FGTAO"]
  },
  "FGTB": {
    "col": 2,
    "text": {
      "FGTBS": "ยิงประตู",
      "FGTBH": "โหม่งบอล",
      "FGTBN": "ไม่มีลูกที่เข้า",
      "FGTBP": "ลูกโทษ",
      "FGTBF": "ฟรีคิก",
      "FGTBO": "ออนโกล"
    },
    "sort": ["FGTBS", "FGTBH", "FGTBN", "FGTBP", "FGTBF", "FGTBO"]
  },
  "FGTC": {
    "col": 2,
    "text": {
      "FGTCS": "ยิงประตู",
      "FGTCH": "โหม่งบอล",
      "FGTCN": "ไม่มีลูกที่เข้า",
      "FGTCP": "ลูกโทษ",
      "FGTCF": "ฟรีคิก",
      "FGTCO": "ออนโกล"
    },
    "sort": ["FGTCS", "FGTCH", "FGTCN", "FGTCP", "FGTCF", "FGTCO"]
  },
  "FGTD": {
    "col": 2,
    "text": {
      "FGTDS": "ยิงประตู",
      "FGTDH": "โหม่งบอล",
      "FGTDN": "ไม่มีลูกที่เข้า",
      "FGTDP": "ลูกโทษ",
      "FGTDF": "ฟรีคิก",
      "FGTDO": "ออนโกล"
    },
    "sort": ["FGTDS", "FGTDH", "FGTDN", "FGTDP", "FGTDF", "FGTDO"]
  },
  "FGTE": {
    "col": 2,
    "text": {
      "FGTES": "ยิงประตู",
      "FGTEH": "โหม่งบอล",
      "FGTEN": "ไม่มีลูกที่เข้า",
      "FGTEP": "ลูกโทษ",
      "FGTEF": "ฟรีคิก",
      "FGTEO": "ออนโกล"
    },
    "sort": ["FGTES", "FGTEH", "FGTEN", "FGTEP", "FGTEF", "FGTEO"]
  },
  "FGTF": {
    "col": 2,
    "text": {
      "FGTFS": "ยิงประตู",
      "FGTFH": "โหม่งบอล",
      "FGTFN": "ไม่มีลูกที่เข้า",
      "FGTFP": "ลูกโทษ",
      "FGTFF": "ฟรีคิก",
      "FGTFO": "ออนโกล"
    },
    "sort": ["FGTFS", "FGTFH", "FGTFN", "FGTFP", "FGTFF", "FGTFO"]
  },
  "FGTG": {
    "col": 2,
    "text": {
      "FGTGS": "ยิงประตู",
      "FGTGH": "โหม่งบอล",
      "FGTGN": "ไม่มีลูกที่เข้า",
      "FGTGP": "ลูกโทษ",
      "FGTGF": "ฟรีคิก",
      "FGTGO": "ออนโกล"
    },
    "sort": ["FGTGS", "FGTGH", "FGTGN", "FGTGP", "FGTGF", "FGTGO"]
  },
  "FGTH": {
    "col": 2,
    "text": {
      "FGTHS": "ยิงประตู",
      "FGTHH": "โหม่งบอล",
      "FGTHN": "ไม่มีลูกที่เข้า",
      "FGTHP": "ลูกโทษ",
      "FGTHF": "ฟรีคิก",
      "FGTHO": "ออนโกล"
    },
    "sort": ["FGTHS", "FGTHH", "FGTHN", "FGTHP", "FGTHF", "FGTHO"]
  },
  "FGTI": {
    "col": 2,
    "text": {
      "FGTIS": "ยิงประตู",
      "FGTIH": "โหม่งบอล",
      "FGTIN": "ไม่มีลูกที่เข้า",
      "FGTIP": "ลูกโทษ",
      "FGTIF": "ฟรีคิก",
      "FGTIO": "ออนโกล"
    },
    "sort": ["FGTIS", "FGTIH", "FGTIN", "FGTIP", "FGTIF", "FGTIO"]
  },
  "FGTJ": {
    "col": 2,
    "text": {
      "FGTJS": "ยิงประตู",
      "FGTJH": "โหม่งบอล",
      "FGTJN": "ไม่มีลูกที่เข้า",
      "FGTJP": "ลูกโทษ",
      "FGTJF": "ฟรีคิก",
      "FGTJO": "ออนโกล"
    },
    "sort": ["FGTJS", "FGTJH", "FGTJN", "FGTJP", "FGTJF", "FGTJO"]
  },
  "RT3_conner": {
    "col": 3,
    "text": {"RT3H": "{homeTeam}", "RT3N": "ไม่ใช่ทั้งหมด", "RT3C": "{awayTeam}"},
    "sort": ["RT3H", "RT3N", "RT3C"]
  },
  "RT5_conner": {
    "col": 3,
    "text": {"RT5H": "{homeTeam}", "RT5N": "ไม่ใช่ทั้งหมด", "RT5C": "{awayTeam}"},
    "sort": ["RT5H", "RT5N", "RT5C"]
  },
  "RT7_conner": {
    "col": 3,
    "text": {"RT7H": "{homeTeam}", "RT7N": "ไม่ใช่ทั้งหมด", "RT7C": "{awayTeam}"},
    "sort": ["RT7H", "RT7N", "RT7C"]
  },
  "RT9_conner": {
    "col": 3,
    "text": {"RT9H": "{homeTeam}", "RT9N": "ไม่ใช่ทั้งหมด", "RT9C": "{awayTeam}"},
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
    "col": 2,
    "text": {"HGC1": "ครึ่งแรกมากว่า 0.5 & ครึ่งหลังมากกว่า 0.5"},
    "sort": ["HGC1"]
  },
  "HGC2": {
    "col": 2,
    "text": {"HGC2": "ครึ่งแรกมากว่า 0.5 & ครึ่งหลังมากกว่า 1.5"},
    "sort": ["HGC2"]
  },
  "HGC3": {
    "col": 2,
    "text": {"HGC3": "ครึ่งแรกมากว่า 1.5 & ครึ่งหลังมากกว่า 1.5"},
    "sort": ["HGC3"]
  },
  "W2M": {
    "col": 2,
    "text": {"W2MH": "{homeTeam}", "W2MC": "{awayTeam}"},
    "sort": ["W2MH", "W2MC"]
  },
  "TTB_card": {
    "col": 2,
    "text": {
      "TTBHO": "{homeTeam} สูง {ratio}",
      "TTBHU": "{homeTeam} ต่ำ {ratio}",
      "TTBCO": "{awayTeam} สูง {ratio}",
      "TTBCU": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["TTBHO", "TTBHU", "TTBCO", "TTBCU"]
  },
  "HSR": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ{ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CSR": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ{ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HFS": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CFS": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOS": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "COS": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "PAOU": {
    "col": 2,
    "text": {"OUC": " สูง {ratio}", "OUH": " ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HAR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RTTG": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} สูง {ratio}",
      "ROUHH": "{homeTeam} ต่ำ {ratio}",
      "ROUCC": "{awayTeam} สูง {ratio}",
      "ROUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RLG": {
    "col": 3,
    "text": {"RLGH": "{homeTeam}", "RLGA": "{awayTeam}", "RLGN": "ไม่มีลูกที่เข้า"},
    "sort": ["RLGH", "RLGA", "RLGN"]
  },
  "RTG": {
      'col': 2,
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
    "text": {"HRTSY": "ใช่", "HRTSN": "ไม่ "},
    "sort": ["HRTSY", "HRTSN"]
  },
  "RTGOU": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRTTG": {
    "col": 2,
    "text": {
      "HROUHC": "{homeTeam}สูง {ratio}",
      "HROUHH": "{homeTeam} ต่ำ {ratio}",
      "HROUCC": "{awayTeam} สูง {ratio}",
      "HROUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["HROUHC", "HROUHH", "HROUCC", "HROUCH"]
  },
 
  "RTM": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "เสมอ", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "ROU3_conner": {
    "col": 3,
    "text": {"ROUC": "สูง {ratio}", "ROUE": "พอดี{ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUE", "ROUH"]
  },
  "RW3_conner": {
    "col": 3,
    "text": {
      "RW3H": "{homeTeam} {ratio}",
      "RW3N": "เสมอ {ratio}",
      "RW3C": "{awayTeam} {ratio}"
    },
    "sort": ["RW3H", "RW3N", "RW3C"]
  },
  "NM5A": {
    "col": 3,
    "text": {
      "NM5AGY": "บอลเข้า ใช่",
      "NM5AGN": "บอลเข้า ไม่",
      "NM5ACY": "เตะมุม ใช่",
      "NM5ACN": "เตะมุม ไม่",
      "NM5AFY": "ฟรีคิก ใช่",
      "NM5AFN": "ฟรีคิก ไม่",
      "NM5AKY": "การเตะเข้าประตู ใช่",
      "NM5AKN": "การเตะเข้าประตู ไม่",
      "NM5ABY": "บอลนอกขอบเขต ใช่",
      "NM5ABN": "บอลนอกขอบเขต ไม่",
      "NM5APY": "ลูกโทษ ใช่",
      "NM5APN": "ลูกโทษ ไม่"
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
    "text": {
      "NM5BGY": "บอลเข้า ใช่",
      "NM5BGN": "บอลเข้า ไม่",
      "NM5BCY": "เตะมุม ใช่",
      "NM5BCN": "เตะมุม ไม่",
      "NM5BFY": "ฟรีคิก ใช่",
      "NM5BFN": "ฟรีคิก ไม่",
      "NM5BKY": "การเตะเข้าประตู ใช่",
      "NM5BKN": "การเตะเข้าประตู ไม่",
      "NM5BBY": "บอลนอกขอบเขต ใช่",
      "NM5BBN": "บอลนอกขอบเขต ไม่",
      "NM5BPY": "ลูกโทษ ใช่",
      "NM5BPN": "ลูกโทษ ไม่"
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
    "text": {
      "NM5CGY": "บอลเข้า ใช่",
      "NM5CGN": "บอลเข้า ไม่",
      "NM5CCY": "เตะมุม ใช่",
      "NM5CCN": "เตะมุม ไม่",
      "NM5CFY": "ฟรีคิก ใช่",
      "NM5CFN": "ฟรีคิก ไม่",
      "NM5CKY": "การเตะเข้าประตู ใช่",
      "NM5CKN": "การเตะเข้าประตู ไม่",
      "NM5CBY": "บอลนอกขอบเขต ใช่",
      "NM5CBN": "บอลนอกขอบเขต ไม่",
      "NM5CPY": "ลูกโทษ ใช่",
      "NM5CPN": "ลูกโทษ ไม่"
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
    "text": {
      "NM5DGY": "บอลเข้า ใช่",
      "NM5DGN": "บอลเข้า ไม่",
      "NM5DCY": "เตะมุม ใช่",
      "NM5DCN": "เตะมุม ไม่",
      "NM5DFY": "ฟรีคิก ใช่",
      "NM5DFN": "ฟรีคิก ไม่",
      "NM5DKY": "การเตะเข้าประตู ใช่",
      "NM5DKN": "การเตะเข้าประตู ไม่",
      "NM5DBY": "บอลนอกขอบเขต ใช่",
      "NM5DBN": "บอลนอกขอบเขต ไม่",
      "NM5DPY": "ลูกโทษ ใช่",
      "NM5DPN": "ลูกโทษ ไม่"
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
    "text": {
      "NM1AGY": "บอลเข้า ใช่",
      "NM1AGN": "บอลเข้า ไม่",
      "NM1ACY": "เตะมุม ใช่",
      "NM1ACN": "เตะมุม ไม่",
      "NM1AFY": "ฟรีคิก ใช่",
      "NM1AFN": "ฟรีคิก ไม่",
      "NM1AKY": "การเตะเข้าประตู ใช่",
      "NM1AKN": "การเตะเข้าประตู ไม่",
      "NM1ABY": "บอลนอกขอบเขต ใช่",
      "NM1ABN": "บอลนอกขอบเขต ไม่"
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
    "text": {
      "NM1BGY": "บอลเข้า ใช่",
      "NM1BGN": "บอลเข้า ไม่",
      "NM1BCY": "เตะมุม ใช่",
      "NM1BCN": "เตะมุม ไม่",
      "NM1BFY": "ฟรีคิก ใช่",
      "NM1BFN": "ฟรีคิก ไม่",
      "NM1BKY": "การเตะเข้าประตู ใช่",
      "NM1BKN": "การเตะเข้าประตู ไม่",
      "NM1BBY": "บอลนอกขอบเขต ใช่",
      "NM1BBN": "บอลนอกขอบเขต ไม่"
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
    "text": {
      "NM1CGY": "บอลเข้า ใช่",
      "NM1CGN": "บอลเข้า ไม่",
      "NM1CCY": "เตะมุม ใช่",
      "NM1CCN": "เตะมุม ไม่",
      "NM1CFY": "ฟรีคิก ใช่",
      "NM1CFN": "ฟรีคิก ไม่",
      "NM1CKY": "การเตะเข้าประตู ใช่",
      "NM1CKN": "การเตะเข้าประตู ไม่",
      "NM1CBY": "บอลนอกขอบเขต ใช่",
      "NM1CBN": "บอลนอกขอบเขต ไม่"
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
    "text": {
      "NM1DGY": "บอลเข้า ใช่",
      "NM1DGN": "บอลเข้า ไม่",
      "NM1DCY": "เตะมุม ใช่",
      "NM1DCN": "เตะมุม ไม่",
      "NM1DFY": "ฟรีคิก ใช่",
      "NM1DFN": "ฟรีคิก ไม่",
      "NM1DKY": "การเตะเข้าประตู ใช่",
      "NM1DKN": "การเตะเข้าประตู ไม่",
      "NM1DBY": "บอลนอกขอบเขต ใช่",
      "NM1DBN": "บอลนอกขอบเขต ไม่"
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
    "text": {
      "WH5MAG": 'บอลเข้า',
      "WH5MAC": 'เตะมุม',
      "WH5MAP": 'ลูกโทษ',
      "WH5MAD": 'แจกใบ',
      "WH5MAF": 'ฟรีคิก',
      "WH5MAK": 'การเตะเข้าประตู',
      "WH5MAB": 'บอลนอกขอบเขต',
      "WH5MAN": 'ไม่มีเหตุการณ์ใดๆ',
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
    'text': {
      'WH5MBG': 'บอลเข้า',
      'WH5MBC': 'เตะมุม',
      'WH5MBP': 'ลูกโทษ',
      'WH5MBD': 'แจกใบ',
      'WH5MBF': 'ฟรีคิก',
      'WH5MBK': 'การเตะเข้าประตู',
      'WH5MBB': 'บอลนอกขอบเขต',
      'WH5MBN': 'ไม่มีเหตุการณ์ใดๆ',
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
    'text': {
      'WH5MCG': 'บอลเข้า',
      'WH5MCC': 'เตะมุม',
      'WH5MCP': 'ลูกโทษ',
      'WH5MCD': 'แจกใบ',
      'WH5MCF': 'ฟรีคิก',
      'WH5MCK': 'การเตะเข้าประตู',
      'WH5MCB': 'บอลนอกขอบเขต',
      'WH5MCN': 'ไม่มีเหตุการณ์ใดๆ',
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
    'text': {
      'WH5MDG': 'บอลเข้า',
      'WH5MDC': 'เตะมุม',
      'WH5MDP': 'ลูกโทษ',
      'WH5MDD': 'แจกใบ',
      'WH5MDF': 'ฟรีคิก',
      'WH5MDK': 'การเตะเข้าประตู',
      'WH5MDB': 'บอลนอกขอบเขต',
      'WH5MDN': 'ไม่มีเหตุการณ์ใดๆ',
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
    "text": {
      "WH1MAG": "บอลเข้า",
      "WH1MAC": "เตะมุม",
      'WH1MAD': 'แจกใบ',
      'WH1MAP': 'ลูกโทษ',
      "WH1MAF": "ฟรีคิก",
      "WH1MAK": "การเตะเข้าประตู",
      "WH1MAB": "บอลนอกขอบเขต",
      "WH1MAN": "ไม่มีเหตุการณ์ใดๆ"
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
    "text": {
      "WH1MBG": "บอลเข้า",
      "WH1MBC": "เตะมุม",
      'WH1MBD': 'แจกใบ',
      'WH1MBP': 'ลูกโทษ',
      "WH1MBF": "ฟรีคิก",
      "WH1MBK": "การเตะเข้าประตู",
      "WH1MBB": "บอลนอกขอบเขต",
      "WH1MBN": "ไม่มีเหตุการณ์ใดๆ"
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
    "text": {
      "WH1MCG": "บอลเข้า",
      "WH1MCC": "เตะมุม",
      'WH1MCD': 'แจกใบ',
      'WH1MCP': 'ลูกโทษ',
      "WH1MCF": "ฟรีคิก",
      "WH1MCK": "การเตะเข้าประตู",
      "WH1MCB": "บอลนอกขอบเขต",
      "WH1MCN": "ไม่มีเหตุการณ์ใดๆ"
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
    "text": {
      "WH1MDG": "บอลเข้า",
      "WH1MDC": "เตะมุม",
      'WH1MDD': 'แจกใบ',
      'WH1MDP': 'ลูกโทษ',
      "WH1MDF": "ฟรีคิก",
      "WH1MDK": "การเตะเข้าประตู",
      "WH1MDB": "บอลนอกขอบเขต",
      "WH1MDN": "ไม่มีเหตุการณ์ใดๆ"
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
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC3_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC4_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC5_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC6_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC7_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC8_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC9_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC10_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC11_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC12_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC13_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC14_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC15_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC16_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC17_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC18_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC19_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC20_conner": {
    "col": 2,
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
    "text": {"TEARMH": "{homeTeam}", "TEARMN": "เสมอ", "TEARMC": "{awayTeam}"},
    "sort": ["TEARMH", "TEARMN", "TEARMC"]
  },
  "TEAR": {
    "col": 2,
    "text": {"TEARH": "{homeTeam} {ratio}", "TEARC": "{awayTeam} {ratio}"},
    "sort": ["TEARH", "TEARC"]
  },
  "TEAROU": {
    "col": 2,
    "text": {"TEAROUO": "สูง {ratio}", "TEAROUU": "ต่ำ {ratio}"},
    "sort": ["TEAROUO", "TEAROUU"]
  },
  "FIARM": {
    "col": 3,
    "text": {"FIARMH": "{homeTeam}", "FIARMN": "เสมอ", "FIARMC": "{awayTeam}"},
    "sort": ["FIARMH", "FIARMN", "FIARMC"]
  },
  "FIAR": {
    "col": 2,
    "text": {"FIARH": "{homeTeam} {ratio}", "FIARC": "{awayTeam} {ratio}"},
    "sort": ["FIARH", "FIARC"]
  },
  "FIBROU": {
    "col": 2,
    "text": {"FIBROUO": "สูง {ratio}", "FIBROUU": "ต่ำ {ratio}"},
    "sort": ["FIBROUO", "FIBROUU"]
  },
  "TEBRM": {
    "col": 3,
    "text": {"TEBRMH": "{homeTeam}", "TEBRMN": "เสมอ", "TEBRMC": "{awayTeam}"},
    "sort": ["TEBRMH", "TEBRMN", "TEBRMC"]
  },
  "TEBR": {
    "col": 2,
    "text": {"TEBRH": "{homeTeam} {ratio}", "TEBRC": "{awayTeam} {ratio}"},
    "sort": ["TEBRH", "TEBRC"]
  },
  "TEBROU": {
    "col": 2,
    "text": {"TEBROUO": "สูง {ratio}", "TEBROUU": "ต่ำ {ratio}"},
    "sort": ["TEBROUO", "TEBROUU"]
  },
  "SAARM": {
    "col": 3,
    "text": {"SAARMH": "{homeTeam}", "SAARMN": "เสมอ", "SAARMC": "{awayTeam}"},
    "sort": ["SAARMH", "SAARMN", "SAARMC"]
  },
  "SAAR": {
    "col": 2,
    "text": {"SAARH": "{homeTeam} {ratio}", "SAARC": "{awayTeam} {ratio}"},
    "sort": ["SAARH", "SAARC"]
  },
  "SAAROU": {
    "col": 2,
    "text": {"SAAROUO": "สูง {ratio}", "SAAROUU": "ต่ำ {ratio}"},
    "sort": ["SAAROUO", "SAAROUU"]
  },
  "FICRM": {
    "col": 3,
    "text": {"FICRMH": "{homeTeam}", "FICRMN": "เสมอ", "FICRMC": "{awayTeam}"},
    "sort": ["FICRMH", "FICRMN", "FICRMC"]
  },
  "FICR": {
    "col": 2,
    "text": {"FICRH": "{homeTeam} {ratio}", "FICRC": "{awayTeam} {ratio}"},
    "sort": ["FICRH", "FICRC"]
  },
  "FICROU": {
    "col": 2,
    "text": {"FICROUO": "สูง {ratio}", "FICROUU": "ต่ำ {ratio}"},
    "sort": ["FICROUO", "FICROUU"]
  },
  "FIDRM": {
    "col": 3,
    "text": {"FIDRMH": "{homeTeam}", "FIDRMN": "เสมอ", "FIDRMC": "{awayTeam}"},
    "sort": ["FIDRMH", "FIDRMN", "FIDRMC"]
  },
  "FIDR": {
    "col": 2,
    "text": {"FIDRH": "{homeTeam} {ratio}", "FIDRC": "{awayTeam} {ratio}"},
    "sort": ["FIDRH", "FIDRC"]
  },
  "FIDROU": {
    "col": 2,
    "text": {"FIDROUO": "สูง {ratio}", "FIDROUU": "ต่ำ {ratio}"},
    "sort": ["FIDROUO", "FIDROUU"]
  },
  "FIERM": {
    "col": 3,
    "text": {"FIERMH": "{homeTeam}", "FIERMN": "เสมอ", "FIERMC": "{awayTeam}"},
    "sort": ["FIERMH", "FIERMN", "FIERMC"]
  },
  "FIER": {
    "col": 2,
    "text": {"FIERH": "{homeTeam} {ratio}", "FIERC": "{awayTeam} {ratio}"},
    "sort": ["FIERH", "FIERC"]
  },
  "FIEROU": {
    "col": 2,
    "text": {"FIEROUO": "สูง {ratio}", "FIEROUU": "ต่ำ {ratio}"},
    "sort": ["FIEROUO", "FIEROUU"]
  },
  "FIFRM": {
    "col": 3,
    "text": {"FIFRMH": "{homeTeam}", "FIFRMN": "เสมอ", "FIFRMC": "{awayTeam}"},
    "sort": ["FIFRMH", "FIFRMN", "FIFRMC"]
  },
  "FIFR": {
    "col": 2,
    "text": {"FIFRH": "{homeTeam} {ratio}", "FIFRC": "{awayTeam} {ratio}"},
    "sort": ["FIFRH", "FIFRC"]
  },
  "FIFROU": {
    "col": 2,
    "text": {"FIFROUO": "สูง {ratio}", "FIFROUU": "ต่ำ {ratio}"},
    "sort": ["FIFROUO", "FIFROUU"]
  },
  "FIGRM": {
    "col": 3,
    "text": {"FIGRMH": "{homeTeam}", "FIGRMN": "เสมอ", "FIGRMC": "{awayTeam}"},
    "sort": ["FIGRMH", "FIGRMN", "FIGRMC"]
  },
  "FIGR": {
    "col": 2,
    "text": {"FIGRH": "{homeTeam} {ratio}", "FIGRC": "{awayTeam} {ratio}"},
    "sort": ["FIGRH", "FIGRC"]
  },
  "FIGROU": {
    "col": 2,
    "text": {"FIGROUO": "สูง {ratio}", "FIGROUU": "ต่ำ {ratio}"},
    "sort": ["FIGROUO", "FIGROUU"]
  },
  "FIHRM": {
    "col": 3,
    "text": {"FIHRMH": "{homeTeam}", "FIHRMN": "เสมอ", "FIHRMC": "{awayTeam}"},
    "sort": ["FIHRMH", "FIHRMN", "FIHRMC"]
  },
  "FIHR": {
    "col": 2,
    "text": {"FIHRH": "{homeTeam} {ratio}", "FIHRC": "{awayTeam} {ratio}"},
    "sort": ["FIHRH", "FIHRC"]
  },
  "FIHROU": {
    "col": 2,
    "text": {"FIHROUO": " สูง {ratio}", "FIHROUU": "ต่ำ {ratio}"},
    "sort": ["FIHROUO", "FIHROUU"]
  },
  "FIIRM": {
    "col": 3,
    "text": {"FIIRMH": "{homeTeam}", "FIIRMN": "เสมอ", "FIIRMC": "{awayTeam}"},
    "sort": ["FIIRMH", "FIIRMN", "FIIRMC"]
  },
  "FIIR": {
    "col": 2,
    "text": {"FIIRH": "{homeTeam} {ratio}", "FIIRC": "{awayTeam} {ratio}"},
    "sort": ["FIIRH", "FIIRC"]
  },
  "FIIROU": {
    "col": 2,
    "text": {"FIIROUO": "สูง {ratio}", "FIIROUU": "ต่ำ {ratio}"},
    "sort": ["FIIROUO", "FIIROUU"]
  },
  "FIJRM": {
    "col": 3,
    "text": {"FIJRMH": "{homeTeam}", "FIJRMN": "เสมอ", "FIJRMC": "{awayTeam}"},
    "sort": ["FIJRMH", "FIJRMN", "FIJRMC"]
  },
  "FIJR": {
    "col": 2,
    "text": {"FIJRH": "{homeTeam} {ratio}", "FIJRC": "{awayTeam} {ratio}"},
    "sort": ["FIJRH", "FIJRC"]
  },
  "FIJROU": {
    "col": 2,
    "text": {"FIJROUO": "สูง {ratio}", "FIJROUU": "ต่ำ {ratio}"},
    "sort": ["FIJROUO", "FIJROUU"]
  },
  "FIKRM": {
    "col": 3,
    "text": {"FIKRMH": "{homeTeam}", "FIKRMN": "เสมอ", "FIKRMC": "{awayTeam}"},
    "sort": ["FIKRMH", "FIKRMN", "FIKRMC"]
  },
  "FIKR": {
    "col": 2,
    "text": {"FIKRH": "{homeTeam} {ratio}", "FIKRC": "{awayTeam} {ratio}"},
    "sort": ["FIKRH", "FIKRC"]
  },
  "FIKROU": {
    "col": 2,
    "text": {"FIKROUO": "สูง {ratio}", "FIKROUU": "ต่ำ {ratio}"},
    "sort": ["FIKROUO", "FIKROUU"]
  },
  "FILRM": {
    "col": 3,
    "text": {"FILRMH": "{homeTeam}", "FILRMN": "เสมอ", "FILRMC": "{awayTeam}"},
    "sort": ["FILRMH", "FILRMN", "FILRMC"]
  },
  "FILR": {
    "col": 2,
    "text": {"FILRH": "{homeTeam} {ratio}", "FILRC": "{awayTeam} {ratio}"},
    "sort": ["FILRH", "FILRC"]
  },
  "FILROU": {
    "col": 2,
    "text": {"FILROUO": "สูง {ratio}", "FILROUU": "ต่ำ {ratio}"},
    "sort": ["FILROUO", "FILROUU"]
  },
  "FIMRM": {
    "col": 3,
    "text": {"FIMRMH": "{homeTeam}", "FIMRMN": "เสมอ", "FIMRMC": "{awayTeam}"},
    "sort": ["FIMRMH", "FIMRMN", "FIMRMC"]
  },
  "FIMR": {
    "col": 2,
    "text": {"FIMRH": "{homeTeam} {ratio}", "FIMRC": "{awayTeam} {ratio}"},
    "sort": ["FIMRH", "FIMRC"]
  },
  "FIMROU": {
    "col": 2,
    "text": {"FIMROUO": "สูง {ratio}", "FIMROUU": "ต่ำ {ratio}"},
    "sort": ["FIMROUO", "FIMROUU"]
  },
  "FINRM": {
    "col": 3,
    "text": {"FINRMH": "{homeTeam}", "FINRMN": "เสมอ", "FINRMC": "{awayTeam}"},
    "sort": ["FINRMH", "FINRMN", "FINRMC"]
  },
  "FINR": {
    "col": 2,
    "text": {"FINRH": "{homeTeam} {ratio}", "FINRC": "{awayTeam} {ratio}"},
    "sort": ["FINRH", "FINRC"]
  },
  "FINROU": {
    "col": 2,
    "text": {"FINROUO": "สูง {ratio}", "FINROUU": "ต่ำ {ratio}"},
    "sort": ["FINROUO", "FINROUU"]
  },
  "FIORM": {
    "col": 3,
    "text": {"FIORMH": "{homeTeam}", "FIORMN": "เสมอ", "FIORMC": "{awayTeam}"},
    "sort": ["FIORMH", "FIORMN", "FIORMC"]
  },
  "FIOR": {
    "col": 2,
    "text": {"FIORH": "{homeTeam} {ratio}", "FIORC": "{awayTeam} {ratio}"},
    "sort": ["FIORH", "FIORC"]
  },
  "FIOROU": {
    "col": 2,
    "text": {"FIOROUO": "สูง {ratio}", "FIOROUU": "ต่ำ {ratio}"},
    "sort": ["FIOROUO", "FIOROUU"]
  },
  "FIPRM": {
    "col": 3,
    "text": {"FIPRMH": "{homeTeam}", "FIPRMN": "เสมอ", "FIPRMC": "{awayTeam}"},
    "sort": ["FIPRMH", "FIPRMN", "FIPRMC"]
  },
  "FIPR": {
    "col": 2,
    "text": {"FIPRH": "{homeTeam} {ratio}", "FIPRC": "{awayTeam} {ratio}"},
    "sort": ["FIPRH", "FIPRC"]
  },
  "FIPROU": {
    "col": 2,
    "text": {"FIPROUO": "สูง {ratio}", "FIPROUU": "ต่ำ {ratio}"},
    "sort": ["FIPROUO", "FIPROUU"]
  },
  "FIQRM": {
    "col": 3,
    "text": {"FIQRMH": "{homeTeam}", "FIQRMN": "เสมอ", "FIQRMC": "{awayTeam}"},
    "sort": ["FIQRMH", "FIQRMN", "FIQRMC"]
  },
  "FIQR": {
    "col": 2,
    "text": {"FIQRH": "{homeTeam} {ratio}", "FIQRC": "{awayTeam} {ratio}"},
    "sort": ["FIQRH", "FIQRC"]
  },
  "FIQROU": {
    "col": 2,
    "text": {"FIQROUO": "สูง {ratio}", "FIQROUU": "ต่ำ {ratio}"},
    "sort": ["FIQROUO", "FIQROUU"]
  },
  "TECRM": {
    "col": 3,
    "text": {"TECRMH": "{homeTeam}", "TECRMN": "เสมอ", "TECRMC": "{awayTeam}"},
    "sort": ["TECRMH", "TECRMN", "TECRMC"]
  },
  "TECR": {
    "col": 2,
    "text": {"TECRH": "{homeTeam} {ratio}", "TECRC": "{awayTeam} {ratio}"},
    "sort": ["TECRH", "TECRC"]
  },
  "TECROU": {
    "col": 2,
    "text": {"TECROUO": "สูง {ratio}", "TECROUU": "ต่ำ {ratio}"},
    "sort": ["TECROUO", "TECROUU"]
  },
  "TEDRM": {
    "col": 3,
    "text": {"TEDRMH": "{homeTeam}", "TEDRMN": "เสมอ", "TEDRMC": "{awayTeam}"},
    "sort": ["TEDRMH", "TEDRMN", "TEDRMC"]
  },
  "TEDR": {
    "col": 2,
    "text": {"TEDRH": "{homeTeam} {ratio}", "TEDRC": "{awayTeam} {ratio}"},
    "sort": ["TEDRH", "TEDRC"]
  },
  "TEDROU": {
    "col": 2,
    "text": {"TEDROUO": "สูง {ratio}", "TEDROUU": "ต่ำ {ratio}"},
    "sort": ["TEDROUO", "TEDROUU"]
  },
  "TEERM": {
    "col": 3,
    "text": {"TEERMH": "{homeTeam}", "TEERMN": "เสมอ", "TEERMC": "{awayTeam}"},
    "sort": ["TEERMH", "TEERMN", "TEERMC"]
  },
  "TEER": {
    "col": 2,
    "text": {"TEERH": "{homeTeam} {ratio}", "TEERC": "{awayTeam} {ratio}"},
    "sort": ["TEERH", "TEERC"]
  },
  "TEEROU": {
    "col": 2,
    "text": {"TEEROUO": "สูง {ratio}", "TEEROUU": "ต่ำ {ratio}"},
    "sort": ["TEEROUO", "TEEROUU"]
  },
  "TEFRM": {
    "col": 3,
    "text": {"TEFRMH": "{homeTeam}", "TEFRMN": "เสมอ", "TEFRMC": "{awayTeam}"},
    "sort": ["TEFRMH", "TEFRMN", "TEFRMC"]
  },
  "TEFR": {
    "col": 2,
    "text": {"TEFRH": "{homeTeam} {ratio}", "TEFRC": "{awayTeam} {ratio}"},
    "sort": ["TEFRH", "TEFRC"]
  },
  "TEFROU": {
    "col": 2,
    "text": {"TEFROUO": "สูง {ratio}", "TEFROUU": "ต่ำ {ratio}"},
    "sort": ["TEFROUO", "TEFROUU"]
  },
  "TEGRM": {
    "col": 2,
    "text": {"TEGRMH": "{homeTeam}", "TEGRMN": "เสมอ", "TEGRMC": "{awayTeam}"},
    "sort": ["TEGRMH", "TEGRMN", "TEGRMC"]
  },
  "TEGR": {
    "col": 2,
    "text": {"TEGRH": "{homeTeam} {ratio}", "TEGRC": "{awayTeam} {ratio}"},
    "sort": ["TEGRH", "TEGRC"]
  },
  "TEGROU": {
    "col": 2,
    "text": {"TEGROUO": "สูง {ratio}", "TEGROUU": "ต่ำ {ratio}"},
    "sort": ["TEGROUO", "TEGROUU"]
  },
  "TEHRM": {
    "col": 3,
    "text": {"TEHRMH": "{homeTeam}", "TEHRMN": "เสมอ", "TEHRMC": "{awayTeam}"},
    "sort": ["TEHRMH", "TEHRMN", "TEHRMC"]
  },
  "TEHR": {
    "col": 2,
    "text": {"TEHRH": "{homeTeam} {ratio}", "TEHRC": "{awayTeam} {ratio}"},
    "sort": ["TEHRH", "TEHRC"]
  },
  "TEHROU": {
    "col": 2,
    "text": {"TEHROUO": "สูง {ratio}", "TEHROUU": "ต่ำ {ratio}"},
    "sort": ["TEHROUO", "TEHROUU"]
  },
  "TEIRM": {
    "col": 3,
    "text": {"TEIRMH": "{homeTeam}", "TEIRMN": "เสมอ", "TEIRMC": "{awayTeam}"},
    "sort": ["TEIRMH", "TEIRMN", "TEIRMC"]
  },
  "TEIR": {
    "col": 2,
    "text": {"TEIRH": "{homeTeam} {ratio}", "TEIRC": "{awayTeam} {ratio}"},
    "sort": ["TEIRH", "TEIRC"]
  },
  "TEIROU": {
    "col": 2,
    "text": {"TEIROUO": "สูง {ratio}", "TEIROUU": "ต่ำ {ratio}"},
    "sort": ["TEIROUO", "TEIROUU"]
  },
  "TEJRM": {
    "col": 3,
    "text": {"TEJRMH": "{homeTeam}", "TEJRMN": "เสมอ", "TEJRMC": "{awayTeam}"},
    "sort": ["TEJRMH", "TEJRMN", "TEJRMC"]
  },
  "TEJR": {
    "col": 2,
    "text": {"TEJRH": "{homeTeam} {ratio}", "TEJRC": "{awayTeam} {ratio}"},
    "sort": ["TEJRH", "TEJRC"]
  },
  "TEJROU": {
    "col": 2,
    "text": {"TEJROUO": "สูง {ratio}", "TEJROUU": "ต่ำ {ratio}"},
    "sort": ["TEJROUO", "TEJROUU"]
  },
  "TEKRM": {
    "col": 3,
    "text": {"TEKRMH": "{homeTeam}", "TEKRMN": "เสมอ", "TEKRMC": "{awayTeam}"},
    "sort": ["TEKRMH", "TEKRMN", "TEKRMC"]
  },
  "TEKR": {
    "col": 2,
    "text": {"TEKRH": "{homeTeam} {ratio}", "TEKRC": "{awayTeam} {ratio}"},
    "sort": ["TEKRH", "TEKRC"]
  },
  "TEKROU": {
    "col": 2,
    "text": {"TEKROUO": "สูง {ratio}", "TEKROUU": "ต่ำ {ratio}"},
    "sort": ["TEKROUO", "TEKROUU"]
  },
  "TELRM": {
    "col": 3,
    "text": {"TELRMH": "{homeTeam}", "TELRMN": "เสมอ", "TELRMC": "{awayTeam}"},
    "sort": ["TELRMH", "TELRMN", "TELRMC"]
  },
  "TELR": {
    "col": 2,
    "text": {"TELRH": "{homeTeam} {ratio}", "TELRC": "{awayTeam} {ratio}"},
    "sort": ["TELRH", "TELRC"]
  },
  "TELROU": {
    "col": 2,
    "text": {"TELROUO": "สูง {ratio}", "TELROUU": "ต่ำ {ratio}"},
    "sort": ["TELROUO", "TELROUU"]
  },
  "TEMRM": {
    "col": 3,
    "text": {"TEMRMH": "{homeTeam}", "TEMRMN": "เสมอ", "TEMRMC": "{awayTeam}"},
    "sort": ["TEMRMH", "TEMRMN", "TEMRMC"]
  },
  "TEMR": {
    "col": 2,
    "text": {"TEMRH": "{homeTeam} {ratio}", "TEMRC": "{awayTeam} {ratio}"},
    "sort": ["TEMRH", "TEMRC"]
  },
  "TEMROU": {
    "col": 2,
    "text": {"TEMROUO": "สูง {ratio}", "TEMROUU": "ต่ำ {ratio}"},
    "sort": ["TEMROUO", "TEMROUU"]
  },
  "TENRM": {
    "col": 3,
    "text": {"TENRMH": "{homeTeam}", "TENRMN": "เสมอ", "TENRMC": "{awayTeam}"},
    "sort": ["TENRMH", "TENRMN", "TENRMC"]
  },
  "TENR": {
    "col": 2,
    "text": {"TENRH": "{homeTeam} {ratio}", "TENRC": "{awayTeam} {ratio}"},
    "sort": ["TENRH", "TENRC"]
  },
  "TENROU": {
    "col": 2,
    "text": {"TENROUO": "สูง {ratio}", "TENROUU": "ต่ำ {ratio}"},
    "sort": ["TENROUO", "TENROUU"]
  },
  "TEORM": {
    "col": 3,
    "text": {"TEORMH": "{homeTeam}", "TEORMN": "เสมอ", "TEORMC": "{awayTeam}"},
    "sort": ["TEORMH", "TEORMN", "TEORMC"]
  },
  "TEOR": {
    "col": 2,
    "text": {"TEORH": "{homeTeam} {ratio}", "TEORC": "{awayTeam} {ratio}"},
    "sort": ["TEORH", "TEORC"]
  },
  "TEOROU": {
    "col": 2,
    "text": {"TEOROUO": "สูง {ratio}", "TEOROUU": "ต่ำ {ratio}"},
    "sort": ["TEOROUO", "TEOROUU"]
  },
  "SABRM": {
    "col": 3,
    "text": {"SABRMH": "{homeTeam}", "SABRMN": "เสมอ", "SABRMC": "{awayTeam}"},
    "sort": ["SABRMH", "SABRMN", "SABRMC"]
  },
  "SABR": {
    "col": 2,
    "text": {"SABRH": "{homeTeam} {ratio}", "SABRC": "{awayTeam} {ratio}"},
    "sort": ["SABRH", "SABRC"]
  },
  "SABROU": {
    "col": 2,
    "text": {"SABROUO": "สูง {ratio}", "SABROUU": "ต่ำ {ratio}"},
    "sort": ["SABROUO", "SABROUU"]
  },
  "BM": {
    "col": 3,
    "text": {"BMH": "{homeTeam}", "BMN": "เสมอ", "BMC": "{awayTeam}"},
    "sort": ["BMH", "BMN", "BMC"]
  },
  "BR": {
    "col": 2,
    "text": {"BRH": "{homeTeam} {ratio}", "BRC": "{awayTeam} {ratio}"},
    "sort": ["BRH", "BRC"]
  },
  "BROU": {
    "col": 2,
    "text": {"BROUO": "สูง {ratio}", "BROUU": "ต่ำ {ratio}"},
    "sort": ["BROUO", "BROUU"]
  },
  "SACRM": {
    "col": 3,
    "text": {"SACRMH": "{homeTeam}", "SACRMN": "เสมอ", "SACRMC": "{awayTeam}"},
    "sort": ["SACRMH", "SACRMN", "SACRMC"]
  },
  "SACR": {
    "col": 2,
    "text": {"SACRH": "{homeTeam} {ratio}", "SACRC": "{awayTeam} {ratio}"},
    "sort": ["SACRH", "SACRC"]
  },
  "SACROU": {
    "col": 2,
    "text": {"SACROUO": "สูง {ratio}", "SACROUU": "ต่ำ {ratio}"},
    "sort": ["SACROUO", "SACROUU"]
  },
  "SADRM": {
    "col": 3,
    "text": {"SADRMH": "{homeTeam}", "SADRMN": "เสมอ", "SADRMC": "{awayTeam}"},
    "sort": ["SADRMH", "SADRMN", "SADRMC"]
  },
  "SADR": {
    "col": 2,
    "text": {"SADRH": "{homeTeam} {ratio}", "SADRC": "{awayTeam} {ratio}"},
    "sort": ["SADRH", "SADRC"]
  },
  "SADROU": {
    "col": 2,
    "text": {"SADROUO": "สูง {ratio}", "SADROUU": "ต่ำ {ratio}"},
    "sort": ["SADROUO", "SADROUU"]
  },
  "SAERM": {
    "col": 3,
    "text": {"SAERMH": "{homeTeam}", "SAERMN": "เสมอ", "SAERMC": "{awayTeam}"},
    "sort": ["SAERMH", "SAERMN", "SAERMC"]
  },
  "SAER": {
    "col": 2,
    "text": {"SAERH": "{homeTeam} {ratio}", "SAERC": "{awayTeam} {ratio}"},
    "sort": ["SAERH", "SAERC"]
  },
  "SAEROU": {
    "col": 2,
    "text": {"SAEROUO": "สูง {ratio}", "SAEROUU": "ต่ำ {ratio}"},
    "sort": ["SAEROUO", "SAEROUU"]
  },
  "SAFRM": {
    "col": 3,
    "text": {"SAFRMH": "{homeTeam}", "SAFRMN": "เสมอ", "SAFRMC": "{awayTeam}"},
    "sort": ["SAFRMH", "SAFRMN", "SAFRMC"]
  },
  "SAFR": {
    "col": 2,
    "text": {"SAFRH": "{homeTeam} {ratio}", "SAFRC": "{awayTeam} {ratio}"},
    "sort": ["SAFRH", "SAFRC"]
  },
  "SAFROU": {
    "col": 2,
    "text": {"SAFROUO": "สูง {ratio}", "SAFROUU": "ต่ำ {ratio}"},
    "sort": ["SAFROUO", "SAFROUU"]
  },
  "SAGRM": {
    "col": 3,
    "text": {"SAGRMH": "{homeTeam}", "SAGRMN": "เสมอ", "SAGRMC": "{awayTeam}"},
    "sort": ["SAGRMH", "SAGRMN", "SAGRMC"]
  },
  "SAGR": {
    "col": 2,
    "text": {"SAGRH": "{homeTeam} {ratio}", "SAGRC": "{awayTeam} {ratio}"},
    "sort": ["SAGRH", "SAGRC"]
  },
  "SAGROU": {
    "col": 2,
    "text": {"SAGROUO": "สูง {ratio}", "SAGROUU": "ต่ำ {ratio}"},
    "sort": ["SAGROUO", "SAGROUU"]
  },
  "SAHRM": {
    "col": 3,
    "text": {"SAHRMH": "{homeTeam}", "SAHRMN": "เสมอ", "SAHRMC": "{awayTeam}"},
    "sort": ["SAHRMH", "SAHRMN", "SAHRMC"]
  },
  "SAHR": {
    "col": 2,
    "text": {"SAHRH": "{homeTeam} {ratio}", "SAHRC": "{awayTeam} {ratio}"},
    "sort": ["SAHRH", "SAHRC"]
  },
  "SAHROU": {
    "col": 2,
    "text": {"SAHROUO": "สูง {ratio}", "SAHROUU": "ต่ำ {ratio}"},
    "sort": ["SAHROUO", "SAHROUU"]
  },
  "SAIRM": {
    "col": 3,
    "text": {"SAIRMH": "{homeTeam}", "SAIRMN": "เสมอ", "SAIRMC": "{awayTeam}"},
    "sort": ["SAIRMH", "SAIRMN", "SAIRMC"]
  },
  "SAIR": {
    "col": 2,
    "text": {"SAIRH": "{homeTeam} {ratio}", "SAIRC": "{awayTeam} {ratio}"},
    "sort": ["SAIRH", "SAIRC"]
  },
  "SAIROU": {
    "col": 2,
    "text": {"SAIROUO": "สูง {ratio}", "SAIROUU": "ต่ำ {ratio}"},
    "sort": ["SAIROUO", "SAIROUU"]
  },
  "RTTG_conner": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RFGTA": {
    "col": 2,
    "text": {
      "RFGTAS": "ยิงประตู",
      "RFGTAH": "โหม่งบอล",
      "RFGTAN": "ไม่มีลูกที่เข้า",
      "RFGTAP": "ลูกโทษ",
      "RFGTAF": "ฟรีคิก",
      "RFGTAO": "ออนโกล"
    },
    "sort": ["RFGTAS", "RFGTAH", "RFGTAN", "RFGTAP", "RFGTAF", "RFGTAO"]
  },
  "RFGTB": {
    "col": 2,
    "text": {
      "RFGTBS": "ยิงประตู",
      "RFGTBH": "โหม่งบอล",
      "RFGTBN": "ไม่มีลูกที่เข้า",
      "RFGTBP": "ลูกโทษ",
      "RFGTBF": "ฟรีคิก",
      "RFGTBO": "ออนโกล"
    },
    "sort": ["RFGTBS", "RFGTBH", "RFGTBN", "RFGTBP", "RFGTBF", "RFGTBO"]
  },
  "RFGTC": {
    "col": 2,
    "text": {
      "RFGTCS": "ยิงประตู",
      "RFGTCH": "โหม่งบอล",
      "RFGTCN": "ไม่มีลูกที่เข้า",
      "RFGTCP": "ลูกโทษ",
      "RFGTCF": "ฟรีคิก",
      "RFGTCO": "ออนโกล"
    },
    "sort": ["RFGTCS", "RFGTCH", "RFGTCN", "RFGTCP", "RFGTCF", "RFGTCO"]
  },
  "RFGTD": {
    "col": 2,
    "text": {
      "RFGTDS": "ยิงประตู",
      "RFGTDH": "โหม่งบอล",
      "RFGTDN": "ไม่มีลูกที่เข้า",
      "RFGTDP": "ลูกโทษ",
      "RFGTDF": "ฟรีคิก",
      "RFGTDO": "ออนโกล"
    },
    "sort": ["RFGTDS", "RFGTDH", "RFGTDN", "RFGTDP", "RFGTDF", "RFGTDO"]
  },
  "RFGTE": {
    "col": 2,
    "text": {
      "RFGTES": "ยิงประตู",
      "RFGTEH": "โหม่งบอล",
      "RFGTEN": "ไม่มีลูกที่เข้า",
      "RFGTEP": "ลูกโทษ",
      "RFGTEF": "ฟรีคิก",
      "RFGTEO": "ออนโกล"
    },
    "sort": ["RFGTES", "RFGTEH", "RFGTEN", "RFGTEP", "RFGTEF", "RFGTEO"]
  },
  "RFGTF": {
    "col": 2,
    "text": {
      "RFGTFS": "ยิงประตู",
      "RFGTFH": "โหม่งบอล",
      "RFGTFN": "ไม่มีลูกที่เข้า",
      "RFGTFP": "ลูกโทษ",
      "RFGTFF": "ฟรีคิก",
      "RFGTFO": "ออนโกล"
    },
    "sort": ["RFGTFS", "RFGTFH", "RFGTFN", "RFGTFP", "RFGTFF", "RFGTFO"]
  },
  "RFGTG": {
    "col": 2,
    "text": {
      "RFGTGS": "ยิงประตู",
      "RFGTGH": "โหม่งบอล",
      "RFGTGN": "ไม่มีลูกที่เข้า",
      "RFGTGP": "ลูกโทษ",
      "RFGTGF": "ฟรีคิก",
      "RFGTGO": "ออนโกล"
    },
    "sort": ["RFGTGS", "RFGTGH", "RFGTGN", "RFGTGP", "RFGTGF", "RFGTGO"]
  },
  "RFGTH": {
    "col": 2,
    "text": {
      "RFGTHS": "ยิงประตู",
      "RFGTHH": "โหม่งบอล",
      "RFGTHN": "ไม่มีลูกที่เข้า",
      "RFGTHP": "ลูกโทษ",
      "RFGTHF": "ฟรีคิก",
      "RFGTHO": "ออนโกล"
    },
    "sort": ["RFGTHS", "RFGTHH", "RFGTHN", "RFGTHP", "RFGTHF", "RFGTHO"]
  },
  "RFGTI": {
    "col": 2,
    "text": {
      "RFGTIS": "ยิงประตู",
      "RFGTIH": "โหม่งบอล",
      "RFGTIN": "ไม่มีลูกที่เข้า",
      "RFGTIP": "ลูกโทษทีมเยือนชนะ",
      "RFGTIF": "ฟรีคิก",
      "RFGTIO": "ออนโกล"
    },
    "sort": ["RFGTIS", "RFGTIH", "RFGTIN", "RFGTIP", "RFGTIF", "RFGTIO"]
  },
  "RFGTJ": {
    "col": 2,
    "text": {
      "RFGTJS": "ยิงประตู",
      "RFGTJH": "โหม่งบอล",
      "RFGTJN": "ไม่มีลูกที่เข้า",
      "RFGTJP": "ลูกโทษ",
      "RFGTJF": "ฟรีคิก",
      "RFGTJO": "ออนโกล"
    },
    "sort": ["RFGTJS", "RFGTJH", "RFGTJN", "RFGTJP", "RFGTJF", "RFGTJO"]
  },
  "RRT3_conner": {
    "col": 3,
    "text": {"RRT3H": "{homeTeam}", "RRT3N": "ไม่ใช่ทั้งหมด", "RRT3C": "{awayTeam}"},
    "sort": ["RRT3H", "RRT3N", "RRT3C"]
  },
  "RRT5_conner": {
    "col": 3,
    "text": {"RRT5H": "{homeTeam}", "RRT5N": "ไม่ใช่ทั้งหมด", "RRT5C": "{awayTeam}"},
    "sort": ["RRT5H", "RRT5N", "RRT5C"]
  },
  "RRT7_conner": {
    "col": 3,
    "text": {"RRT7H": "{homeTeam}", "RRT7N": "ไม่ใช่ทั้งหมด", "RRT7C": "{awayTeam}"},
    "sort": ["RRT7H", "RRT7N", "RRT7C"]
  },
  "RRT9_conner": {
    "col": 3,
    "text": {"RRT9H": "{homeTeam}", "RRT9N": "ไม่ใช่ทั้งหมด", "RRT9C": "{awayTeam}"},
    "sort": ["RRT9H", "RRT9N", "RRT9C"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "คี่",
      "RTEOHE": "คู่",
      "RTEOCO": "คี่",
      "RTEOCE": "คู่"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "SP": {
    "col": 2,
    "text": {"SPH": "{homeTeam}", "SPC": "{awayTeam}"},
    "sort": ["SPH", "SPC"]
  },
  "MP": {
    "col": 2,
    "text": {"MPH": "{homeTeam}", "MPC": "{awayTeam}"},
    "sort": ["MPH", "MPC"]
  },
  "GZ": {
    "col": 3,
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
    "text": {"HRTSY": "ใช่", "HRTSN": "ไม่"},
    "sort": ["HRTSY", "HRTSN"]
  },
  "R2OU_conner": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "TSNT": {
    "col": 2,
    "text": {"TSNTY": "ใช่", "TSNTN": "ไม่"},
    "sort": ["TSNTY", "TSNTN"]
  },
  "M_conner": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R_conner": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU_conner": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RM_conner": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "เสมอ", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_conner": {
    "col": 2,
    "text": {"ROUC": "สูง1 {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_conner": {
    "col": 3,
    "text": {"HRMH": "{homeTeam}", "HRMN": "เสมอ", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_conner": {
    "col": 2,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_conner": {
    "col": 2,
    "text": {"HROUC": "สูง {ratio}", "HROUH": "ต่ำ {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "HROU2_conner": {
    "col": 2,
    "text": {"HOU2C": "สูง {ratio}", "HOU2H": "ต่ำ {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "RM_OT": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "เสมอ", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_OT": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_OT": {
    "col": 3,
    "text": {"HRMH": "{homeTeam}", "HRMN": "เสมอ", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_OT": {
    "col": 2,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_OT": {
    "col": 2,
    "text": {"HROUC": "สูง {ratio}", "HROUH": "ต่ำ {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "RE_PS": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_PS": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RDC_OT": {
    "col": 3,
    "text": {"RDCHN": "ทีมเจ้าบ้านกับทีมรวม", "RDCHC": "ทีมเจ้าบ้านกับทีมเยือน", "RDCCN": "ทีมรวมกับทีมเยือน"},
    "sort": ["RDCHN", "RDCHC", "RDCCN"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "ARG_OT": {
    "col": 3,
    "text": {"ARGH": "{homeTeam}", "ARGN": "ไม่มีลูกที่เข้า", "ARGC": "{awayTeam}"},
    "sort": ["ARGH", "ARGC", "ARGN"]
  },
  "BRG_OT": {
    "col": 3,
    "text": {"BRGH": "{homeTeam}", "BRGN": "ไม่มีลูกที่เข้า", "BRGC": "{awayTeam}"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG_OT": {
    "col": 3,
    "text": {"CRGH": "{homeTeam}", "CRGN": "ไม่มีลูกที่เข้า", "CRGC": "{awayTeam}"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG_OT": {
    "col": 3,
    "text": {"DRGH": "{homeTeam}", "DRGN": "ไม่มีลูกที่เข้า", "DRGC": "{awayTeam}"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG_OT": {
    "col": 3,
    "text": {"ERGH": "{homeTeam}", "ERGN": "ไม่มีลูกที่เข้า", "ERGC": "{awayTeam}"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG_OT": {
    "col": 3,
    "text": {"FRGH": "{homeTeam}", "FRGN": "ไม่มีลูกที่เข้า", "FRGC": "{awayTeam}"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG_OT": {
    "col": 3,
    "text": {"GRGH": "{homeTeam}", "GRGN": "ไม่มีลูกที่เข้า", "GRGC": "{awayTeam}"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG_OT": {
    "col": 3,
    "text": {"HRGH": "{homeTeam}", "HRGN": "ไม่มีลูกที่เข้า", "HRGC": "{awayTeam}"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG_OT": {
    "col": 3,
    "text": {"IRGH": "{homeTeam}", "IRGN": "ไม่มีลูกที่เข้า", "IRGC": "{awayTeam}"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG_OT": {
    "col": 3,
    "text": {"JRGH": "{homeTeam}", "JRGN": "ไม่มีลูกที่เข้า", "JRGC": "{awayTeam}"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "RTS_OT": {
    "col": 2,
    "text": {"RTSY": "ใช่", "RTSN": "ไม่"},
    "sort": ["RTSY", "RTSN"]
  },
  "RTEO_OT": {
    "col": 2,
    "text": {"RTEOHO": "ใช่", "RTEOHE": "ไม่", "RTEOCO": "ใช่", "RTEOCE": "ไม่"},
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  'RW3_OT': {
    'col': 3,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'เสมอ {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'GZ_OT': {
    'col': 3,
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
    'text': {
      'ROUHC': '{homeTeam} สูง {ratio}',
      'ROUHH': '{homeTeam} ต่ำ {ratio}',
      'ROUCC': '{awayTeam}สูง {ratio}',
      'ROUCH': '{awayTeam} ต่ำ {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'RTG_OT': {
    'col': 2,
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
    'text': {'RWNH': '{homeTeam}', 'RWNC': '{awayTeam}'},
    'sort': ['RWNH', 'RWNC']
  },
  'DNB': {
    'col': 2,
    'text': {'DNBH': '{homeTeam}', 'DNBA': '{awayTeam}'},
    'sort': ['DNBH', 'DNBA']
  },
  'RM2_PS': {
    'col': 2,
    'text': {'RM2H': '{homeTeam}', 'RM2C': '{awayTeam}'},
    'sort': ['RM2H', 'RM2C']
  },
  'RSA_PS': {
    'col': 2,
    'text': {
      'RSAHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSAHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSACY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSACN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSAHY', 'RSAHN', 'RSACY', 'RSACN']
  },
  'RSB_PS': {
    'col': 2,
    'text': {
      'RSBHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSBHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSBCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSBCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSBHY', 'RSBHN', 'RSBCY', 'RSBCN']
  },
  'RSC_PS': {
    'col': 2,
    'text': {
      'RSCHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSCHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSCCY': '{awayTeam} ยิงลูกโทษเข้า ',
      'RSCCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSCHY', 'RSCHN', 'RSCCY', 'RSCCN']
  },
  'RSD_PS': {
    'col': 2,
    'text': {
      'RSDHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSDHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSDCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSDCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSDHY', 'RSDHN', 'RSDCY', 'RSDCN']
  },
  'RSE_PS': {
    'col': 2,
    'text': {
      'RSEHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSEHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSECY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSECN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSEHY', 'RSEHN', 'RSECY', 'RSECN']
  },
  'RSF_PS': {
    'col': 2,
    'text': {
      'RSFHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSFHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSFCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSFCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSFHY', 'RSFHN', 'RSFCY', 'RSFCN']
  },
  'RSG_PS': {
    'col': 2,
    'text': {
      'RSGHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSGHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSGCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSGCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSGHY', 'RSGHN', 'RSGCY', 'RSGCN']
  },
  'RSH_PS': {
    'col': 2,
    'text': {
      'RSHHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSHHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSHCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSHCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSHHY', 'RSHHN', 'RSHCY', 'RSHCN']
  },
  'RSI_PS': {
    'col': 2,
    'text': {
      'RSIHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSIHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSICY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSICN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSIHY', 'RSIHN', 'RSICY', 'RSICN']
  },
  'RSJ_PS': {
    'col': 2,
    'text': {
      'RSJHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSJHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSJCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSJCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSJHY', 'RSJHN', 'RSJCY', 'RSJCN']
  },
  'RSK_PS': {
    'col': 2,
    'text': {
      'RSKHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSKHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSKCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSKCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSKHY', 'RSKHN', 'RSKCY', 'RSKCN']
  },
  'RSL_PS': {
    'col': 2,
    'text': {
      'RSLHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSLHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSLCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSLCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSLHY', 'RSLHN', 'RSLCY', 'RSLCN']
  },
  'RSM_PS': {
    'col': 2,
    'text': {
      'RSMHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSMHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSMCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSMCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSMHY', 'RSMHN', 'RSMCY', 'RSMCN']
  },
  'RSN_PS': {
    'col': 2,
    'text': {
      'RSNHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSNHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSNCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSNCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSNHY', 'RSNHN', 'RSNCY', 'RSNCN']
  },
  'RSO_PS': {
    'col': 2,
    'text': {
      'RSOHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSOHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSOCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSOCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSOHY', 'RSOHN', 'RSOCY', 'RSOCN']
  },
  'RSP_PS': {
    'col': 2,
    'text': {
      'RSPHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSPHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSPCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSPCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSPHY', 'RSPHN', 'RSPCY', 'RSPCN']
  },
  'RSQ_PS': {
    'col': 2,
    'text': {
      'RSQHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSQHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSQCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSQCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSQHY', 'RSQHN', 'RSQCY', 'RSQCN']
  },
  'RSR_PS': {
    'col': 2,
    'text': {
      'RSRHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSRHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSRCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSRCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSRHY', 'RSRHN', 'RSRCY', 'RSRCN']
  },
  'RSS_PS': {
    'col': 2,
    'text': {
      'RSSHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSSHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSSCY': '{awayTeam} ยิงลูกโทษเข้า ',
      'RSSCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSSHY', 'RSSHN', 'RSSCY', 'RSSCN']
  },
  'RST_PS': {
    'col': 2,
    'text': {
      'RSTHY': '{homeTeam} ยิงลูกโทษเข้า',
      'RSTHN': '{homeTeam} ยิงพลาดลูกโทษ',
      'RSTCY': '{awayTeam} ยิงลูกโทษเข้า',
      'RSTCN': '{awayTeam} ยิงพลาดลูกโทษ'
    },
    'sort': ['RSTHY', 'RSTHN', 'RSTCY', 'RSTCN']
  },
  'RPSD_PS': {
    'col': 2,
    'text': {'RPSDY': 'ใช่', 'RPSDN': 'ไม่'},
    'sort': ['RPSDY', 'RPSDN']
  },
  'RLS_PS': {
    'col': 2,
    'text': {'RLSH': '{homeTeam}', 'RLSC': '{awayTeam}'},
    'sort': ['RLSH', 'RLSC']
  },
  'RTTG_PS': {
    'col': 2,
    'text': {
      'ROUHC': '{homeTeam} สูง {ratio}',
      'ROUHH': '{homeTeam} ต่ำ {ratio}',
      'ROUCC': '{awayTeam} สูง {ratio}',
      'ROUCH': '{awayTeam} ต่ำ {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'TQ': {
    'col': 2,
    'text': {'TQH': '{homeTeam}', 'TQC': '{awayTeam}'},
    'sort': ['TQH', 'TQC']
  },
  "FSG": {
    "col": 3,
    "text": {"FSGH": "{homeTeam}", "FSGA": "{awayTeam}", "FSGN": "ไม่มีลูกที่เข้า"},
    "sort": ["FSGH", "FSGA", "FSGN"]
  },

  "HTSBH2": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTSB2HY": "ใช่",
      "HTSB2HN": "ไม่",
    },
    "sort": ["HTSB2HY", "HTSB2HN"]
  },
  "HTSBC2": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTSB2CY": "ใช่",
      "HTSB2CN": "ไม่",
    },
    "sort": ["HTSB2CY", "HTSB2CN"]
  },
  "TSBH": {
    "col": 2,
    "col188": 1,
    "text": {
      "TSBHY": "ใช่",
      "TSBHN": "ไม่",
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "TSBC": {
    "col": 2,
    "col188": 1,
    "text": {
      "TSBCY": "ใช่",
      "TSBCN": "ไม่"
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "HOU_conner": {
    "col": 2,
    "text": {'HOUC': 'สูง {ratio}', 'HOUH': 'ต่ำ {ratio}'},
    "sort": ['HOUC', 'HOUH']
  },
};
