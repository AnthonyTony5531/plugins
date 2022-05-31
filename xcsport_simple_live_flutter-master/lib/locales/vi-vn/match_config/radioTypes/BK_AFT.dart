// Bóng bầu dục Mỹ
const dynamic bk_aftRadioTypes = {
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "FM": {
    "col": 3,
    "text": {"FMH": "{homeTeam}", "FMN": "Hòa", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "DC": {
    "col": 3,
    "text": {
      "DCHH": "Chủ/Chủ",
      "DCHC": "Chủ/Khách",
      "DCHN": "Chủ/Hòa",
      "DCCC": "Khách/Khách",
      "DCCH": "Khách/Chủ",
      "DCCN": "Khách/Hòa",
      "DCNH": "Hòa/Chủ",
      "DCNC": "Hòa/Khách",
      "DCNN": "Hòa/Hòa"
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
    "text": {"HS1": "Hiệp 1", "HS2": "Hiệp 2", "HSE": "Điểm số bằng nhau"},
    "sort": ["HS1", "HS2", "HSE"]
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
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Có", "WBON": "Không"},
    "sort": ["WBOY", "WBON"]
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
  "RP": {
    "col": 2,
    "text": {"RPH": "{homeTeam}", "RPA": "{awayTeam}"},
    "sort": ["RPH", "RPA"]
  },
  "HSQ": {
    "col": 3,
    "text": {
      "HSQ1": "Hiệp 1",
      "HSQ2": "Hiệp 2",
      "HSQ3": "Hiệp 3",
      "HSQ4": "Hiệp 4",
      "HSQE": "Điểm số bằng nhau"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "Lẻ", "EOHE": "Chẵn"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "Lẻ", "EOCE": "Chẵn"},
    "sort": ["EOCO", "EOCE"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "Lẻ", "HEOHE": "Chẵn"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "Lẻ", "HEOCE": "Chẵn"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "TTO": {
    "col": 2,
    "text": {"TTOO": "Tài {ratio}", "TTOU": "Xỉu {ratio}"},
    "sort": ["TTOO", "TTOU"]
  },
  "TFG": {
    "col": 2,
    "text": {"TFGO": "Tài {ratio}", "TFGU": "Xỉu {ratio}"},
    "sort": ["TFGO", "TFGU"]
  },
  "EO2": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ1": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ2": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ3": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "EOQ4": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
 
  "HM": {
    "col": 2,
    "text": {"HMH": "{homeTeam}", "HMC": "{awayTeam}"},
    "sort": ["HMH", "HMC"]
  },
  "HRM": {
    "col": 2,
    "text": {"HRMH": "{homeTeam}", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMC"]
  },
  
  "TD": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {"col": 3, "text": {}, "sort": []},
  "G": {
    "col": 2,
    "text": {
      "GHC": "{homeTeam} Tài {ratio}",
      "GHH": "{awayTeam} Xỉu {ratio}",
      "GCC": "{homeTeam} Tài {ratio}",
      "GCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["GHC", "GHH", "GCC", "GCH"]
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
  "TEO": {
    "col": 2,
    "text": {
      "TEHOO": "Lẻ",
      "TEHOE": "Chẵn",
      "TECOO": "Lẻ",
      "TECOE": "Chẵn"
    },
    "sort": ["TEHOO", "TEHOE", "TECOO", "TECOE"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMHA": "{homeTeam} Thắng 1-6",
      "WMHB": "{awayTeam} Thắng 7-12",
      "WMHC": "{homeTeam} Thắng 13-18",
      "WMHD": "{awayTeam} Thắng 19-24",
      "WMHE": "{homeTeam} Thắng 25-30",
      "WMHF": "{awayTeam} Thắng 21-36",
      "WMHG": "{homeTeam} Thắng 37-42",
      "WMHH": "{awayTeam} Thắng 43 trở lên",
      "WMCA": "{homeTeam} Thắng 1-6",
      "WMCB": "{awayTeam} Thắng 7-12",
      "WMCC": "{homeTeam} Thắng 13-18",
      "WMCD": "{awayTeam} Thắng 19-24",
      "WMCE": "{homeTeam} Thắng 25-30",
      "WMCF": "{awayTeam} Thắng 21-36",
      "WMCG": "{homeTeam} Thắng 37-42",
      "WMCH": "{awayTeam} Thắng 43 trở lên"
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
    "text": {"HGH": "{homeTeam}", "HGN": "Điểm số bằng nhau", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "THSQ": {
    "col": 3,
    "text": {"THSQH": "{homeTeam}", "THSQN": "Hòa", "THSQC": "{awayTeam}"},
    "sort": ["THSQH", "THSQN", "THSQC"]
  },
  "AH": {
    "col": 2,
    "text": {"ARH": "{homeTeam} {ratio}", "ARC": "{awayTeam} {ratio}"},
    "sort": ["ARH", "ARC"]
  },
  "AG": {
    "col": 2,
    "text": {"AOUC": "Tài {ratio}", "AOUH": "Xỉu {ratio}"},
    "sort": ["AOUC", "AOUH"]
  },
  "FP": {
    "col": 2,
    "text": {"FPH": "{homeTeam}", "FPC": "{awayTeam}"},
    "sort": ["FPH", "FPC"]
  },
  "FT": {
    "col": 2,
    "text": {"FTH": "{homeTeam}", "FTC": "{awayTeam}"},
    "sort": ["FTH", "FTC"]
  },
  "FCC": {
    "col": 2,
    "text": {"FCCH": "{homeTeam}", "FCCC": "{awayTeam}"},
    "sort": ["FCCH", "FCCC"]
  },
  'ARH': {
      'col': 2,
      'text': {
        'ARHH': '{homeTeam} {ratio}',
        'ARHC': '{awayTeam} {ratio}'
      },
      'sort': ['ARHH', 'ARHC']
    },
    'RAG': {
      'col': 2,
      'text': {
        'RAGC': 'Tài {ratio}',
        'RAGH': 'Xỉu {ratio}'
      },
      'sort': ['RAGC', 'RAGH']
    },
  "RG": {
    "col": 2,
    "text": {
      "RGHC": "{homeTeam} Tài {ratio}",
      "RGHH": "{awayTeam} Xỉu {ratio}",
      "RGCC": "{homeTeam} Tài {ratio}",
      "RGCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["RGHC", "RGHH", "RGCC", "RGCH"]
  },
  "RHG": {
    "col": 3,
    "text": {"HGH": "{homeTeam}", "HGN": "Điểm số bằng nhau", "HGC": "{awayTeam}"},
    "sort": ["HGH", "HGN", "HGC"]
  },
  "RWM": {
    "col": 2,
    "text": {
      "RWMHA": "{homeTeam} Thắng 1-6",
      "RWMHB": "{awayTeam} Thắng 7-12",
      "RWMHC": "{homeTeam} Thắng 13-18",
      "RWMHD": "{awayTeam} Thắng 19-24",
      "RWMHE": "{homeTeam} Thắng 25-30",
      "RWMHF": "{awayTeam} Thắng 21-36",
      "RWMHG": "{homeTeam} Thắng 37-42",
      "RWMHH": "{awayTeam} Thắng 43 trở lên",
      "RWMCA": "{homeTeam} Thắng 1-6",
      "RWMCB": "{awayTeam} Thắng 7-12",
      "RWMCC": "{homeTeam} Thắng 13-18",
      "RWMCD": "{awayTeam} Thắng 19-24",
      "RWMCE": "{homeTeam} Thắng 25-30",
      "RWMCF": "{awayTeam} Thắng 21-36",
      "RWMCG": "{homeTeam} Thắng 37-42",
      "RWMCH": "{awayTeam} Thắng 43 trở lên"
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
    "text": {"RWBOY": "Có", "RWBON": "Không"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEHOO": "Lẻ",
      "RTEHOE": "Chẵn",
      "RTECOO": "Lẻ",
      "RTECOE": "Chẵn"
    },
    "sort": ["RTEHOO", "RTEHOE", "RTECOO", "RTECOE"]
  },
  "RDC": {
    "col": 3,
    "text": {
      "RDCHH": "Chủ/Chủ",
      "RDCHC": "Chủ/Khách",
      "RDCHN": "Chủ/Hòa",
      "RDCCC": "Khách/Khách",
      "RDCCH": "Khách/Chủ",
      "RDCCN": "Khách/Hòa",
      "RDCNH": "Hòa/Chủ",
      "RDCNC": "Hòa/Khách",
      "RDCNN": "Hòa/Hòa"
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
    "text": {"RFSH": "{homeTeam}", "RFSC": "{awayTeam}"},
    "sort": ["RFSH", "RFSC"]
  },
  "RFM": {
    "col": 3,
    "text": {"RFMH": "{homeTeam}", "RFMD": "Hòa", "RFMA": "{awayTeam}"},
    "sort": ["RFMH", "RFMD", "RFMA"]
  }
};
