//แฮนด์บอล
const dynamic op_hbRadioTypes = {
  "M": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "DC": {
    "col": 3,
    "text": {"DCCD": "เจ้าบ้าน/เสมอ", "DCCC": "เจ้าบ้าน/ทีมเยือน", "DCDC": "เสมอ/ทีมเยือน"},
    "sort": ["DCCD", "DCCC", "DCDC"]
  },
  'RFM': {
    'col': 3,
    'text': {
      'RFMH': '{homeTeam} {ratio}',
      'RFMD': 'เสมอ {ratio}',
      'RFMN': 'เสมอ {ratio}',
      'RFMC': '{awayTeam} {ratio}'
    },
    'sort': ['RFMH', 'RFMN', 'RFMD', 'RFMC']
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "สูง {ratio}", "OUHU": "ต่ำ {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "สูง {ratio}", "OUCU": "ต่ำ {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
  "EG": {
    "col": 2,
    "text": {
      "EG25": "0-46",
      "EG26": "47-49",
      "EG27": "50-52",
      "EG28": "53-55",
      "EG29": "56-58",
      "EG30": "59-61",
      "EG31": "62+"
    },
    "sort": ["EG25", "EG26", "EG27", "EG28", "EG29", "EG30", "EG31"]
  },
  "OUM": {
    "col": 2,
    "text": {
      "OUM794": "เจ้าบ้าน&ต่ำกว่า{total}",
      "OUM796": "เจ้าบ้าน&สูงกว่า{total}",
      "OUM798": "เสมอ&ต่ำกว่า{total}",
      "OUM800": "เสมอ&สูงกว่า{total}",
      "OUM802": "ทีมเยือน&ต่ำกว่า{total}",
      "OUM804": "ทีมเยือน&สูงกว่า{total}"
    },
    "sort": ["OUM794", "OUM796", "OUM798", "OUM800", "OUM802", "OUM804"]
  },
  "HS": {
    "col": 3,
    "text": {"HS1": "ครึ่งแรก", "HS2": "ครึ่งหลัง", "HSE": "ได้คะแนนเท่้ากัน"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  'HM': {
    'col': 3,
    'text': {
      'HM1': '{homeTeam}',
      'HMH': '{homeTeam}',
      'HM2': 'เสมชนะ',
      'HMN': 'เสมชนะ',
      'HM3': '{awayTeam}',
      'HMC': '{awayTeam}'
    },
    'sort': ['HM1', 'HM2', 'HM3', 'HMH', 'HMN', 'HMC']
  },
  "HDC": {
    "col": 3,
    "text": {"HDCCD": "เจ้าบ้าน/เสมอ", "HDCCC": "เจ้าบ้าน/ทีมเยือน", "HDCDC": "เสมอ/ทีมเยือน"},
    "sort": ["HDC9", "HDCCC", "HDCDC"]
  },
  "HRFM": {
    "col": 3,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "เสมอ {ratio}",
      'HRFMN': 'เสมอ {ratio}',
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ['HRFMH', 'HRFMN', 'HRFMD', 'HRFMC']
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
  
  "HOUM": {
    "col": 2,
    "text": {
      "HOUM794": "เจ้าบ้าน&ต่ำกว่า{total}",
      "HOUM796": "เจ้าบ้าน&สูงกว่า{total}",
      "HOUM798": "เสมอ&ต่ำกว่า{total}",
      "HOUM800": "เสมอ&สูงกว่า{total}",
      "HOUM802": "ทีมเยือน&ต่ำกว่า{total}",
      "HOUM804": "ทีมเยือน&สูงกว่า{total}"
    },
    "sort": ["HOUM794", "HOUM796", "HOUM798", "HOUM800", "HOUM802", "HOUM804"]
  },
  "HWM": {
    "col": 2,
    "text": {
      "HWMA": "{homeTeam} ผลต่าง1-2คะแนน",
      "HWMB": "{homeTeam}ผลต่าง3-4คะแนน",
      "HWMC": "{homeTeam} ผลต่าง5-6คะแนน",
      "HWMD": "{homeTeam} ผลต่าง7+",
      "HWME": "{awayTeam}ผลต่าง ผลต่าง1-2คะแนน",
      "HWMF": "{awayTeam} ผลต่าง3-4คะแนน",
      "HWMG": "{awayTeam} ผลต่าง5-6คะแนน",
      "HWMH": "{awayTeam} ผลต่าง7+",
      "HWMI": "เสมอ"
    },
    "sort": ["HWMA", "HWMB", "HWMC", "HWME", "HWMF", "HWMG", "HWMH", "HWMI"]
  },
  "OTR": {
    "col": 2,
    "text": {"OTRH": "{homeTeam} {ratio}", "OTRC": "{awayTeam} {ratio}"},
    "sort": ["OTRH", "OTRC"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "สูง {ratio}", "OTOUU": "ต่ำ {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "M_OT": {
    "col": 2,
    "text": {"M_OT4": "{homeTeam}", "M_OT5": "{awayTeam}"},
    "sort": ["M_OT4", "M_OT5"]
  },
  "HST": {
    "col": 3,
    "text": {"HST1": "{homeTeam}", "HST2": "เสมอ", "HST3": "{awayTeam}"},
    "sort": ["HST1", "HST2", "HST3"]
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "คี่",
      "TEOHE": "คู่",
      "TEOCO": "คี่",
      "TEOCE": "คู่"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
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
  "F": {
    "col": 3,
    "text": {
      "FHH": "เจ้าบ้าน/ทีมรวม",
      "FHC": "เจ้าบ้าน/ทีมรวม",
      "FHN": "เจ้าบ้าน/ทีมรวม",
      "FCC": "ทีมเยือน/ทีมเยือน",
      "FCH": "ทีมเยือน/เจ้าบ้าน",
      "FCN": "ทีมเยือน/ทีมรวม",
      "FNH": "ทีมรวม/เจ้าบ้าน",
      "FNC": "ทีมรวม/ทีมรวม",
      "FNN": "ทีมรวม/ทีมรวม"
    },
    "sort": ["FHH", "FHC", "FHN", "FCC", "FCH", "FCN", "FNH", "FNC", "FNN"]
  },
  'AH': {
    'col': 2,
    'text': {
      'AHH': '{homeTeam} {ratio}',
      'AHC': '{homeTeam} {ratio}',
    },
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'สูง {ratio}', 'AGH': 'ต่ำ {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "DNB": {
    "col": 2,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "HDNB": {
    "col": 2,
    "text": {"HDNBH": "{homeTeam}", "HDNBA": "{awayTeam}"},
    "sort": ["HDNBH", "HDNBA"]
  },
  "HTEO": {
    "col": 2,
    "text": {
      "HTEOHO": "คี่",
      "HTEOHE": "คู่",
      "HTEOCO": "คี่",
      "HTEOCE": "คู่"
    },
    "sort": ["HTEOHO", "HTEOHE", "HTEOCO", "HTEOCE"]
  },
  "HTEO2": {
    "col": 2,
    "text": {
      "HTEO2HO": "คี่",
      "HTEO2HE": "คู่",
      "HTEO2CO": "คี่",
      "HTEO2CE": "คู่"
    },
    "sort": ["HTEO2HO", "HTEO2HE", "HTEO2CO", "HTEO2CE"]
  },
  "HTTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} สูง {ratio}",
      "OUHH": "{homeTeam} ต่ำ {ratio}",
      "OUCC": "{awayTeam} สูง{ratio}",
      "OUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "คี่่", "HEO2E": "คู่"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "WM5": {
    "col": 2,
    "text": {
      "WM5A": "{homeTeam} ผลต่าง1-5คะแนน",
      "WM5B": "{homeTeam} ผลต่าง6+คะแนน",
      "WM5C": "{awayTeam} ผลต่าง1-5คะแนน",
      "WM5D": "{awayTeam} ผลต่าง6+คะแนน",
      "WM5E": "เสมอ"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5D", "WM5E"]
  },
  "WM3": {
    "col": 3,
    "text": {
      "WM3A": "{homeTeam} ผลต่าง3คะแนนขึ้นไป",
      "WM3B": "{awayTeam} ผลต่าง3คะแนนชึ้นไป",
      "WM3C": "เสมอหรือทีมใดๆชนะ2คะแนน"
    },
    "sort": ["WM3A", "WM3B", "WM3C"]
  },
  "HWM3": {
    "col": 3,
    "text": {
      "HWM3A": "{homeTeam} ผลต่าง2คะแนนขึ้นไป",
      "HWM3B": "{awayTeam} ผลต่าง2คะแนนขึ้นไป",
      "HWM3C": "เสมอหรือทีมใดๆชนะ1คะแนน"
    },
    "sort": ["HWM3A", "HWM3B", "HWM3C"]
  },
  "RTA": {
    "col": 3,
    "text": {"RTAH": "{homeTeam}", "RTAN": "ไม่ใช่ทั้งหมด", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAH", "RTAC"]
  },
  "RTB": {
    "col": 3,
    "text": {"RTBH": "{homeTeam}", "RTBN": "ไม่ใช่ทั้งหมด", "RTBC": "{awayTeam}"},
    "sort": ["RTBH", "RTBH", "RTBC"]
  },
  "RTC": {
    "col": 3,
    "text": {"RTCH": "{homeTeam}", "RTCN": "ไม่ใช่ทั้งหมด", "RTCC": "{awayTeam}"},
    "sort": ["RTCH", "RTCH", "RTCC"]
  },
  "HRTA": {
    "col": 3,
    "text": {"HRTAH": "{homeTeam}", "HRTAN": "ไม่ใช่ทั้งหมด", "HRTAC": "{awayTeam}"},
    "sort": ["HRTAH", "HRTAN", "HRTAC"]
  },
  "HRTB": {
    "col": 3,
    "text": {"HRTBH": "{homeTeam}", "HRTBN": "ไม่ใช่ทั้งหมด", "HRTBC": "{awayTeam}"},
    "sort": ["HRTBH", "HRTBN", "HRTBC"]
  },
  "HRTC": {
    "col": 3,
    "text": {"HRTCH": "{homeTeam}", "HRTCN": "ไม่ใช่ทั้งหมด", "HRTCC": "{awayTeam}"},
    "sort": ["HRTCH", "HRTCN", "HRTCC"]
  },
  "HRTD": {
    "col": 3,
    "text": {"HRTDH": "{homeTeam}", "HRTDN": "ไม่ใช่ทั้งหมด", "HRTDC": "{awayTeam}"},
    "sort": ["HRTDH", "HRTDN", "HRTDC"]
  },
  "HRTE": {
    "col": 3,
    "text": {"HRTEH": "{homeTeam}", "HRTEN": "ไม่ใช่ทั้งหมด", "HRTEC": "{awayTeam}"},
    "sort": ["HRTEH", "HRTEN", "HRTEC"]
  },
  "HRTF": {
    "col": 3,
    "text": {"HRTFH": "{homeTeam}", "HRTFN": "ไม่ใช่ทั้งหมด", "HRTFC": "{awayTeam}"},
    "sort": ["HRTFH", "HRTFN", "HRTFC"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMA": "{homeTeam} ผลต่าง1-3คะแนน",
      "WMB": "{homeTeam} ผลต่าง4-6คะแนน",
      "WMC": "{homeTeam} ผลต่าง7-9คะแนน",
      "WMD": "{homeTeam} ผลต่าง10-12คะแนน",
      "WME": "{homeTeam} ผลต่าง13-16คะแนน",
      "WMF": "{homeTeam} ผลต่าง17-20คะแนน",
      "WMG": "{homeTeam} ผลต่าง21+",
      "WMH": "{awayTeam} ผลต่าง1-3คะแนน",
      "WMI": "{awayTeam} ผลต่าง4-6คะแนน",
      "WMJ": "{awayTeam} ผลต่าง7-9คะแนน",
      "WMK": "{awayTeam} ผลต่าง10-12คะแนน",
      "WML": "{awayTeam} ผลต่าง13-16คะแนน",
      "WMM": "{awayTeam} ผลต่าง17-20คะแนน",
      "WMN": "{awayTeam} ผลต่าง21+",
      "WMO": "เสมอ"
    },
    "sort": [
      "WMA",
      "WMB",
      "WMC",
      "WME",
      "WMF",
      "WMG",
      "WMH",
      "WMI",
      "WMJ",
      "WMK",
      "WML",
      "WMM",
      "WMN",
      "WMO"
    ]
  },
  'HRFM2': {
    'col': 3,
    'text': {
      'HRFM2H': '{homeTeam} {ratio}',
      'HRFM2D': 'เสมอ {ratio}',
      'HRFM2N': 'เสมอ {ratio}',
      'HRFM2C': '{awayTeam} {ratio}'
    },
    'sort': ['HRFM2H', 'HRFM2N', 'HRFM2D', 'HRFM2C']
  },
  "HOF": {"col": 3, "text": {}, "sort": []},
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
  "HRM": {
    "col": 2,
    "text": {"HRMH": "{homeTeam}", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMC"]
  },
  
  "hRM2": {
    "col": 2,
    "text": {"hRM2H": "{homeTeam}", "hRM2C": "{awayTeam}"},
    "sort": ["hRM2H", "hRM2C"]
  },
  "HRE2": {
    "col": 2,
    "text": {"HRE2H": "{homeTeam} {ratio}", "HRE2C": "{awayTeam} {ratio}"},
    "sort": ["HRE2H", "HRE2C"]
  },
  "HROU2": {
    "col": 2,
    "text": {"HROU2C": "สูง {ratio}", "HROU2H": "ต่ำ {ratio}"},
    "sort": ["HROU2C", "HROU2H"]
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
  "HRTEO": {
    "col": 2,
    "text": {
      "HRTEOHO": "คี่",
      "HRTEOHE": "คู่",
      "HRTEOCO": "คี่",
      "HRTEOCE": "คู่"
    },
    "sort": ["HRTEOHO", "HRTEOHE", "HRTEOCO", "HRTEOCE"]
  },
  "HRTEO2": {
    "col": 2,
    "text": {
      "HRTEO2HO": "คี่",
      "HRTEO2HE": "คู่",
      "HRTEO2CO": "คี่่",
      "HRTEO2CE": "คู่"
    },
    "sort": ["HRTEO2HO", "HRTEO2HE", "HRTEO2CO", "HRTEO2CE"]
  },
  'RDC': {
      'col': 3,
      'text': {
        'RDCCD': 'เจ้าบ้าน/เสมอ',
        'RDCCC': 'เจ้าบ้าน/ทีมเยือน',
        'RDCDC': 'ทีมเยือน/เสมอ'
      },
      'sort': ['RDCCD', 'RDCCC', 'RDCDC']
    },
    'HRDC': {
      'col': 3,
      'text': {
        'HRDCCD': 'เจ้าบ้าน/เสมอ',
        'HRDCCC': 'เจ้าบ้าน/ทีมเยือน',
        'HRDCDC': 'ทีมเยือน/เสมอ'
      },
      'sort': ['HRDCCD', 'HRDCCC', 'HRDCDC']
    },
  "RF": {
    "col": 3,
    "text": {
      "RFHH": "เจ้าบ้าน/เสมอ",
      "RFHC": "เจ้าบ้าน/ทีมเยือน",
      "RFHN": "เจ้าบ้าน/ทีมรวม",
      "RFCC": "ทีมเยือน/ทีมเยือน",
      "RFCH": "ทีมเยือน/เจ้าบ้าน",
      "RFCN": "ทีมเยือน/ทีมรวม",
      "RFNH": "ทีมรวม/เจ้าบ้าน",
      "RFNC": "ทีมรวม/ทีมเยือน",
      "RFNN": "ทีมรวม/ทีมรวม"
    },
    "sort": [
      "RFHH",
      "RFHC",
      "RFHN",
      "RFCC",
      "RFCH",
      "RFCN",
      "RFNH",
      "RFNC",
      "RFNN"
    ]
  },
  
  "HREO2": {
    "col": 2,
    "text": {"HREOO": "คี่", "HREOE": "คู่"},
    "sort": ["HREOO", "HREOE"]
  }
};
