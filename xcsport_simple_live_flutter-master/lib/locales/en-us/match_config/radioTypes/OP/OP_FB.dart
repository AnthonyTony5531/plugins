//Floorball
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
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "M2": {
    "col": 3,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MN": "Draw", "MC": "{awayTeam}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "DOU_OT": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "T": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} Over {ratio}",
      "THH": "{homeTeam} Under {ratio}",
      "TCC": "{awayTeam} Over {ratio}",
      "TCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T1": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} Over {ratio}",
      "THH": "{homeTeam} Under {ratio}",
      "TCC": "{awayTeam} Over {ratio}",
      "TCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T2": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} Over {ratio}",
      "THH": "{homeTeam} Under {ratio}",
      "TCC": "{awayTeam} Over {ratio}",
      "TCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
  },
  "T_OT": {
    "col": 2,
    "col188": 1,
    "text": {
      "THC": "{homeTeam} Over {ratio}",
      "THH": "{homeTeam} Under {ratio}",
      "TCC": "{awayTeam} Over {ratio}",
      "TCH": "{awayTeam} Under {ratio}"
    },
    "sort": ["THC", "THH", "TCC", "TCH"]
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
  "DNB": {
    "col": 2,
    "col188": 1,
    "text": {"DNBY": "{homeTeam}", "DNBN": "{awayTeam}"},
    "sort": ["DNBY", "DNBN"]
  },
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "Home/Draw", "DCHC": "Home/Away", "DCCN": "Away/Draw"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  
  "TS": {
    "col": 2,
    "col188": 1,
    "text": {"TSN": "No"},
    "sort": ["TSN"]
  },
  'BG': {
    'col': 2,
    'text': {'BGY': 'Yes', 'BGN': 'No'},
    'sort': ['BGY', 'BGN']
  },
  "FS": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "No Goal", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS1": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "No Goal", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FS2": {
    "col": 2,
    "col188": 1,
    "text": {"FSH": "{homeTeam}", "FSN": "No Goal", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC", "FSN"]
  },
  "FL": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "No Goal", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL1": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "No Goal", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "FL2": {
    "col": 2,
    "col188": 1,
    "text": {"FLH": "{homeTeam}", "FLN": "No Goal", "FLC": "{awayTeam}"},
    "sort": ["FLH", "FLC", "FLN"]
  },
  "EG": {
    "col": 2,
    "col188": 1,
    "text": {
      "EGN": "No Goal",
      "EG1": "1 Goal",
      "EG2": "2 Goals",
      "EG3": "3 Goals",
      "EG4": "4 Goals",
      "EG5": "5 Goals",
      "EG6": "6 Goals",
      "EG7": "7 Goals",
      "EG8": "8 Goals",
      "EG9": "9 Goals",
      "EG10": "10 Goals",
      "EG11": "11 Goals",
      "EG12": "12 Goals",
      "EG13": "13 Goals",
      "EG14": "14 Goals",
      "EG15OV": "15+ Goals"
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
      "WMH1": "{homeTeam} Net winning by 1",
      "WMH2": "{homeTeam} Net winning by 2",
      "WMH3": "{homeTeam} Net winning by 3",
      "WMHOV": "{homeTeam} Net winning by 4+",
      "WMC1": "{awayTeam} Net winning by 1",
      "WMC2": "{awayTeam} Net winning by 2",
      "WMC3": "{awayTeam} Net winning by 3",
      "WMCOV": "{awayTeam} Net winning by 4+"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "FA": {
    "col": 3,
    "col188": 1,
    "text": {
      "FAHH": "Home/Home",
      "FAHC": "Home/Away",
      "FAHN": "Home/Draw",
      "FACC": "Away/Away",
      "FACH": "Away/Home",
      "FACN": "Away/Draw",
      "FANH": "Draw/Home",
      "FANC": "Draw/Away",
      "FANN": "Draw/Draw"
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
    "text": {
      "MG1": "1st Round",
      "MG2": "2nd Round",
      "MG3": "3rd Round",
      "MGN": "Draw"
    },
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
      "T1G1": " 0-1 minutes",
      "T1G2": " 1-2 minutes",
      "T1G3": " 2-3 minutes",
      "T1G4": " 3-4 minutes",
      "T1G5": " 4-5 minutes",
      "T1G6": " 5-6 minutes",
      "T1G7": " 6-7 minutes",
      "T1G8": " 7-8 minutes",
      "T1G9": " 8-9 minutes",
      "T1G10": " 9+ minutes"
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
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "WM_OT": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "{homeTeam} Net winning by 1",
      "WMH2": "{homeTeam} Net winning by 2",
      "WMH3": "{homeTeam} Net winning by 3",
      "WMHOV": "{homeTeam} Net winning by 4+",
      "WMC1": "{awayTeam} Net winning by 1",
      "WMC2": "{awayTeam} Net winning by 2",
      "WMC3": "{awayTeam} Net winning by 3",
      "WMCOV": "{awayTeam} Net winning by 4+"
    },
    "sort": ["WMH1", "WMH2", "WMH3", "WMHOV", "WMC1", "WMC2", "WMC3", "WMCOV"]
  },
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Yes", "WBON": "No"},
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
    "text": {"DCHN": "Home/Draw", "DCHC": "Home/Away", "DCCN": "Away/Draw"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "DC3": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "Home/Draw", "DCHC": "Home/Away", "DCCN": "Away/Draw"},
    "sort": ["DCHN", "DCHC", "DCCN"]
  },
  "TS1": {
    "col": 2,
    "text": {"TSY": "Yes", "TSN": "No"},
    "sort": ["TSY", "TSN"]
  },
  "TS2": {
    "col": 2,
    "text": {"TSY": "Yes", "TSN": "No"},
    "sort": ["TSY", "TSN"]
  }
};
