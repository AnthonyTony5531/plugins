//手球
const dynamic op_hbRadioTypes = {
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCCD": "主队/平局", "DCCC": "主队/客队", "DCDC": "平局/客队"},
    "sort": ["DCCD", "DCCC", "DCDC"]
  },
  'RFM': {
    'col': 3,
    "col188": 1,
    'text': {
      'RFMH': '{homeTeam} {ratio}',
      'RFMD': '平局 {ratio}',
      'RFMN': '平局 {ratio}',
      'RFMC': '{awayTeam} {ratio}'
    },
    'sort': ['RFMH', 'RFMN', 'RFMD', 'RFMC']
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "大 {ratio}", "OUHU": "小 {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "大 {ratio}", "OUCU": "小 {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
  "EG": {
    "col": 2,
    "col188": 1,
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
    "col188": 1,
    "text": {
      "OUM794": "主队&低于{total}",
      "OUM796": "主队&高于{total}",
      "OUM798": "平局&低于{total}",
      "OUM800": "平局&高于{total}",
      "OUM802": "客队&低于{total}",
      "OUM804": "客队&高于{total}"
    },
    "sort": ["OUM794", "OUM796", "OUM798", "OUM800", "OUM802", "OUM804"]
  },
  "HS": {
    "col": 3,
    "col188": 1,
    "text": {"HS1": "上半场", "HS2": "下半场", "HSE": "得分相同"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  'HM': {
    'col': 3,
    "col188": 1,
    'text': {
      'HM1': '{homeTeam}',
      'HMH': '{homeTeam}',
      'HM2': '平',
      'HMN': '平',
      'HM3': '{awayTeam}',
      'HMC': '{awayTeam}'
    },
    'sort': ['HM1', 'HM2', 'HM3', 'HMH', 'HMN', 'HMC']
  },
  "HDC": {
    "col": 3,
    "col188": 1,
    "text": {"HDCCD": "主队/平局", "HDCCC": "主队/客队", "HDCDC": "平局/客队"},
    "sort": ["HDC9", "HDCCC", "HDCDC"]
  },
  "HRFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "平 {ratio}",
      'HRFMN': '平 {ratio}',
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ['HRFMH', 'HRFMN', 'HRFMD', 'HRFMC']
  },
  "HR": {
    "col": 2,
    "col188": 1,
    "text": {"HRH": "{homeTeam} {ratio}", "HRC": "{awayTeam} {ratio}"},
    "sort": ["HRH", "HRC"]
  },
  'HOU': {
    'col': 2,
    'text': {
      'HOUO': '大 {ratio}',
      'HOUU': '小 {ratio}',
      'HOUC': '大 {ratio}',
      'HOUH': '小 {ratio}'
    },
    'sort': ['HOUO', 'HOUU', 'HOUC', 'HOUH']
  },
  "HOUH": {
    "col": 2,
    "text": {"HOUHO": "大 {ratio}", "HOUHU": "小 {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "大 {ratio}", "HOUCU": "小 {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  
  "HOUM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HOUM794": "主队&低于{total}",
      "HOUM796": "主队&高于{total}",
      "HOUM798": "平局&低于{total}",
      "HOUM800": "平局&高于{total}",
      "HOUM802": "客队&低于{total}",
      "HOUM804": "客队&高于{total}"
    },
    "sort": ["HOUM794", "HOUM796", "HOUM798", "HOUM800", "HOUM802", "HOUM804"]
  },
  "HWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HWMA": "{homeTeam} 净胜1-2分",
      "HWMB": "{homeTeam} 净胜3-4分",
      "HWMC": "{homeTeam} 净胜5-6分",
      "HWMD": "{homeTeam} 净胜7+",
      "HWME": "{awayTeam} 净胜1-2分",
      "HWMF": "{awayTeam} 净胜3-4分",
      "HWMG": "{awayTeam} 净胜5-6分",
      "HWMH": "{awayTeam} 净胜7+",
      "HWMI": "和局"
    },
    "sort": ["HWMA", "HWMB", "HWMC", "HWME", "HWMF", "HWMG", "HWMH", "HWMI"]
  },
  "OTR": {
    "col": 2,
    "col188": 1,
    "text": {"OTRH": "{homeTeam} {ratio}", "OTRC": "{awayTeam} {ratio}"},
    "sort": ["OTRH", "OTRC"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "大 {ratio}", "OTOUU": "小 {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "M_OT": {
    "col": 2,
    "col188": 1,
    "text": {"M_OT4": "{homeTeam}", "M_OT5": "{awayTeam}"},
    "sort": ["M_OT4", "M_OT5"]
  },
  "HST": {
    "col": 3,
    "col188": 1,
    "text": {"HST1": "{homeTeam}", "HST2": "平", "HST3": "{awayTeam}"},
    "sort": ["HST1", "HST2", "HST3"]
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "单",
      "TEOHE": "双",
      "TEOCO": "单",
      "TEOCE": "双"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
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
  "F": {
    "col": 3,
    "col188": 1,
    "text": {
      "FHH": "主/和",
      "FHC": "主/客",
      "FHN": "主/和",
      "FCC": "客/客",
      "FCH": "客/主",
      "FCN": "客/和",
      "FNH": "和/主",
      "FNC": "和/客",
      "FNN": "和/和"
    },
    "sort": ["FHH", "FHC", "FHN", "FCC", "FCH", "FCN", "FNH", "FNC", "FNN"]
  },
  'AH': {
    'col': 2,
    "col188": 1,
    'text': {
      'AHH': '{homeTeam} {ratio}',
      'AHC': '{homeTeam} {ratio}',
    },
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': '大 {ratio}', 'AGH': '小 {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "DNB": {
    "col": 2,
    "col188": 1,
    "text": {"DNBH": "{homeTeam}", "DNBA": "{awayTeam}"},
    "sort": ["DNBH", "DNBA"]
  },
  "HDNB": {
    "col": 2,
    "col188": 1,
    "text": {"HDNBH": "{homeTeam}", "HDNBA": "{awayTeam}"},
    "sort": ["HDNBH", "HDNBA"]
  },
  "HTEO": {
    "col": 2,
    "text": {
      "HTEOHO": "单",
      "HTEOHE": "双",
      "HTEOCO": "单",
      "HTEOCE": "双"
    },
    "sort": ["HTEOHO", "HTEOHE", "HTEOCO", "HTEOCE"]
  },
  "HTEO2": {
    "col": 2,
    "text": {
      "HTEO2HO": "单",
      "HTEO2HE": "双",
      "HTEO2CO": "单",
      "HTEO2CE": "双"
    },
    "sort": ["HTEO2HO", "HTEO2HE", "HTEO2CO", "HTEO2CE"]
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
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "单", "HEO2E": "双"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "WM5": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM5A": "{homeTeam} 净胜1-5分",
      "WM5B": "{homeTeam} 净胜6+分",
      "WM5C": "{awayTeam} 净胜1-5分",
      "WM5D": "{awayTeam} 净胜6+分",
      "WM5E": "平"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5D", "WM5E"]
  },
  "WM3": {
    "col": 3,
    "col188": 1,
    "text": {
      "WM3A": "{homeTeam} 净胜3分以上",
      "WM3B": "{awayTeam} 净胜3分以上",
      "WM3C": "平局或者任何队伍以2分或者更少的优势获胜"
    },
    "sort": ["WM3A", "WM3B", "WM3C"]
  },
  "HWM3": {
    "col": 3,
    "col188": 1,
    "text": {
      "HWM3A": "{homeTeam} 净胜2分以上",
      "HWM3B": "{awayTeam} 净胜2分以上",
      "HWM3C": "平局或者任何队伍以1分或者更少的优势获胜"
    },
    "sort": ["HWM3A", "HWM3B", "HWM3C"]
  },
  "RTA": {
    "col": 3,
    "col188": 1,
    "text": {"RTAH": "{homeTeam}", "RTAN": "都不是", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAH", "RTAC"]
  },
  "RTB": {
    "col": 3,
    "col188": 1,
    "text": {"RTBH": "{homeTeam}", "RTBN": "都不是", "RTBC": "{awayTeam}"},
    "sort": ["RTBH", "RTBH", "RTBC"]
  },
  "RTC": {
    "col": 3,
    "col188": 1,
    "text": {"RTCH": "{homeTeam}", "RTCN": "都不是", "RTCC": "{awayTeam}"},
    "sort": ["RTCH", "RTCH", "RTCC"]
  },
  "HRTA": {
    "col": 3,
    "col188": 1,
    "text": {"HRTAH": "{homeTeam}", "HRTAN": "都不是", "HRTAC": "{awayTeam}"},
    "sort": ["HRTAH", "HRTAN", "HRTAC"]
  },
  "HRTB": {
    "col": 3,
    "col188": 1,
    "text": {"HRTBH": "{homeTeam}", "HRTBN": "都不是", "HRTBC": "{awayTeam}"},
    "sort": ["HRTBH", "HRTBN", "HRTBC"]
  },
  "HRTC": {
    "col": 3,
    "col188": 1,
    "text": {"HRTCH": "{homeTeam}", "HRTCN": "都不是", "HRTCC": "{awayTeam}"},
    "sort": ["HRTCH", "HRTCN", "HRTCC"]
  },
  "HRTD": {
    "col": 3,
    "col188": 1,
    "text": {"HRTDH": "{homeTeam}", "HRTDN": "都不是", "HRTDC": "{awayTeam}"},
    "sort": ["HRTDH", "HRTDN", "HRTDC"]
  },
  "HRTE": {
    "col": 3,
    "col188": 1,
    "text": {"HRTEH": "{homeTeam}", "HRTEN": "都不是", "HRTEC": "{awayTeam}"},
    "sort": ["HRTEH", "HRTEN", "HRTEC"]
  },
  "HRTF": {
    "col": 3,
    "col188": 1,
    "text": {"HRTFH": "{homeTeam}", "HRTFN": "都不是", "HRTFC": "{awayTeam}"},
    "sort": ["HRTFH", "HRTFN", "HRTFC"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMA": "{homeTeam} 净胜1-3分",
      "WMB": "{homeTeam} 净胜4-6分",
      "WMC": "{homeTeam} 净胜7-9分",
      "WMD": "{homeTeam} 净胜10-12分",
      "WME": "{homeTeam} 净胜13-16分",
      "WMF": "{homeTeam} 净胜17-20分",
      "WMG": "{homeTeam} 净胜21+",
      "WMH": "{awayTeam} 净胜1-3分",
      "WMI": "{awayTeam} 净胜4-6分",
      "WMJ": "{awayTeam} 净胜7-9分",
      "WMK": "{awayTeam} 净胜10-12分",
      "WML": "{awayTeam} 净胜13-16分",
      "WMM": "{awayTeam} 净胜17-20分",
      "WMN": "{awayTeam} 净胜21+",
      "WMO": "和局"
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
    "col188": 1,
    'text': {
      'HRFM2H': '{homeTeam} {ratio}',
      'HRFM2D': '平 {ratio}',
      'HRFM2N': '平 {ratio}',
      'HRFM2C': '{awayTeam} {ratio}'
    },
    'sort': ['HRFM2H', 'HRFM2N', 'HRFM2D', 'HRFM2C']
  },
  "HOF": {"col": 3, "text": {}, "sort": []},
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
 
  "HRM": {
    "col": 2,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMC"]
  },
  "HRE": {
    "col": 2,
    "col188": 1,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU": {
    "col": 2,
    "text": {"HROUC": "大 {ratio}", "HROUH": "小 {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "hRM2": {
    "col": 2,
    "col188": 1,
    "text": {"hRM2H": "{homeTeam}", "hRM2C": "{awayTeam}"},
    "sort": ["hRM2H", "hRM2C"]
  },
  "HRE2": {
    "col": 2,
    "col188": 1,
    "text": {"HRE2H": "{homeTeam} {ratio}", "HRE2C": "{awayTeam} {ratio}"},
    "sort": ["HRE2H", "HRE2C"]
  },
  "HROU2": {
    "col": 2,
    "text": {"HROU2C": "大 {ratio}", "HROU2H": "小 {ratio}"},
    "sort": ["HROU2C", "HROU2H"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "单",
      "RTEOHE": "双",
      "RTEOCO": "单",
      "RTEOCE": "双"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "HRTEO": {
    "col": 2,
    "text": {
      "HRTEOHO": "单",
      "HRTEOHE": "双",
      "HRTEOCO": "单",
      "HRTEOCE": "双"
    },
    "sort": ["HRTEOHO", "HRTEOHE", "HRTEOCO", "HRTEOCE"]
  },
  "HRTEO2": {
    "col": 2,
    "text": {
      "HRTEO2HO": "单",
      "HRTEO2HE": "双",
      "HRTEO2CO": "单",
      "HRTEO2CE": "双"
    },
    "sort": ["HRTEO2HO", "HRTEO2HE", "HRTEO2CO", "HRTEO2CE"]
  },
  'RDC': {
      'col': 3,
      "col188": 1,
      'text': {
        'RDCCD': '主队/和局',
        'RDCCC': '主队/客队',
        'RDCDC': '客队/和局'
      },
      'sort': ['RDCCD', 'RDCCC', 'RDCDC']
    },
    'HRDC': {
      'col': 3,
      "col188": 1,
      'text': {
        'HRDCCD': '主队/和局',
        'HRDCCC': '主队/客队',
        'HRDCDC': '客队/和局'
      },
      'sort': ['HRDCCD', 'HRDCCC', 'HRDCDC']
    },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFHH": "主/和",
      "RFHC": "主/客",
      "RFHN": "主/和",
      "RFCC": "客/客",
      "RFCH": "客/主",
      "RFCN": "客/和",
      "RFNH": "和/主",
      "RFNC": "和/客",
      "RFNN": "和/和"
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
    "text": {"HREOO": "单", "HREOE": "双"},
    "sort": ["HREOO", "HREOE"]
  }
};
