// American Football
const dynamic bk_aftRadioTypes = {
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "FM": {
    "col": 3,
    "col188": 1,
    "text": {"FMH": "{homeTeam}", "FMN": "Draw", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
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
  "HS": {
    "col": 3,
    "col188": 1,
    "text": {"HS1": "First Half", "HS2": "Second Half", "HSE": "Same Score"},
    "sort": ["HS1", "HS2", "HSE"]
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
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Yes", "WBON": "No"},
    "sort": ["WBOY", "WBON"]
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
  "RP": {
    "col": 2,
    "col188": 1,
    "text": {"RPH": "{homeTeam}", "RPA": "{awayTeam}"},
    "sort": ["RPH", "RPA"]
  },
  "HSQ": {
    "col": 3,
    "col188": 1,
    "text": {
      "HSQ1": "1st Quarter",
      "HSQ2": "2nd Quarter",
      "HSQ3": "3rd Quarter",
      "HSQ4": "4th Quarter",
      "HSQE": "Same Score"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "Odd", "EOHE": "Even"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "Odd", "EOCE": "Even"},
    "sort": ["EOCO", "EOCE"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "Odd", "HEOHE": "Even"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "Odd", "HEOCE": "Even"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "TTO": {
    "col": 2,
    "text": {"TTOO": "Over {ratio}", "TTOU": "Under {ratio}"},
    "sort": ["TTOO", "TTOU"]
  },
  "TFG": {
    "col": 2,
    "text": {"TFGO": "Over {ratio}", "TFGU": "Under {ratio}"},
    "sort": ["TFGO", "TFGU"]
  },
  "EO2": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ1": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ2": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ3": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ4": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  
  "HM": {
    "col": 2,
    "col188": 1,
    "text": {"HMH": "{homeTeam}", "HMC": "{awayTeam}"},
    "sort": ["HMH", "HMC"]
  },
  "HRM": {
    "col": 2,
    "col188": 1,
    "text": {"HRMH": "{homeTeam}", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMC"]
  },
  
  "TD": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "G": {
    "col": 2,
    "col188": 1,
    "text": {
      "GHC": "{homeTeam} Over {ratio}",
      "GHH": "{awayTeam} Under {ratio}",
      "GCC": "{homeTeam} Over {ratio}",
      "GCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["GHC", "GHH", "GCC", "GCH"]
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
  "TEO": {
    "col": 2,
    "col188": 1,
    "text": {
      "TEHOO": "Odd",
      "TEHOE": "Even",
      "TECOO": "Odd",
      "TECOE": "Even"
    },
    "sort": ["TEHOO", "TEHOE", "TECOO", "TECOE"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMHA": "{homeTeam} Net Winning 1-6",
      "WMHB": "{awayTeam} Net Winning 7-12",
      "WMHC": "{homeTeam} Net Winning 13-18",
      "WMHD": "{awayTeam} Net Winning 19-24",
      "WMHE": "{homeTeam} Net Winning 25-30",
      "WMHF": "{awayTeam} Net Winning 21-36",
      "WMHG": "{homeTeam} Net Winning 37-42",
      "WMHH": "{awayTeam} Net Winning 43+",
      "WMCA": "{homeTeam} Net Winning 1-6",
      "WMCB": "{awayTeam} Net Winning 7-12",
      "WMCC": "{homeTeam} Net Winning 13-18",
      "WMCD": "{awayTeam} Net Winning 19-24",
      "WMCE": "{homeTeam} Net Winning 25-30",
      "WMCF": "{awayTeam} Net Winning 21-36",
      "WMCG": "{homeTeam} Net Winning 37-42",
      "WMCH": "{awayTeam} Net Winning 43+"
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
    "col188": 1,
    "text": {"HGH": "{homeTeam}", "HGN": "Same Score", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "THSQ": {
    "col": 3,
    "col188": 1,
    "text": {"THSQH": "{homeTeam}", "THSQN": "Draw", "THSQC": "{awayTeam}"},
    "sort": ["THSQH", "THSQN", "THSQC"]
  },
  "AH": {
    "col": 2,
    "col188": 1,
    "text": {"ARH": "{homeTeam} {ratio}", "ARC": "{awayTeam} {ratio}"},
    "sort": ["ARH", "ARC"]
  },
  "AG": {
    "col": 2,
    "text": {"AOUC": "Over {ratio}", "AOUH": "Under {ratio}"},
    "sort": ["AOUC", "AOUH"]
  },
  "FP": {
    "col": 2,
    "col188": 1,
    "text": {"FPH": "{homeTeam}", "FPC": "{awayTeam}"},
    "sort": ["FPH", "FPC"]
  },
  "FT": {
    "col": 2,
    "col188": 1,
    "text": {"FTH": "{homeTeam}", "FTC": "{awayTeam}"},
    "sort": ["FTH", "FTC"]
  },
  "FCC": {
    "col": 2,
    "col188": 1,
    "text": {"FCCH": "{homeTeam}", "FCCC": "{awayTeam}"},
    "sort": ["FCCH", "FCCC"]
  },
  'ARH': {
    'col': 2,
    "col188": 1,
    'text': {'ARHH': '{homeTeam} {ratio}', 'ARHC': '{awayTeam} {ratio}'},
    'sort': ['ARHH', 'ARHC']
  },
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'Over {ratio}', 'RAGH': 'Under {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  "RG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RGHC": "{homeTeam} Over {ratio}",
      "RGHH": "{awayTeam} Under {ratio}",
      "RGCC": "{homeTeam} Over {ratio}",
      "RGCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["RGHC", "RGHH", "RGCC", "RGCH"]
  },
  "RHG": {
    "col": 3,
    "col188": 1,
    "text": {"HGH": "{homeTeam}", "HGN": "Same Score", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "RWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWMHA": "{homeTeam} Net Winning 1-6",
      "RWMHB": "{awayTeam} Net Winning 7-12",
      "RWMHC": "{homeTeam} Net Winning 13-18",
      "RWMHD": "{awayTeam} Net Winning 19-24",
      "RWMHE": "{homeTeam} Net Winning 25-30",
      "RWMHF": "{awayTeam} Net Winning 21-36",
      "RWMHG": "{homeTeam} Net Winning 37-42",
      "RWMHH": "{awayTeam} Net Winning 43+",
      "RWMCA": "{homeTeam} Net Winning 1-6",
      "RWMCB": "{awayTeam} Net Winning 7-12",
      "RWMCC": "{homeTeam} Net Winning 13-18",
      "RWMCD": "{awayTeam} Net Winning 19-24",
      "RWMCE": "{homeTeam} Net Winning 25-30",
      "RWMCF": "{awayTeam} Net Winning 21-36",
      "RWMCG": "{homeTeam} Net Winning 37-42",
      "RWMCH": "{awayTeam} Net Winning 43+"
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
    "text": {"RWBOY": "Yes", "RWBON": "No"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEHOO": "Odd",
      "RTEHOE": "Even",
      "RTECOO": "Odd",
      "RTECOE": "Even"
    },
    "sort": ["RTEHOO", "RTEHOE", "RTECOO", "RTECOE"]
  },
  "RDC": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDCHH": "Home/Home",
      "RDCHC": "Home/Away",
      "RDCHN": "Home/Draw",
      "RDCCC": "Away/Away",
      "RDCCH": "Away/Home",
      "RDCCN": "Away/Draw",
      "RDCNH": "Draw/Home",
      "RDCNC": "Draw/Away",
      "RDCNN": "Draw/Draw"
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
    "col188": 1,
    "text": {"RFSH": "{homeTeam}", "RFSC": "{awayTeam}"},
    "sort": ["RFSH", "RFSC"]
  },
  "RFM": {
    "col": 3,
    "col188": 1,
    "text": {"RFMH": "{homeTeam}", "RFMD": "Draw", "RFMA": "{awayTeam}"},
    "sort": ["RFMH", "RFMD", "RFMA"]
  }
};
