// Baseball
const dynamic bsRadioTypes = {
  "MN": {
    "col": 3,
    "col188": 1,
    "text": {"MNH": "{homeTeam}", "MNN": "Draw", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNN", "MNC"]
  },
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
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
  "RES": {
    "col": 3,
    "col188": 1,
    "text": {
      "RES4": "0-4",
      "RES6": "5-6",
      "RES8": "7-8",
      "RES10": "9-10",
      "RES13": "11-13",
      "RES14": "14+"
    },
    "sort": ["RES4", "RES6", "RES8", "RES10", "RES13", "RES14"]
  },
  "HIS": {
    "col": 2,
    "col188": 1,
    "text": {
      "HIS1": " 1st inning",
      "HIS2": " 2nd inning",
      "HIS3": " 3rd inning",
      "HIS4": " 4th inning",
      "HIS5": " 5th inning",
      "HIS6": " 6th inning",
      "HIS7": " 7th inning",
      "HIS8": " 8th inning",
      "HIS9": " 9th inning",
      "HISN": "Same Score"
    },
    "sort": [
      "HIS1",
      "HIS2",
      "HIS3",
      "HIS4",
      "HIS5",
      "HIS6",
      "HIS7",
      "HIS8",
      "HIS9",
      "HISN"
    ]
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
  "IM": {
    "col": 3,
    "col188": 1,
    "text": {"IMH": "{homeTeam}", "IMN": "Draw", "IMC": "{awayTeam}"},
    "sort": ["IMH", "IMN", "IMC"]
  },
  "IOU": {
    "col": 2,
    "text": {"IOUO": "Over {ratio}", "IOUU": "Under {ratio}"},
    "sort": ["IOUO", "IOUU"]
  },
  "IR": {
    "col": 2,
    "col188": 1,
    "text": {"IRH": "{homeTeam} {ratio}", "IRC": "{awayTeam} {ratio}"},
    "sort": ["IRH", "IRC"]
  },
  "IOUH": {
    "col": 2,
    "text": {"IOUHO": "Over {ratio}", "IOUHU": "Under {ratio}"},
    "sort": ["IOUHO", "IOUHU"]
  },
  "IOUC": {
    "col": 2,
    "text": {"IOUCO": "Over {ratio}", "IOUCU": "Under {ratio}"},
    "sort": ["IOUCO", "IOUCU"]
  },
  "WM1": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM1H1": "{homeTeam} Won 1 inning",
      "WM1H2": "{homeTeam} Won 2 innings",
      "WM1H3": "{homeTeam} Won 3+ innings",
      "WM1C1": "{awayTeam} Won 1 inning",
      "WM1C2": "{awayTeam} Won 2 innings",
      "WM1C3": "{awayTeam} Won 3+ innings",
    },
    "sort": ['WM1H1', 'WM1C1', 'WM1H2', 'WM1C2', 'WM1H3', 'WM1C3']
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "Home Team Won by 1",
      "WMH2": "Home Team Won by 2",
      "WMH3": "Home Team Won by 3",
      "WMH4": "Home Team Won by 4",
      "WMHOV": "Home Team Won by 4+",
      "WMC1": "Away Team Won by 1",
      "WMC2": "Away Team Won by 2",
      "WMC3": "Away Team Won by 3",
      "WMC4": "Away Team Won by 4",
      "WMCOV": "Away Team Won by 4+",
      "WMH0": "Draw"
    },
    "sort": [
      'WMH1',
      'WMC1',
      'WMH2',
      'WMC2',
      'WMH3',
      'WMC3',
      'WMH4',
      'WMC4',
      'WMHOV',
      'WMCOV',
      'WMH0'
    ]
  },
  "RWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWMH1": 'Home Team Won by 1',
      "RWMH2": 'Home Team Won by 2',
      "RWMH3": 'Home Team Won by 3',
      "WMH1": 'Home Team Won by 1',
      "WMH2": 'Home Team Won by 2',
      "WMH3": 'Home Team Won by 3',
      "WMHOV": 'Home Team Won by 4+',
      "WMC1": 'Away Team Won by 1',
      "WMC2": 'Away Team Won by 2',
      "WMC3": 'Away Team Won by 3',
      "WMCOV": 'Away Team Won by 4+',
      "RWMH4": 'Away Team Won by 4',
      "RWMC1": 'Away Team Won by 1',
      "RWMC2": 'Away Team Won by 2',
      "RWMC3": 'Away Team Won by 3',
      "RWMC4": 'Away Team Won by 4',
      "RWMH0": "Draw"
    },
    "sort": [
      'RWMH1',
      'WMH1',
      'WMC1',
      'RWMC1',
      'RWMH2',
      'WMH2',
      'WMC2',
      'RWMC2',
      'RWMH3',
      'WMC3',
      'WMH3',
      'RWMC3',
      'RWMH4',
      'RWMC4',
      'WMHOV',
      'WMCOV',
      'RWMH0'
    ]
  },
  "HWM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HWMH1": "Home Team Won by 1",
      "HWMH2": "Home Team Won by 2",
      "HWMH3": "Home Team Won by 3",
      "HWMH4": "Home Team Won by 4",
      "HWMC1": "Away Team Won by 1",
      "HWMC2": "Away Team Won by 2",
      "HWMC3": "Away Team Won by 3",
      "HWMC4": "Away Team Won by 4",
      "HWMH0": "Draw"
    },
    "sort": [
      "HWMH1",
      "HWMH2",
      "HWMH3",
      "HWMH4",
      "HWMC1",
      "HWMC2",
      "HWMC3",
      "HWMC4",
      "HWMH0"
    ]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "Yes", "OTN": "No"},
    "sort": ["OTY", "OTN"]
  },
  "ROUH": {
    "col": 2,
    "text": {"ROUHO": "Over {ratio}", "ROUHU": "Under {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC": {
    "col": 2,
    "text": {"ROUCO": "Over {ratio}", "ROUCU": "Under {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "HRUH": {
    "col": 2,
    "text": {"HOUHO": "Over {ratio}", "HOUHU": "Under {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HRUC": {
    "col": 2,
    "text": {"HOUCO": "Over {ratio}", "HOUCU": "Under {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "HRWM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRWMH1": "Home Team Won by 1",
      "HRWMH2": "Home Team Won by 2",
      "HRWMH3": "Home Team Won by 3",
      "HRWMH4": "Home Team Won by 4",
      "HRWMC1": "Away Team Won by 1",
      "HRWMC2": "Away Team Won by 2",
      "HRWMC3": "Away Team Won by 3",
      "HRWMC4": "Away Team Won by 4",
      "HRWMH0": "Draw"
    },
    "sort": [
      "HRWMH1",
      "HRWMH2",
      "HRWMH3",
      "HRWMH4",
      "HRWMC1",
      "HRWMC2",
      "HRWMC3",
      "HRWMC4",
      "HRWMH0"
    ]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "Yes", "ROTN": "No"},
    "sort": ["ROTY", "ROTN"]
  },
  "AEO": {
    "col": 2,
    "text": {"AEOO": "Odd", "AEOE": "Even"},
    "sort": ["AEOO", "AEOE"]
  },
  "W3": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "Draw {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  'OUW3': {
    'col': 3,
    "col188": 1,
    'text': {
      'OUW3O': 'Over {ratio}',
      'OUW3E': 'Exact {ratio}',
      'OUW3U': 'Under {ratio}'
    },
    'sort': ['OUW3O', 'OUW3E', 'OUW3U']
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
  "HSQ": {
    "col": 3,
    "col188": 1,
    "text": {"HSQ1": "1-5 innings ", "HSQ2": "Draw", "HSQ3": "Other innings"},
    "sort": ["HSQ1", "HSQ2", "HSQ3"]
  },
  "HST": {
    "col": 3,
    "col188": 1,
    "text": {"HSTH": "{homeTeam}", "HSTN": "Draw", "HSTC": "{awayTeam}"},
    "sort": ["HSTH", "HSTN", "HSTC"]
  },
  "ARG": {
    "col": 2,
    "text": {"ARGY": "Yes", "ARGN": "No"},
    "sort": ["ARGY", "ARGN"]
  },
  "TOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "TOUHC": "{homeTeam} Over {ratio}",
      "TOUHH": "{homeTeam} Under {ratio}",
      "TOUCC": "{awayTeam} Over {ratio}",
      "TOUCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["TOUHC", "TOUHH", "TOUCC", "TOUCH"]
  },
  "UA": {
    "col": 3,
    "col188": 1,
    "text": {
      "UAO": "Over {ratio}",
      "UAE": "Exact {ratio}",
      "UAU": "Under {ratio}"
    },
    "sort": ["UAO", "UAE", "UAU"]
  },
  "UB": {
    "col": 3,
    "col188": 1,
    "text": {
      "UBO": "Over {ratio}",
      "UBE": "Exact {ratio}",
      "UBU": "Under {ratio}"
    },
    "sort": ["UBO", "UBE", "UBU"]
  },
  "UC": {
    "col": 3,
    "col188": 1,
    "text": {
      "UCO": "Over {ratio}",
      "UCE": "Exact {ratio}",
      "UCU": "Under {ratio}"
    },
    "sort": ["UCO", "UCE", "UCU"]
  },
  "MA": {
    "col": 3,
    "col188": 1,
    "text": {"MAH": "{homeTeam}", "MAN": "Draw", "MAC": "{awayTeam}"},
    "sort": ["MAH", "MAN", "MAC"]
  },
  "MB": {
    "col": 3,
    "col188": 1,
    "text": {"MBH": "{homeTeam}", "MBN": "Draw", "MBC": "{awayTeam}"},
    "sort": ["MBH", "MBN", "MBC"]
  },
  "MC": {
    "col": 3,
    "col188": 1,
    "text": {"MCH": "{homeTeam}", "MCN": "Draw", "MCC": "{awayTeam}"},
    "sort": ["MCH", "MCN", "MCC"]
  },
  "MD": {
    "col": 3,
    "col188": 1,
    "text": {"MDH": "{homeTeam}", "MDN": "Draw", "MDC": "{awayTeam}"},
    "sort": ["MDH", "MDN", "MDC"]
  },
  "MLA": {
    "col": 2,
    "col188": 1,
    "text": {"MLAH": "{homeTeam}", "MLAC": "{awayTeam}"},
    "sort": ["MLAH", "MLAC"]
  },
  "MLB": {
    "col": 2,
    "col188": 1,
    "text": {"MLBH": "{homeTeam}", "MLBC": "{awayTeam}"},
    "sort": ["MLBH", "MLBC"]
  },
  "MLC": {
    "col": 2,
    "col188": 1,
    "text": {"MLCH": "{homeTeam}", "MLCC": "{awayTeam}"},
    "sort": ["MLCH", "MLCC"]
  },
  "TS": {
    "col": 2,
    "text": {"TSY": "Yes", "TSN": "No"},
    "sort": ["TSY", "TSN"]
  },
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {
      "DCHH": "Home/Home",
      "DCHC": "Home/Away",
      "DCHN": "Home/Draw",
      "DCCC": "Away/Away",
      "DCCH": "Away/Home",
      "DCCN": "Away/Draw",
      "DCNH": "Draw/Home",
      "DCNC": "Draw/Away",
      "DCNN": "Draw/Draw"
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
  "RWBO": {
    "col": 2,
    "text": {"RWBOY": "Yes", "RWBON": "No"},
    "sort": ["RWBOY", "RWBON"]
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
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
  "M2": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R2": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU2": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M1": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R1": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU1": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M4": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R4": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU4": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M6": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R6": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU6": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M8": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R8": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU8": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M9": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R9": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU9": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RTTG': {
    'col': 2,
    "col188": 1,
    'text': {
      'ROUHC': '{homeTeam} Over {ratio}',
      'ROUHH': '{homeTeam} Under {ratio}',
      'ROUCC': '{awayTeam} Over {ratio}',
      'ROUCH': '{awayTeam} Under {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'PPA': {
    'col': 3,
    "col188": 1,
    'text': {'PPAB': 'Safe on base', 'PPAO': "Draw", 'PPAHR': 'Home Run'},
    'sort': ['PPAB', 'PPAO', 'PPAHR']
  },
  'PATS': {
    'col': 2,
    'text': {'PATSY': 'Yes', 'PATSN': 'No'},
    'sort': ['PATSY', 'PATSN']
  },
  'NR': {
    'col': 3,
    "col188": 1,
    'text': {'NRH': '{homeTeam}', 'NRN': 'No Score', 'NRA': '{awayTeam}'},
    'sort': ['NRH', 'NRN', 'NRA']
  },
  'FS': {
    'col': 2,
    "col188": 1,
    'text': {'FSH': '{homeTeam}', 'FSC': '{awayTeam}'},
    'sort': ['FSH', 'FSC']
  },
  'LS': {
    'col': 2,
    "col188": 1,
    'text': {'LSH': '{homeTeam}', 'LSC': '{awayTeam}'},
    'sort': ['LSH', 'LSC']
  },
  'PHR': {
    'col': 2,
    'text': {'PHRC': 'Over {ratio}', 'PHRH': 'Under {ratio}'},
    'sort': ['PHRC', 'PHRH']
  },
  'PSO': {
    'col': 2,
    'text': {'PSOC': 'Over {ratio}', 'PSOH': 'Under {ratio}'},
    'sort': ['PSOC', 'PSOH']
  },
  'PH': {
    'col': 2,
    'text': {'PHC': 'Over {ratio}', 'PHH': 'Under {ratio}'},
    'sort': ['PHC', 'PHH']
  },
  'PTB': {
    'col': 2,
    'text': {'PTBC': 'Over {ratio}', 'PTBH': 'Under {ratio}'},
    'sort': ['PTBC', 'PTBH']
  },
  'PHA': {
    'col': 2,
    'text': {'PHAC': 'Over {ratio}', 'PHAH': 'Under {ratio}'},
    'sort': ['PHAC', 'PHAH']
  },
  'PHRA': {
    'col': 2,
    'text': {'PHRAC': 'Over {ratio}', 'PHRAH': 'Under {ratio}'},
    'sort': ['PHRAC', 'PHRAH']
  },
  'PSOT': {
    'col': 2,
    'text': {'PSOTC': 'Over {ratio}', 'PSOTH': 'Under {ratio}'},
    'sort': ['PSOTC', 'PSOTH']
  },
  'OUA': {
    'col': 2,
    'text': {'OUAC': 'Over {ratio}', 'OUAH': 'Under {ratio}'},
    'sort': ['OUAC', 'OUAH']
  },
  'HTOU': {
    'col': 2,
    "col188": 1,
    'text': {
      'HTOUHC': '{homeTeam} Over {ratio}',
      'HTOUHH': '{homeTeam} Under {ratio}',
      'HTOUCC': '{awayTeam} Over {ratio}',
      'HTOUCH': '{awayTeam} Under {ratio}'
    },
    'sort': ['HTOUHC', 'HTOUHH', 'HTOUCC', 'HTOUCH']
  },
  'RW3': {
    'col': 3,
    "col188": 1,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'Draw {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'F2G': {
    'col': 3,
    "col188": 1,
    'text': {'F2GH': '{homeTeam}', 'F2GN': 'Neither', 'F2GC': '{awayTeam}'},
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    "col188": 1,
    'text': {'F3GH': '{homeTeam}', 'F3GN': 'Neither', 'F3GC': '{awayTeam}'},
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'F4G': {
    'col': 3,
    "col188": 1,
    'text': {'F4GH': '{homeTeam}', 'F4GN': 'Neither', 'F4GC': '{awayTeam}'},
    'sort': ['F4GH', 'F4GC', 'F4GN']
  },
  'F5G': {
    'col': 3,
    "col188": 1,
    'text': {'F5GH': '{homeTeam}', 'F5GN': 'Neither', 'F5GC': '{awayTeam}'},
    'sort': ['F5GH', 'F5GC', 'F5GN']
  },
  'F6G': {
    'col': 3,
    "col188": 1,
    'text': {'F6GH': '{homeTeam}', 'F6GN': 'Neither', 'F6GC': '{awayTeam}'},
    'sort': ['F6GH', 'F6GC', 'F6GN']
  },
  'F7G': {
    'col': 3,
    "col188": 1,
    'text': {'F7GH': '{homeTeam}', 'F7GN': 'Neither', 'F7GC': '{awayTeam}'},
    'sort': ['F7GH', 'F7GC', 'F7GN']
  },
  'RM1': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM2': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM3': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM4': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM5': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM6': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM7': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM8': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "Draw", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RDC': {
    'col': 2,
    "col188": 1,
    'text': {
      'RDCHH': 'Home/Home',
      'RDCHC': 'Home/Away',
      'RDCCC': 'Away/Away',
      'RDCCH': 'Away/Home',
      'RDCNH': 'Draw/Home',
      'RDCNC': 'Draw/Away'
    },
    'sort': [
      'RDCHH',
      'RDCHC',
      'RDCCC',
      'RDCCH',
      'RDCNH',
      'RDCNC',
    ]
  },
  'ROUA': {
    'col': 2,
    'text': {'ROUAC': 'Over {ratio}', 'ROUAH': 'Under {ratio}'},
    'sort': ['ROUAC', 'ROUAH']
  },
  'ROUG': {
    'col': 2,
    'text': {'ROUGC': 'Over {ratio}', 'ROUGH': 'Under {ratio}'},
    'sort': ['ROUGC', 'ROUAH']
  },
  'ROUB': {
    'col': 2,
    'text': {'ROUBC': 'Over {ratio}', 'ROUBH': 'Under {ratio}'},
    'sort': ['ROUBC', 'ROUBH']
  },
  'ROUD': {
    'col': 2,
    'text': {'ROUDC': 'Over {ratio}', 'ROUDH': 'Under {ratio}'},
    'sort': ['ROUDC', 'ROUAH']
  },
  'ROUE': {
    'col': 2,
    'text': {'ROUEC': 'Over {ratio}', 'ROUEH': 'Under {ratio}'},
    'sort': ['ROUEC', 'ROUAH']
  },
  'ROUF': {
    'col': 2,
    'text': {'ROUFC': 'Over {ratio}', 'ROUFH': 'Under {ratio}'},
    'sort': ['ROUFC', 'ROUAH']
  },
  'RHIT': {
    'col': 2,
    'text': {'RHITOUC': 'Over {ratio}', 'RHITOUH': 'Under {ratio}'},
    'sort': ['RHITOUC', 'RHITOUH']
  },
};
