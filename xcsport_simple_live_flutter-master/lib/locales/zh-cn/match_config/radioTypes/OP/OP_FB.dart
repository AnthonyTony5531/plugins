//地板球
const dynamic op_fbRadioTypes = {
  "DM_OT": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M1": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "M2": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "平", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "RA": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FR": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "DR_OT": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R_OT": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R1": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R2": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUA": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "DOU_OT": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "T": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} 大 {ratio}",
      "THH": "{homeTeam} 小 {ratio}",
      "TCC": "{awayTeam} 大 {ratio}",
      "TCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T1": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} 大 {ratio}",
      "THH": "{homeTeam} 小 {ratio}",
      "TCC": "{awayTeam} 大 {ratio}",
      "TCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T2": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} 大 {ratio}",
      "THH": "{homeTeam} 小 {ratio}",
      "TCC": "{awayTeam} 大 {ratio}",
      "TCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T_OT": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} 大 {ratio}",
      "THH": "{homeTeam} 小 {ratio}",
      "TCC": "{awayTeam} 大 {ratio}",
      "TCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "W3": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "平局 {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "DNB": {
    "col": 2,
    "col188": 1,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "主/和", "DCHC": "主/客", "DCCN": "客/和"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TS": {
    "col": 2,
    "col188": 1,
    "text": {"TSN": "否"},
    "sort": ["TSN"]
  },
  'BG': {
    'col': 2,
    'text': {'BGY': '是', 'BGN': '否'},
    'sort': ['BGY', 'BGN']
  },
  "FS": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "没有进球", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS1": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "没有进球", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS2": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "没有进球", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FL": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "没有进球", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL1": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "没有进球", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL2": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "没有进球", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "EG": {
    "col": 2,
    "col188": 1,
    "text": {
      "EGN": "没有进球",
      "EG1": "1个进球",
      "EG2": "2个进球",
      "EG3": "3个进球",
      "EG4": "4个进球",
      "EG5": "5个进球",
      "EG6": "6个进球",
      "EG7": "7个进球",
      "EG8": "8个进球",
      "EG9": "9个进球",
      "EG10": "10个进球",
      "EG11": "11个进球",
      "EG12": "12个进球",
      "EG13": "13个进球",
      "EG14": "14个进球",
      "EG15OV": "15个进球或更多"
    },
    "sort": [
      "EGN",
      "EG1",
      "EG2",
      "EG3",
      "EG4",
      "EG5",
      "EG6",
      "EG7",
      "EG8",
      "EG9",
      "EG10",
      "EG11",
      "EG12",
      "EG13",
      "EG14",
      "EG15OV"
    ]
  },
  "TEG": {
    "col": 2,
    "col188": 1,
    "text": {
      "TEGH0": "{homeTeam} 0",
      "TEGH1": "{homeTeam} 1",
      "TEGH2": "{homeTeam} 2",
      "TEGH3": "{homeTeam} 3",
      "TEGH4": "{homeTeam} 4",
      "TEGH5": "{homeTeam} 5",
      "TEGH6": "{homeTeam} 6",
      "TEGH7": "{homeTeam} 7",
      "TEGH8": "{homeTeam} 8",
      "TEGH9": "{homeTeam} 9",
      "TEGHOV": "{homeTeam} 10+",
      "TEGC0": "{awayTeam} 0",
      "TEGC1": "{awayTeam} 1",
      "TEGC2": "{awayTeam} 2",
      "TEGC3": "{awayTeam} 3",
      "TEGC4": "{awayTeam} 4",
      "TEGC5": "{awayTeam} 5",
      "TEGC6": "{awayTeam} 6",
      "TEGC7": "{awayTeam} 7",
      "TEGC8": "{awayTeam} 8",
      "TEGC9": "{awayTeam} 9",
      "TEGCOV": "{awayTeam} 10+"
    },
    "sort": [
      "TEGH0",
      "TEGH1",
      "TEGH2",
      "TEGH3",
      "TEGH4",
      "TEGH5",
      "TEGH6",
      "TEGH7",
      "TEGH8",
      "TEGH9",
      "TEGHOV",
      "TEGC0",
      "TEGC1",
      "TEGC2",
      "TEGC3",
      "TEGC4",
      "TEGC5",
      "TEGC6",
      "TEGC7",
      "TEGC8",
      "TEGC9",
      "TEGCOV"
    ]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "{homeTeam} 净胜1分",
      "WMH2": "{homeTeam} 净胜2分",
      "WMH3": "{homeTeam} 净胜3分",
      "WMHOV": "{homeTeam} 净胜4+分",
      "WMC1": "{awayTeam} 净胜1分",
      "WMC2": "{awayTeam} 净胜2分",
      "WMC3": "{awayTeam} 净胜3分",
      "WMCOV": "{awayTeam} 净胜4+分"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "FA": {
    "col": 3,
    "col188": 1,
    "text": {
      "FAHH": "主/主",
      "FAHC": "主/客",
      "FAHN": "主/和",
      "FACC": "客/客",
      "FACH": "客/主",
      "FACN": "客/和",
      "FANH": "和/主",
      "FANC": "和/客",
      "FANN": "和/和"
    },
    "sort": [
      "FAHH",
      "FAHC",
      "FAHN",
      "FACC",
      "FACH",
      "FACN",
      "FANH",
      "FANC",
      "FANN"
    ]
  },
  "MG": {
    "col": 2,
    "col188": 1,
    "text": {"MG1": "第一局", "MG2": "第二局", "MG3": "第三局", "MGN": "和局"},
    "sort": ["MG1", "MG2", "MG3", "MGN"]
  },
  "WN": {
    "col": 2,
    "col188": 1,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "T1G": {
    "col": 2,
    "col188": 1,
    "text": {
      "T1G1": "第0-1分钟",
      "T1G2": "第1-2分钟",
      "T1G3": "第2-3分钟",
      "T1G4": "第3-4分钟",
      "T1G5": "第4-5分钟",
      "T1G6": "第5-6分钟",
      "T1G7": "第6-7分钟",
      "T1G8": "第7-8分钟",
      "T1G9": "第8-9分钟",
      "T1G10": "第9分钟之后"
    },
    "sort": [
      "T1G1",
      "T1G2",
      "T1G3",
      "T1G4",
      "T1G5",
      "T1G6",
      "T1G7",
      "T1G8",
      "T1G9",
      "T1G10"
    ]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "WM_OT": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "{homeTeam} 净胜1分",
      "WMH2": "{homeTeam} 净胜2分",
      "WMH3": "{homeTeam} 净胜3分",
      "WMHOV": "{homeTeam} 净胜4+分",
      "WMC1": "{awayTeam} 净胜1分",
      "WMC2": "{awayTeam} 净胜2分",
      "WMC3": "{awayTeam} 净胜3分",
      "WMCOV": "{awayTeam} 净胜4+分"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "是", "WBON": "否"},
    "sort": ["WBOY", "WBON"]
  },
  "DNB1": {
    "col": 2,
    "col188": 1,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DNB2": {
    "col": 2,
    "col188": 1,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC1": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "主/和", "DCHC": "主/客", "DCCN": "客/和"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "主/和", "DCHC": "主/客", "DCCN": "客/和"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TS1": {
    "col": 2,
    "text": {"TSY": "是", "TSN": "否"},
    "sort": ["TSY", "TSN"]
  },
  "TS2": {
    "col": 2,
    "text": {"TSY": "是", "TSN": "否"},
    "sort": ["TSY", "TSN"]
  }
};
