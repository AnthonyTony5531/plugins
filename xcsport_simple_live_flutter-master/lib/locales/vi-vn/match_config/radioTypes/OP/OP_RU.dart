// Bóng bầu dục

const dynamic op_ruRadioTypes = {
  "TQ": {
    "col": 2,
    "text": {"TQ4": "{homeTeam}", "TQ5": "{awayTeam}"},
    "sort": ["TQ4", "TQ5"]
  },
  "WTW": {
    "col": 2,
    "text": {"WTW4": "{homeTeam}", "WTW5": "{awayTeam}"},
    "sort": ["WTW4", "WTW5"]
  },
  'DC': {
    'col': 3,
    'text': {
      'DCHH': 'Chủ/Chủ',
      'DCHC': 'Chủ/Khách',
      'DCHD': 'Chủ/Hòa',
      'DCCC': 'Khách/Khách',
      'DCCH': 'Khách/Chủ',
      'DCCD': 'Khách/Hòa',
      'DCDD': 'Hòa/Hòa',
      'DCDH': 'Hòa/Chủ',
      'DCDC': 'Hòa/Khách'
    },
    'sort': [
      'DCHH',
      'DCHC',
      'DCHD',
      'DCCC',
      'DCCH',
      'DCCD',
      'DCDD',
      'DCDH',
      'DCDC'
    ]
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
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "{homeTeam} Cách biệt 1-5 điểm",
      "WMH2": "{homeTeam} Cách biệt 6-10 điểm",
      "WMH3": "{homeTeam} Cách biệt 11-15 điểm",
      "WMH4": "{homeTeam} Cách biệt 16-20 điểm",
      "WMH5": "{homeTeam} Cách biệt 21-25 điểm",
      "WMH6": "{homeTeam} Cách biệt 26-30 điểm",
      "WMH7": "{homeTeam} Cách biệt 31-35 điểm",
      "WMH8": "{homeTeam} Cách biệt 36-40 điểm",
      "WMC1": "{awayTeam} Cách biệt 1-5 điểm",
      "WMC2": "{awayTeam} Cách biệt 6-10 điểm",
      "WMC3": "{awayTeam} Cách biệt 11-15 điểm",
      "WMC4": "{awayTeam} Cách biệt 16-20 điểm",
      "WMC5": "{awayTeam} Cách biệt 21-25 điểm",
      "WMC6": "{awayTeam} Cách biệt 26-30 điểm",
      "WMC7": "{awayTeam} Cách biệt 31-35 điểm",
      "WMC8": "{awayTeam} Cách biệt 36-40 điểm",
      'WMN': 'Hòa'
    },
    'sort': [
      'WMH1',
      'WMH2',
      'WMH3',
      'WMH4',
      'WMH5',
      'WMH6',
      'WMH7',
      'WMH8',
      'WMC1',
      'WMC2',
      'WMC3',
      'WMC4',
      'WMC5',
      'WMC6',
      'WMC7',
      'WMC8',
      'WMN'
    ]
  },
  "OUH": {
    "col": 2,
    "text": {"OUH4": "Tài {ratio}", "OUH5": "Xỉu {ratio}"},
    "sort": ["OUH4", "OUH5"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC4": "Tài {ratio}", "OUC5": "Xỉu {ratio}"},
    "sort": ["OUC4", "OUC5"]
  },
  
  "RF": {
    "col": 3,
    "text": {
      "RF418": "Chủ/Chủ",
      "RF420": "Chủ/Hòa",
      "RF422": "Chủ/Khách",
      "RF424": "Hòa/Chủ",
      "RF426": "Hòa/Hòa",
      "RF428": "Hòa/Khách",
      "RF430": "Khách/Chủ",
      "RF432": "Khách/Hòa",
      "RF434": "Khách/Khách"
    },
    "sort": [
      "RF418",
      "RF420",
      "RF422",
      "RF424",
      "RF426",
      "RF428",
      "RF430",
      "RF432",
      "RF434"
    ]
  },
  "HS": {
    "col": 3,
    "text": {"HS436": "Hiệp 1", "HS438": "Hiệp 1", "HS440": "Điểm số bằng nhau"},
    "sort": ["HS436", "HS438", "HS440"]
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
    'sort': ['HMH', 'HMN', 'HMC', 'HM1', 'HM2', 'HM3']
  },
  "HRFM": {
    "col": 3,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Hòa {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HEO": {
    "col": 2,
    "text": {"HEO70": "Lẻ", "HEO72": "Chẵn"},
    "sort": ["HEO70", "HEO72"]
  },
  "OTM": {
    "col": 3,
    "text": {"OTM1": "{homeTeam}", "OTM2": "Hòa", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "HWM": {
    "col": 2,
    "text": {
      "HWM130": "Đội nhà thắng 15 điểm trở lên",
      "HWM131": "Đội nhà thắng 8-14 điểm",
      "HWM132": "Đội nhà thắng 1-7 điểm",
      "HWM133": "Hòa",
      "HWM134": "Đội khách thắng 1-7 điểm",
      "HWM135": "Đội khách thắng 8-14 điểm",
      "HWM136": "Đội khách thắng 15 điểm trở lên"
    },
    "sort": [
      "HWM130",
      "HWM131",
      "HWM132",
      "HWM133",
      "HWM134",
      "HWM135",
      "HWM136"
    ]
  },
  "HRP": {
    "col": 3,
    "text": {"HRP6": "{homeTeam}", "HRP7": "none", "HRP8": "{awayTeam}"},
    "sort": ["HRP6", "HRP7", "HRP8"]
  },
  "RP": {
    "col": 3,
    "text": {"RP6": "{homeTeam}", "RP7": "none", "RP8": "{awayTeam}"},
    "sort": ["RP6", "RP7", "RP8"]
  },
  "SWM": {
    "col": 3,
    "text": {
      "SWM112": "Đội nhà thắng 1-12 điểm",
      "SWM113": "Đội nhà thắng 13 điểm trở lên",
      "SWM114": "Đội khách thắng 1-12 điểm",
      "SWM115": "Đội khách thắng 13 điểm trở lên",
      "SWM116": "Hòa"
    },
    "sort": ["SWM112", "SWM113", "SWM114", "SWM115", "SWM116"]
  },
  "WD": {
    "col": 2,
    "text": {"WDH": "{homeTeam}", "WDC": "{awayTeam}"},
    "sort": ["WDH", "WDC"]
  },
  'CD': {
    'col': 3,
    'text': {
      'CDHH': 'Chủ/Hòa',
      'CDHC': 'Chủ/Khách',
      'CDHN': 'Chủ/Hòa',
      'CDCC': 'Khách/Khách',
      'CDCH': 'Khách/Chủ',
      'CDCN': 'Khách/Hòa',
      'CDNH': 'Hòa/Chủ',
      'CDNC': 'Hòa/Khách',
      'CDNN': 'Hòa/Hòa'
    },
    'sort': [
      'CDHH',
      'CDHC',
      'CDHN',
      'CDCC',
      'CDCH',
      'CDCN',
      'CDNH',
      'CDNC',
      'CDNN'
    ]
  },
  "WM5": {
    "col": 2,
    "text": {
      "WM5A": "{homeTeam} Cách biệt 1-12 điểm",
      "WM5B": "{homeTeam} Cách biệt 13+",
      "WM5C": "{awayTeam} Cách biệt 1-12 điểm",
      "WM5D": "{awayTeam} Cách biệt 13+",
      "WM5E": "Hòa"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5E"]
  },
  "RTA": {
    "col": 3,
    "text": {"RTAH": "{homeTeam}", "RTAN": "Đều không phải", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAN", "RTAC"]
  },
  'ZEO': {
    'col': 2,
    'text': {'EOO': 'Lẻ', 'EOE': 'Chẵn'},
    'sort': ['EOO', 'EOE']
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
  'AH': {
    'col': 2,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'Tài {ratio}', 'AGH': 'Xỉu {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "SOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FST": {
    "col": 2,
    "text": {"FSTH": "{homeTeam}", "FSTC": "{awayTeam}"},
    "sort": ["FSTH", "FSTC"]
  },
  "FLT": {
    "col": 2,
    "text": {"FLTH": "{homeTeam}", "FLTC": "{awayTeam}"},
    "sort": ["FLTH", "FLTC"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "FSM": {
    "col": 2,
    "text": {"FSMH": "{homeTeam}", "FSMC": "{awayTeam}"},
    "sort": ["FSMH", "FSMC"]
  },
  "FLM": {
    "col": 2,
    "text": {"FLMH": "{homeTeam}", "FLMC": "{awayTeam}"},
    "sort": ["FLMH", "FLMC"]
  },
  "HH": {
    "col": 3,
    "text": {"HH1": "Hiệp 1", "HH2": "Hiệp 2", "HHD": "Điểm số bằng nhau"},
    "sort": ["HH1", "HH2", "HHD"]
  },
  "AROU": {
    "col": 2,
    "text": {"AROUC": "Tài {ratio}", "AROUH": "Xỉu {ratio}"},
    "sort": ["AROUC", "AROUH"]
  },
  "RWM16": {
    "col": 2,
    "text": {
      "RWM1": "{homeTeam} Cách biệt 1-5 điểm",
      "RWM2": "{homeTeam} Cách biệt 6-10 điểm",
      "RWM3": "{homeTeam} Cách biệt 11-15 điểm",
      "RWM4": "{homeTeam} Cách biệt 16-20 điểm",
      "RWM5": "{homeTeam} Cách biệt 21-25 điểm",
      "RWM6": "{homeTeam} Cách biệt 26-30 điểm",
      "RWM7": "{homeTeam} Cách biệt 31-35 điểm",
      "RWM8": "{homeTeam} Cách biệt 40+ điểm",
      "RWM9": "{awayTeam} Cách biệt 1-5 điểm",
      "RWM10": "{awayTeam} Cách biệt 6-10 điểm",
      "RWM11": "{awayTeam} Cách biệt 11-15 điểm",
      "RWM12": "{awayTeam} Cách biệt 16-20 điểm",
      "RWM13": "{awayTeam} Cách biệt 21-25 điểm",
      "RWM14": "{awayTeam} Cách biệt 26-30 điểm",
      "RWM15": "{awayTeam} Cách biệt 31-35 điểm",
      "RWM16": "{awayTeam} Cách biệt 40+ điểm"
    },
    "sort": [
      "RWM1",
      "RWM2",
      "RWM3",
      "RWM4",
      "RWM5",
      "RWM6",
      "RWM7",
      "RWM8",
      "RWM9",
      "RWM10",
      "RWM11",
      "RWM12",
      "RWM13",
      "RWM14",
      "RWM15",
      "RWM16"
    ]
  },
  'RM': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'Tài {ratio}', 'RAGH': 'Xỉu {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  'RAH': {
    'col': 2,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'UHOU': {
    'col': 2,
    'text': {'HOUC': 'Tài {ratio}', 'HOUH': 'Xỉu {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'UHR': {
    'col': 2,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'sort': ['HRH', 'HRC']
  }
};
