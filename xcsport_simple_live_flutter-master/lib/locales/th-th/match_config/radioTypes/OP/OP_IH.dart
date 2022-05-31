//ฮ็อกกี้น้ำแข็ง
const dynamic op_ihRadioTypes = {
  'DC': {
    'col': 3,
    'text': {
      'DCCD': 'เจ้าบ้าน/เสมอ',
      'DCHN': 'เจ้าบ้าน/เสมอ',
      'DCHC': 'เจ้าบ้าน ทีมเยือน',
      'DCCN': 'ทีมเยือน/เสมอ',
      'DCCC': 'ทีมเยือน/เสมอ',
      'DCDC': 'ทีมเยือน/เสมอ'
    },
    'sort': ['DCCD', 'DCCC', 'DCDC', 'DCHN', 'DCCN', 'DCHC']
  },
  "DTK": {
    "col": 2,
    "text": {"DTK4": "{homeTeam}", "DTK5": "{awayTeam}"},
    "sort": ["DTK4", "DTK5"]
  },
  "RFM": {
    "col": 3,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "เสมอ {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUH12": "สูง {ratio}", "OUH13": "ต่ำ {ratio}"},
    "sort": ["OUH12", "OUH13"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC12": "สูง {ratio}", "OUC13": "ต่ำ {ratio}"},
    "sort": ["OUC12", "OUC13"]
  },
  "EG": {
    "col": 2,
    "text": {
      "EG75": "0",
      "EG76": "1",
      "EG77": "2",
      "EG78": "3",
      "EG79": "4",
      "EG80": "5",
      "EG81": "6",
      "EG82": "7",
      "EG83": "8",
      "EG84": "9+"
    },
    "sort": [
      "EG75",
      "EG76",
      "EG77",
      "EG78",
      "EG79",
      "EG80",
      "EG81",
      "EG82",
      "EG83",
      "EG84"
    ]
  },
  "EGH": {
    "col": 2,
    "text": {"EGH88": "0", "EGH89": "1", "EGH90": "2", "EGH91": "3"},
    "sort": ["EGH88", "EGH89", "EGH90", "EGH91"]
  },
  "EGC": {
    "col": 2,
    "text": {"EGC88": "0", "EGC89": "1", "EGC90": "2", "EGC91": "3"},
    "sort": ["EGC88", "EGC89", "EGC90", "EGC91"]
  },
  "CS": {
    "col": 2,
    "text": {
      "CS1157": "0:0",
      "CS1158": "0:1",
      "CS1159": "0:2",
      "CS1160": "0:3",
      "CS1161": "0:4",
      "CS1162": "0:5",
      "CS1163": "0:6",
      "CS1164": "0:7",
      "CS1165": "1:0",
      "CS1166": "1:1",
      "CS1167": "1:2",
      "CS1168": "1:3",
      "CS1169": "1:4",
      "CS1170": "1:5",
      "CS1171": "1:6",
      "CS1172": "2:0",
      "CS1173": "2:1",
      "CS1174": "2:2",
      "CS1175": "2:3",
      "CS1176": "2:4",
      "CS1177": "2:5",
      "CS1178": "3:0",
      "CS1179": "3:1",
      "CS1180": "3:2",
      "CS1181": "3:3",
      "CS1182": "3:4",
      "CS1183": "4:0",
      "CS1184": "4:1",
      "CS1185": "4:2",
      "CS1186": "4:3",
      "CS1187": "5:0",
      "CS1188": "5:1",
      "CS1189": "5:2",
      "CS1190": "6:0",
      "CS1191": "6:1",
      "CS1192": "7:0",
      "CS1193": "other"
    },
    "sort": [
      "CS1157",
      "CS1158",
      "CS1159",
      "CS1160",
      "CS1161",
      "CS1162",
      "CS1163",
      "CS1164",
      "CS1165",
      "CS1166",
      "CS1167",
      "CS1168",
      "CS1169",
      "CS1170",
      "CS1171",
      "CS1172",
      "CS1173",
      "CS1174",
      "CS1175",
      "CS1176",
      "CS1177",
      "CS1178",
      "CS1179",
      "CS1180",
      "CS1181",
      "CS1182",
      "CS1183",
      "CS1184",
      "CS1185",
      "CS1186",
      "CS1187",
      "CS1188",
      "CS1189",
      "CS1190",
      "CS1191",
      "CS1192",
      "CS1193"
    ]
  },
  "OTM": {
    "col": 3,
    "text": {"OTM1": "{homeTeam}", "OTM2": "เสมอ", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOU12": "สูง {ratio}", "OTOU13": "ต่ำ {ratio}"},
    "sort": ["OTOU12", "OTOU13"]
  },
  "M_PS": {
    "col": 2,
    "text": {"M_PS4": "{homeTeam}", "M_PS5": "{awayTeam}"},
    "sort": ["M_PS4", "M_PS5"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "ใช่", "WBON": "ไม่"},
    "sort": ["WBOY", "WBON"]
  },
  "M_OT": {
    "col": 2,
    "text": {
      "M_OTH": "{homeTeam}",
      "M_OTA": "{awayTeam}",
      "MH": "{homeTeam}",
      "MC": "{awayTeam}"
    },
    "sort": ["M_OTH", "M_OTA", "MH", "MC"]
  },
  "HSQ": {
    "col": 2,
    "text": {
      "HSQ1621": "รอบที่1",
      "HSQ1622": "รอบที่2",
      "HSQ1623": "รอบที่3",
      "HSQ1624": "ได้คะแนนเท่ากัน"
    },
    "sort": ["HSQ1621", "HSQ1622", "HSQ1623", "HSQ1624"]
  },
  "MP": {
    "col": 3,
    "text": {"MP1": "{homeTeam}", "MP2": "เสมอ", "MP3": "{awayTeam}"},
    "sort": ["MP1", "MP2", "MP3"]
  },
  'CW': {
    'col': 3,
    'text': {'CWH': '{homeTeam}', 'CWN': 'เสมอ', 'CWC': '{awayTeam}'},
    'sort': ['CWH', 'CWN', 'CWC']
  },
  "PRFM": {
    "col": 3,
    "text": {
      "PRFMH": "{homeTeam} {ratio}",
      "PRFMD": "เสมอ {ratio}",
      "PRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["PRFMH", "PRFMD", "PRFMC"]
  },
  "POU": {
    "col": 2,
    "text": {"POU12": "สูง {ratio}", "POU13": "ต่ำ {ratio}"},
    "sort": ["POU12", "POU13"]
  },
  "POUH": {
    "col": 2,
    "text": {"POUH12": "สูง {ratio}", "POUH13": "ต่ำ {ratio}"},
    "sort": ["POUH12", "POUH13"]
  },
  "POUC": {
    "col": 2,
    "text": {"POUC12": "สูง {ratio}", "POUC13": "ต่ำ {ratio}"},
    "sort": ["POUC12", "POUC13"]
  },
  "PCS": {
    "col": 2,
    "text": {
      "PCS1630": "0:0",
      "PCS1631": "1:0",
      "PCS1632": "2:0",
      "PCS1633": "0:1",
      "PCS1634": "1:1",
      "PCS1635": "2:1",
      "PCS1636": "0:2",
      "PCS1637": "1:2",
      "PCS1638": "2:2",
      "PCS1639": "other"
    },
    "sort": [
      "PCS1630",
      "PCS1631",
      "PCS1632",
      "PCS1633",
      "PCS1634",
      "PCS1635",
      "PCS1636",
      "PCS1637",
      "PCS1638",
      "PCS1639"
    ]
  },
  "PR": {
    "col": 2,
    "text": {"PRH": "{homeTeam} {ratio}", "PRC": "{awayTeam} {ratio}"},
    "sort": ["PRH", "PRC"]
  },
  "PEO": {
    "col": 2,
    "text": {"PEO70": "คี่", "PEO72": "คู่"},
    "sort": ["PEO70", "PEO72"]
  },
  "PDC": {
    "col": 3,
    "text": {"PDCCD": "เจ้าบ้าน/เสมอ", "PDCCC": "เจ้าบ้าน/ทีมเยือน", "PDCDC": "เสมอ/ทีมเยือน"},
    "sort": ["PDCCD", "PDCCC", "PDCDC"]
  },
  "MW": {
    "col": 2,
    "text": {"MWH": "{homeTeam} {ratio}", "MWC": "{awayTeam} {ratio}"},
    "sort": ["MWH", "MWC"]
  },
  "T": {
    "col": 2,
    "text": {"T01": "0~1", "T23": "2~3", "T46": "4~6", "OVER": "7+"},
    "sort": ["T01", "T23", "T46", "OVER"]
  },
  "RT": {
    "col": 2,
    "text": {"RT01": "0~1", "RT23": "2~3", "RT46": "4~6", "ROVER": "7+"},
    "sort": ["RT01", "RT23", "RT46", "ROVER"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "DNB": {
    "col": 2,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "DNB1": {
    "col": 2,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "DNB2": {
    "col": 2,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "DNB3": {
    "col": 2,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "F2G": {
    "col": 3,
    "text": {"F2GH": "{homeTeam}", "F2GN": "ไม่ใช่ทั้งหมด", "F2GC": "{awayTeam}"},
    "sort": ["F2GH", "F2GN", "F2GC"]
  },
  "F3G": {
    "col": 3,
    "text": {"F3GH": "{homeTeam}", "F3GN": "ไม่ใช่ทั้งหมด", "F3GC": "{awayTeam}"},
    "sort": ["F3GH", "F3GN", "F3GC"]
  },
  "F4G": {
    "col": 3,
    "text": {"F4GH": "{homeTeam}", "F4GN": "ไม่ใช่ทั้งหมด", "F4GC": "{awayTeam}"},
    "sort": ["F4GH", "F4GN", "F4GC"]
  },
  "F5G": {
    "col": 3,
    "text": {"F5GH": "{homeTeam}", "F5GN": "ไม่ใช่ทั้งหมด", "F5GC": "{awayTeam}"},
    "sort": ["F5GH", "F5GN", "F5GC"]
  },
  "GA": {
    "col": 2,
    "text": {"GAF": "9นาที30วิ", "GAL": "หลังจาก9นาที30วิ"},
    "sort": ["GAF", "GAL"]
  },
  "DC1": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้าบ้าน/ทีมเยือน", "DCCN": "ทีมเยือน/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC2": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้าบ้าน/ทีมเยือน", "DCCN": "ทีมเยือน/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้าบ้าน/ทีมเยือน", "DCCN": "ทีมเยือน/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TW": {
    "col": 2,
    "text": {
      "TWN": "ไม่มีลูกที่เข้า",
      "TW1": "เข้า1ลูก",
      "TW2": "เข้า2ลูก",
      "TW3": "เข้า3ลูก",
      "TW4": "เข้า4ลูก",
      "TW5": "เข้า5ลูก",
      "TW6": "เข้า6ลูก",
      "TW7": "เข้า7ลูก",
      "TW8OV": "เข้า8ลูกหรือมากกว่า"
    },
    "sort": ["TWN", "TW1", "TW2", "TW3", "TW4", "TW5", "TW6", "TW7", "TW8OV"]
  },
  "RTW": {"col": 2, "text": {}, "sort": []},
  "TS": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "TS1": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "TS2": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "TS3": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
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
  "MG": {
    "col": 2,
    "text": {"MG1": "รอบที่1", "MG2": "รอบที่2", "MG3": "รอบที่3", "MGN": "เสมอ"},
    "sort": ["MG1", "MG2", "MG3", "MGN"]
  },
  "WN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "ไม่ใช่ทั้งหมด", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS1": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "ไม่ใช่ทั้งหมด", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS2": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "ไม่ใช่ทั้งหมด", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS3": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "ไม่ใช่ทั้งหมด", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FL": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "ไม่ใช่ทั้งหมด", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL1": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "ไม่ใช่ทั้งหมด", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL2": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "ไม่ใช่ทั้งหมด", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL3": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "ไม่ใช่ทั้งหมด", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "TTG_OT": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG1": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG2": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG3": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง {ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "M1": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R1": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M2": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R2": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M3": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R3": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU3": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "BG": {
    "col": 2,
    "text": {"BGY": "ใช่", "BGN": "ต่ำ"},
    "sort": ["BGY", "BGN"]
  },
  "WM_OT": {
    "col": 2,
    "text": {
      "WM113": "{homeTeam} ผลชนะ1ลูก",
      "WM114": "{homeTeam} ผลชนะ2ลูก",
      "WM120": "{homeTeam} ผลชนะ3ลูก",
      "WM121": "{homeTeam} ผลชนะ4ลูก",
      "WM122": "{homeTeam} ผลชนะ5ลูกหรือมากกว่า",
      "WM116": "{awayTeam} ผลชนะ1ลูก",
      "WM117": "{awayTeam} ผลชนะ2ลูก",
      "WM123": "{awayTeam} ผลชนะ3ลูก",
      "WM124": "{awayTeam} ผลชนะ4ลูก",
      "WM125": "{awayTeam} ผลชนะ5ลูกหรือมากกว่า"
    },
    "sort": [
      "WM113",
      "WM114",
      "WM120",
      "WM121",
      "WM122",
      "WM116",
      "WM117",
      "WM123",
      "WM124",
      "WM125"
    ]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "TGOU_OT": {
    "col": 2,
    "text": {"OUC": "คี่ {ratio}", "OUH": "คู่ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WM113": "{homeTeam} ผลชนะ1ลูก",
      "WM114": "{homeTeam} ผลชนะ2ลูก",
      "WM120": "{homeTeam} ผลชนะ3ลูก",
      "WM121": "{homeTeam} ผลชนะ4ลูก",
      "WM122": "{homeTeam} ผลชนะ5ลูก",
      "WM123": "{homeTeam} ผลชนะ6ลูกหรือมากกว่า",
      "WM116": "{awayTeam} ผลชนะ1ลูก",
      "WM117": "{awayTeam} ผลชนะ2ลูก",
      "WM124": "{awayTeam} ผลชนะ3ลูก",
      "WM125": "{awayTeam} ผลชนะ4ลูก",
      "WM126": "{awayTeam} ผลชนะ5ลูก",
      "WM127": "{awayTeam} ผลชนะ6ลูกหรือมากกว่า",
      "WM119": "สำนัก"
    },
    "sort": [
      "WM113",
      "WM114",
      "WM120",
      "WM121",
      "WM122",
      "WM123",
      "WM116",
      "WM117",
      "WM124",
      "WM125",
      "WM126",
      "WM127",
      "WM119"
    ]
  },
  'AH': {
    'col': 2,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  'AH_OT': {
    'col': 2,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  "AF": {
    "col": 3,
    "text": {
      "AFHH": "เจ้าบ้าน/ทีมรวม",
      "AFHC": "เจ้าบ้าน/ทีมเยือน",
      "AFHN": "เจ้าบ้าน/ทีมรวม",
      "AFCC": "ทีมเยือน/ทีมเยือน",
      "AFCH": "ทีมเยือน/เจ้าบ้าน",
      "AFCN": "ทีมเยือน/ทีมรวม",
      "AFNH": "ทีมรวม/เจ้าบ้าน",
      "AFNC": "ทีมรวม/ทีมรวม",
      "AFNN": "ทีมรวม/ทีมรวม"
    },
    "sort": [
      "AFHH",
      "AFHC",
      "AFHN",
      "AFCC",
      "AFCH",
      "AFCN",
      "AFNH",
      "AFNC",
      "AFNN"
    ]
  },
  'RM': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  
  'RM1': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  "RE1": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU1": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RM2': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RE2': {
    'col': 2,
    'text': {'REH': '{homeTeam} {ratio}', 'REC': '{awayTeam} {ratio}'},
    'sort': ['REH', 'REC']
  },
  "ROU2": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RM3': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  "RE3": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU3": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RTGOU_OT": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "คี่่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RDNM": {
    "col": 2,
    "text": {"RDNMH": "{homeTeam}", "RDNMA": "{awayTeam}"},
    "sort": ["RDNMH", "RDNMA"]
  },
  "RDC": {
    "col": 3,
    "text": {"RDCHN": "เจ้าบ้าน/ทีมรวม", "RDCHC": "เจ้าบ้าน/ทีมเยือน", "RDCCN": "ทีมเยือน/เสมอ"},
    "sort": ["RDCHN", "RDCHC", "RDCCN"]
  },
  'RTG': {
    'col': 2,
    'text': {
      'RTGH0': '{homeTeam} 0',
      'RTGH1': '{homeTeam} 1',
      'RTGH2': '{homeTeam} 2',
      'RTGH3': '{homeTeam} 3',
      'RTGH4': '{homeTeam} 4',
      'RTGH5': '{homeTeam} 5',
      'RTGH6': '{homeTeam} 6',
      'RTGH7': '{homeTeam} 7',
      'RTGH8': '{homeTeam} 8',
      'RTGH9': '{homeTeam} 9',
      'RTGH10': '{homeTeam} 10',
      'RTGH4+': '{homeTeam} 4+',
      'RTGH5+': '{homeTeam} 5+',
      'RTGH6+': '{homeTeam} 6+',
      'RTGH7+': '{homeTeam} 7+',
      'RTGH8+': '{homeTeam} 8+',
      'RTGH9+': '{homeTeam} 9+',
      'RTGH10+': '{homeTeam} 10+',
      'RTGC0': '{awayTeam} 0',
      'RTGC1': '{awayTeam} 1',
      'RTGC2': '{awayTeam} 2',
      'RTGC3': '{awayTeam} 3',
      'RTGC4': '{awayTeam} 4',
      'RTGC5': '{awayTeam} 5',
      'RTGC6': '{awayTeam} 6',
      'RTGC7': '{awayTeam} 7',
      'RTGC8': '{awayTeam} 8',
      'RTGC9': '{awayTeam} 9',
      'RTGC10': '{awayTeam} 10',
      'RTGC4+': '{awayTeam} 4+',
      'RTGC5+': '{awayTeam} 5+',
      'RTGC6+': '{awayTeam} 6+',
      'RTGC7+': '{awayTeam} 7+',
      'RTGC8+': '{awayTeam} 8+',
      'RTGC9+': '{awayTeam} 9+',
      'RTGC10+': '{awayTeam} 10+',
    },
    'sort': [
      'RTGH0',
      'RTGH1',
      'RTGH2',
      'RTGH3',
      'RTGH4',
      'RTGH5',
      'RTGH6',
      'RTGH7',
      'RTGH8',
      'RTGH9',
      'RTGH10',
      'RTGH4+',
      'RTGH5+',
      'RTGH6+',
      'RTGH7+',
      'RTGH8+',
      'RTGH9+',
      'RTGH10+',
      'RTGC0',
      'RTGC1',
      'RTGC2',
      'RTGC3',
      'RTGC4',
      'RTGC5',
      'RTGC6',
      'RTGC7',
      'RTGC8',
      'RTGC9',
      'RTGC10',
      'RTGC4+',
      'RTGC5+',
      'RTGC6+',
      'RTGC7+',
      'RTGC8+',
      'RTGC9+',
      'RTGC10+'
    ]
  },
  "RWM_OT": {
    "col": 2,
    "text": {
      "RWM113": "{homeTeam} ผลชนะ1ลูก",
      "RWM114": "{homeTeam} ผลชนะ2ลูก",
      "RWM120": "{homeTeam} ผลชนะ3ลูก",
      "RWM121": "{homeTeam} ผลชนะ4ลูก",
      "RWM122": "{homeTeam} ผลชนะ5ลูกหรือมากกว่า",
      "RWM116": "{awayTeam} ผลชนะ1ลูก",
      "RWM117": "{awayTeam} ผลชนะ2ลูก",
      "RWM123": "{awayTeam} ผลชนะ3ลูก",
      "RWM124": "{awayTeam} ผลชนะ4ลูก",
      "RWM125": "{awayTeam} ผลชนะ5ลูกหรือมากกว่า"
    },
    "sort": [
      "RWM113",
      "RWM114",
      "RWM120",
      "RWM121",
      "RWM122",
      "RWM116",
      "RWM117",
      "RWM123",
      "RWM124",
      "RWM125"
    ]
  },
  "RWM": {
    "col": 2,
    "text": {
      "RWM113": "{homeTeam} ผลชนะ1ลูก",
      "RWM114": "{homeTeam} ผลชนะ2ลูก",
      "RWM120": "{homeTeam} ผลชนะ3ลูก",
      "RWM121": "{homeTeam} ผลชนะ4ลูก",
      "RWM122": "{homeTeam} ผลชนะ5ลูก",
      "RWM123": "{homeTeam} ผลชนะ6ลูกหรือมากกว่า",
      "RWM116": "{awayTeam} ผลชนะ1ลูก",
      "RWM117": "{awayTeam} ผลชนะ2ลูก",
      "RWM124": "{awayTeam} ผลชนะ3ลูก",
      "RWM125": "{awayTeam} ผลชนะ4ลูก",
      "RWM126": "{awayTeam} ผลชนะ5ลูก",
      "RWM127": "{awayTeam} ผลชนะ6ลูกหรือมากกว่า",
      "RWM119": "สำนัก"
    },
    "sort": [
      "RWM113",
      "RWM114",
      "RWM120",
      "RWM121",
      "RWM122",
      "RWM123",
      "RWM116",
      "RWM117",
      "RWM124",
      "RWM125",
      "RWM126",
      "RWM127",
      "RWM119"
    ]
  },
  "RF2G": {
    "col": 3,
    "text": {"RF2GH": "{homeTeam}", "RF2GN": "ไม่ใช่ทั้งหมด", "RF2GC": "{awayTeam}"},
    "sort": ["RF2GH", "RF2GN", "RF2GC"]
  },
  "RF3G": {
    "col": 3,
    "text": {"RF3GH": "{homeTeam}", "RF3GN": "ไม่ใช่ทั้งหมด", "RF3GC": "{awayTeam}"},
    "sort": ["RF3GH", "RF3GN", "RF3GC"]
  },
  "RF4G": {
    "col": 3,
    "text": {"RF4GH": "{homeTeam}", "RF4GN": "ไม่ใช่ทั้งหมด", "RF4GC": "{awayTeam}"},
    "sort": ["RF4GH", "RF4GN", "RF4GC"]
  },
  "RF5G": {
    "col": 3,
    "text": {"RF5GH": "{homeTeam}", "RF5GN": "ไม่ใช่ทั้งหมด", "RF5GC": "{awayTeam}"},
    "sort": ["RF5GH", "RF5GN", "RF5GC"]
  },
  "RBG": {
    "col": 2,
    "text": {"RBGY": "ใช่", "RBGN": "ไม่"},
    "sort": ["RBGY", "RBGN"]
  },
  "RTS": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "RWN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "RWBO": {
    "col": 2,
    "text": {"RWBOY": "ใช่", "RWBON": "ไม่"},
    "sort": ["RWBO74", "RWBON"]
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
  "RTTG1": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} สูง {ratio}",
      "ROUHH": "{homeTeam} ต่ำ {ratio}",
      "ROUCC": "{awayTeam} สูง {ratio}",
      "ROUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RTTG2": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} สูง {ratio}",
      "ROUHH": "{homeTeam} ต่ำ {ratio}",
      "ROUCC": "{awayTeam}สูง {ratio}",
      "ROUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RTTG_OT": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} สูง{ratio}",
      "ROUHH": "{homeTeam} ต่ำ {ratio}",
      "ROUCC": "{awayTeam} สูง {ratio}",
      "ROUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RDNB1": {
    "col": 2,
    "text": {"RDNBH": "{homeTeam}", "RDNBA": "{awayTeam}"},
    "sort": ["RDNBH", "RDNBA"]
  },
  "RDNB2": {
    "col": 2,
    "text": {"RDNBH": "{homeTeam}", "RDNBA": "{awayTeam}"},
    "sort": ["RDNBH", "RDNBA"]
  },
  "RDNB3": {
    "col": 2,
    "text": {"RDNBH": "{homeTeam}", "RDNBA": "{awayTeam}"},
    "sort": ["RDNBH", "RDNBA"]
  },
  "BRG": {
    "col": 3,
    "text": {"BRGH": "{homeTeam}", "BRGC": "{awayTeam}", "BRGN": "บอลไม่เข้า"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG": {
    "col": 3,
    "text": {"CRGH": "{homeTeam}", "CRGC": "{awayTeam}", "CRGN": "บอลไม่เข้า"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG": {
    "col": 3,
    "text": {"DRGH": "{homeTeam}", "DRGC": "{awayTeam}", "DRGN": "บอลไม่เข้า"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG": {
    "col": 3,
    "text": {"ERGH": "{homeTeam}", "ERGC": "{awayTeam}", "ERGN": "บอลไม่เข้า"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG": {
    "col": 3,
    "text": {"FRGH": "{homeTeam}", "FRGC": "{awayTeam}", "FRGN": "บอลไม่เข้า"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG": {
    "col": 3,
    "text": {"GRGH": "{homeTeam}", "GRGC": "{awayTeam}", "GRGN": "บอลไม่เข้า"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG": {
    "col": 3,
    "text": {"HRGH": "{homeTeam}", "HRGC": "{awayTeam}", "HRGN": "บอลไม่เข้า"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG": {
    "col": 3,
    "text": {"IRGH": "{homeTeam}", "IRGC": "{awayTeam}", "IRGN": "บอลไม่เข้า"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG": {
    "col": 3,
    "text": {"JRGH": "{homeTeam}", "JRGC": "{awayTeam}", "JRGN": "บอลไม่เข้า"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "KRG": {
    "col": 3,
    "text": {"KRGH": "{homeTeam}", "KRGC": "{awayTeam}", "KRGN": "บอลไม่เข้า"},
    "sort": ["KRGH", "KRGC", "KRGN"]
  },
  "LRG": {
    "col": 3,
    "text": {"LRGH": "{homeTeam}", "LRGC": "{awayTeam}", "LRGN": "บอลไม่เข้า"},
    "sort": ["LRGH", "LRGC", "LRGN"]
  },
  "MRG": {
    "col": 3,
    "text": {"MRGH": "{homeTeam}", "MRGC": "{awayTeam}", "MRGN": "บอลไม่เข้า"},
    "sort": ["MRGH", "MRGC", "MRGN"]
  },
  "NRG": {
    "col": 3,
    "text": {"NRGH": "{homeTeam}", "NRGC": "{awayTeam}", "NRGN": "บอลไม่เข้า"},
    "sort": ["NRGH", "NRGC", "NRGN"]
  },
  "ORG": {
    "col": 3,
    "text": {"ORGH": "{homeTeam}", "ORGC": "{awayTeam}", "ORGN": "บอลไม่เข้า"},
    "sort": ["ORGH", "ORGC", "ORGN"]
  },
  'RCW': {
    'col': 3,
    'text': {'RCWH': '{homeTeam}', 'RCWC': '{awayTeam}', 'RCWN': 'เสมอ'},
    'sort': ['RCWH', 'RCWN', 'RCWC']
  },
  'RAH': {
    'col': 2,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'RAH_OT': {
    'col': 2,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'MROUE': {
    'col': 2,
    'text': {'ROUC': 'สูง {ratio}', 'ROUH': 'ต่ำ {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'MROUF': {
    'col': 2,
    'text': {'ROUC': 'สูง {ratio}', 'ROUH': 'ต่ำ {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
   "OU_OT": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHC": "สูง {ratio}", "OUHH": "ต่ำ {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "ROUH_OT": {
    "col": 2,
    "text": {"ROUHC": "สูง {ratio}", "ROUHH": "ต่ำ {ratio}"},
    "sort": ["ROUHC", "ROUHH"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCC": "สูง {ratio}", "OUCH": "ต่ำ {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCC": "สูง {ratio}", "ROUCH": "ต่ำ {ratio}"},
    "sort": ["ROUCC", "ROUCH"]
  },
};
