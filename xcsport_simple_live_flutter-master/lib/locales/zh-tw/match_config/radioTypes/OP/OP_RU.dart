
// 橄欖球/英式橄欖球
const dynamic op_ruRadioTypes = {
  "TQ": {
    "col": 2,
    "col188": 1,
    "text": {"TQ4": "{homeTeam}", "TQ5": "{awayTeam}"},
    "sort": ["TQ4", "TQ5"]
  },
  "WTW": {
    "col": 2,
    "col188": 1,
    "text": {"WTW4": "{homeTeam}", "WTW5": "{awayTeam}"},
    "sort": ["WTW4", "WTW5"]
  },
  'DC': {
    'col': 3,
    "col188": 1,
    'text': {
      'DCHH': '主/主',
      'DCHC': '主/客',
      'DCHD': '主/和',
      'DCCC': '客/客',
      'DCCH': '客/主',
      'DCCD': '客/和',
      'DCDD': '和/和',
      'DCDH': '和/主',
      'DCDC': '和/客'
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
    "col188": 1,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "平局 {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "{homeTeam} 凈勝1-5分",
      "WMH2": "{homeTeam} 凈勝6-10分",
      "WMH3": "{homeTeam} 凈勝11-15分",
      "WMH4": "{homeTeam} 凈勝16-20分",
      "WMH5": "{homeTeam} 凈勝21-25分",
      "WMH6": "{homeTeam} 凈勝26-30分",
      "WMH7": "{homeTeam} 凈勝31-35分",
      "WMH8": "{homeTeam} 凈勝36-40分",
      "WMC1": "{awayTeam} 凈勝1-5分",
      "WMC2": "{awayTeam} 凈勝6-10分",
      "WMC3": "{awayTeam} 凈勝11-15分",
      "WMC4": "{awayTeam} 凈勝16-20分",
      "WMC5": "{awayTeam} 凈勝21-25分",
      "WMC6": "{awayTeam} 凈勝26-30分",
      "WMC7": "{awayTeam} 凈勝31-35分",
      "WMC8": "{awayTeam} 凈勝36-40分",
      'WMN': "平"
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
    "text": {"OUH4": "大 {ratio}", "OUH5": "小 {ratio}"},
    "sort": ["OUH4", "OUH5"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC4": "大 {ratio}", "OUC5": "小 {ratio}"},
    "sort": ["OUC4", "OUC5"]
  },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RF418": "主/主",
      "RF420": "主/平",
      "RF422": "主/客",
      "RF424": "平/主",
      "RF426": "平/平",
      "RF428": "平/客",
      "RF430": "客/主",
      "RF432": "客/平",
      "RF434": "客/客"
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
    "col188": 1,
    "text": {"HS436": "上半場", "HS438": "下半場", "HS440": "得分相同"},
    "sort": ["HS436", "HS438", "HS440"]
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
    'sort': ['HMH', 'HMN', 'HMC', 'HM1', 'HM2', 'HM3']
  },
  "HRFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "平局 {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  "HOU": {
    "col": 2,
    "text": {
      "HOU12": "大 {ratio}",
      "HOUC": '大 {ratio}',
      "HOUH": '小 {ratio}',
      "HOU13": "小 {ratio}"
    },
    "sort": ['HOU12', 'HOUC', 'HOUH', 'HOU13']
  },
  "HEO": {
    "col": 2,
    "text": {"HEO70": "單", "HEO72": "雙"},
    "sort": ["HEO70", "HEO72"]
  },
  "OTM": {
    "col": 3,
    "col188": 1,
    "text": {"OTM1": "{homeTeam}", "OTM2": "平", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "HWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HWM130": "主隊贏15分以上",
      "HWM131": "主隊贏8-14分",
      "HWM132": "主隊贏1-7分",
      "HWM133": "平",
      "HWM134": "客隊贏1-7分",
      "HWM135": "客隊贏8-14分",
      "HWM136": "客隊贏15分以上"
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
    "col188": 1,
    "text": {"HRP6": "{homeTeam}", "HRP7": "none", "HRP8": "{awayTeam}"},
    "sort": ["HRP6", "HRP7", "HRP8"]
  },
  "RP": {
    "col": 3,
    "col188": 1,
    "text": {"RP6": "{homeTeam}", "RP7": "none", "RP8": "{awayTeam}"},
    "sort": ["RP6", "RP7", "RP8"]
  },
  "SWM": {
    "col": 3,
    "col188": 1,
    "text": {
      "SWM112": "主隊贏1-12分",
      "SWM113": "主隊贏13分以上",
      "SWM114": "客隊贏1-12分",
      "SWM115": "客隊贏13分以上",
      "SWM116": "平"
    },
    "sort": ["SWM112", "SWM113", "SWM114", "SWM115", "SWM116"]
  },
  "WD": {
    "col": 2,
    "col188": 1,
    "text": {"WDH": "{homeTeam}", "WDC": "{awayTeam}"},
    "sort": ["WDH", "WDC"]
  },
  'CD': {
    'col': 3,
    "col188": 1,
    'text': {
      'CDHH': '主/和',
      'CDHC': '主/客',
      'CDHN': '主/和',
      'CDCC': '客/客',
      'CDCH': '客/主',
      'CDCN': '客/和',
      'CDNH': '和/主',
      'CDNC': '和/客',
      'CDNN': '和/和'
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
    "col188": 1,
    "text": {
      "WM5A": "{homeTeam} 凈勝1-12分",
      "WM5B": "{homeTeam} 凈勝13+",
      "WM5C": "{awayTeam} 凈勝1-12分",
      "WM5D": "{awayTeam} 凈勝13+",
      "WM5E": "平"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5E"]
  },
  "RTA": {
    "col": 3,
    "col188": 1,
    "text": {"RTAH": "{homeTeam}", "RTAN": "都不是", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAN", "RTAC"]
  },
  'ZEO': {
    'col': 2,
    'text': {'EOO': '單', 'EOE': '雙'},
    'sort': ['EOO', 'EOE']
  },
  "FS": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC"]
  },
  "FL": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC"]
  },
  'AH': {
    'col': 2,
    "col188": 1,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': '大 {ratio}', 'AGH': '小 {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "SOU": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FST": {
    "col": 2,
    "col188": 1,
    "text": {"FSTH": "{homeTeam}", "FSTC": "{awayTeam}"},
    "sort": ["FSTH", "FSTC"]
  },
  "FLT": {
    "col": 2,
    "col188": 1,
    "text": {"FLTH": "{homeTeam}", "FLTC": "{awayTeam}"},
    "sort": ["FLTH", "FLTC"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "FSM": {
    "col": 2,
    "col188": 1,
    "text": {"FSMH": "{homeTeam}", "FSMC": "{awayTeam}"},
    "sort": ["FSMH", "FSMC"]
  },
  "FLM": {
    "col": 2,
    "col188": 1,
    "text": {"FLMH": "{homeTeam}", "FLMC": "{awayTeam}"},
    "sort": ["FLMH", "FLMC"]
  },
  "HH": {
    "col": 3,
    "col188": 1,
    "text": {"HH1": "上半場", "HH2": "下半場", "HHD": "得分相同"},
    "sort": ["HH1", "HH2", "HHD"]
  },
  "AROU": {
    "col": 2,
    "text": {"AROUC": "大 {ratio}", "AROUH": "小 {ratio}"},
    "sort": ["AROUC", "AROUH"]
  },
  "RWM16": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWM1": "{homeTeam} 凈勝1-5分",
      "RWM2": "{homeTeam} 凈勝6-10分",
      "RWM3": "{homeTeam} 凈勝11-15分",
      "RWM4": "{homeTeam} 凈勝16-20分",
      "RWM5": "{homeTeam} 凈勝21-25分",
      "RWM6": "{homeTeam} 凈勝26-30分",
      "RWM7": "{homeTeam} 凈勝31-35分",
      "RWM8": "{homeTeam} 凈勝40+分",
      "RWM9": "{awayTeam} 凈勝1-5分",
      "RWM10": "{awayTeam} 凈勝6-10分",
      "RWM11": "{awayTeam} 凈勝11-15分",
      "RWM12": "{awayTeam} 凈勝16-20分",
      "RWM13": "{awayTeam} 凈勝21-25分",
      "RWM14": "{awayTeam} 凈勝26-30分",
      "RWM15": "{awayTeam} 凈勝31-35分",
      "RWM16": "{awayTeam} 凈勝40+分"
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
 
  'RAG': {
    'col': 2,
    'text': {'RAGC': '大 {ratio}', 'RAGH': '小 {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  'RAH': {
    'col': 2,
    "col188": 1,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'UHOU': {
    'col': 2,
    'text': {'HOUC': '大 {ratio}', 'HOUH': '小 {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'UHR': {
    'col': 2,
    "col188": 1,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'sort': ['HRH', 'HRC']
  }
};
