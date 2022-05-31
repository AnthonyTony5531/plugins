//Handball
const dynamic op_hbRadioTypes = {
  
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCCD": "Home/Draw", "DCCC": "Home/Away", "DCDC": "Draw/Away"},
    "sort": ["DCCD", "DCCC", "DCDC"]
  },
  'RFM': {
    'col': 3,
    "col188": 1,
    'text': {
      'RFMH': '{homeTeam} {ratio}',
      'RFMD': 'Draw {ratio}',
      'RFMN': 'Draw {ratio}',
      'RFMC': '{awayTeam} {ratio}'
    },
    'sort': ['RFMH', 'RFMN', 'RFMD', 'RFMC']
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "Over {ratio}", "OUHU": "Under {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "Over {ratio}", "OUCU": "Under {ratio}"},
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
      "OUM794": "Home& Lower{total}",
      "OUM796": "Home& Higher{total}",
      "OUM798": "Draw& Lower{total}",
      "OUM800": "Draw& Higher{total}",
      "OUM802": "Away& Lower{total}",
      "OUM804": "Away& Higher{total}"
    },
    "sort": ["OUM794", "OUM796", "OUM798", "OUM800", "OUM802", "OUM804"]
  },
  "HS": {
    "col": 3,
    "col188": 1,
    "text": {"HS1": "First Half", "HS2": "Second Half", "HSE": "Same Score"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  'HM': {
    'col': 3,
    "col188": 1,
    'text': {
      'HM1': '{homeTeam}',
      'HMH': '{homeTeam}',
      'HM2': 'Draw',
      'HMN': 'Draw',
      'HM3': '{awayTeam}',
      'HMC': '{awayTeam}'
    },
    'sort': ['HM1', 'HM2', 'HM3', 'HMH', 'HMN', 'HMC']
  },
  "HDC": {
    "col": 3,
    "col188": 1,
    "text": {"HDCCD": "Home/Draw", "HDCCC": "Home/Away", "HDCDC": "Draw/Away"},
    "sort": ["HDC9", "HDCCC", "HDCDC"]
  },
  "HRFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Draw {ratio}",
      'HRFMN': 'Draw {ratio}',
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ['HRFMH', 'HRFMN', 'HRFMD', 'HRFMC']
  },
  
  "HOUH": {
    "col": 2,
    "text": {"HOUHO": "Over {ratio}", "HOUHU": "Under {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "Over {ratio}", "HOUCU": "Under {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
 
  "HOUM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HOUM794": "Home& Lower{total}",
      "HOUM796": "Home& Higher{total}",
      "HOUM798": "Draw& Lower{total}",
      "HOUM800": "Draw& Higher{total}",
      "HOUM802": "Away& Lower{total}",
      "HOUM804": "Away& Higher{total}"
    },
    "sort": ["HOUM794", "HOUM796", "HOUM798", "HOUM800", "HOUM802", "HOUM804"]
  },
  "HWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HWMA": "{homeTeam} Net winning by 1-2",
      "HWMB": "{homeTeam} Net winning by 3-4",
      "HWMC": "{homeTeam} Net winning by 5-6",
      "HWMD": "{homeTeam} Net winning by 7+",
      "HWME": "{awayTeam} Net winning by 1-2",
      "HWMF": "{awayTeam} Net winning by 3-4",
      "HWMG": "{awayTeam} Net winning by 5-6",
      "HWMH": "{awayTeam} Net winning by 7+",
      "HWMI": "Draw"
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
    "text": {"OTOUO": "Over {ratio}", "OTOUU": "Under {ratio}"},
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
    "text": {"HST1": "{homeTeam}", "HST2": "Draw", "HST3": "{awayTeam}"},
    "sort": ["HST1", "HST2", "HST3"]
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "Odd",
      "TEOHE": "Even",
      "TEOCO": "Odd",
      "TEOCE": "Even"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
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
  "F": {
    "col": 3,
    "col188": 1,
    "text": {
      "FHH": "Home/Draw",
      "FHC": "Home/Away",
      "FHN": "Home/Draw",
      "FCC": "Away/Away",
      "FCH": "Away/Home",
      "FCN": "Away/Draw",
      "FNH": "Draw/Home",
      "FNC": "Draw/Away",
      "FNN": "Draw/Draw"
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
    'text': {'AGC': 'Over {ratio}', 'AGH': 'Under {ratio}'},
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
    "col188": 1,
    "text": {
      "HTEOHO": "Odd",
      "HTEOHE": "Even",
      "HTEOCO": "Odd",
      "HTEOCE": "Even"
    },
    "sort": ["HTEOHO", "HTEOHE", "HTEOCO", "HTEOCE"]
  },
  "HTEO2": {
    "col": 2,
    "text": {
      "HTEO2HO": "Odd",
      "HTEO2HE": "Even",
      "HTEO2CO": "Odd",
      "HTEO2CE": "Even"
    },
    "sort": ["HTEO2HO", "HTEO2HE", "HTEO2CO", "HTEO2CE"]
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
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "Odd", "HEO2E": "Even"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "WM5": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM5A": "{homeTeam} Net winning by 1-5",
      "WM5B": "{homeTeam} Net winning by 6+",
      "WM5C": "{awayTeam} Net winning by 1-5",
      "WM5D": "{awayTeam} Net winning by 6+",
      "WM5E": "Draw"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5D", "WM5E"]
  },
  "WM3": {
    "col": 3,
    "col188": 1,
    "text": {
      "WM3A": "{homeTeam} Net winning by 3+",
      "WM3B": "{awayTeam} Net winning by 3+",
      "WM3C": "Draw or any team won the game by 2 or less advantage"
    },
    "sort": ["WM3A", "WM3B", "WM3C"]
  },
  "HWM3": {
    "col": 3,
    "col188": 1,
    "text": {
      "HWM3A": "{homeTeam} Net winning by 2+",
      "HWM3B": "{awayTeam} Net winning by 2+",
      "HWM3C": "Draw or any team won the game by 1 or less advantage"
    },
    "sort": ["HWM3A", "HWM3B", "HWM3C"]
  },
  "RTA": {
    "col": 3,
    "col188": 1,
    "text": {"RTAH": "{homeTeam}", "RTAN": "Neither", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAH", "RTAC"]
  },
  "RTB": {
    "col": 3,
    "col188": 1,
    "text": {"RTBH": "{homeTeam}", "RTBN": "Neither", "RTBC": "{awayTeam}"},
    "sort": ["RTBH", "RTBH", "RTBC"]
  },
  "RTC": {
    "col": 3,
    "col188": 1,
    "text": {"RTCH": "{homeTeam}", "RTCN": "Neither", "RTCC": "{awayTeam}"},
    "sort": ["RTCH", "RTCH", "RTCC"]
  },
  "HRTA": {
    "col": 3,
    "col188": 1,
    "text": {"HRTAH": "{homeTeam}", "HRTAN": "Neither", "HRTAC": "{awayTeam}"},
    "sort": ["HRTAH", "HRTAN", "HRTAC"]
  },
  "HRTB": {
    "col": 3,
    "col188": 1,
    "text": {"HRTBH": "{homeTeam}", "HRTBN": "Neither", "HRTBC": "{awayTeam}"},
    "sort": ["HRTBH", "HRTBN", "HRTBC"]
  },
  "HRTC": {
    "col": 3,
    "col188": 1,
    "text": {"HRTCH": "{homeTeam}", "HRTCN": "Neither", "HRTCC": "{awayTeam}"},
    "sort": ["HRTCH", "HRTCN", "HRTCC"]
  },
  "HRTD": {
    "col": 3,
    "col188": 1,
    "text": {"HRTDH": "{homeTeam}", "HRTDN": "Neither", "HRTDC": "{awayTeam}"},
    "sort": ["HRTDH", "HRTDN", "HRTDC"]
  },
  "HRTE": {
    "col": 3,
    "col188": 1,
    "text": {"HRTEH": "{homeTeam}", "HRTEN": "Neither", "HRTEC": "{awayTeam}"},
    "sort": ["HRTEH", "HRTEN", "HRTEC"]
  },
  "HRTF": {
    "col": 3,
    "col188": 1,
    "text": {"HRTFH": "{homeTeam}", "HRTFN": "Neither", "HRTFC": "{awayTeam}"},
    "sort": ["HRTFH", "HRTFN", "HRTFC"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMA": "{homeTeam} Net winning by 1-3",
      "WMB": "{homeTeam} Net winning by 4-6",
      "WMC": "{homeTeam} Net winning by 7-9",
      "WMD": "{homeTeam} Net winning by 10-12",
      "WME": "{homeTeam} Net winning by 13-16",
      "WMF": "{homeTeam} Net winning by 17-20",
      "WMG": "{homeTeam} Net winning by 21+",
      "WMH": "{awayTeam} Net winning by 1-3",
      "WMI": "{awayTeam} Net winning by 4-6",
      "WMJ": "{awayTeam} Net winning by 7-9",
      "WMK": "{awayTeam} Net winning by 10-12",
      "WML": "{awayTeam} Net winning by 13-16",
      "WMM": "{awayTeam} Net winning by 17-20",
      "WMN": "{awayTeam} Net winning by 21+",
      "WMO": "Draw"
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
      'HRFM2D': 'Draw {ratio}',
      'HRFM2N': 'Draw {ratio}',
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
    "text": {"HROU2C": "Over {ratio}", "HROU2H": "Under {ratio}"},
    "sort": ["HROU2C", "HROU2H"]
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
  "HRTEO": {
    "col": 2,
    "text": {
      "HRTEOHO": "Odd",
      "HRTEOHE": "Even",
      "HRTEOCO": "Odd",
      "HRTEOCE": "Even"
    },
    "sort": ["HRTEOHO", "HRTEOHE", "HRTEOCO", "HRTEOCE"]
  },
  "HRTEO2": {
    "col": 2,
    "text": {
      "HRTEO2HO": "Odd",
      "HRTEO2HE": "Even",
      "HRTEO2CO": "Odd",
      "HRTEO2CE": "Even"
    },
    "sort": ["HRTEO2HO", "HRTEO2HE", "HRTEO2CO", "HRTEO2CE"]
  },
  'RDC': {
    'col': 3,
    "col188": 1,
    'text': {'RDCCD': 'Home/Draw', 'RDCCC': 'Home/Away', 'RDCDC': 'Away/Draw'},
    'sort': ['RDCCD', 'RDCCC', 'RDCDC']
  },
  'HRDC': {
    'col': 3,
    "col188": 1,
    'text': {
      'HRDCCD': 'Home/Draw',
      'HRDCCC': 'Home/Away',
      'HRDCDC': 'Away/Draw'
    },
    'sort': ['HRDCCD', 'HRDCCC', 'HRDCDC']
  },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFHH": "Home/Draw",
      "RFHC": "Home/Away",
      "RFHN": "Home/Draw",
      "RFCC": "Away/Away",
      "RFCH": "Away/Home",
      "RFCN": "Away/Draw",
      "RFNH": "Draw/Home",
      "RFNC": "Draw/Away",
      "RFNN": "Draw/Draw"
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
    "text": {"HREOO": "Odd", "HREOE": "Even"},
    "sort": ["HREOO", "HREOE"]
  }
};
