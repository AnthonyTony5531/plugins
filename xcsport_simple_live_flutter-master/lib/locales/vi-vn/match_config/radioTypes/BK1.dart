//Bóng rổ
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
    "text": {"FMH": "{homeTeam}", "FMN": "Hòa", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "W3": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3D": "Hòa {ratio}",
      "W3A": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3D", "W3A"]
  },
  "HS": {
    "col": 3,
    "text": {"HS1": "Nửa đầu trận", "HS2": "Nửa sau trận", "HSE": "Điểm số bằng nhau"},
    "sort": ["HS1", "HS2", "HSE"]
  },
  
  "WBO": {
    "col": 2,
    "text": {"WBOY": "Có", "WBON": "Không"},
    "sort": ["WBOY", "WBON"]
  },
  "ROUH": {
    "col": 2,
    "text": {"ROUHO": "Tài {ratio}", "ROUHU": "Xỉu {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC": {
    "col": 2,
    "text": {"ROUCO": "Tài {ratio}", "ROUCU": "Xỉu {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUH": "Tài {ratio}", "OUC": "Xỉu {ratio}"},
    "sort": ["OUH", "OUC"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUH": "Tài {ratio}", "OUC": "Xỉu {ratio}"},
    "sort": ["OUH", "OUC"]
  },
  "HOUH": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOUC": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
      "HSQ1": "Hiệp 1",
      "HSQ2": "Hiệp 2",
      "HSQ3": "Hiệp 3",
      "HSQ4": "Hiệp 4",
      "HSQE": "Điểm số bằng nhau"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH12":"{homeTeam} thắng lợi 1-2 Phút",
      "WMH36":"{homeTeam} thắng lợi 3-6 Phút",
      "WMH79":"{homeTeam} thắng lợi 7-9 Phút",
      "WMH1013":"{homeTeam} thắng lợi 10-13 Phút",
      "WMH1416":"{homeTeam} thắng lợi 14-16 Phút",
      "WMH1720":"{homeTeam} thắng lợi 17-20 Phút",
      "WMH21OV":"{homeTeam} thắng lợi 21 Phút bên trên",
      "WMC12":"{awayTeam} thắng lợi 1-2 Phút",
      "WMC36":"{awayTeam} thắng lợi 3-6 Phút",
      "WMC79":"{awayTeam} thắng lợi 7-9 Phút",
      "WMC1013":"{awayTeam} thắng lợi 10-13 Phút",
      "WMC1416":"{awayTeam} thắng lợi 14-16 Phút",
      "WMC1720":"{awayTeam} thắng lợi 17-20 Phút",
      "WMC21OV":"{awayTeam} thắng lợi 21 Phút bên trên",

      "WMH15":"{homeTeam} thắng lợi 1-5 Phút",
      "WMH610":"{homeTeam} thắng lợi 6-10 Phút",
      "WMH1120":"{homeTeam} thắng lợi 11-20 Phút",
      "WMH2125":"{homeTeam} thắng lợi 21-25 Phút",
      "WMH26OV":"{homeTeam} thắng lợi 26 Phút bên trên",
      "WMC15":"{awayTeam} thắng lợi 1-5 Phút",
      "WMC610":"{awayTeam} thắng lợi 6-10 Phút",
      "WMC1120":"{awayTeam} thắng lợi 11-20 Phút",
      "WMC2125":"{awayTeam} thắng lợi 21-25 Phút",
      "WMC26OV":"{awayTeam} thắng lợi 26 Phút bên trên",

      "WMH3":"{homeTeam} Có thể thắng lợi 3 Phút bên trên",
      "WMC3":"{awayTeam} Có thể thắng lợi 3 Phút bên trên",
      "WMO":"khác Phút con số",
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
    "text": {"OEUU": "Thấp hơn {total} điểm", "OEUE": "Bằng {total} điểm", "OEUO": "Cao hơn {total} điểm"},
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
      'QWMH': '{homeTeam}Giành được 3 điểm trở lên',
      'QWMC': '{awayTeam}Giành được 3 điểm trở lên',
      'QWMO': 'Khác'
    },
    "sort": ["QWMH", "QWMC", "QWMO"]
  },
  "QOUH": {
    "col": 2,
    "text": {"QOUHO": "Tài {ratio}", "QOUHU": "Xỉu {ratio}"},
    "sort": ["QOUHO", "QOUHU"]
  },
  "QOUC": {
    "col": 2,
    "text": {"QOUCO": "Tài {ratio}", "QOUCU": "Xỉu {ratio}"},
    "sort": ["QOUCO", "QOUCU"]
  },
  "QLP": {
    "col": 2,
    "text": {"QLPH": "{homeTeam}", "QLPA": "{awayTeam}"},
    "sort": ["QLPH", "QLPA"]
  },
  "QRP": {
    "col": 3,
    "text": {"QRPH": "{homeTeam}", "QRPN": "Không", "QRPC": "{awayTeam}"},
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
      "OUHLP0": "0 Hoặc 5",
      "OUHLP1": "1 Hoặc 6",
      "OUHLP2": "2 Hoặc 7",
      "OUHLP3": "3 Hoặc 8",
      "OUHLP4": "4 Hoặc 9"
    },
    "sort": ["OUHLP0", "OUHLP1", "OUHLP2", "OUHLP3", "OUHLP4"]
  },
  "OUCLP": {
    "col": 2,
    "text": {
      "OUCLP0": "0 Hoặc 5",
      "OUCLP1": "1 Hoặc 6",
      "OUCLP2": "2 Hoặc 7",
      "OUCLP3": "3 Hoặc 8",
      "OUCLP4": "4 Hoặc 9"
    },
    "sort": ["OUCLP0", "OUCLP1", "OUCLP2", "OUCLP3", "OUCLP4"]
  },

  "PDH": {
    "col": 2,
    "text": {
      "PDH0": "0 Hoặc 5",
      "PDH1": "1 Hoặc 6",
      "PDH2": "2 Hoặc 7",
      "PDH3": "3 Hoặc 8",
      "PDH4": "4 Hoặc 9"
    },
    "sort": ["PDH0", "PDH1", "PDH2", "PDH3", "PDH4"]
  },
  "RPDH": {
    "col": 2,
    "text": {
      "RPDH0": "0 Hoặc 5",
      "RPDH1": "1 Hoặc 6",
      "RPDH2": "2 Hoặc 7",
      "RPDH3": "3 Hoặc 8",
      "RPDH4": "4 Hoặc 9"
    },
    "sort": ["RPDH0", "RPDH1", "RPDH2", "RPDH3", "RPDH4"]
  },
  "PDC": {
    "col": 2,
    "text": {
      "PDC0": "0 Hoặc 5",
      "PDC1": "1 Hoặc 6",
      "PDC2": "2 Hoặc 7",
      "PDC3": "3 Hoặc 8",
      "PDC4": "4 Hoặc 9"
    },
    "sort": ["PDC0", "PDC1", "PDC2", "PDC3", "PDC4"]
  },
  "RPDC": {
    "col": 2,
    "text": {
      "RPDC0": "0 Hoặc 5",
      "RPDC1": "1 Hoặc 6",
      "RPDC2": "2 Hoặc 7",
      "RPDC3": "3 Hoặc 8",
      "RPDC4": "4 Hoặc 9"
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
      'FNH': 'Hòa/{homeTeam}',
      'FNC': 'Hòa/{awayTeam}',
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
      'RFNH': 'Hòa/{homeTeam}',
      'RFNC': 'Hòa/{awayTeam}',
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
      "2P": "Bóng 2 điểm", "3P": "Bóng 3 điểm", "PS": "Bóng phạt",
      "LGA": "Bóng 2 điểm", "LGB": "Bóng 3 điểm", "LGC": "Bóng phạt",
    },
    "sort": [
      "2P", "3P", "PS",
      "LGA", "LGB", "LGC"
    ]
  },
  "FG": {
    "col": 3,
    "text": {
      "2P": "Bóng 2 điểm", "3P": "Bóng 3 điểm", "PS": "Bóng phạt",
      "FGA": "Bóng 2 điểm", "FGB": "Bóng 3 điểm", "FGC": "Bóng phạt",
    },
    "sort": [
      "2P", "3P", "PS",
      "FGA", "FGB", "FGC"
    ]
  },
  "OUHT": {
    "col": 2,
    "text": {"OUHTO": "Tài {ratio}", "OUHTU": "Xỉu {ratio}"},
    "sort": ["OUHTO", "OUHTU"]
  },
  "OUCT": {
    "col": 2,
    "text": {"OUCTO": "Tài {ratio}", "OUCTU": "Xỉu {ratio}"},
    "sort": ["OUCTO", "OUCTU"]
  },
  "OUHOT": {
    "col": 2,
    "text": {"OUHOTO": "Tài {ratio}", "OUHOTU": "Xỉu {ratio}"},
    "sort": ["OUHOTO", "OUHOTU"]
  },
  "OUCOT": {
    "col": 2,
    "text": {"OUCOTO": "Tài {ratio}", "OUCOTU": "Xỉu {ratio}"},
    "sort": ["OUCOTO", "OUCOTU"]
  },
  "OUHST": {
    "col": 2,
    "text": {"OUHSTO": "Tài {ratio}", "OUHSTU": "Xỉu {ratio}"},
    "sort": ["OUHSTO", "OUHSTU"]
  },
  "OUCST": {
    "col": 2,
    "text": {"OUCSTO": "Tài {ratio}", "OUCSTU": "Xỉu {ratio}"},
    "sort": ["OUCSTO", "OUCSTU"]
  },
  "PQ": {"col": 2, "text": {}, "sort": []},
  "APP": {"col": 2, "text": {}, "sort": []},
  "FFG": {"col": 2, "text": {}, "sort": []},
  "HAOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  
  "TOU": {
    "col": 2,
    "text": {
      "HTOUC": "{homeTeam} Tài {ratio}",
      "HTOUH": "{homeTeam} Xỉu {ratio}",
      "CTOUC": "{awayTeam} Tài {ratio}",
      "CTOUH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["HTOUC", "HTOUH", "CTOUC", "CTOUH"]
  },
  "WMB": {
    "col": 2,
    "text": {
      'WM15': 'Bất kỳ đội nào thắng lợi 1-5 Phút',
      'WM610': 'Bất kỳ đội nào thắng lợi 6-10 Phút',
      'WM1115': 'Bất kỳ đội nào thắng lợi 11-15 Phút',
      'WM1620': 'Bất kỳ đội nào thắng lợi 16-20 Phút',
      'WM2125': 'Bất kỳ đội nào thắng lợi 21-25 Phút',
      'WM2630': 'Bất kỳ đội nào thắng lợi 26-30 Phút',
      'WM31OV': 'Bất kỳ đội nào thắng lợi 31 Phút bên trên',
    },
    "sort": ["WM15", "WM610", "WM1115", "WM1620", "WM2125", "WM2630", "WM31OV"]
  },
  "WMA": {
    "col": 3,
    "text": {
      "WMH6OV": "{homeTeam}thắng lợi 6 Phút bên trên",
      "WMC6OV": "{awayTeam}thắng lợi 6 Phút bên trên",
      "WM5": "Bất kỳ đội nào thắng lợi 5 Phút Hoặc ít hơn",
    },
    "sort": ['WMH6OV', 'WMC6OV', 'WM5',]
  },
  "WMC": {
    "col": 2,
    "text": {
      'WMH15': '{homeTeam}thắng lợi 1-5 Phút',
      'WMH610': '{homeTeam}thắng lợi 6-10 Phút',
      'WMH1115': '{homeTeam}thắng lợi 11-15 Phút',
      'WMH1620': '{homeTeam}thắng lợi 16-20 Phút',
      'WMH2125': '{homeTeam}thắng lợi 21-25 Phút',
      'WMH26OV': '{homeTeam}thắng lợi 26 Phút bên trên',
      'WMC15': '{awayTeam}thắng lợi 1-5 Phút',
      'WMC610': '{awayTeam}thắng lợi 6-10 Phút',
      'WMC1115': '{awayTeam}thắng lợi 11-15 Phút',
      'WMC1620': '{awayTeam}thắng lợi 16-20 Phút',
      'WMC2125': '{awayTeam}thắng lợi 21-25 Phút',
      'WMC26OV': '{awayTeam}thắng lợi 26 Phút bên trên',
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
      'RWM15': 'Bất kỳ đội nào thắng lợi 1-5 Phút',
      'RWM610': 'Bất kỳ đội nào thắng lợi 6-10 Phút',
      'RWM1115': 'Bất kỳ đội nào thắng lợi 11-15 Phút',
      'RWM1620': 'Bất kỳ đội nào thắng lợi 16-20 Phút',
      'RWM2125': 'Bất kỳ đội nào thắng lợi 21-25 Phút',
      'RWM2630': 'Bất kỳ đội nào thắng lợi 26-30 Phút',
      'RWM31OV': 'Bất kỳ đội nào thắng lợi 31 Phút bên trên',
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
      "RWMH6OV": "{homeTeam}thắng lợi 6 Phút bên trên",
      "RWMC6OV": "{awayTeam}thắng lợi 6 Phút bên trên",
      "RWM5": "Bất kỳ đội nào thắng lợi 5 Phút Hoặc ít hơn",
    },
    "sort": ['RWMH6OV', 'RWMC6OV', 'RWM5']
  },
  "RWMC": {
    "col": 2,
    "text": {
      'RWMH15': '{homeTeam} thắng lợi 1-5 Phút',
      'RWMH610': '{homeTeam} thắng lợi 6-10 Phút',
      'RWMH1115': '{homeTeam} thắng lợi 11-15 Phút',
      'RWMH1620': '{homeTeam} thắng lợi 16-20 Phút',
      'RWMH2125': '{homeTeam} thắng lợi 21-25 Phút',
      'RWMH26OV': '{homeTeam} thắng lợi 26 Phút bên trên',
      'RWMC15': '{awayTeam} thắng lợi 1-5 Phút',
      'RWMC610': '{awayTeam} thắng lợi 6-10 Phút',
      'RWMC1115': '{awayTeam} thắng lợi 11-15 Phút',
      'RWMC1620': '{awayTeam} thắng lợi 16-20 Phút',
      'RWMC2125': '{awayTeam} thắng lợi 21-25 Phút',
      'RWMC26OV': '{awayTeam} thắng lợi 26 Phút bên trên',
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
      "HTOUHO": "{homeTeam} Tài {ratio}",
      "HTOUHU": "{homeTeam} Xỉu {ratio}",
      "HTOUCO": "{awayTeam} Tài {ratio}",
      "HTOUCU": "{awayTeam} Xỉu {ratio}"
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
    'text': {'RAGC': 'Tài {ratio}', 'RAGH': 'Xỉu {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  "RTOU": {
    "col": 2,
    "text": {
      "RTOUHO": "{homeTeam} Tài {ratio}",
      "RTOUHU": "{homeTeam} Xỉu {ratio}",
      "RTOUCO": "{awayTeam} Tài {ratio}",
      "RTOUCU": "{awayTeam} Xỉu {ratio}",
    },
    "sort": ["RTOUHO", "RTOUHU", "RTOUCO", "RTOUCU"]
  },
  'PD': {
    'col': 2,
    'text': {
      'PDH0': '{homeTeam} 0 Hoặc 5',
      'PDH1': '{homeTeam} 1 Hoặc 6',
      'PDH2': '{homeTeam} 2 Hoặc 7',
      'PDH3': '{homeTeam} 3 Hoặc 8',
      'PDH4': '{homeTeam} 4 Hoặc 9',
      'PDC0': '{awayTeam} 0 Hoặc 5',
      'PDC1': '{awayTeam} 1 Hoặc 6',
      'PDC2': '{awayTeam} 2 Hoặc 7',
      'PDC3': '{awayTeam} 3 Hoặc 8',
      'PDC4': '{awayTeam} 4 Hoặc 9'
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
      'RPDH0': '{homeTeam} 0 Hoặc 5',
      'RPDH1': '{homeTeam} 1 Hoặc 6',
      'RPDH2': '{homeTeam} 2 Hoặc 7',
      'RPDH3': '{homeTeam} 3 Hoặc 8',
      'RPDH4': '{homeTeam} 4 Hoặc 9',
      'RPDC0': '{awayTeam} 0 Hoặc 5',
      'RPDC1': '{awayTeam} 1 Hoặc 6',
      'RPDC2': '{awayTeam} 2 Hoặc 7',
      'RPDC3': '{awayTeam} 3 Hoặc 8',
      'RPDC4': '{awayTeam} 4 Hoặc 9'
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
        'RMOUHO': '{homeTeam} Tài {ratio}',
        'RMOUHU': '{homeTeam} Xỉu {ratio}',
        'RMOUCO': '{awayTeam} Tài {ratio}',
        'RMOUCU': '{awayTeam} Xỉu {ratio}'
      },
      'sort': ['RMOUHO', 'RMOUHU', 'RMOUCO', 'RMOUCU']
  },
  'RHCOU': {
    'col': 2,
    'text': {
      'RHCOUHO': '{homeTeam} Tài {ratio}',
      'RHCOUHU': '{homeTeam} Xỉu {ratio}',
      'RHCOUCO': '{awayTeam} Tài {ratio}',
      'RHCOUCU': '{awayTeam} Xỉu {ratio}'
    },
    'sort': ['RHCOUHO', 'RHCOUHU', 'RHCOUCO', 'RHCOUCU']
  },
  'RWM': {
    'col': 2,
    'text': {
      "RWMH12": "{homeTeam} thắng lợi 1-2 Phút",
      "RWMH36": "{homeTeam} thắng lợi 3-6 Phút",
      "RWMH79": "{homeTeam} thắng lợi 7-9 Phút",
      "RWMH1013": "{homeTeam} thắng lợi 10-13 Phút",
      "RWMH1416": "{homeTeam} thắng lợi 14-16 Phút",
      "RWMH1720": "{homeTeam} thắng lợi 17-20 Phút",
      "RWMH21OV": "{homeTeam} thắng lợi 21 Phút bên trên",
      "RWMC12": "{awayTeam} thắng lợi 1-2 Phút",
      "RWMC36": "{awayTeam} thắng lợi 3-6 Phút",
      "RWMC79": "{awayTeam} thắng lợi 7-9 Phút",
      "RWMC1013": "{awayTeam} thắng lợi 10-13 Phút",
      "RWMC1416": "{awayTeam} thắng lợi 14-16 Phút",
      "RWMC1720": "{awayTeam} thắng lợi 17-20 Phút",
      "RWMC21OV": "{awayTeam} thắng lợi 21 Phút bên trên",
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "Lẻ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
   "ROUH_OT": {
    "col": 2,
    "text": {"ROUHO": "Tài {ratio}", "ROUHU": "Xỉu {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCO": "Tài {ratio}", "ROUCU": "Xỉu {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHO": "Tài {ratio}", "OUHU": "Xỉu {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCO": "Tài {ratio}", "OUCU": "Xỉu {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
};
