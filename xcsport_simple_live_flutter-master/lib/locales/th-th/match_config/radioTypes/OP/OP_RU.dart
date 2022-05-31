// 橄欖球/英式橄欖球

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
      'DCHH': 'จ้าบ้าน/จ้าบ้าน',
      'DCHC': 'จ้าบ้าน/ทีมเยือน',
      'DCHD': 'จ้าบ้าน/เสมอ',
      'DCCC': 'ทีมเยือน/ทีมเยือน',
      'DCCH': 'ทีมเยือน/จ้าบ้าน',
      'DCCD': 'ทีมเยือน/เสมอ',
      'DCDD': 'เสมอ/เสมอ',
      'DCDH': 'เสมอ/จ้าบ้าน',
      'DCDC': 'เสมอ/ทีมเยือน'
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
      "RFMD": "เสมอ {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "{homeTeam} ชนะสุทธิ1-5",
      "WMH2": "{homeTeam} ชนะสุทธิ6-10",
      "WMH3": "{homeTeam} ชนะสุทธิ11-15",
      "WMH4": "{homeTeam} ชนะสุทธิ16-20",
      "WMH5": "{homeTeam} ชนะสุทธิ21-25",
      "WMH6": "{homeTeam} ชนะสุทธิ26-30",
      "WMH7": "{homeTeam} ชนะสุทธิ31-35",
      "WMH8": "{homeTeam} ชนะสุทธิ36-40",
      "WMC1": "{awayTeam} ชนะสุทธิ1-5",
      "WMC2": "{awayTeam} ชนะสุทธิ6-10",
      "WMC3": "{awayTeam} ชนะสุทธิ11-15",
      "WMC4": "{awayTeam} ชนะสุทธิ16-20",
      "WMC5": "{awayTeam} ชนะสุทธิ21-25",
      "WMC6": "{awayTeam} ชนะสุทธิ26-30",
      "WMC7": "{awayTeam} ชนะสุทธิ31-35",
      "WMC8": "{awayTeam} ชนะสุทธิ36-40",
      'WMN': 'เสมอ'
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
    "text": {"OUH4": "สูง {ratio}", "OUH5": "ต่ำ {ratio}"},
    "sort": ["OUH4", "OUH5"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC4": "สูง {ratio}", "OUC5": "ต่ำ {ratio}"},
    "sort": ["OUC4", "OUC5"]
  },
  "EO": {
    "col": 2,
    "text": {"EO4": "คี่", "EO5": "คู่"},
    "sort": ["EO4", "EO5"]
  },
  "RF": {
    "col": 3,
    "text": {
      "RF418": "จ้าบ้าน/เจ้าบ้าน",
      "RF420": "จ้าบ้าน/เสมอ",
      "RF422": "จ้าบ้าน/ทีมเยือน",
      "RF424": "สมอ/จ้าบ้าน",
      "RF426": "สมอ/สมอ",
      "RF428": "สมอ/ทีมเยือน",
      "RF430": "ทีมเยือน/จ้าบ้าน",
      "RF432": "ทีมเยือน/สมอ",
      "RF434": "ทีมเยือน/ทีมเยือน"
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
    "text": {"HS436": "ครึ่งแรก", "HS438": "ครึ่งหลัง", "HS440": "คะแนนเท่ากัน"},
    "sort": ["HS436", "HS438", "HS440"]
  },
  'HM': {
    'col': 3,
    'text': {
      'HM1': '{homeTeam}',
      'HMH': '{homeTeam}',
      'HM2': 'สมอ',
      'HMN': 'สมอ',
      'HM3': '{awayTeam}',
      'HMC': '{awayTeam}'
    },
    'sort': ['HMH', 'HMN', 'HMC', 'HM1', 'HM2', 'HM3']
  },
  "HRFM": {
    "col": 3,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "เสมอ {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HEO": {
    "col": 2,
    "text": {"HEO70": "คี่", "HEO72": "คู่"},
    "sort": ["HEO70", "HEO72"]
  },
  "OTM": {
    "col": 3,
    "text": {"OTM1": "{homeTeam}", "OTM2": "สมอ", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "HWM": {
    "col": 2,
    "text": {
      "HWM130": "เจ้าบ้านชนะ15+",
      "HWM131": "เจ้าบ้านชนะ8-14",
      "HWM132": "เจ้าบ้านชนะ1-7",
      "HWM133": "เสมอ",
      "HWM134": "ทีมเยือนชนะ1-7",
      "HWM135": "ทีมเยือนชนะ8-14",
      "HWM136": "ทีมเยือนชนะ15+"
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
      "SWM112": "เจ้าบ้านชนะ1-12",
      "SWM113": "เจ้าบ้านชนะ13+",
      "SWM114": "ทีมเยือนชนะ1-12",
      "SWM115": "ทีมเยือนชนะ13+",
      "SWM116": "เสมอ"
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
      'CDHH': 'จ้าบ้าน/เสมอ',
      'CDHC': 'จ้าบ้าน/ทีมเยือน',
      'CDHN': 'จ้าบ้าน/เสมอ',
      'CDCC': 'ทีมเยือน/ทีมเยือน',
      'CDCH': 'ทีมเยือน/จ้าบ้าน',
      'CDCN': 'ทีมเยือน/เสมอ',
      'CDNH': 'เสมอ/จ้าบ้าน',
      'CDNC': 'เสมอ/ทีมเยือน',
      'CDNN': 'เสมอ/เสมอ'
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
      "WM5A": "{homeTeam} ชนะสุทธิ1-12",
      "WM5B": "{homeTeam} ชนะสุทธิ13+",
      "WM5C": "{awayTeam} ชนะสุทธิ1-12",
      "WM5D": "{awayTeam} ชนะสุทธิ13+",
      "WM5E": "เสมอ"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5E"]
  },
  "RTA": {
    "col": 3,
    "text": {"RTAH": "{homeTeam}", "RTAN": "ไม่ใช่เลย", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAN", "RTAC"]
  },
  'ZEO': {
    'col': 2,
    'text': {'EOO': 'คี่', 'EOE': 'คู่'},
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
    'text': {'AGC': 'สูง {ratio}', 'AGH': 'ต่ำ {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "SOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
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
    "text": {"HH1": "ครึ่งแรก", "HH2": "ครึ่งหลัง", "HHD": "คะแนนเท่ากัน"},
    "sort": ["HH1", "HH2", "HHD"]
  },
  "AROU": {
    "col": 2,
    "text": {"AROUC": "สูง {ratio}", "AROUH": "ต่ำ {ratio}"},
    "sort": ["AROUC", "AROUH"]
  },
  "RWM16": {
    "col": 2,
    "text": {
      "RWM1": "{homeTeam} ชนะสุทธิ1-5",
      "RWM2": "{homeTeam} ชนะสุทธิ6-10",
      "RWM3": "{homeTeam} ชนะสุทธิ11-15",
      "RWM4": "{homeTeam} ชนะสุทธิ16-20",
      "RWM5": "{homeTeam} ชนะสุทธิ21-25",
      "RWM6": "{homeTeam} ชนะสุทธิ26-30",
      "RWM7": "{homeTeam} ชนะสุทธิ31-35",
      "RWM8": "{homeTeam} ชนะสุทธิ40+",
      "RWM9": "{awayTeam} ชนะสุทธิ1-5",
      "RWM10": "{awayTeam} ชนะสุทธิ6-10",
      "RWM11": "{awayTeam} ชนะสุทธิ11-15",
      "RWM12": "{awayTeam} ชนะสุทธิ16-20",
      "RWM13": "{awayTeam} ชนะสุทธิ21-25",
      "RWM14": "{awayTeam} ชนะสุทธิ26-30",
      "RWM15": "{awayTeam} ชนะสุทธิ31-35",
      "RWM16": "{awayTeam} ชนะสุทธิ40+"
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
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'สูง {ratio}', 'RAGH': 'ต่ำ {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  'RAH': {
    'col': 2,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'UHOU': {
    'col': 2,
    'text': {'HOUC': 'สูง {ratio}', 'HOUH': 'ต่ำ {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'UHR': {
    'col': 2,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'sort': ['HRH', 'HRC']
  }
};
