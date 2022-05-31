// Rugby
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
      'DCHH': 'Home/Home',
      'DCHC': 'Home/Away',
      'DCHD': 'Home/Draw',
      'DCCC': 'Away/Away',
      'DCCH': 'Away/Home',
      'DCCD': 'Away/Draw',
      'DCDD': 'Draw/Draw',
      'DCDH': 'Draw/Home',
      'DCDC': 'Draw/Away'
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
      "RFMD": "Draw {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "{homeTeam} Net winning by 1-5",
      "WMH2": "{homeTeam} Net winning by 6-10 ",
      "WMH3": "{homeTeam} Net winning by 11-15 ",
      "WMH4": "{homeTeam} Net winning by 16-20 ",
      "WMH5": "{homeTeam} Net winning by 21-25 ",
      "WMH6": "{homeTeam} Net winning by 26-30 ",
      "WMH7": "{homeTeam} Net winning by 31-35 ",
      "WMH8": "{homeTeam} Net winning by 36-40 ",
      "WMC1": "{awayTeam} Net winning by 1-5 ",
      "WMC2": "{awayTeam} Net winning by 6-10 ",
      "WMC3": "{awayTeam} Net winning by 11-15 ",
      "WMC4": "{awayTeam} Net winning by 16-20 ",
      "WMC5": "{awayTeam} Net winning by 21-25 ",
      "WMC6": "{awayTeam} Net winning by 26-30 ",
      "WMC7": "{awayTeam} Net winning by 31-35 ",
      "WMC8": "{awayTeam} Net winning by 36-40 ",
      'WMN': "Draw"
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
    "text": {"OUH4": "Over {ratio}", "OUH5": "Under {ratio}"},
    "sort": ["OUH4", "OUH5"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUC4": "Over {ratio}", "OUC5": "Under {ratio}"},
    "sort": ["OUC4", "OUC5"]
  },
  "EO": {
    "col": 2,
    "text": {"EO4": "Odd", "EO5": "Even"},
    "sort": ["EO4", "EO5"]
  },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RF418": "Home/Home",
      "RF420": "Home/Draw",
      "RF422": "Home/Away",
      "RF424": "Draw/Home",
      "RF426": "Draw/Draw",
      "RF428": "Draw/Away",
      "RF430": "Away/Home",
      "RF432": "Away/Draw",
      "RF434": "Away/Away"
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
    "text": {
      "HS436": "First Half",
      "HS438": "Second Half",
      "HS440": "Same Score"
    },
    "sort": ["HS436", "HS438", "HS440"]
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
    'sort': ['HMH', 'HMN', 'HMC', 'HM1', 'HM2', 'HM3']
  },
  "HRFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Draw {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HEO": {
    "col": 2,
    "text": {"HEO70": "Odd", "HEO72": "Even"},
    "sort": ["HEO70", "HEO72"]
  },
  "OTM": {
    "col": 3,
    "col188": 1,
    "text": {"OTM1": "{homeTeam}", "OTM2": "Draw", "OTM3": "{awayTeam}"},
    "sort": ["OTM1", "OTM2", "OTM3"]
  },
  "HWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HWM130": "Home won 15+",
      "HWM131": "Home won 8-14",
      "HWM132": "Home won 1-7",
      "HWM133": "Draw",
      "HWM134": "Away won 1-7",
      "HWM135": "Away won 8-14",
      "HWM136": "Away won 15+"
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
      "SWM112": "Home Won 1-12",
      "SWM113": "Home Won 13+",
      "SWM114": "Away Won 1-12",
      "SWM115": "Away Won 13+",
      "SWM116": "Draw"
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
      'CDHH': 'Home/Draw',
      'CDHC': 'Home/Away',
      'CDHN': 'Home/Draw',
      'CDCC': 'Away/Away',
      'CDCH': 'Away/Home',
      'CDCN': 'Away/Draw',
      'CDNH': 'Draw/Home',
      'CDNC': 'Draw/Away',
      'CDNN': 'Draw/Draw'
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
      "WM5A": "{homeTeam} Net winning by 1-12",
      "WM5B": "{homeTeam} Net winning by 13+",
      "WM5C": "{awayTeam} Net winning by 1-12",
      "WM5D": "{awayTeam} Net winning by 13+",
      "WM5E": "Draw"
    },
    "sort": ["WM5A", "WM5B", "WM5C", "WM5E"]
  },
  "RTA": {
    "col": 3,
    "col188": 1,
    "text": {"RTAH": "{homeTeam}", "RTAN": "Neither", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAN", "RTAC"]
  },
  'ZEO': {
    'col': 2,
    'text': {'EOO': 'Odd', 'EOE': 'Even'},
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
    'text': {'AGC': 'Over {ratio}', 'AGH': 'Under {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "SOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"HH1": " First Half", "HH2": "Second Half", "HHD": "Same Score"},
    "sort": ["HH1", "HH2", "HHD"]
  },
  "AROU": {
    "col": 2,
    "text": {"AROUC": "Over {ratio}", "AROUH": "Under {ratio}"},
    "sort": ["AROUC", "AROUH"]
  },
  "RWM16": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWM1": "{homeTeam} Net winning by 1-5 points",
      "RWM2": "{homeTeam} Net winning by 6-10 points",
      "RWM3": "{homeTeam} Net winning by 11-15 points",
      "RWM4": "{homeTeam} Net winning by 16-20 points",
      "RWM5": "{homeTeam} Net winning by 21-25 points",
      "RWM6": "{homeTeam} Net winning by 26-30 points",
      "RWM7": "{homeTeam} Net winning by 31-35 points",
      "RWM8": "{homeTeam} Net winning by 40+ points",
      "RWM9": "{awayTeam} Net winning by 1-5 points",
      "RWM10": "{awayTeam} Net winning by 6-10 points",
      "RWM11": "{awayTeam} Net winning by 11-15 points",
      "RWM12": "{awayTeam} Net winning by 16-20 points",
      "RWM13": "{awayTeam} Net winning by 21-25 points",
      "RWM14": "{awayTeam} Net winning by 26-30 points",
      "RWM15": "{awayTeam} Net winning by 31-35 points",
      "RWM16": "{awayTeam} Net winning by 40+ points"
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
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'Over {ratio}', 'RAGH': 'Under {ratio}'},
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
    'text': {'HOUC': 'Over {ratio}', 'HOUH': 'Under {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'UHR': {
    'col': 2,
    "col188": 1,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'sort': ['HRH', 'HRC']
  }
};
