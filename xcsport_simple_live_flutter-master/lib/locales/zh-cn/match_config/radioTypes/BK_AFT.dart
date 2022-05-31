// 美式足球
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
    "text": {"FMH": "{homeTeam}", "FMN": "和局", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {
      "DCHH": "主/主",
      "DCHC": "主/客",
      "DCHN": "主/和",
      "DCCC": "客/客",
      "DCCH": "客/主",
      "DCCN": "客/和",
      "DCNH": "和/主",
      "DCNC": "和/客",
      "DCNN": "和/和"
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
    "text": {"HS1": "上半场", "HS2": "下半场", "HSE": "得分相同"},
    "sort": ["HS1", "HS2", "HSE"]
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
  "WBO": {
    "col": 2,
    "text": {"WBOY": "是", "WBON": "否"},
    "sort": ["WBOY", "WBON"]
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
      "HSQ1": "第1节",
      "HSQ2": "第2节",
      "HSQ3": "第3节",
      "HSQ4": "第4节",
      "HSQE": "得分相同"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "单", "EOHE": "双"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "单", "EOCE": "双"},
    "sort": ["EOCO", "EOCE"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "单", "HEOHE": "双"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "单", "HEOCE": "双"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "TTO": {
    "col": 2,
    "text": {"TTOO": "大 {ratio}", "TTOU": "小 {ratio}"},
    "sort": ["TTOO", "TTOU"]
  },
  "TFG": {
    "col": 2,
    "text": {"TFGO": "大 {ratio}", "TFGU": "小 {ratio}"},
    "sort": ["TFGO", "TFGU"]
  },
  "EO2": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ1": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ2": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ3": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ4": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "G": {
    "col": 2,
    "col188": 1,
    "text": {
      "GHC": "{homeTeam} 大 {ratio}",
      "GHH": "{awayTeam} 小 {ratio}",
      "GCC": "{homeTeam} 大 {ratio}",
      "GCH": "{awayTeam} 小 {ratio}"
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
    "text": {
      "TEHOO": "单",
      "TEHOE": "双",
      "TECOO": "单",
      "TECOE": "双"
    },
    "sort": ["TEHOO", "TEHOE", "TECOO", "TECOE"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMHA": "{homeTeam} 净胜 1-6",
      "WMHB": "{awayTeam} 净胜 7-12",
      "WMHC": "{homeTeam} 净胜 13-18",
      "WMHD": "{awayTeam} 净胜 19-24",
      "WMHE": "{homeTeam} 净胜 25-30",
      "WMHF": "{awayTeam} 净胜 21-36",
      "WMHG": "{homeTeam} 净胜 37-42",
      "WMHH": "{awayTeam} 净胜 43 以上",
      "WMCA": "{homeTeam} 净胜 1-6",
      "WMCB": "{awayTeam} 净胜 7-12",
      "WMCC": "{homeTeam} 净胜 13-18",
      "WMCD": "{awayTeam} 净胜 19-24",
      "WMCE": "{homeTeam} 净胜 25-30",
      "WMCF": "{awayTeam} 净胜 21-36",
      "WMCG": "{homeTeam} 净胜 37-42",
      "WMCH": "{awayTeam} 净胜 43 以上"
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
    "text": {"HGH": "{homeTeam}", "HGN": "得分相同", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "THSQ": {
    "col": 3,
    "col188": 1,
    "text": {"THSQH": "{homeTeam}", "THSQN": "和局", "THSQC": "{awayTeam}"},
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
    "text": {"AOUC": "大 {ratio}", "AOUH": "小 {ratio}"},
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
      'text': {
        'ARHH': '{homeTeam} {ratio}',
        'ARHC': '{awayTeam} {ratio}'
      },
      'sort': ['ARHH', 'ARHC']
    },
    'RAG': {
      'col': 2,
      'text': {
        'RAGC': '大 {ratio}',
        'RAGH': '小 {ratio}'
      },
      'sort': ['RAGC', 'RAGH']
    },
  "RG": {
    "col": 2,
    "col188": 1,
    "text": {
      "RGHC": "{homeTeam} 大 {ratio}",
      "RGHH": "{awayTeam} 小 {ratio}",
      "RGCC": "{homeTeam} 大 {ratio}",
      "RGCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["RGHC", "RGHH", "RGCC", "RGCH"]
  },
  "RHG": {
    "col": 3,
    "col188": 1,
    "text": {"HGH": "{homeTeam}", "HGN": "得分相同", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "RWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWMHA": "{homeTeam} 净胜 1-6",
      "RWMHB": "{awayTeam} 净胜 7-12",
      "RWMHC": "{homeTeam} 净胜 13-18",
      "RWMHD": "{awayTeam} 净胜 19-24",
      "RWMHE": "{homeTeam} 净胜 25-30",
      "RWMHF": "{awayTeam} 净胜 21-36",
      "RWMHG": "{homeTeam} 净胜 37-42",
      "RWMHH": "{awayTeam} 净胜 43 以上",
      "RWMCA": "{homeTeam} 净胜 1-6",
      "RWMCB": "{awayTeam} 净胜 7-12",
      "RWMCC": "{homeTeam} 净胜 13-18",
      "RWMCD": "{awayTeam} 净胜 19-24",
      "RWMCE": "{homeTeam} 净胜 25-30",
      "RWMCF": "{awayTeam} 净胜 21-36",
      "RWMCG": "{homeTeam} 净胜 37-42",
      "RWMCH": "{awayTeam} 净胜 43 以上"
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
    "text": {"RWBOY": "是", "RWBON": "否"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEHOO": "单",
      "RTEHOE": "双",
      "RTECOO": "单",
      "RTECOE": "双"
    },
    "sort": ["RTEHOO", "RTEHOE", "RTECOO", "RTECOE"]
  },
  "RDC": {
    "col": 3,
    "col188": 1,
    "text": {
      "RDCHH": "主/主",
      "RDCHC": "主/客",
      "RDCHN": "主/和",
      "RDCCC": "客/客",
      "RDCCH": "客/主",
      "RDCCN": "客/和",
      "RDCNH": "和/主",
      "RDCNC": "和/客",
      "RDCNN": "和/和"
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
    "text": {"RFMH": "{homeTeam}", "RFMD": "平", "RFMA": "{awayTeam}"},
    "sort": ["RFMH", "RFMD", "RFMA"]
  }
};
