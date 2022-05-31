// ฟุตบอล
const dynamic bk_aftRadioTypes = {
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "FM": {
    "col": 3,
    "text": {"FMH": "{homeTeam}", "FMN": "เสมอ", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "DC": {
    "col": 3,
    "text": {
      "DCHH": "เจ้าบ้าน/เจ้าบ้าน",
      "DCHC": "เจ้าบ้าน/ทีมเยือน",
      "DCHN": "เจ้าบ้าน/ทีมรวม",
      "DCCC": "ทีมเยือน/ทีมเยือน",
      "DCCH": "ทีมเยือน/เจ้าบ้าน",
      "DCCN": "เจ้า/ทีมรวม",
      "DCNH": "ทีมรวม/เจ้าบ้าน",
      "DCNC": "ทีมรวม/ทีมเยือน",
      "DCNN": "ทีมรวม/ทีมรวม"
    },
    "sort": [
      "DCHH",
      "DCHC",
      "DCHN",
      "DCCC",
      "DCCH",
      "DCCN",
      "DCNH",
      "DCNC",
      "DCNN"
    ]
  },
  "HS": {
    "col": 3,
    "text": {"HS1": "ครึ่งแรก", "HS2": "ครึ่งหลัง", "HSE": "ได้คะแนนเท่ากัน"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  "HOUH": {
    "col": 2,
    "text": {"HOUHO": "สูง {ratio}", "HOUHU": "ต่ำ {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "สูง {ratio}", "HOUCU": "ต่ำ {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "ใช่", "WBON": "ไม่"},
    "sort": ["WBOY", "WBON"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "สูง{ratio}", "OUHU": "ต่ำ {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "สูง {ratio}", "OUCU": "ต่ำ {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
  "RP": {
    "col": 2,
    "text": {"RPH": "{homeTeam}", "RPA": "{awayTeam}"},
    "sort": ["RPH", "RPA"]
  },
  "HSQ": {
    "col": 3,
    "text": {
      "HSQ1": "เซ็ตแรก",
      "HSQ2": "เซ็ตที่สอง",
      "HSQ3": "เซ้ตที่สาม",
      "HSQ4": "เซ็ตที่สี่",
      "HSQE": "ได้คะแนนเท่ากัน"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
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
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "คี่", "HEOHE": "คู่"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "คี่", "HEOCE": "คู่"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "TTO": {
    "col": 2,
    "text": {"TTOO": "สูง {ratio}", "TTOU": "ต่ำ {ratio}"},
    "sort": ["TTOO", "TTOU"]
  },
  "TFG": {
    "col": 2,
    "text": {"TFGO": "สูง {ratio}", "TFGU": "ต่ำ {ratio}"},
    "sort": ["TFGO", "TFGU"]
  },
  "EO2": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู้"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ1": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ2": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ3": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ4": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  
  "HM": {
    "col": 2,
    "text": {"HMH": "{homeTeam}", "HMC": "{awayTeam}"},
    "sort": ["HMH", "HMC"]
  },
  "HRM": {
    "col": 2,
    "text": {"HRMH": "{homeTeam}", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMC"]
  },
  
  "TD": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "G": {
    "col": 2,
    "text": {
      "GHC": "{homeTeam} สูง {ratio}",
      "GHH": "{awayTeam} ต่ำ {ratio}",
      "GCC": "{homeTeam} สูง {ratio}",
      "GCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["GHC", "GHH", "GCC", "GCH"]
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC"]
  },
  "FL": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC"]
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEHOO": "คี่",
      "TEHOE": "คู่",
      "TECOO": "คี่",
      "TECOE": "คู่"
    },
    "sort": ["TEHOO", "TEHOE", "TECOO", "TECOE"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMHA": "{homeTeam} ผลต่าง 1-6",
      "WMHB": "{awayTeam} ผลต่าง7-12",
      "WMHC": "{homeTeam} ผลต่าง 13-18",
      "WMHD": "{awayTeam} ผลต่าง 19-24",
      "WMHE": "{homeTeam} ผลต่าง 25-30",
      "WMHF": "{awayTeam} ผลต่าง 21-36",
      "WMHG": "{homeTeam} ผลต่าง 37-42",
      "WMHH": "{awayTeam} ผลต่าง 43 ขึ้นไป",
      "WMCA": "{homeTeam} ผลต่าง 1-6",
      "WMCB": "{awayTeam} ผลต่าง 7-12",
      "WMCC": "{homeTeam} ผลต่าง 13-18",
      "WMCD": "{awayTeam} ผลต่าง 19-24",
      "WMCE": "{homeTeam} ผลต่าง 25-30",
      "WMCF": "{awayTeam} ผลต่าง21-36",
      "WMCG": "{homeTeam} ผลต่าง 37-42",
      "WMCH": "{awayTeam} ผลต่าง 43 ขึ้นไป"
    },
    "sort": [
      "WMHA",
      "WMHB",
      "WMHC",
      "WMHD",
      "WMHE",
      "WMHF",
      "WMHG",
      "WMHH",
      "WMCA",
      "WMCB",
      "WMCC",
      "WMCD",
      "WMCE",
      "WMCF",
      "WMCG",
      "WMCH"
    ]
  },
  "HG": {
    "col": 3,
    "text": {"HGH": "{homeTeam}", "HGN": "ได้คะแนนเท่ากัน", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "THSQ": {
    "col": 3,
    "text": {"THSQH": "{homeTeam}", "THSQN": "เสมอ", "THSQC": "{awayTeam}"},
    "sort": ["THSQH", "THSQN", "THSQC"]
  },
  "AH": {
    "col": 2,
    "text": {"ARH": "{homeTeam} {ratio}", "ARC": "{awayTeam} {ratio}"},
    "sort": ["ARH", "ARC"]
  },
  "AG": {
    "col": 2,
    "text": {"AOUC": "สูง{ratio}", "AOUH": "ต่ำ {ratio}"},
    "sort": ["AOUC", "AOUH"]
  },
  "FP": {
    "col": 2,
    "text": {"FPH": "{homeTeam}", "FPC": "{awayTeam}"},
    "sort": ["FPH", "FPC"]
  },
  "FT": {
    "col": 2,
    "text": {"FTH": "{homeTeam}", "FTC": "{awayTeam}"},
    "sort": ["FTH", "FTC"]
  },
  "FCC": {
    "col": 2,
    "text": {"FCCH": "{homeTeam}", "FCCC": "{awayTeam}"},
    "sort": ["FCCH", "FCCC"]
  },
  'ARH': {
      'col': 2,
      'text': {
        'ARHH': '{homeTeam} {ratio}',
        'ARHC': '{awayTeam} {ratio}'
      },
      'sort': ['ARHH', 'ARHC']
    },
    'RAG': {
      'col': 2,
      'text': {
        'RAGC': 'สูง{ratio}',
        'RAGH': 'ต่ำ {ratio}'
      },
      'sort': ['RAGC', 'RAGH']
    },
  "RG": {
    "col": 2,
    "text": {
      "RGHC": "{homeTeam} สูง {ratio}",
      "RGHH": "{awayTeam}ต่ำ {ratio}",
      "RGCC": "{homeTeam}สูง {ratio}",
      "RGCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["RGHC", "RGHH", "RGCC", "RGCH"]
  },
  "RHG": {
    "col": 3,
    "text": {"HGH": "{homeTeam}", "HGN": "ได้คะแนนเท่ากัน", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "RWM": {
    "col": 2,
    "text": {
      "RWMHA": "{homeTeam} ผลต่าง 1-6",
      "RWMHB": "{awayTeam} ผลต่าง 7-12",
      "RWMHC": "{homeTeam} ผลต่าง 13-18",
      "RWMHD": "{awayTeam} ผลต่าง 19-24",
      "RWMHE": "{homeTeam} ผลต่าง 25-30",
      "RWMHF": "{awayTeam} ผลต่าง 21-36",
      "RWMHG": "{homeTeam} ผลต่าง 37-42",
      "RWMHH": "{awayTeam} ผลต่าง 43+",
      "RWMCA": "{homeTeam} ผลต่าง 1-6",
      "RWMCB": "{awayTeam} ผลต่าง 7-12",
      "RWMCC": "{homeTeam} ผลต่าง 13-18",
      "RWMCD": "{awayTeam} ผลต่าง 19-24",
      "RWMCE": "{homeTeam} ผลต่าง25-30",
      "RWMCF": "{awayTeam} ผลต่าง 21-36",
      "RWMCG": "{homeTeam} ผลต่าง 37-42",
      "RWMCH": "{awayTeam} ผลต่าง 43+"
    },
    "sort": [
      "RWMHA",
      "RWMHB",
      "RWMHC",
      "RWMHD",
      "RWMHE",
      "RWMHF",
      "RWMHG",
      "RWMHH",
      "RWMCA",
      "RWMCB",
      "RWMCC",
      "RWMCD",
      "RWMCE",
      "RWMCF",
      "RWMCG",
      "RWMCH"
    ]
  },
  "RWBO": {
    "col": 2,
    "text": {"RWBOY": "ใช่", "RWBON": "ไม่"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEHOO": "คี่",
      "RTEHOE": "คู่",
      "RTECOO": "คี่",
      "RTECOE": "คู่"
    },
    "sort": ["RTEHOO", "RTEHOE", "RTECOO", "RTECOE"]
  },
  "RDC": {
    "col": 3,
    "text": {
      "RDCHH": "เจ้าบ้าน/เจ้าบ้าน",
      "RDCHC": "เจ้าบ้าน/ทีมเยือน",
      "RDCHN": "เจ้าบ้าน/ทีมรวม",
      "RDCCC": "ทีมเยือน/ทีมเยือน",
      "RDCCH": "ทีมเยือน/เจ้าบ้าน",
      "RDCCN": "ทีมเยือน/ทีมรวม",
      "RDCNH": "ทีมรวม/เจ้าบ้าน",
      "RDCNC": "เจ้าบ้าน/ทีมเยือน",
      "RDCNN": "ทีมรวม/ทีมรวม"
    },
    "sort": [
      "RDCHH",
      "RDCHC",
      "RDCHN",
      "RDCCC",
      "RDCCH",
      "RDCCN",
      "RDCNH",
      "RDCNC",
      "RDCNN"
    ]
  },
  "RFS": {
    "col": 2,
    "text": {"RFSH": "{homeTeam}", "RFSC": "{awayTeam}"},
    "sort": ["RFSH", "RFSC"]
  },
  "RFM": {
    "col": 3,
    "text": {"RFMH": "{homeTeam}", "RFMD": "เกมส์เสมอ", "RFMA": "{awayTeam}"},
    "sort": ["RFMH", "RFMD", "RFMA"]
  }
};
