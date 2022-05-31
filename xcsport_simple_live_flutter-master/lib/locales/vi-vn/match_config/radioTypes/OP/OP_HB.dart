//Bóng ném
const dynamic op_hbRadioTypes = {
 
  "DC": {
    "col": 3,
    "text": {"DCCD": "Chủ nhà/Hòa", "DCCC": "Chủ nhà/Đội khách", "DCDC": "Hòa/Đội khách"},
    "sort": ["DCCD", "DCCC", "DCDC"]
  },
  'RFM': {
    'col': 3,
    'text': {
      'RFMH': '{homeTeam} {ratio}',
      'RFMD': 'Hòa {ratio}',
      'RFMN': 'Hòa {ratio}',
      'RFMC': '{awayTeam} {ratio}'
    },
    'sort': ['RFMH', 'RFMN', 'RFMD', 'RFMC']
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "Tài {ratio}", "OUHU": "Xỉu {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "Tài {ratio}", "OUCU": "Xỉu {ratio}"},
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
      "OUM794": "Chủ nhà & Thấp hơn{total}",
      "OUM796": "Chủ nhà & Cao hơn{total}",
      "OUM798": "Hòa & Thấp hơn{total}",
      "OUM800": "Hòa & Cao hơn{total}",
      "OUM802": "Đội khách & Thấp hơn{total}",
      "OUM804": "Đội khách & Cao hơn{total}"
    },
    "sort": ["OUM794", "OUM796", "OUM798", "OUM800", "OUM802", "OUM804"]
  },
  "HS": {
    "col": 3,
    "text": {"HS1": "Hiệp 1", "HS2": "Hiệp 2", "HSE": "Điểm số bằng nhau"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  'HM': {
    'col': 3,
    'text': {
      'HM1': '{homeTeam}',
      'HMH': '{homeTeam}',
      'HM2': 'Hòa',
      'HMN': 'Hòa',
      'HM3': '{awayTeam}',
      'HMC': '{awayTeam}'
    },
    'sort': ['HM1', 'HM2', 'HM3', 'HMH', 'HMN', 'HMC']
  },
  "HDC": {
    "col": 3,
    "text": {"HDCCD": "Chủ nhà/Hòa", "HDCCC": "Chủ nhà/Đội khách", "HDCDC": "Hòa/Đội khách"},
    "sort": ["HDC9", "HDCCC", "HDCDC"]
  },
  "HRFM": {
    "col": 3,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Hòa {ratio}",
      'HRFMN': 'Hòa {ratio}',
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ['HRFMH', 'HRFMN', 'HRFMD', 'HRFMC']
  },
  
  "HOUH": {
    "col": 2,
    "text": {"HOUHO": "Tài {ratio}", "HOUHU": "Xỉu {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "Tài {ratio}", "HOUCU": "Xỉu {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  
  "HOUM": {
    "col": 2,
    "text": {
      "HOUM794": "Chủ nhà & Thấp hơn{total}",
      "HOUM796": "Chủ nhà & Cao hơn{total}",
      "HOUM798": "Hòa & Thấp hơn{total}",
      "HOUM800": "Hòa & Cao hơn{total}",
      "HOUM802": "Đội khách & Thấp hơn{total}",
      "HOUM804": "Đội khách & Cao hơn{total}"
    },
    "sort": ["HOUM794", "HOUM796", "HOUM798", "HOUM800", "HOUM802", "HOUM804"]
  },
  "HWM": {
    "col": 2,
    "text": {
      "HWMA": "{homeTeam} Chênh lệch 1-2 điểm",
      "HWMB": "{homeTeam} Chênh lệch 3-4 điểm",
      "HWMC": "{homeTeam} Chênh lệch 5-6 điểm",
      "HWMD": "{homeTeam} Chênh lệch 7+",
      "HWME": "{awayTeam} Chênh lệch 1-2 điểm",
      "HWMF": "{awayTeam} Chênh lệch 3-4 điểm",
      "HWMG": "{awayTeam} Chênh lệch 5-6 điểm",
      "HWMH": "{awayTeam} Chênh lệch 7+",
      "HWMI": "Kết quả hòa"
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
    "text": {"OTOUO": "Tài {ratio}", "OTOUU": "Xỉu {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "M_OT": {
    "col": 2,
    "text": {"M_OT4": "{homeTeam}", "M_OT5": "{awayTeam}"},
    "sort": ["M_OT4", "M_OT5"]
  },
  "HST": {
    "col": 3,
    "text": {"HST1": "{homeTeam}", "HST2": "Hòa", "HST3": "{awayTeam}"},
    "sort": ["HST1", "HST2", "HST3"]
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "Lẻ",
      "TEOHE": "Chẵn",
      "TEOCO": "Lẻ",
      "TEOCE": "Chẵn"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
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
  "F": {
    "col": 3,
    "text": {
      "FHH": "Chủ/Hòa",
      "FHC": "Chủ/Khách",
      "FHN": "Chủ/Hòa",
      "FCC": "Khách/Khách",
      "FCH": "Khách/Chủ",
      "FCN": "Khách/Hòa",
      "FNH": "Hòa/Chủ",
      "FNC": "Hòa/Khách",
      "FNN": "Hòa/Hòa"
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
    'text': {'AGC': 'Tài {ratio}', 'AGH': 'Xỉu {ratio}'},
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
      "HTEOHO": "Lẻ",
      "HTEOHE": "Chẵn",
      "HTEOCO": "Lẻ",
      "HTEOCE": "Chẵn"
    },
    "sort": ["HTEOHO", "HTEOHE", "HTEOCO", "HTEOCE"]
  },
  "HTEO2": {
    "col": 2,
    "text": {
      "HTEO2HO": "Lẻ",
      "HTEO2HE": "Chẵn",
      "HTEO2CO": "Lẻ",
      "HTEO2CE": "Chẵn"
    },
    "sort": ["HTEO2HO", "HTEO2HE", "HTEO2CO", "HTEO2CE"]
  },
  "HTTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "Lẻ", "HEO2E": "Chẵn"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "WM5": {
    "col": 2,
    "text": {
      "WM5A": "{homeTeam} Chênh lệch 1-5 điểm",
      "WM5B": "{homeTeam} Chênh lệch 6+ điểm",
      "WM5C": "{awayTeam} Chênh lệch 1-5 điểm",
      "WM5D": "{awayTeam} Chênh lệch 6+ điểm",
      "WM5E": "Hòa"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5D", "WM5E"]
  },
  "WM3": {
    "col": 3,
    "text": {
      "WM3A": "{homeTeam} Chênh lệch 3 điểm trở lên",
      "WM3B": "{awayTeam} Chênh lệch 3 điểm trở lên",
      "WM3C": "Hòa hay bất kỳ đội nào có từ 2 điểm trở xuống có lợi thế chiến thắng"
    },
    "sort": ["WM3A", "WM3B", "WM3C"]
  },
  "HWM3": {
    "col": 3,
    "text": {
      "HWM3A": "{homeTeam} Chênh lệch 2 điểm trở lên",
      "HWM3B": "{awayTeam} Chênh lệch 2 điểm trở lên",
      "HWM3C": "Hòa hay bất kỳ đội nào có từ 1 điểm trở xuống có lợi thế chiến thắng"
    },
    "sort": ["HWM3A", "HWM3B", "HWM3C"]
  },
  "RTA": {
    "col": 3,
    "text": {"RTAH": "{homeTeam}", "RTAN": "Đều không phải", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAH", "RTAC"]
  },
  "RTB": {
    "col": 3,
    "text": {"RTBH": "{homeTeam}", "RTBN": "Đều không phải", "RTBC": "{awayTeam}"},
    "sort": ["RTBH", "RTBH", "RTBC"]
  },
  "RTC": {
    "col": 3,
    "text": {"RTCH": "{homeTeam}", "RTCN": "Đều không phải", "RTCC": "{awayTeam}"},
    "sort": ["RTCH", "RTCH", "RTCC"]
  },
  "HRTA": {
    "col": 3,
    "text": {"HRTAH": "{homeTeam}", "HRTAN": "Đều không phải", "HRTAC": "{awayTeam}"},
    "sort": ["HRTAH", "HRTAN", "HRTAC"]
  },
  "HRTB": {
    "col": 3,
    "text": {"HRTBH": "{homeTeam}", "HRTBN": "Đều không phải", "HRTBC": "{awayTeam}"},
    "sort": ["HRTBH", "HRTBN", "HRTBC"]
  },
  "HRTC": {
    "col": 3,
    "text": {"HRTCH": "{homeTeam}", "HRTCN": "Đều không phải", "HRTCC": "{awayTeam}"},
    "sort": ["HRTCH", "HRTCN", "HRTCC"]
  },
  "HRTD": {
    "col": 3,
    "text": {"HRTDH": "{homeTeam}", "HRTDN": "Đều không phải", "HRTDC": "{awayTeam}"},
    "sort": ["HRTDH", "HRTDN", "HRTDC"]
  },
  "HRTE": {
    "col": 3,
    "text": {"HRTEH": "{homeTeam}", "HRTEN": "Đều không phải", "HRTEC": "{awayTeam}"},
    "sort": ["HRTEH", "HRTEN", "HRTEC"]
  },
  "HRTF": {
    "col": 3,
    "text": {"HRTFH": "{homeTeam}", "HRTFN": "Đều không phải", "HRTFC": "{awayTeam}"},
    "sort": ["HRTFH", "HRTFN", "HRTFC"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMA": "{homeTeam} Chênh lệch 1-3 điểm",
      "WMB": "{homeTeam} Chênh lệch 4-6 điểm",
      "WMC": "{homeTeam} Chênh lệch 7-9 điểm",
      "WMD": "{homeTeam} Chênh lệch 10-12 điểm",
      "WME": "{homeTeam} Chênh lệch 13-16 điểm",
      "WMF": "{homeTeam} Chênh lệch 17-20 điểm",
      "WMG": "{homeTeam} Chênh lệch 21+",
      "WMH": "{awayTeam} Chênh lệch 1-3 điểm",
      "WMI": "{awayTeam} Chênh lệch 4-6 điểm",
      "WMJ": "{awayTeam} Chênh lệch 7-9 điểm",
      "WMK": "{awayTeam} Chênh lệch 10-12 điểm",
      "WML": "{awayTeam} Chênh lệch 13-16 điểm",
      "WMM": "{awayTeam} Chênh lệch 17-20 điểm",
      "WMN": "{awayTeam} Chênh lệch 21+",
      "WMO": "Kết quả hòa"
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
      'HRFM2D': 'Hòa {ratio}',
      'HRFM2N': 'Hòa {ratio}',
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
    "text": {"HROU2C": "Tài {ratio}", "HROU2H": "Xỉu {ratio}"},
    "sort": ["HROU2C", "HROU2H"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "Lẻ",
      "RTEOHE": "Chẵn",
      "RTEOCO": "Lẻ",
      "RTEOCE": "Chẵn"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "HRTEO": {
    "col": 2,
    "text": {
      "HRTEOHO": "Lẻ",
      "HRTEOHE": "Chẵn",
      "HRTEOCO": "Lẻ",
      "HRTEOCE": "Chẵn"
    },
    "sort": ["HRTEOHO", "HRTEOHE", "HRTEOCO", "HRTEOCE"]
  },
  "HRTEO2": {
    "col": 2,
    "text": {
      "HRTEO2HO": "Lẻ",
      "HRTEO2HE": "Chẵn",
      "HRTEO2CO": "Lẻ",
      "HRTEO2CE": "Chẵn"
    },
    "sort": ["HRTEO2HO", "HRTEO2HE", "HRTEO2CO", "HRTEO2CE"]
  },
  'RDC': {
      'col': 3,
      'text': {
        'RDCCD': 'Chủ nhà/Hòa',
        'RDCCC': 'Chủ nhà/Đội khách',
        'RDCDC': 'Đội khách/Hòa'
      },
      'sort': ['RDCCD', 'RDCCC', 'RDCDC']
    },
    'HRDC': {
      'col': 3,
      'text': {
        'HRDCCD': 'Chủ nhà/Hòa',
        'HRDCCC': 'Chủ nhà/Đội khách',
        'HRDCDC': 'Đội khách/Hòa'
      },
      'sort': ['HRDCCD', 'HRDCCC', 'HRDCDC']
    },
  "RF": {
    "col": 3,
    "text": {
      "RFHH": "Chủ/Chủ",
      "RFHC": "Chủ/Khách",
      "RFHN": "Chủ/Hòa",
      "RFCC": "Khách/Khách",
      "RFCH": "Khách/Chủ",
      "RFCN": "Khách/Hòa",
      "RFNH": "Hòa/Chủ",
      "RFNC": "Hòa/Khách",
      "RFNN": "Hòa/Hòa"
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
    "text": {"HREOO": "Lẻ", "HREOE": "Chẵn"},
    "sort": ["HREOO", "HREOE"]
  }
};
