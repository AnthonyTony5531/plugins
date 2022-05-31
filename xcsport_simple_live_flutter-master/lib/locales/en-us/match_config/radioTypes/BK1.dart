//Basketball
const dynamic bkRadioTypes = {
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
  "W3": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3D": "Draw {ratio}",
      "W3A": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3D", "W3A"]
  },
  "HS": {
    "col": 2,
    "col188": 1,
    "text": {"HS1": "1st Half", "HS2": "2nd Half", "HSE": "Same Goal"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Yes", "WBON": "No"},
    "sort": ["WBOY", "WBON"]
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
  "HOUH": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOUC": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RP": {
    "col": 2,
    "col188": 1,
    "text": {"RPH": "{homeTeam}", "RPA": "{awayTeam}"},
    "sort": ["RPH", "RPA"]
  },
  "HSQ": {
    "col": 2,
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
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH12": "{homeTeam} Won1-2 ",
      "WMH36": "{homeTeam} Won3-6 ",
      "WMH79": "{homeTeam} Won7-9 ",
      "WMH1013": "{homeTeam} Won10-13 ",
      "WMH1416": "{homeTeam} Won14-16 ",
      "WMH1720": "{homeTeam} Won17-20 ",
      "WMH21OV": "{homeTeam} Won21+",
      "WMC12": "{awayTeam} Won1-2 ",
      "WMC36": "{awayTeam} Won3-6 ",
      "WMC79": "{awayTeam} Won7-9 ",
      "WMC1013": "{awayTeam} Won10-13 ",
      "WMC1416": "{awayTeam} Won14-16 ",
      "WMC1720": "{awayTeam} Won17-20 ",
      "WMC21OV": "{awayTeam} Won21+",
      "WMH15": "{homeTeam} Won1-5 ",
      "WMH610": "{homeTeam} Won6-10 ",
      "WMH1120": "{homeTeam} Won11-20 ",
      "WMH2125": "{homeTeam} Won21-25 ",
      "WMH26OV": "{homeTeam} Won26+",
      "WMC15": "{awayTeam} Won1-5 ",
      "WMC610": "{awayTeam} Won6-10 ",
      "WMC1120": "{awayTeam} Won11-20 ",
      "WMC2125": "{awayTeam} Won21-25 ",
      "WMC26OV": "{awayTeam} Won26+",
      "WMH3": "{homeTeam} Won3+",
      "WMC3": "{awayTeam} Won3+",
      "WMO": "Others",
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
    "col188": 1,
    "text": {
      "OEUU": "Lower{total} ",
      "OEUE": "Same As{total} ",
      "OEUO": "Higher{total}"
    },
    "sort": ["OEUU", "OEUE", "OEUO"]
  },
  "PR": {
    "col": 2,
    "col188": 1,
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
    "col188": 1,
    'text': {
      'QWMH': '{homeTeam}Won 3+',
      'QWMC': '{awayTeam}Won 3+',
      'QWMO': 'Others'
    },
    "sort": ["QWMH", "QWMC", "QWMO"]
  },
  "QOUH": {
    "col": 2,
    "text": {"QOUHO": "Over {ratio}", "QOUHU": "Under {ratio}"},
    "sort": ["QOUHO", "QOUHU"]
  },
  "QOUC": {
    "col": 2,
    "text": {"QOUCO": "Over {ratio}", "QOUCU": "Under {ratio}"},
    "sort": ["QOUCO", "QOUCU"]
  },
  "QLP": {
    "col": 2,
    "col188": 1,
    "text": {"QLPH": "{homeTeam}", "QLPA": "{awayTeam}"},
    "sort": ["QLPH", "QLPA"]
  },
  "QRP": {
    "col": 3,
    "col188": 1,
    "text": {"QRPH": "{homeTeam}", "QRPN": "No", "QRPC": "{awayTeam}"},
    "sort": ["QRPH", "QRPN", "QRPC"]
  },
  "FP": {
    "col": 2,
    "col188": 1,
    "text": {"FPH": "{homeTeam}", "FPC": "{awayTeam}"},
    "sort": ["FPH", "FPC"]
  },
  "LP": {
    "col": 2,
    "col188": 1,
    "text": {"LPH": "{homeTeam}", "LPC": "{awayTeam}"},
    "sort": ["LPH", "LPC"]
  },
  "OUHLP": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUHLP0": "0 or 5",
      "OUHLP1": "1 or 6",
      "OUHLP2": "2 or 7",
      "OUHLP3": "3 or 8",
      "OUHLP4": "4 or 9"
    },
    "sort": ["OUHLP0", "OUHLP1", "OUHLP2", "OUHLP3", "OUHLP4"]
  },
  "OUCLP": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUCLP0": "0 or 5",
      "OUCLP1": "1 or 6",
      "OUCLP2": "2 or 7",
      "OUCLP3": "3 or 8",
      "OUCLP4": "4 or 9"
    },
    "sort": ["OUCLP0", "OUCLP1", "OUCLP2", "OUCLP3", "OUCLP4"]
  },
  "PDH": {
    "col": 2,
    "col188": 1,
    "text": {
      "PDH0": "0 or 5",
      "PDH1": "1 or 6",
      "PDH2": "2 or 7",
      "PDH3": "3 or 8",
      "PDH4": "4 or 9"
    },
    "sort": ["PDH0", "PDH1", "PDH2", "PDH3", "PDH4"]
  },
  "RPDH": {
    "col": 2,
    "col188": 1,
    "text": {
      "RPDH0": "0 or 5",
      "RPDH1": "1 or 6",
      "RPDH2": "2 or 7",
      "RPDH3": "3 or 8",
      "RPDH4": "4 or 9"
    },
    "sort": ["RPDH0", "RPDH1", "RPDH2", "RPDH3", "RPDH4"]
  },
  "PDC": {
    "col": 2,
    "col188": 1,
    "text": {
      "PDC0": "0 or 5",
      "PDC1": "1 or 6",
      "PDC2": "2 or 7",
      "PDC3": "3 or 8",
      "PDC4": "4 or 9"
    },
    "sort": ["PDC0", "PDC1", "PDC2", "PDC3", "PDC4"]
  },
  "RPDC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RPDC0": "0 or 5",
      "RPDC1": "1 or 6",
      "RPDC2": "2 or 7",
      "RPDC3": "3 or 8",
      "RPDC4": "4 or 9"
    },
    "sort": ["RPDC0", "RPDC1", "RPDC2", "RPDC3", "RPDC4"]
  },
  "HA": {
    "col": 2,
    "col188": 1,
    "text": {"HAH": "{homeTeam}", "HAC": "{awayTeam}"},
    "sort": ["HAH", "HAC"]
  },
  "FP20": {
    "col": 2,
    "col188": 1,
    "text": {"FP20H": "{homeTeam}", "FP20C": "{awayTeam}"},
    "sort": ["FP20H", "FP20C"]
  },
  "M3P": {
    "col": 2,
    "col188": 1,
    "text": {"M3PH": "{homeTeam}", "M3PC": "{awayTeam}"},
    "sort": ["M3PH", "M3PC"]
  },
  "MAP": {
    "col": 2,
    "col188": 1,
    "text": {"MAPH": "{homeTeam}", "MAPC": "{awayTeam}"},
    "sort": ["MAPH", "MAPC"]
  },
  "MGP": {
    "col": 2,
    "col188": 1,
    "text": {"MGPH": "{homeTeam}", "MGPC": "{awayTeam}"},
    "sort": ["MGPH", "MGPC"]
  },
  "MLP": {
    "col": 2,
    "col188": 1,
    "text": {"MLPH": "{homeTeam}", "MLPC": "{awayTeam}"},
    "sort": ["MLPH", "MLPC"]
  },
  "MJP": {
    "col": 2,
    "col188": 1,
    "text": {"MJPH": "{homeTeam}", "MJPC": "{awayTeam}"},
    "sort": ["MJPH", "MJPC"]
  },
  "F": {
    "col": 3,
    "col188": 1,
    'text': {
      'FHH': '{homeTeam}/{homeTeam}',
      'FHC': '{homeTeam}/{awayTeam}',
      'FNH': 'Draw/{homeTeam}',
      'FNC': 'Draw/{awayTeam}',
      'FCH': '{awayTeam}/{homeTeam}',
      'FCC': '{awayTeam}/{awayTeam}'
    },
    "sort": ["FHH", "FHC", "FNH", "FNC", "FCH", "FCC"]
  },
  "RF": {
    "col": 3,
    "col188": 1,
    'text': {
      'RFHH': '{homeTeam}/{homeTeam}',
      'RFHC': '{homeTeam}/{awayTeam}',
      'RFNH': 'Draw/{homeTeam}',
      'RFNC': 'Draw/{awayTeam}',
      'RFCH': '{awayTeam}/{homeTeam}',
      'RFCC': '{awayTeam}/{awayTeam}'
    },
    "sort": ["RFHH", "RFHC", "RFNH", "RFNC", "RFCH", "RFCC"]
  },
  "DTP": {
    "col": 2,
    "col188": 1,
    "text": {"DTP1": "DTP1", "DTP2": "DTP2"},
    "sort": ["DTP1", "DTP2"]
  },
  "LG": {
    "col": 3,
    "col188": 1,
    "text": {
      "2P": "Field Goal",
      "3P": "Three-Pointer",
      "PS": "Free Throw",
      "LGA": "Field Goal",
      "LGB": "Three-Pointer",
      "LGC": "Free Throw"
    },
    "sort": ["2P", "3P", "PS", "LGA", "LGB", "LGC"]
  },
  "FG": {
    "col": 3,
    "col188": 1,
    "text": {
      "2P": "Field Goal",
      "3P": "Three-Pointer",
      "PS": "Free Throw",
      "FGA": "Field Goal",
      "FGB": "Three-Pointer",
      "FGC": "Free Throw"
    },
    "sort": ["2P", "3P", "PS", "FGA", "FGB", "FGC"]
  },
  "OUHT": {
    "col": 2,
    "text": {"OUHTO": "Over {ratio}", "OUHTU": "Under {ratio}"},
    "sort": ["OUHTO", "OUHTU"]
  },
  "OUCT": {
    "col": 2,
    "text": {"OUCTO": "Over {ratio}", "OUCTU": "Under {ratio}"},
    "sort": ["OUCTO", "OUCTU"]
  },
  "OUHOT": {
    "col": 2,
    "text": {"OUHOTO": "Over {ratio}", "OUHOTU": "Under {ratio}"},
    "sort": ["OUHOTO", "OUHOTU"]
  },
  "OUCOT": {
    "col": 2,
    "text": {"OUCOTO": "Over {ratio}", "OUCOTU": "Under {ratio}"},
    "sort": ["OUCOTO", "OUCOTU"]
  },
  "OUHST": {
    "col": 2,
    "text": {"OUHSTO": "Over {ratio}", "OUHSTU": "Under {ratio}"},
    "sort": ["OUHSTO", "OUHSTU"]
  },
  "OUCST": {
    "col": 2,
    "text": {"OUCSTO": "Over {ratio}", "OUCSTU": "Under {ratio}"},
    "sort": ["OUCSTO", "OUCSTU"]
  },
  "PQ": {"col": 2, "text": {}, "sort": []},
  "APP": {"col": 2, "text": {}, "sort": []},
  "FFG": {"col": 2, "text": {}, "sort": []},
  "HAOU": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "TOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTOUC": "{homeTeam} Over {ratio}",
      "HTOUH": "{homeTeam} Under {ratio}",
      "CTOUC": "{awayTeam} Over {ratio}",
      "CTOUH": "{awayTeam} Under {ratio}"
    },
    "sort": ["HTOUC", "HTOUH", "CTOUC", "CTOUH"]
  },
  "WMB": {
    "col": 2,
    "col188": 1,
    "text": {
      'WM15': 'Any Team Won 1-5 ',
      'WM610': 'Any Team Won 6-10 ',
      'WM1115': 'Any Team Won 11-15 ',
      'WM1620': 'Any Team Won 16-20 ',
      'WM2125': 'Any Team Won 21-25 ',
      'WM2630': 'Any Team Won 26-30 ',
      'WM31OV': 'Any Team Won 31+',
    },
    "sort": ["WM15", "WM610", "WM1115", "WM1620", "WM2125", "WM2630", "WM31OV"]
  },
  "WMA": {
    "col": 3,
    "col188": 1,
    "text": {
      "WMH6OV": "{homeTeam}Won 6+",
      "WMC6OV": "{awayTeam}Won 6+",
      "WM5": "Any Team Won 5 or Less",
    },
    "sort": [
      'WMH6OV',
      'WMC6OV',
      'WM5',
    ]
  },
  "WMC": {
    "col": 2,
    "col188": 1,
    "text": {
      'WMH15': '{homeTeam}Won 1-5 ',
      'WMH610': '{homeTeam}Won 6-10 ',
      'WMH1115': '{homeTeam}Won 11-15 ',
      'WMH1620': '{homeTeam}Won 16-20 ',
      'WMH2125': '{homeTeam}Won 21-25 ',
      'WMH26OV': '{homeTeam}Won 26+',
      'WMC15': '{awayTeam}Won 1-5 ',
      'WMC610': '{awayTeam}Won 6-10 ',
      'WMC1115': '{awayTeam}Won 11-15 ',
      'WMC1620': '{awayTeam}Won 16-20 ',
      'WMC2125': '{awayTeam}Won 21-25 ',
      'WMC26OV': '{awayTeam}Won 26+',
    },
    "sort": [
      'WMH15',
      'WMC15',
      'WMH610',
      'WMC610',
      'WMH1115',
      'WMC1115',
      'WMH1620',
      'WMC1620',
      'WMH2125',
      'WMC2125',
      'WMH26OV',
      'WMC26OV',
    ]
  },
  "RTA": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RTB": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RTC": {
    "col": 2,
    "col188": 1,
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
    "col188": 1,
    "text": {
      'RWM15': 'Any Team Won 1-5 ',
      'RWM610': 'Any Team Won 6-10 ',
      'RWM1115': 'Any Team Won 11-15 ',
      'RWM1620': 'Any Team Won 16-20 ',
      'RWM2125': 'Any Team Won 21-25 ',
      'RWM2630': 'Any Team Won 26-30 ',
      'RWM31OV': 'Any Team Won 31+',
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
    "col188": 1,
    "text": {
      "RWMH6OV": "{homeTeam}Won 6+",
      "RWMC6OV": "{awayTeam}Won 6+",
      "RWM5": "Any Team Won 5 or Less",
    },
    "sort": ['RWMH6OV', 'RWMC6OV', 'RWM5']
  },
  "RWMC": {
    "col": 2,
    "col188": 1,
    "text": {
      'RWMH15': '{homeTeam} Won 1-5 ',
      'RWMH610': '{homeTeam} Won 6-10 ',
      'RWMH1115': '{homeTeam} Won 11-15 ',
      'RWMH1620': '{homeTeam} Won 16-20 ',
      'RWMH2125': '{homeTeam} Won 21-25 ',
      'RWMH26OV': '{homeTeam} Won 26+',
      'RWMC15': '{awayTeam} Won 1-5 ',
      'RWMC610': '{awayTeam} Won 6-10 ',
      'RWMC1115': '{awayTeam} Won 11-15 ',
      'RWMC1620': '{awayTeam} Won 16-20 ',
      'RWMC2125': '{awayTeam} Won 21-25 ',
      'RWMC26OV': '{awayTeam} Won 26+',
    },
    "sort": [
      'RWMH15',
      'RWMC15',
      'RWMH610',
      'RWMC610',
      'RWMH1115',
      'RWMC1115',
      'RWMH1620',
      'RWMC1620',
      'RWMH2125',
      'RWMC2125',
      'RWMH26OV',
      'RWMC26OV'
    ]
  },
  "HTOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTOUHO": "{homeTeam} Over {ratio}",
      "HTOUHU": "{homeTeam} Under {ratio}",
      "HTOUCO": "{awayTeam} Over {ratio}",
      "HTOUCU": "{awayTeam} Under {ratio}"
    },
    "sort": ["HTOUHO", "HTOUHU", " HTOUCO", " HTOUCU"]
  },
  'RAH': {
    'col': 2,
    "col188": 1,
    'text': {'RAHH': '{homeTeam} {ratio}', 'RAHC': '{awayTeam} {ratio}'},
    'sort': ['RAHH', 'RAHC']
  },
  'RAG': {
    'col': 2,
    'text': {'RAGC': 'Over {ratio}', 'RAGH': 'Under {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  "RTOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "RTOUHO": "{homeTeam} Over {ratio}",
      "RTOUHU": "{homeTeam} Under {ratio}",
      "RTOUCO": "{awayTeam} Over {ratio}",
      "RTOUCU": "{awayTeam} Under {ratio}",
    },
    "sort": ["RTOUHO", "RTOUHU", "RTOUCO", "RTOUCU"]
  },
  'PD': {
    'col': 2,
    "col188": 1,
    'text': {
      'PDH0': '{homeTeam} 0 or 5',
      'PDH1': '{homeTeam} 1 or 6',
      'PDH2': '{homeTeam} 2 or 7',
      'PDH3': '{homeTeam} 3 or 8',
      'PDH4': '{homeTeam} 4 or 9',
      'PDC0': '{awayTeam} 0 or 5',
      'PDC1': '{awayTeam} 1 or 6',
      'PDC2': '{awayTeam} 2 or 7',
      'PDC3': '{awayTeam} 3 or 8',
      'PDC4': '{awayTeam} 4 or 9'
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
    "col188": 1,
    'text': {
      'RPDH0': '{homeTeam} 0 or 5',
      'RPDH1': '{homeTeam} 1 or 6',
      'RPDH2': '{homeTeam} 2 or 7',
      'RPDH3': '{homeTeam} 3 or 8',
      'RPDH4': '{homeTeam} 4 or 9',
      'RPDC0': '{awayTeam} 0 or 5',
      'RPDC1': '{awayTeam} 1 or 6',
      'RPDC2': '{awayTeam} 2 or 7',
      'RPDC3': '{awayTeam} 3 or 8',
      'RPDC4': '{awayTeam} 4 or 9'
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
    "col188": 1,
    'text': {
      'RMOUHO': '{homeTeam} Over {ratio}',
      'RMOUHU': '{homeTeam} Under {ratio}',
      'RMOUCO': '{awayTeam} Over {ratio}',
      'RMOUCU': '{awayTeam} Under {ratio}'
    },
    'sort': ['RMOUHO', 'RMOUHU', 'RMOUCO', 'RMOUCU']
  },
  'RHCOU': {
    'col': 2,
    "col188": 1,
    'text': {
      'RHCOUHO': '{homeTeam} Over {ratio}',
      'RHCOUHU': '{homeTeam} Under {ratio}',
      'RHCOUCO': '{awayTeam} Over {ratio}',
      'RHCOUCU': '{awayTeam} Under {ratio}'
    },
    'sort': ['RHCOUHO', 'RHCOUHU', 'RHCOUCO', 'RHCOUCU']
  },
  'RWM': {
    'col': 2,
    "col188": 1,
    'text': {
      "RWMH12": "{homeTeam} Won1-2 ",
      "RWMH36": "{homeTeam} Won3-6 ",
      "RWMH79": "{homeTeam} Won7-9 ",
      "RWMH1013": "{homeTeam} Won10-13 ",
      "RWMH1416": "{homeTeam} Won14-16 ",
      "RWMH1720": "{homeTeam} Won17-20 ",
      "RWMH21OV": "{homeTeam} Won21+",
      "RWMC12": "{awayTeam} Won1-2 ",
      "RWMC36": "{awayTeam} Won3-6 ",
      "RWMC79": "{awayTeam} Won7-9 ",
      "RWMC1013": "{awayTeam} Won10-13 ",
      "RWMC1416": "{awayTeam} Won14-16 ",
      "RWMC1720": "{awayTeam} Won17-20 ",
      "RWMC21OV": "{awayTeam} Won21+",
    },
    'sort': [
      "RWMH12",
      "RWMC12",
      "RWMH36",
      "RWMC36",
      "RWMH79",
      "RWMC79",
      "RWMH1013",
      "RWMC1013",
      "RWMH1416",
      "RWMC1416",
      "RWMH1720",
      "RWMC1720",
      "RWMH21OV",
      "RWMC21OV",
    ]
  },
  "R_OT": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RE_OT": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "M_OT": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RM_OT": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "OU_OT": {
    "col": 2,
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "Over {ratio}", "ROUH": "Under {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "Odd", "EOE": "Even"},
    "sort": ["EOO", "EOE"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "Odd", "REOE": "Even"},
    "sort": ["REOO", "REOE"]
  },
  "ROUH_OT": {
    "col": 2,
    "text": {"ROUHO": "Over {ratio}", "ROUHU": "Under {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCO": "Over {ratio}", "ROUCU": "Under {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHO": "Over {ratio}", "OUHU": "Under {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCO": "Over {ratio}", "OUCU": "Under {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
};
