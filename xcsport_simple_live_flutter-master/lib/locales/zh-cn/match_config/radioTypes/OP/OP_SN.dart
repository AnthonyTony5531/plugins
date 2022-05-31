//斯诺克
const dynamic op_snRadioTypes = {
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M1": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R1": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },

  "CS": {
    "col": 2,
    "col188": 1,
    "text": {
      "CS6C0": "6:0",
      "CS6C1": "6:1",
      "CS6C2": "6:2",
      "CS6C3": "6:3",
      "CS6C4": "6:4",
      "CS6C5": "6:5",
      "CS5C6": "5:6",
      "CS4C6": "4:6",
      "CS3C6": "3:6",
      "CS2C6": "2:6",
      "CS1C6": "1:6",
      "CS0C6": "0:6",
      "CS3C2": "3:2",
      "CS2C3": "2:3",
      "CS1C3": "1:3",
      "CS0C3": "0:3",
      "CS3C0": "3:0",
      "CS3C1": "3:1",
      "CS4C0": "4:0",
      "CS4C1": "4:1",
      "CS4C2": "4:2",
      "CS4C3": "4:3",
      "CS3C4": "3:4",
      "CS2C4": "2:4",
      "CS1C4": "1:4",
      "CS0C4": "0:4",
      "CS5C0": "5:0",
      "CS5C1": "5:1",
      "CS5C2": "5:2",
      "CS5C3": "5:3",
      "CS5C4": "5:4",
      "CS4C5": "4:5",
      "CS3C5": "3:5",
      "CS2C5": "2:5",
      "CS1C5": "1:5",
      "CS0C5": "0:5"
    },
    "sort": [
      "CS6C0",
      "CS6C1",
      "CS6C2",
      "CS6C3",
      "CS6C4",
      "CS6C5",
      "CS5C6",
      "CS4C6",
      "CS3C6",
      "CS2C6",
      "CS1C6",
      "CS0C6",
      "CS3C2",
      "CS2C3",
      "CS1C3",
      "CS0C3",
      "CS3C0",
      "CS3C1",
      "CS4C0",
      "CS4C1",
      "CS4C2",
      "CS4C3",
      "CS3C4",
      "CS2C4",
      "CS1C4",
      "CS0C4",
      "CS5C0",
      "CS5C1",
      "CS5C2",
      "CS5C3",
      "CS5C4",
      "CS4C5",
      "CS3C5",
      "CS2C5",
      "CS1C5",
      "CS0C5"
    ]
  },
  "FX_RF": {
    "col": 2,
    "col188": 1,
    "text": {"FX_RFH": "{homeTeam}", "FX_RFC": "{awayTeam}"},
    "sort": ["FX_RFH", "FX_RFC"]
  },
  "FX_FM": {
    "col": 3,
    "col188": 1,
    "text": {"FX_FMH": "{homeTeam}", "FX_FMN": "平", "FX_FMC": "{awayTeam}"},
    "sort": ["FX_FMH", "FX_FMN", "FX_FMC"]
  },
  "FM": {
    "col": 2,
    "col188": 1,
    "text": {"FMH": "{homeTeam}", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMC"]
  },
  "FR": {
    "col": 2,
    "col188": 1,
    "text": {"FRH": "{homeTeam} {ratio}", "FRC": "{awayTeam} {ratio}"},
    "sort": ["FRH", "FRC"]
  },
  "FOU": {
    "col": 2,
    "text": {"FOUC": "大 {ratio}", "FOUH": "小 {ratio}"},
    "sort": ["FOUC", "FOUH"]
  },
  "FEO": {
    "col": 2,
    "text": {"FEOO": "单", "FEOE": "双"},
    "sort": ["FEOO", "FEOE"]
  },
  "FX_RP": {
    "col": 2,
    "col188": 1,
    "text": {"FX_RPH": "{homeTeam}", "FX_RPC": "{awayTeam}"},
    "sort": ["FX_RPH", "FX_RPC"]
  },
  "DG_CS": {
    "col": 2,
    "col188": 1,
    "text": {"DG_CSH": "{homeTeam}", "DG_CSC": "{awayTeam}"},
    "sort": ["DG_CSH", "DG_CSC"]
  },
  "FHBT": {
    "col": 2,
    "col188": 1,
    "text": {
      "DOU_CS49": "0-49",
      "DOU_CS99": "50-99",
      "DOU_CS119": "100-119",
      "DOU_CS146": "120-146",
      "DOU_CS147": "147+"
    },
    "sort": ["DOU_CS49", "DOU_CS99", "DOU_CS119", "DOU_CS146", "DOU_CS147"]
  },
  "FB100": {
    "col": 2,
    "text": {"DG_BHY": "是", "DG_BHN": "否"},
    "sort": ["DG_BHY", "DG_BHN"]
  },
  "FB50": {
    "col": 2,
    "text": {"DG_BFY": "是", "DG_BFN": "否"},
    "sort": ["DG_BFY", "DG_BFN"]
  },
  "FX_FG": {
    "col": 2,
    "text": {"FX_FGY": "是", "FX_FGN": "否"},
    "sort": ["FX_FGY", "FX_FGN"]
  },
  "FX_B": {
    "col": 2,
    "col188": 1,
    "text": {"FX_BH": "{homeTeam}", "FX_BC": "{awayTeam}"},
    "sort": ["FX_BH", "FX_BC"]
  },
  "FL_B": {
    "col": 2,
    "col188": 1,
    "text": {"FL_BH": "{homeTeam}", "FL_BC": "{awayTeam}"},
    "sort": ["FL_BH", "FL_BC"]
  },
  "FX_C": {
    "col": 2,
    "col188": 1,
    "text": {
      "FX_C1672": "黄球",
      "FX_C1673": "绿球",
      "FX_C1674": "棕色球",
      "FX_C1675": "篮球",
      "FX_C1676": "粉球",
      "FX_C1677": "黑球"
    },
    "sort": [
      "FX_C1672",
      "FX_C1673",
      "FX_C1674",
      "FX_C1675",
      "FX_C1676",
      "FX_C1677"
    ]
  },
  "FL_P": {
    "col": 2,
    "col188": 1,
    "text": {
      "FL_PRE": "红色球",
      "FL_PYE": "黄球",
      "FL_PGR": "绿球",
      "FL_PBR": "棕色球",
      "FL_PBL": "篮球",
      "FL_PPI": "粉球",
      "FL_PBK": "黑球",
      "FL_PFO": "犯规"
    },
    "sort": [
      "FL_PRE",
      "FL_PYE",
      "FL_PGR",
      "FL_PBR",
      "FL_PBL",
      "FL_PPI",
      "FL_PBK",
      "FL_PFO"
    ]
  },
  "M15": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R15": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "M16": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R16": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "M17": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R17": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "M18": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R18": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "M19": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R19": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "HBM": {
    "col": 2,
    "col188": 1,
    "text": {"HBMH": "{homeTeam}", "HBMC": "{awayTeam}"},
    "sort": ["HBMH", "HBMC"]
  },
  "CSD": {
    "col": 2,
    "col188": 1,
    "text": {
      "CSDH10C0": "{homeTeam}10-0",
      "CSDH10C1": "{homeTeam}10-1",
      "CSDH10C2": "{homeTeam}10-2",
      "CSDH10C3": "{homeTeam}10-3",
      "CSDH10C4": "{homeTeam}10-4",
      "CSDH10C5": "{homeTeam}10-5",
      "CSDH10C6": "{homeTeam}10-6",
      "CSDH10C7": "{homeTeam}10-7",
      "CSDH10C8": "{homeTeam}10-8",
      "CSDH10C9": "{homeTeam}10-9",
      "CSDC10H0": "{awayTeam}10-0",
      "CSDC10H1": "{awayTeam}10-1",
      "CSDC10H2": "{awayTeam}10-2",
      "CSDC10H3": "{awayTeam}10-3",
      "CSDC10H4": "{awayTeam}10-4",
      "CSDC10H5": "{awayTeam}10-5",
      "CSDC10H6": "{awayTeam}10-6",
      "CSDC10H7": "{awayTeam}10-7",
      "CSDC10H8": "{awayTeam}10-8",
      "CSDC10H9": "{awayTeam}10-9"
    },
    "sort": [
      "CSDH10C0",
      "CSDH10C1",
      "CSDH10C2",
      "CSDH10C3",
      "CSDH10C4",
      "CSDH10C5",
      "CSDH10C6",
      "CSDH10C7",
      "CSDH10C8",
      "CSDH10C9",
      "CSDC10H0",
      "CSDC10H1",
      "CSDC10H2",
      "CSDC10H3",
      "CSDC10H4",
      "CSDC10H5",
      "CSDC10H6",
      "CSDC10H7",
      "CSDC10H8",
      "CSDC10H9"
    ]
  },
  "MSB": {
    "col": 2,
    "col188": 1,
    "text": {
      "MSB1": "单杆破百在第一局",
      "MSB2": "{homeTeam}获得4杆以上单杆破百",
      "MSB3": "{awayTeam}获得4杆以上单杆破百",
      "MSB4": "比赛出现单杆147分"
    },
    "sort": ["MSB1", "MSB2", "MSB3", "MSB4"]
  },
  "MC": {
    "col": 2,
    "col188": 1,
    "text": {
      "MCH0": "{homeTeam} 0次单杆破百",
      "MCH1": "{homeTeam} 1次单杆破百",
      "MCH2": "{homeTeam} 2次单杆破百",
      "MCH3": "{homeTeam} 3次单杆破百",
      "MDH4+": "{homeTeam} 4次或更多单杆破百",
      "MCC0": "{awayTeam} 0次单杆破百",
      "MCC1": "{awayTeam} 1次单杆破百",
      "MCC2": "{awayTeam} 2次单杆破百",
      "MCC3": "{awayTeam} 3次单杆破百",
      " MCC4+": "{awayTeam} 4次或更多单杆破百"
    },
    "sort": ["HBMH", "HBMC"]
  },
  'MCOU': {
    'col': 2,
    'text': {'MCOUC': '大 {ratio}', 'MCOUH': '小 {ratio}'},
    'sort': ['MCOUC', 'MCOUH']
  },
  "DF": {
    "col": 2,
    "text": {"DFY": "是", "DFN": "否"},
    "sort": ["DFY", "DFN"]
  },
  "MA": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RA": {
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
  'FAB50': {
    'col': 2,
    'text': {'FAB50Y': '是', 'FAB50N': '否'},
    'sort': ['FAB50Y', 'FAB50N']
  },
  'FAB100': {
    'col': 2,
    'text': {'FAB100Y': '是', 'FAB100N': '否'},
    'sort': ['FAB100Y', 'FAB100N']
  },
  "EOA": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "RTA": {
    "col": 2,
    "col188": 1,
    "text": {"RTAH": "{homeTeam}", "RTAC": "{awayTeam}"},
    "sort": ["RTAH", "RTAC"]
  },
  'NC': {
    'col': 2,
    "col188": 1,
    'text': {
      'NCA': '0次单杆破百',
      'NCB': '1次单杆破百',
      'NCC': '2次单杆破百',
      'NCD': '3次单杆破百',
      'NCE': '4次单杆破百',
      'NCF': '5次单杆破百',
      'NCG': '6次单杆破百',
      'NCH': '7次单杆破百',
      'NCI': '8次单杆破百',
      'NCJ': '9次单杆破百',
      'NCK': '4次以上单杆破百',
      'NCL': '5次以上单杆破百',
      'NCM': '6次以上单杆破百',
      'NCN': '7次以上单杆破百',
      'NCO': '8次以上单杆破百',
      'NCP': '9次以上单杆破百'
    },
    'sort': [
      'NCA',
      'NCB',
      'NCC',
      'NCD',
      'NCE',
      'NCF',
      'NCG',
      'NCH',
      'NCI',
      'NCJ',
      'NCK',
      'NCL',
      'NCM',
      'NCN',
      'NCO',
      'NCP'
    ]
  },
  "BO7": {
    "col": 2,
    "col188": 1,
    "text": {
      "PD7A": "{homeTeam} 4-0",
      "PD7B": "{homeTeam} 4-1",
      "PD7C": "{homeTeam} 4-2",
      "PD7D": "{homeTeam} 4-3",
      "PD7E": "{awayTeam} 0-4",
      "PD7F": "{awayTeam} 1-4",
      "PD7G": "{awayTeam} 2-4",
      "PD7H": "{awayTeam} 3-4"
    },
    "sort": ["PD7A", "PD7B", "PD7C", "PD7D", "PD7E", "PD7F", "PD7G", "PD7H"]
  },
  "SB": {
    "col": 2,
    "col188": 1,
    "text": {
      "SBHA": "{homeTeam} 以2-0获胜",
      "SBHB": "{homeTeam} 以2-1获胜",
      "SBCA": "{awayTeam} 以2-0获胜",
      "SBCB": "{awayTeam} 以2-1获胜"
    },
    "sort": ["SBHA", "SBHB", "SBCA", "SBCB"]
  },
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RM1": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE1": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU1": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM2": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE2": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU2": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM3": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE3": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU3": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM4": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE4": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU4": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM5": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE5": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU5": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM6": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE6": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU6": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM7": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE7": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU7": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM8": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE8": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU8": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM9": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE9": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU9": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM10": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE10": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU10": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM11": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE11": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU11": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM12": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE12": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU12": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM13": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE13": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU13": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM14": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE14": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU14": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM15": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE15": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU15": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM16": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE16": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU16": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM17": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE17": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU17": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM18": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE18": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU18": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM19": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE19": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU19": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM20": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE20": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU20": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM21": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE21": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU21": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM22": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE22": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU22": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM23": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE23": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU23": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM24": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE24": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU24": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RM25": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE25": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU25": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO8": {
    "col": 2,
    "text": {"REOO": "单", "REOE": "双"},
    "sort": ["REOO", "REOE"]
  }
};
