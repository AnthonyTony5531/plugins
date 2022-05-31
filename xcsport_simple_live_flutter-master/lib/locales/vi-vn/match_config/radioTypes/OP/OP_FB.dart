//Bóng sàn
const dynamic op_fbRadioTypes = {
 
  "DM_OT": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M1": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "M2": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "RA": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "DR_OT": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R_OT": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R1": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "R2": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUA": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "DOU_OT": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "T": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} Tài {ratio}",
      "THH": "{homeTeam} Xỉu {ratio}",
      "TCC": "{awayTeam} Tài {ratio}",
      "TCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T1": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} Tài {ratio}",
      "THH": "{homeTeam} Xỉu {ratio}",
      "TCC": "{awayTeam} Tài {ratio}",
      "TCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T2": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} Tài {ratio}",
      "THH": "{homeTeam} Xỉu {ratio}",
      "TCC": "{awayTeam} Tài {ratio}",
      "TCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T_OT": {
    "col": 2,
    "text": {
      "THC": "{homeTeam} Tài {ratio}",
      "THH": "{homeTeam} Xỉu {ratio}",
      "TCC": "{awayTeam} Tài {ratio}",
      "TCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "W3": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "Hòa {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "DNB": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC": {
    "col": 3,
    "text": {"DCHN": "Chủ/hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  
  "TS": {
    "col": 2,
    "text": {"TSN": "Không"},
    "sort": ["TSN"]
  },
  'BG': {
    'col': 2,
    'text': {'BGY': 'Có', 'BGN': 'Không'},
    'sort': ['BGY', 'BGN']
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "Không có bàn thắng", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS1": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "Không có bàn thắng", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS2": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSN": "Không có bàn thắng", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FL": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "Không có bàn thắng", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL1": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "Không có bàn thắng", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL2": {
    "col": 2,
    "text": {"FLH": "{homeTeam}", "FLN": "Không có bàn thắng", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "EG": {
    "col": 2,
    "text": {
      "EGN": "Không vào",
      "EG1": "1 bàn thắng",
      "EG2": "2 bàn thắng",
      "EG3": "3 bàn thắng",
      "EG4": "4 bàn thắng",
      "EG5": "5 bàn thắng",
      "EG6": "6 bàn thắng",
      "EG7": "7 bàn thắng",
      "EG8": "8 bàn thắng",
      "EG9": "9 bàn thắng",
      "EG10": "10 bàn thắng",
      "EG11": "11 bàn thắng",
      "EG12": "12 bàn thắng",
      "EG13": "13 bàn thắng",
      "EG14": "14 bàn thắng",
      "EG15OV": "15 bàn thắng hoặc nhiều hơn"
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
    "text": {
      "WMH1": "{homeTeam} Chênh lệch 1 điểm",
      "WMH2": "{homeTeam} Chênh lệch 2 điểm",
      "WMH3": "{homeTeam} Chênh lệch 3 điểm",
      "WMHOV": "{homeTeam} Chênh lệch 4+ điểm",
      "WMC1": "{awayTeam} Chênh lệch 1 điểm",
      "WMC2": "{awayTeam} Chênh lệch 2 điểm",
      "WMC3": "{awayTeam} Chênh lệch 3 điểm",
      "WMCOV": "{awayTeam} Chênh lệch 4+ điểm"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "FA": {
    "col": 3,
    "text": {
      "FAHH": "Chủ/Chủ",
      "FAHC": "Chủ/Khách",
      "FAHN": "Chủ/Hòa",
      "FACC": "Khách/Khách",
      "FACH": "Khách/Chủ",
      "FACN": "Khách/Hòa",
      "FANH": "Hòa/Chủ",
      "FANC": "Hòa/Khách",
      "FANN": "Hòa/Hòa"
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
    "text": {"MG1": "Vòng 1", "MG2": "Vòng 2", "MG3": "Vòng 3", "MGN": "Hòa"},
    "sort": ["MG1", "MG2", "MG3", "MGN"]
  },
  "WN": {
    "col": 2,
    "text": {"WNH": "{homeTeam}", "WNC": "{awayTeam}"},
    "sort": ["WNH", "WNC"]
  },
  "T1G": {
    "col": 2,
    "text": {
      "T1G1": "Phút 0-1",
      "T1G2": "Phút 1-2",
      "T1G3": "Phút 2-3",
      "T1G4": "Phút 3-4",
      "T1G5": "Phút 4-5",
      "T1G6": "Phút 5-6",
      "T1G7": "Phút 6-7",
      "T1G8": "Phút 7-8",
      "T1G9": "Phút 8-9",
      "T1G10": "Sau 9 phút"
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
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "WM_OT": {
    "col": 2,
    "text": {
      "WMH1": "{homeTeam} Thắng ròng 1 điểm ",
      "WMH2": "{homeTeam} Chênh lệch 2 điểm",
      "WMH3": "{homeTeam} Chênh lệch 3 điểm",
      "WMHOV": "{homeTeam} Chênh lệch 4+ điểm",
      "WMC1": "{awayTeam} Chênh lệch 1 điểm",
      "WMC2": "{awayTeam} Chênh lệch 2 điểm",
      "WMC3": "{awayTeam} Chênh lệch 3 điểm",
      "WMCOV": "{awayTeam} Chênh lệch 4+ điểm"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Có", "WBON": "Không"},
    "sort": ["WBOY", "WBON"]
  },
  "DNB1": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DNB2": {
    "col": 2,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC1": {
    "col": 3,
    "text": {"DCHN": "Chủ/Hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/Hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "text": {"DCHN": "Chủ/Hòa", "DCHC": "Chủ/Khách", "DCCN": "Khách/Hòa"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TS1": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "TS2": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  }
};
