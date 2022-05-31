//Khúc côn cầu trên băng
const dynamic op_ihRadioTypes = {
  'DC': {
    'col': 3,
    'text': {
      'DCCD': 'Chủ nhà/Hòa',
      'DCHN': 'Chủ nhà/Hòa',
      'DCHC': 'Chủ nhà/Đội khách',
      'DCCN': 'Đội khách/Hòa',
      'DCCC': 'Đội khách/Hòa',
      'DCDC': 'Đội khách/Hòa'
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
      "RFMD": "Hòa {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUH12": "Tài {ratio}", "OUH13": "Xỉu {ratio}"},
    "sort": ["OUH12", "OUH13"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC12": "Tài {ratio}", "OUC13": "Xỉu {ratio}"},
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
    "text": {"OTM1": "{homeTeam}", "OTM2": "Hòa", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOU12": "Tài {ratio}", "OTOU13": "Xỉu {ratio}"},
    "sort": ["OTOU12", "OTOU13"]
  },
  "M_PS": {
    "col": 2,
    "text": {"M_PS4": "{homeTeam}", "M_PS5": "{awayTeam}"},
    "sort": ["M_PS4", "M_PS5"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Có", "WBON": "Không"},
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
      "HSQ1621": "Hiệp 1",
      "HSQ1622": "Hiệp 2",
      "HSQ1623": "Hiệp 3",
      "HSQ1624": "Ghi điểm giống nhau"
    },
    "sort": ["HSQ1621", "HSQ1622", "HSQ1623", "HSQ1624"]
  },
  "MP": {
    "col": 3,
    "text": {"MP1": "{homeTeam}", "MP2": "Hòa", "MP3": "{awayTeam}"},
    "sort": ["MP1", "MP2", "MP3"]
  },
  'CW': {
    'col': 3,
    'text': {'CWH': '{homeTeam}', 'CWN': 'Hòa', 'CWC': '{awayTeam}'},
    'sort': ['CWH', 'CWN', 'CWC']
  },
  "PRFM": {
    "col": 3,
    "text": {
      "PRFMH": "{homeTeam} {ratio}",
      "PRFMD": "Hòa {ratio}",
      "PRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["PRFMH", "PRFMD", "PRFMC"]
  },
  "POU": {
    "col": 2,
    "text": {"POU12": "Tài {ratio}", "POU13": "Xỉu {ratio}"},
    "sort": ["POU12", "POU13"]
  },
  "POUH": {
    "col": 2,
    "text": {"POUH12": "Tài {ratio}", "POUH13": "Xỉu {ratio}"},
    "sort": ["POUH12", "POUH13"]
  },
  "POUC": {
    "col": 2,
    "text": {"POUC12": "Tài {ratio}", "POUC13": "Xỉu {ratio}"},
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
    "text": {"PEO70": "Đơn", "PEO72": "Đôi"},
    "sort": ["PEO70", "PEO72"]
  },
  "PDC": {
    "col": 3,
    "text": {"PDCCD": "Chủ nhà/Hòa", "PDCCC": "Chủ nhà/Đội khách", "PDCDC": "Hòa/Đội khách"},
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
    "text": {"F2GH": "{homeTeam}", "F2GN": "Đều không phải", "F2GC": "{awayTeam}"},
    "sort": ["F2GH", "F2GN", "F2GC"]
  },
  "F3G": {
    "col": 3,
    "text": {"F3GH": "{homeTeam}", "F3GN": "Đều không phải", "F3GC": "{awayTeam}"},
    "sort": ["F3GH", "F3GN", "F3GC"]
  },
  "F4G": {
    "col": 3,
    "text": {"F4GH": "{homeTeam}", "F4GN": "Đều không phải", "F4GC": "{awayTeam}"},
    "sort": ["F4GH", "F4GN", "F4GC"]
  },
  "F5G": {
    "col": 3,
    "text": {"F5GH": "{homeTeam}", "F5GN": "Đều không phải", "F5GC": "{awayTeam}"},
    "sort": ["F5GH", "F5GN", "F5GC"]
  },
  "GA": {
    "col": 2,
    "text": {"GAF": "9 phút30 giây trước", "GAL": "9 phút30 giây "},
    "sort": ["GAF", "GAL"]
  },
  "DC1": {
    "col": 3,
    "text": {"DCHN": "Chủ/Hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/Hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC2": {
    "col": 3,
    "text": {"DCHN": "Chủ/Hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/Hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "text": {"DCHN": "Chủ/Hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/Hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TW": {
    "col": 2,
    "text": {
      "TWN": "Không có bóng vào",
      "TW1": "1 bàn thắng",
      "TW2": "2 bàn thắng",
      "TW3": "3 bàn thắng",
      "TW4": "4 bàn thắng",
      "TW5": "5 bàn thắng",
      "TW6": "6 bàn thắng",
      "TW7": "7 bàn thắng",
      "TW8OV": "8 bàn thắng hoặc nhiều hơn"
    },
    "sort": ["TWN", "TW1", "TW2", "TW3", "TW4", "TW5", "TW6", "TW7", "TW8OV"]
  },
  "RTW": {"col": 2, "text": {}, "sort": []},
  "TS": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "TS1": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "TS2": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "TS3": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
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
    "text": {"MG1": "Phần 1", "MG2": "Phần 2", "MG3": "Phần 3", "MGN": "Hòa"},
    "sort": ["MG1", "MG2", "MG3", "MGN"]
  },
  "WN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "Đều không phải", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS1": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "Đều không phải", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS2": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "Đều không phải", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FS3": {
    "col": 3,
    "text": {"FSH": "{homeTeam}", "FSN": "Đều không phải", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSN", "FSC"]
  },
  "FL": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "Đều không phải", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL1": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "Đều không phải", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL2": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "Đều không phải", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "FL3": {
    "col": 3,
    "text": {"FLH": "{homeTeam}", "FLN": "Đều không phải", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLN", "FLC"]
  },
  "TTG_OT": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG1": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG2": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "TTG3": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "M1": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R1": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M2": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R2": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M3": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R3": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU3": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "BG": {
    "col": 2,
    "text": {"BGY": "Có", "BGN": "Không"},
    "sort": ["BGY", "BGN"]
  },
  "WM_OT": {
    "col": 2,
    "text": {
      "WM113": "{homeTeam} Thắng cách biệt 1 bóng",
      "WM114": "{homeTeam} Thắng cách biệt 2 bóng",
      "WM120": "{homeTeam} Thắng cách biệt 3 bóng",
      "WM121": "{homeTeam} Thắng cách biệt 4 bóng",
      "WM122": "{homeTeam} Thắng cách biệt 5 bóng hoặc nhiều hơn",
      "WM116": "{awayTeam} Thắng cách biệt 1 bóng",
      "WM117": "{awayTeam} Thắng cách biệt 2 bóng",
      "WM123": "{awayTeam} Thắng cách biệt 3 bóng",
      "WM124": "{awayTeam} Thắng cách biệt 4 bóng",
      "WM125": "{awayTeam} Thắng cách biệt 5 bóng hoặc nhiều hơn"
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
    "text": {"EOO": "Đơn", "EOE": "Đôi"},
    "sort": ["EOO", "EOE"]
  },
  "TGOU_OT": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WM113": "{homeTeam} Thắng cách biệt 1 bóng",
      "WM114": "{homeTeam} Thắng cách biệt 2 bóng",
      "WM120": "{homeTeam} Thắng cách biệt 3 bóng",
      "WM121": "{homeTeam} Thắng cách biệt 4 bóng",
      "WM122": "{homeTeam} Thắng cách biệt 5 bóng",
      "WM123": "{homeTeam} Thắng cách biệt 6 bóng hoặc nhiều hơn",
      "WM116": "{awayTeam} Thắng cách biệt 1 bóng",
      "WM117": "{awayTeam} Thắng cách biệt 2 bóng",
      "WM124": "{awayTeam} Thắng cách biệt 3 bóng",
      "WM125": "{awayTeam} Thắng cách biệt 4 bóng",
      "WM126": "{awayTeam} Thắng cách biệt 5 bóng",
      "WM127": "{awayTeam} Thắng cách biệt 6 bóng hoặc nhiều hơn",
      "WM119": "Hòa"
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
      "AFHH": "Chủ/Hòa",
      "AFHC": "Chủ/Khách",
      "AFHN": "Chủ/Hòa",
      "AFCC": "Khách/Khách",
      "AFCH": "Khách/Chủ",
      "AFCN": "Khách/Hòa",
      "AFNH": "Hòa/Chủ",
      "AFNC": "Hòa/Khách",
      "AFNN": "Hòa/Hòa"
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
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  
  'RM1': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  "RE1": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU1": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RM2': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RE2': {
    'col': 2,
    'text': {'REH': '{homeTeam} {ratio}', 'REC': '{awayTeam} {ratio}'},
    'sort': ['REH', 'REC']
  },
  "ROU2": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RM3': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  "RE3": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU3": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RTGOU_OT": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "Đơn", "REOE": "Đôi"},
    "sort": ["REOO", "REOE"]
  },
  "RDNM": {
    "col": 2,
    "text": {"RDNMH": "{homeTeam}", "RDNMA": "{awayTeam}"},
    "sort": ["RDNMH", "RDNMA"]
  },
  "RDC": {
    "col": 3,
    "text": {"RDCHN": "Chủ nhà/Hòa", "RDCHC": "Chủ nhà/Đội khách", "RDCCN": "Đội khách/Hòa"},
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
      "RWM113": "{homeTeam} Thắng cách biệt 1 bóng",
      "RWM114": "{homeTeam} Thắng cách biệt 2 bóng",
      "RWM120": "{homeTeam} Thắng cách biệt 3 bóng",
      "RWM121": "{homeTeam} Thắng cách biệt 4 bóng",
      "RWM122": "{homeTeam} Thắng cách biệt 5 bóng hoặc nhiều hơn",
      "RWM116": "{awayTeam} Thắng cách biệt 1 bóng",
      "RWM117": "{awayTeam} Thắng cách biệt 2 bóng",
      "RWM123": "{awayTeam} Thắng cách biệt 3 bóng",
      "RWM124": "{awayTeam} Thắng cách biệt 4 bóng",
      "RWM125": "{awayTeam} Thắng cách biệt 5 bóng hoặc nhiều hơn"
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
      "RWM113": "{homeTeam} Thắng cách biệt 1 bóng",
      "RWM114": "{homeTeam} Thắng cách biệt 2 bóng",
      "RWM120": "{homeTeam} Thắng cách biệt 3 bóng",
      "RWM121": "{homeTeam} Thắng cách biệt 4 bóng",
      "RWM122": "{homeTeam} Thắng cách biệt 5 bóng",
      "RWM123": "{homeTeam} Thắng cách biệt 6 bóng hoặc nhiều hơn",
      "RWM116": "{awayTeam} Thắng cách biệt 1 bóng",
      "RWM117": "{awayTeam} Thắng cách biệt 2 bóng",
      "RWM124": "{awayTeam} Thắng cách biệt 3 bóng",
      "RWM125": "{awayTeam} Thắng cách biệt 4 bóng",
      "RWM126": "{awayTeam} Thắng cách biệt 5 bóng",
      "RWM127": "{awayTeam} Thắng cách biệt 6 bóng hoặc nhiều hơn",
      "RWM119": "Hòa"
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
    "text": {"RF2GH": "{homeTeam}", "RF2GN": "Đều không phải", "RF2GC": "{awayTeam}"},
    "sort": ["RF2GH", "RF2GN", "RF2GC"]
  },
  "RF3G": {
    "col": 3,
    "text": {"RF3GH": "{homeTeam}", "RF3GN": "Đều không phải", "RF3GC": "{awayTeam}"},
    "sort": ["RF3GH", "RF3GN", "RF3GC"]
  },
  "RF4G": {
    "col": 3,
    "text": {"RF4GH": "{homeTeam}", "RF4GN": "Đều không phải", "RF4GC": "{awayTeam}"},
    "sort": ["RF4GH", "RF4GN", "RF4GC"]
  },
  "RF5G": {
    "col": 3,
    "text": {"RF5GH": "{homeTeam}", "RF5GN": "Đều không phải", "RF5GC": "{awayTeam}"},
    "sort": ["RF5GH", "RF5GN", "RF5GC"]
  },
  "RBG": {
    "col": 2,
    "text": {"RBGY": "Có", "RBGN": "Không"},
    "sort": ["RBGY", "RBGN"]
  },
  "RTS": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "RWN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "RWBO": {
    "col": 2,
    "text": {"RWBOY": "Có", "RWBON": "Không"},
    "sort": ["RWBO74", "RWBON"]
  },
  "RTTG": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} Tài {ratio}",
      "ROUHH": "{homeTeam} Xỉu {ratio}",
      "ROUCC": "{awayTeam} Tài {ratio}",
      "ROUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RTTG1": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} Tài {ratio}",
      "ROUHH": "{homeTeam} Xỉu {ratio}",
      "ROUCC": "{awayTeam} Tài {ratio}",
      "ROUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RTTG2": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} Tài {ratio}",
      "ROUHH": "{homeTeam} Xỉu {ratio}",
      "ROUCC": "{awayTeam} Tài {ratio}",
      "ROUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RTTG_OT": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} Tài {ratio}",
      "ROUHH": "{homeTeam} Xỉu {ratio}",
      "ROUCC": "{awayTeam} Tài {ratio}",
      "ROUCH": "{awayTeam} Xỉu {ratio}"
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
    "text": {"BRGH": "{homeTeam}", "BRGC": "{awayTeam}", "BRGN": "Không có bóng vào"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG": {
    "col": 3,
    "text": {"CRGH": "{homeTeam}", "CRGC": "{awayTeam}", "CRGN": "Không có bóng vào"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG": {
    "col": 3,
    "text": {"DRGH": "{homeTeam}", "DRGC": "{awayTeam}", "DRGN": "Không có bóng vào"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG": {
    "col": 3,
    "text": {"ERGH": "{homeTeam}", "ERGC": "{awayTeam}", "ERGN": "Không có bóng vào"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG": {
    "col": 3,
    "text": {"FRGH": "{homeTeam}", "FRGC": "{awayTeam}", "FRGN": "Không có bóng vào"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG": {
    "col": 3,
    "text": {"GRGH": "{homeTeam}", "GRGC": "{awayTeam}", "GRGN": "Không có bóng vào"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG": {
    "col": 3,
    "text": {"HRGH": "{homeTeam}", "HRGC": "{awayTeam}", "HRGN": "Không có bóng vào"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG": {
    "col": 3,
    "text": {"IRGH": "{homeTeam}", "IRGC": "{awayTeam}", "IRGN": "Không có bóng vào"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG": {
    "col": 3,
    "text": {"JRGH": "{homeTeam}", "JRGC": "{awayTeam}", "JRGN": "Không có bóng vào"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "KRG": {
    "col": 3,
    "text": {"KRGH": "{homeTeam}", "KRGC": "{awayTeam}", "KRGN": "Không có bóng vào"},
    "sort": ["KRGH", "KRGC", "KRGN"]
  },
  "LRG": {
    "col": 3,
    "text": {"LRGH": "{homeTeam}", "LRGC": "{awayTeam}", "LRGN": "Không có bóng vào"},
    "sort": ["LRGH", "LRGC", "LRGN"]
  },
  "MRG": {
    "col": 3,
    "text": {"MRGH": "{homeTeam}", "MRGC": "{awayTeam}", "MRGN": "Không có bóng vào"},
    "sort": ["MRGH", "MRGC", "MRGN"]
  },
  "NRG": {
    "col": 3,
    "text": {"NRGH": "{homeTeam}", "NRGC": "{awayTeam}", "NRGN": "Không có bóng vào"},
    "sort": ["NRGH", "NRGC", "NRGN"]
  },
  "ORG": {
    "col": 3,
    "text": {"ORGH": "{homeTeam}", "ORGC": "{awayTeam}", "ORGN": "Không có bóng vào"},
    "sort": ["ORGH", "ORGC", "ORGN"]
  },
  'RCW': {
    'col': 3,
    'text': {'RCWH': '{homeTeam}', 'RCWC': '{awayTeam}', 'RCWN': 'Hòa'},
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
    'text': {'ROUC': 'Tài {ratio}', 'ROUH': 'Xỉu {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'MROUF': {
    'col': 2,
    'text': {'ROUC': 'Tài {ratio}', 'ROUH': 'Xỉu {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
   "OU_OT": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHC": "Tài {ratio}", "OUHH": "Xỉu {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "ROUH_OT": {
    "col": 2,
    "text": {"ROUHC": "Tài {ratio}", "ROUHH": "Xỉu {ratio}"},
    "sort": ["ROUHC", "ROUHH"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCC": "Tài {ratio}", "OUCH": "Xỉu {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCC": "Tài {ratio}", "ROUCH": "Xỉu {ratio}"},
    "sort": ["ROUCC", "ROUCH"]
  },
};
