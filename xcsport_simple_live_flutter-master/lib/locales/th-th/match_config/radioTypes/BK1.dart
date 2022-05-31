//บาสเก็ตบอล
const dynamic bkRadioTypes = {
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
    "text": {"FMH": "{homeTeam}", "FMN": "เสมอ", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "W3": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3D": "เสมอ {ratio}",
      "W3A": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3D", "W3A"]
  },
  "HS": {
    "col": 3,
    "text": {"HS1": "ครึ่งแรก", "HS2": "ครึ่งหลัง", "HSE": "ได้คะแนนเท่ากัน"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  
  "WBO": {
    "col": 2,
    "text": {"WBOY": "ใช่", "WBON": "ไม่"},
    "sort": ["WBOY", "WBON"]
  },
  "ROUH": {
    "col": 2,
    "text": {"ROUHO": "สูง {ratio}", "ROUHU": "ต่ำ {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC": {
    "col": 2,
    "text": {"ROUCO": "สูง {ratio}", "ROUCU": "ต่ำ {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUH": "สูง {ratio}", "OUC": "ต่ำ {ratio}"},
    "sort": ["OUH", "OUC"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUH": "สูง {ratio}", "OUC": "ต่ำ{ratio}"},
    "sort": ["OUH", "OUC"]
  },
  "HOUH": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOUC": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ{ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RP": {
    "col": 2,
    "text": {"RPH": "{homeTeam}", "RPA": "{awayTeam}"},
    "sort": ["RPH", "RPA"]
  },
  "HSQ": {
    "col": 2,
    "text": {
      "HSQ1": "เซ็ตแรก",
      "HSQ2": "เซ็ตที่สอง",
      "HSQ3": "เซ็ตที่สาม",
      "HSQ4": "เซ็ตที่สี่",
      "HSQE": "ได้คะแนนเท่ากัน"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH12":"{homeTeam} ชนะ1-2",
      "WMH36":"{homeTeam} ชนะ3-6",
      "WMH79":"{homeTeam} ชนะ7-9",
      "WMH1013":"{homeTeam} ชนะ10-13",
      "WMH1416":"{homeTeam} ชนะ14-16",
      "WMH1720":"{homeTeam} ชนะ17-20",
      "WMH21OV":"{homeTeam} ชนะ21+",
      "WMC12":"{awayTeam} ชนะ1-2",
      "WMC36":"{awayTeam} ชนะ3-6",
      "WMC79":"{awayTeam} ชนะ7-9",
      "WMC1013":"{awayTeam} ชนะ10-13",
      "WMC1416":"{awayTeam} ชนะ14-16",
      "WMC1720":"{awayTeam} ชนะ17-20",
      "WMC21OV":"{awayTeam} ชนะ21+",

      "WMH15":"{homeTeam} ชนะ1-5",
      "WMH610":"{homeTeam} ชนะ6-10",
      "WMH1120":"{homeTeam} ชนะ11-20",
      "WMH2125":"{homeTeam} ชนะ21-25",
      "WMH26OV":"{homeTeam} ชนะ26+",
      "WMC15":"{awayTeam} ชนะ1-5",
      "WMC610":"{awayTeam} ชนะ6-10",
      "WMC1120":"{awayTeam} ชนะ11-20",
      "WMC2125":"{awayTeam} ชนะ21-25",
      "WMC26OV":"{awayTeam} ชนะ26+",

      "WMH3":"{homeTeam} จะชนะ3+",
      "WMC3":"{awayTeam} จะชนะ3+",
      "WMO":"other",
    },
    "sort": [
      "WMH3",
      "WMC3",
      "WMH12",
      "WMC12",
      "WMH36",
      "WMC36",
      "WMH79",
      "WMC79",
      "WMH1013",
      "WMC1013",
      "WMH1416",
      "WMC1416",
      "WMH1720",
      "WMC1720",
      "WMH21OV",
      "WMC21OV",

      "WMH15",
      "WMC15",
      "WMH610",
      "WMC610",
      "WMH1120",
      "WMC1120",
      "WMH2125",
      "WMC2125",
      "WMH26OV",
      "WMC26OV",

      "WMO",
    ]
  },
  "OEU": {
    "col": 3,
    "text": {"OEUU": "ต่ำกว่า{total}คะแนน", "OEUE": "เท่ากับ{total}คะแนน", "OEUO": "สูงกว่า{total}คะแนน"},
    "sort": ["OEUU", "OEUE", "OEUO"]
  },
  "PR": {
    "col": 2,
    "text": {
      "PR0": "0-100",
      "PR101": "101-110",
      "PR111": "111-120",
      "PR121": "121-130",
      "PR131": "131-140",
      "PR141": "141-150",
      "PR151": "151-160",
      "PR161": "161-170",
      "PR171": "171-180",
      "PR180": "180.5+",
      "PR150": "0-150",
      "PR181": "181-190",
      "PR191": "191-200",
      "PR201": "201-210",
      "PR211": "211-220",
      "PR221": "221-230",
      "PR231": "231-240",
      "PR241": "241-250",
      "PR250": "250.5+"
    },
    "sort": [
      "PR0",
      "PR101",
      "PR111",
      "PR121",
      "PR131",
      "PR141",
      "PR151",
      "PR161",
      "PR171",
      "PR180",
      "PR150",
      "PR151",
      "PR161",
      "PR171",
      "PR181",
      "PR191",
      "PR201",
      "PR211",
      "PR221",
      "PR231",
      "PR241",
      "PR250"
    ]
  },
  "QWM": {
    "col": 3,
    'text': {
      'QWMH': '{homeTeam}ชนะ3คะแนนขึ้นไป',
      'QWMC': '{awayTeam}ชนะ3คะแนนขึ้นไป',
      'QWMO': 'อื่นๆ'
    },
    "sort": ["QWMH", "QWMC", "QWMO"]
  },
  "QOUH": {
    "col": 2,
    "text": {"QOUHO": "สูง {ratio}", "QOUHU": "ต่ำ {ratio}"},
    "sort": ["QOUHO", "QOUHU"]
  },
  "QOUC": {
    "col": 2,
    "text": {"QOUCO": "สูง {ratio}", "QOUCU": "ต่ำ{ratio}"},
    "sort": ["QOUCO", "QOUCU"]
  },
  "QLP": {
    "col": 2,
    "text": {"QLPH": "{homeTeam}", "QLPA": "{awayTeam}"},
    "sort": ["QLPH", "QLPA"]
  },
  "QRP": {
    "col": 3,
    "text": {"QRPH": "{homeTeam}", "QRPN": "ไม่", "QRPC": "{awayTeam}"},
    "sort": ["QRPH", "QRPN", "QRPC"]
  },
  "FP": {
    "col": 2,
    "text": {"FPH": "{homeTeam}", "FPC": "{awayTeam}"},
    "sort": ["FPH", "FPC"]
  },
  "LP": {
    "col": 2,
    "text": {"LPH": "{homeTeam}", "LPC": "{awayTeam}"},
    "sort": ["LPH", "LPC"]
  },
  "OUHLP": {
    "col": 2,
    "text": {
      "OUHLP0": "0หรือ5",
      "OUHLP1": "1หรือ6",
      "OUHLP2": "2หรือ7",
      "OUHLP3": "3หรือ8",
      "OUHLP4": "4หรือ9"
    },
    "sort": ["OUHLP0", "OUHLP1", "OUHLP2", "OUHLP3", "OUHLP4"]
  },
  "OUCLP": {
    "col": 2,
    "text": {
      "OUCLP0": "0หรือ5",
      "OUCLP1": "1หรือ6",
      "OUCLP2": "2หรือ7",
      "OUCLP3": "3หรือ8",
      "OUCLP4": "4หรือ9"
    },
    "sort": ["OUCLP0", "OUCLP1", "OUCLP2", "OUCLP3", "OUCLP4"]
  },

  "PDH": {
    "col": 2,
    "text": {
      "PDH0": "0หรือ5",
      "PDH1": "1หรือ6",
      "PDH2": "2หรือ7",
      "PDH3": "3หรือ8",
      "PDH4": "4หรือ9"
    },
    "sort": ["PDH0", "PDH1", "PDH2", "PDH3", "PDH4"]
  },
  "RPDH": {
    "col": 2,
    "text": {
      "RPDH0": "0หรือ5",
      "RPDH1": "1หรือ6",
      "RPDH2": "2หรือ7",
      "RPDH3": "3หรือ8",
      "RPDH4": "4หรือ9"
    },
    "sort": ["RPDH0", "RPDH1", "RPDH2", "RPDH3", "RPDH4"]
  },
  "PDC": {
    "col": 2,
    "text": {
      "PDC0": "0หรือ5",
      "PDC1": "1หรือ6",
      "PDC2": "2หรือ7",
      "PDC3": "3หรือ8",
      "PDC4": "4หรือ9"
    },
    "sort": ["PDC0", "PDC1", "PDC2", "PDC3", "PDC4"]
  },
  "RPDC": {
    "col": 2,
    "text": {
      "RPDC0": "0หรือ5",
      "RPDC1": "1หรือ6",
      "RPDC2": "2หรือ7",
      "RPDC3": "3หรือ8",
      "RPDC4": "4หรือ9"
    },
    "sort": ["RPDC0", "RPDC1", "RPDC2", "RPDC3", "RPDC4"]
  },

  "HA": {
    "col": 2,
    "text": {"HAH": "{homeTeam}", "HAC": "{awayTeam}"},
    "sort": ["HAH", "HAC"]
  },
  "FP20": {
    "col": 2,
    "text": {"FP20H": "{homeTeam}", "FP20C": "{awayTeam}"},
    "sort": ["FP20H", "FP20C"]
  },
  "M3P": {
    "col": 2,
    "text": {"M3PH": "{homeTeam}", "M3PC": "{awayTeam}"},
    "sort": ["M3PH", "M3PC"]
  },
  "MAP": {
    "col": 2,
    "text": {"MAPH": "{homeTeam}", "MAPC": "{awayTeam}"},
    "sort": ["MAPH", "MAPC"]
  },
  "MGP": {
    "col": 2,
    "text": {"MGPH": "{homeTeam}", "MGPC": "{awayTeam}"},
    "sort": ["MGPH", "MGPC"]
  },
  "MLP": {
    "col": 2,
    "text": {"MLPH": "{homeTeam}", "MLPC": "{awayTeam}"},
    "sort": ["MLPH", "MLPC"]
  },
  "MJP": {
    "col": 2,
    "text": {"MJPH": "{homeTeam}", "MJPC": "{awayTeam}"},
    "sort": ["MJPH", "MJPC"]
  },
  "F": {
    "col": 3,
    'text': {
      'FHH': '{homeTeam}/{homeTeam}',
      'FHC': '{homeTeam}/{awayTeam}',
      'FNH': 'และรอบ/{homeTeam}',
      'FNC': 'และรอบ/{awayTeam}',
      'FCH': '{awayTeam}/{homeTeam}',
      'FCC': '{awayTeam}/{awayTeam}'
    },
    "sort": ["FHH", "FHC", "FNH", "FNC", "FCH", "FCC"]
  },
  "RF": {
    "col": 3,
    'text': {
      'RFHH': '{homeTeam}/{homeTeam}',
      'RFHC': '{homeTeam}/{awayTeam}',
      'RFNH': 'และรอบ/{homeTeam}',
      'RFNC': 'และรอบ/{awayTeam}',
      'RFCH': '{awayTeam}/{homeTeam}',
      'RFCC': '{awayTeam}/{awayTeam}'
    },
    "sort": ["RFHH", "RFHC", "RFNH", "RFNC", "RFCH", "RFCC"]
  },
  "DTP": {
    "col": 2,
    "text": {"DTP1": "DTP1", "DTP2": "DTP2"},
    "sort": ["DTP1", "DTP2"]
  },
  "LG": {
    "col": 3,
    "text": {
      "2P": "2ลูกต่อคะแนน", "3P": "3ลูกต่อคะแนน", "PS": "ฟาวล์",
      "LGA": "2ลูกต่อคะแนน", "LGB": "3ลูกต่อคะแนน", "LGC": "ฟาวล์",
    },
    "sort": [
      "2P", "3P", "PS",
      "LGA", "LGB", "LGC"
    ]
  },
  "FG": {
    "col": 3,
    "text": {
      "2P": "2ลูกต่อคะแนน", "3P": "3ลูกต่อคะแนน", "PS": "ฟาวล์",
      "FGA": "2ลูกต่อคะแนน", "FGB": "3ลูกต่อคะแนน", "FGC": "ฟาวล์",
    },
    "sort": [
      "2P", "3P", "PS",
      "FGA", "FGB", "FGC"
    ]
  },
  "OUHT": {
    "col": 2,
    "text": {"OUHTO": "สูง {ratio}", "OUHTU": "ต่ำ {ratio}"},
    "sort": ["OUHTO", "OUHTU"]
  },
  "OUCT": {
    "col": 2,
    "text": {"OUCTO": "สูง {ratio}", "OUCTU": "ต่ำ {ratio}"},
    "sort": ["OUCTO", "OUCTU"]
  },
  "OUHOT": {
    "col": 2,
    "text": {"OUHOTO": "สูง {ratio}", "OUHOTU": "เล็ก{ratio}"},
    "sort": ["OUHOTO", "OUHOTU"]
  },
  "OUCOT": {
    "col": 2,
    "text": {"OUCOTO": "ใหญ่ {ratio}", "OUCOTU": "ต่ำ {ratio}"},
    "sort": ["OUCOTO", "OUCOTU"]
  },
  "OUHST": {
    "col": 2,
    "text": {"OUHSTO": "สูง{ratio}", "OUHSTU": "ต่ำ {ratio}"},
    "sort": ["OUHSTO", "OUHSTU"]
  },
  "OUCST": {
    "col": 2,
    "text": {"OUCSTO": "สูง {ratio}", "OUCSTU": "ต่ำ {ratio}"},
    "sort": ["OUCSTO", "OUCSTU"]
  },
  "PQ": {"col": 2, "text": {}, "sort": []},
  "APP": {"col": 2, "text": {}, "sort": []},
  "FFG": {"col": 2, "text": {}, "sort": []},
  "HAOU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  
  "TOU": {
    "col": 2,
    "text": {
      "HTOUC": "{homeTeam} สูง {ratio}",
      "HTOUH": "{homeTeam} ต่ำ {ratio}",
      "CTOUC": "{awayTeam} สูง {ratio}",
      "CTOUH": "{awayTeam} ต่ำ{ratio}"
    },
    "sort": ["HTOUC", "HTOUH", "CTOUC", "CTOUH"]
  },
  "WMB": {
    "col": 2,
    "text": {
      'WM15': 'ชนะทั้งสองทีม1-5',
      'WM610': 'ชนะทั้งสองทีม6-10',
      'WM1115': 'ชนะทั้งสองทีม11-15',
      'WM1620': 'ชนะทั้งสองทีม16-20',
      'WM2125': 'ชนะทั้งสองทีม21-25',
      'WM2630': 'ชนะทั้งสองทีม26-30',
      'WM31OV': 'ชนะทั้งสองทีม31+',
    },
    "sort": ["WM15", "WM610", "WM1115", "WM1620", "WM2125", "WM2630", "WM31OV"]
  },
  "WMA": {
    "col": 3,
    "text": {
      "WMH6OV": "{homeTeam}ชนะ6+",
      "WMC6OV": "{awayTeam}ชนะ6+",
      "WM5": "ชนะทั้งสองทีม5-",
    },
    "sort": ['WMH6OV', 'WMC6OV', 'WM5',]
  },
  "WMC": {
    "col": 2,
    "text": {
      'WMH15': '{homeTeam}ชนะ1-5',
      'WMH610': '{homeTeam}ชนะ6-10',
      'WMH1115': '{homeTeam}ชนะ11-15',
      'WMH1620': '{homeTeam}ชนะ16-20',
      'WMH2125': '{homeTeam}ชนะ21-25',
      'WMH26OV': '{homeTeam}ชนะ26+',
      'WMC15': '{awayTeam}ชนะ1-5',
      'WMC610': '{awayTeam}ชนะ6-10',
      'WMC1115': '{awayTeam}ชนะ11-15',
      'WMC1620': '{awayTeam}ชนะ16-20',
      'WMC2125': '{awayTeam}ชนะ21-25',
      'WMC26OV': '{awayTeam}ชนะ26+',
    },
    "sort": [
      'WMH15',   'WMC15',
      'WMH610',  'WMC610',
      'WMH1115', 'WMC1115',
      'WMH1620', 'WMC1620',
      'WMH2125', 'WMC2125',
      'WMH26OV', 'WMC26OV',
    ]
  },
  "RTA": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RTB": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RTC": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "HAR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RWMB": {
    "col": 2,
    "text": {
      'RWM15': 'ชนะทั้งสองทีม1-5',
      'RWM610': 'ชนะทั้งสองทีม6-10',
      'RWM1115': 'ชนะทั้งสองทีม11-15',
      'RWM1620': 'ชนะทั้งสองทีม16-20',
      'RWM2125': 'ชนะทั้งสองทีม21-25',
      'RWM2630': 'ชนะทั้งสองทีม26-30',
      'RWM31OV': 'ชนะทั้งสองทีม31+',
    },
    "sort": [
      'RWM15',
      'RWM610',
      'RWM1115',
      'RWM1620',
      'RWM2125',
      'RWM2630',
      'RWM31OV'
    ]
  },
  "RWMA": {
    "col": 3,
    "text": {
      "RWMH6OV": "{homeTeam}ชนะ6+",
      "RWMC6OV": "{awayTeam}ชนะ6+",
      "RWM5": "ชนะทั้งสองทีม5-",
    },
    "sort": ['RWMH6OV', 'RWMC6OV', 'RWM5']
  },
  "RWMC": {
    "col": 2,
    "text": {
      'RWMH15': '{homeTeam} ชนะ1-5',
      'RWMH610': '{homeTeam} ชนะ6-10',
      'RWMH1115': '{homeTeam} ชนะ11-15',
      'RWMH1620': '{homeTeam} ชนะ16-20',
      'RWMH2125': '{homeTeam} ชนะ21-25',
      'RWMH26OV': '{homeTeam} ชนะ26+',
      'RWMC15': '{awayTeam} ชนะ1-5',
      'RWMC610': '{awayTeam} ชนะ6-10',
      'RWMC1115': '{awayTeam} ชนะ11-15',
      'RWMC1620': '{awayTeam} ชนะ16-20',
      'RWMC2125': '{awayTeam} ชนะ21-25',
      'RWMC26OV': '{awayTeam} ชนะ26+',
    },
    "sort": [
      'RWMH15',   'RWMC15',
      'RWMH610',  'RWMC610',
      'RWMH1115', 'RWMC1115',
      'RWMH1620', 'RWMC1620',
      'RWMH2125', 'RWMC2125',
      'RWMH26OV', 'RWMC26OV'
    ]
  },
  "HTOU": {
    "col": 2,
    "text": {
      "HTOUHO": "{homeTeam} สูง {ratio}",
      "HTOUHU": "{homeTeam} ต่ำ {ratio}",
      "HTOUCO": "{awayTeam} สูง {ratio}",
      "HTOUCU": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["HTOUHO", "HTOUHU", " HTOUCO", " HTOUCU"]
  },
  'RAH': {
    'col': 2,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'สูง {ratio}', 'RAGH': 'ต่ำ{ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  "RTOU": {
    "col": 2,
    "text": {
      "RTOUHO": "{homeTeam} สูง {ratio}",
      "RTOUHU": "{homeTeam} ต่ำ {ratio}",
      "RTOUCO": "{awayTeam} สูง{ratio}",
      "RTOUCU": "{awayTeam} ต่ำ {ratio}",
    },
    "sort": ["RTOUHO", "RTOUHU", "RTOUCO", "RTOUCU"]
  },
  'PD': {
    'col': 2,
    'text': {
      'PDH0': '{homeTeam} 0หรือ5',
      'PDH1': '{homeTeam} 1หรือ6',
      'PDH2': '{homeTeam} 2หรือ7',
      'PDH3': '{homeTeam} 3หรือ8',
      'PDH4': '{homeTeam} 4หรือ9',
      'PDC0': '{awayTeam} 0หรือ5',
      'PDC1': '{awayTeam} 1หรือ6',
      'PDC2': '{awayTeam} 2หรือ7',
      'PDC3': '{awayTeam} 3หรือ8',
      'PDC4': '{awayTeam} 4หรือ9'
    },
    'sort': [
      'PDH0',
      'PDH1',
      'PDH2',
      'PDH3',
      'PDH4',
      'PDC0',
      'PDC1',
      'PDC2',
      'PDC3',
      'PDC4'
    ]
  },
  'RPD': {
    'col': 2,
    'text': {
      'RPDH0': '{homeTeam} 0หรือ5',
      'RPDH1': '{homeTeam} 1หรือ6',
      'RPDH2': '{homeTeam} 2หรือ7',
      'RPDH3': '{homeTeam} 3หรือ8',
      'RPDH4': '{homeTeam} 4หรือ9',
      'RPDC0': '{awayTeam} 0หรือ5',
      'RPDC1': '{awayTeam} 1หรือ6',
      'RPDC2': '{awayTeam} 2หรือ7',
      'RPDC3': '{awayTeam} 3หรือ8',
      'RPDC4': '{awayTeam} 4หรือ9'
    },
    'sort': [
      'RPDH0',
      'RPDH1',
      'RPDH2',
      'RPDH3',
      'RPDH4',
      'RPDC0',
      'RPDC1',
      'RPDC2',
      'RPDC3',
      'RPDC4'
    ]
  },
  'RMOU': {
      'col': 2,
      'text': {
        'RMOUHO': '{homeTeam} สูง {ratio}',
        'RMOUHU': '{homeTeam} ต่ำ {ratio}',
        'RMOUCO': '{awayTeam} สูง {ratio}',
        'RMOUCU': '{awayTeam} ต่ำ {ratio}'
      },
      'sort': ['RMOUHO', 'RMOUHU', 'RMOUCO', 'RMOUCU']
  },
  'RHCOU': {
    'col': 2,
    'text': {
      'RHCOUHO': '{homeTeam} สูง {ratio}',
      'RHCOUHU': '{homeTeam} ต่ำ {ratio}',
      'RHCOUCO': '{awayTeam} สูง {ratio}',
      'RHCOUCU': '{awayTeam} ต่ำ {ratio}'
    },
    'sort': ['RHCOUHO', 'RHCOUHU', 'RHCOUCO', 'RHCOUCU']
  },
  'RWM': {
    'col': 2,
    'text': {
      "RWMH12": "{homeTeam} ชนะ1-2",
      "RWMH36": "{homeTeam} ชนะ3-6",
      "RWMH79": "{homeTeam} ชนะ7-9",
      "RWMH1013": "{homeTeam} ชนะ10-13",
      "RWMH1416": "{homeTeam} ชนะ14-16",
      "RWMH1720": "{homeTeam} ชนะ17-20",
      "RWMH21OV": "{homeTeam} ชนะ21+",
      "RWMC12": "{awayTeam} ชนะ1-2",
      "RWMC36": "{awayTeam} ชนะ3-6",
      "RWMC79": "{awayTeam} ชนะ7-9",
      "RWMC1013": "{awayTeam} ชนะ10-13",
      "RWMC1416": "{awayTeam} ชนะ14-16",
      "RWMC1720": "{awayTeam} ชนะ17-20",
      "RWMC21OV": "{awayTeam} ชนะ21+",
    },
    'sort': [
      "RWMH12", "RWMC12",
      "RWMH36", "RWMC36",
      "RWMH79", "RWMC79",
      "RWMH1013", "RWMC1013",
      "RWMH1416", "RWMC1416",
      "RWMH1720", "RWMC1720",
      "RWMH21OV", "RWMC21OV",
    ]
  },
  "R_OT": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RE_OT": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
   "M_OT": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RM_OT": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
   "ROUH_OT": {
    "col": 2,
    "text": {"ROUHO": "สูง {ratio}", "ROUHU": "ต่ำ {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCO": "สูง {ratio}", "ROUCU": "ต่ำ {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHO": "สูง {ratio}", "OUHU": "ต่ำ {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCO": "สูง {ratio}", "OUCU": "ต่ำ {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
};
