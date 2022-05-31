//ฟลอร์บอล
const dynamic op_fbRadioTypes = {
  "M": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
 
  "DM_OT": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M1": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "M2": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "RA": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "DR_OT": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R_OT": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R1": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R2": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUA": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "DOU_OT": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "T": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} สูง {ratio}",
      "THH": "{homeTeam} ต่ำ {ratio}",
      "TCC": "{awayTeam} สูง {ratio}",
      "TCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T1": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} สูง {ratio}",
      "THH": "{homeTeam} ต่ำ {ratio}",
      "TCC": "{awayTeam} สูง {ratio}",
      "TCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T2": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} สูง {ratio}",
      "THH": "{homeTeam} ต่ำ {ratio}",
      "TCC": "{awayTeam} สูง {ratio}",
      "TCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T_OT": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} สูง {ratio}",
      "THH": "{homeTeam} ต่ำ {ratio}",
      "TCC": "{awayTeam} สูง {ratio}",
      "TCH": "{awayTeam} ต่ำ",
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "W3": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "เสมอ {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "DNB": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้าบ้าน/ทีมเยือน", "DCCN": "ทีม/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  
  "TS": {
    "col": 2,
    "text": {"TSN": "ไม่"},
    "sort": ["TSN"]
  },
  'BG': {
    'col': 2,
    'text': {'BGY': 'ใช่', 'BGN': 'ไม่'},
    'sort': ['BGY', 'BGN']
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "บอลไม่เข้า", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS1": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "บอลไม่เข้า", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS2": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "บอลไม่เข้า", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FL": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "บอลไม่เข้า", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL1": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "บอลไม่เข้า", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL2": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "บอลไม่เข้า", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "EG": {
    "col": 2,
    "text": {
      "EGN": "บอลไม่เข้า",
      "EG1": "เข้า1ลูก",
      "EG2": "เข้า2ลูก",
      "EG3": "เข้า3ลูก",
      "EG4": "เข้า4ลูก",
      "EG5": "เข้า5ลูก",
      "EG6": "เข้า6ลูก",
      "EG7": "เข้า7ลูก",
      "EG8": "เข้า8ลูก",
      "EG9": "เข้า9ลูก",
      "EG10":"เข้า10ลูก",
      "EG11": "เข้า11ลูก",
      "EG12": "เข้า12ลูก",
      "EG13": "เข้า13ลูก",
      "EG14": "เข้า14ลูก",
      "EG15OV": "15ลูกหรือมากกว่านั้น"
    },
    "sort": [
      "EGN",
      "EG1",
      "EG2",
      "EG3",
      "EG4",
      "EG5",
      "EG6",
      "EG7",
      "EG8",
      "EG9",
      "EG10",
      "EG11",
      "EG12",
      "EG13",
      "EG14",
      "EG15OV"
    ]
  },
  "TEG": {
    "col": 2,
    "text": {
      "TEGH0": "{homeTeam} 0",
      "TEGH1": "{homeTeam} 1",
      "TEGH2": "{homeTeam} 2",
      "TEGH3": "{homeTeam} 3",
      "TEGH4": "{homeTeam} 4",
      "TEGH5": "{homeTeam} 5",
      "TEGH6": "{homeTeam} 6",
      "TEGH7": "{homeTeam} 7",
      "TEGH8": "{homeTeam} 8",
      "TEGH9": "{homeTeam} 9",
      "TEGHOV": "{homeTeam} 10+",
      "TEGC0": "{awayTeam} 0",
      "TEGC1": "{awayTeam} 1",
      "TEGC2": "{awayTeam} 2",
      "TEGC3": "{awayTeam} 3",
      "TEGC4": "{awayTeam} 4",
      "TEGC5": "{awayTeam} 5",
      "TEGC6": "{awayTeam} 6",
      "TEGC7": "{awayTeam} 7",
      "TEGC8": "{awayTeam} 8",
      "TEGC9": "{awayTeam} 9",
      "TEGCOV": "{awayTeam} 10+"
    },
    "sort": [
      "TEGH0",
      "TEGH1",
      "TEGH2",
      "TEGH3",
      "TEGH4",
      "TEGH5",
      "TEGH6",
      "TEGH7",
      "TEGH8",
      "TEGH9",
      "TEGHOV",
      "TEGC0",
      "TEGC1",
      "TEGC2",
      "TEGC3",
      "TEGC4",
      "TEGC5",
      "TEGC6",
      "TEGC7",
      "TEGC8",
      "TEGC9",
      "TEGCOV"
    ]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "{homeTeam} ผลต่าง1คะแนน",
      "WMH2": "{homeTeam} ผลต่าง2คะแนน",
      "WMH3": "{homeTeam} ผลต่าง3คะแนน",
      "WMHOV": "{homeTeam} ผลต่าง4+คะแนน",
      "WMC1": "{awayTeam} ผลต่าง1คะแนน",
      "WMC2": "{awayTeam} ผลต่าง2คะแนน",
      "WMC3": "{awayTeam} ผลต่าง3คะแนน",
      "WMCOV": "{awayTeam} ผลต่าง4+คะแนน"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "FA": {
    "col": 3,
    "text": {
      "FAHH": "เจ้าบ้า/เจ้าบ้าน",
      "FAHC": "เจ้าบ้าน/ทีมเยือน",
      "FAHN": "เจ้าบ้าน/ทีมรวม",
      "FACC": "ทีมรวม/ทีมเยือน",
      "FACH": "ทีมเยือน/เจ้าบ้าน",
      "FACN": "ทีมเยือน/ทีมรวม",
      "FANH": "ทีมรวม/เจ้าบ้าน",
      "FANC": "ทีมรวม/ทีมเยือน",
      "FANN": "ทีมรวม/ทีมรวม"
    },
    "sort": [
      "FAHH",
      "FAHC",
      "FAHN",
      "FACC",
      "FACH",
      "FACN",
      "FANH",
      "FANC",
      "FANN"
    ]
  },
  "MG": {
    "col": 2,
    "text": {"MG1": "เกมที่1", "MG2": "เกมที่2", "MG3": "เกมที่3", "MGN": "เสมอ"},
    "sort": ["MG1", "MG2", "MG3", "MGN"]
  },
  "WN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "T1G": {
    "col": 2,
    "text": {
      "T1G1": "ที่0-1นาที",
      "T1G2": "ที่1-2นาที",
      "T1G3": "ที่2-3นาที",
      "T1G4": "ที่3-4นาที",
      "T1G5": "ที่4-5นาที",
      "T1G6": "ที่5-6นาที",
      "T1G7": "ที่6-7นาที",
      "T1G8": "ที่7-8นาที",
      "T1G9": "ที่8-9นาที",
      "T1G10": "หลังจาก9นาที"
    },
    "sort": [
      "T1G1",
      "T1G2",
      "T1G3",
      "T1G4",
      "T1G5",
      "T1G6",
      "T1G7",
      "T1G8",
      "T1G9",
      "T1G10"
    ]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "WM_OT": {
    "col": 2,
    "text": {
      "WMH1": "{homeTeam} ผลต่าง1คะแนน",
      "WMH2": "{homeTeam} ผลต่าง2คะแนน",
      "WMH3": "{homeTeam} ผลต่าง3คะแนน",
      "WMHOV": "{homeTeam} ผลต่าง4+คะแนน",
      "WMC1": "{awayTeam} ผลต่าง1คะแนน",
      "WMC2": "{awayTeam} ผลต่าง2คะแนน",
      "WMC3": "{awayTeam} ผลต่าง3คะแนน",
      "WMCOV": "{awayTeam} ผลต่าง4+คะแนน"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "ใช่", "WBON": "ไม่"},
    "sort": ["WBOY", "WBON"]
  },
  "DNB1": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DNB2": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC1": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้า/ทีมเยือน", "DCCN": "ทีมเยือน/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/ทีมรวม", "DCHC": "เจ้าบ้าน/ทีมเยือน", "DCCN": "ทีมเยือน/ทีมรวม"},
    "sort": ["DCHN", "DCHC", "DCCN"]
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
  }
};
