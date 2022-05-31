//篮球
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
    "text": {"FMH": "{homeTeam}", "FMN": "平", "FMC": "{awayTeam}"},
    "sort": ["FMH", "FMN", "FMC"]
  },
  "W3": {
    "col": 3,
    "col188": 1,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3D": "平局 {ratio}",
      "W3A": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3D", "W3A"]
  },
  "HS": {
    "col": 2,
    "col188": 1,
    "text": {"HS1": "上半场", "HS2": "下半场", "HSE": "得分相同"},
    "sort": ["HS1", "HS2", "HSE"]
  },

  "WBO": {
    "col": 2,
    "text": {"WBOY": "是", "WBON": "否"},
    "sort": ["WBOY", "WBON"]
  },
  "ROUH": {
    "col": 2,
    "text": {"ROUHO": "大 {ratio}", "ROUHU": "小 {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC": {
    "col": 2,
    "text": {"ROUCO": "大 {ratio}", "ROUCU": "小 {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
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
  "HOUH": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOUC": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
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
      "HSQ1": "第1节",
      "HSQ2": "第2节",
      "HSQ3": "第3节",
      "HSQ4": "第4节",
      "HSQE": "得分相同"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQE"]
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH12":"{homeTeam} 赢1-2分",
      "WMH36":"{homeTeam} 赢3-6分",
      "WMH79":"{homeTeam} 赢7-9分",
      "WMH1013":"{homeTeam} 赢10-13分",
      "WMH1416":"{homeTeam} 赢14-16分",
      "WMH1720":"{homeTeam} 赢17-20分",
      "WMH21OV":"{homeTeam} 赢21分以上",
      "WMC12":"{awayTeam} 赢1-2分",
      "WMC36":"{awayTeam} 赢3-6分",
      "WMC79":"{awayTeam} 赢7-9分",
      "WMC1013":"{awayTeam} 赢10-13分",
      "WMC1416":"{awayTeam} 赢14-16分",
      "WMC1720":"{awayTeam} 赢17-20分",
      "WMC21OV":"{awayTeam} 赢21分以上",

      "WMH15":"{homeTeam} 赢1-5分",
      "WMH610":"{homeTeam} 赢6-10分",
      "WMH1120":"{homeTeam} 赢11-20分",
      "WMH2125":"{homeTeam} 赢21-25分",
      "WMH26OV":"{homeTeam} 赢26分以上",
      "WMC15":"{awayTeam} 赢1-5分",
      "WMC610":"{awayTeam} 赢6-10分",
      "WMC1120":"{awayTeam} 赢11-20分",
      "WMC2125":"{awayTeam} 赢21-25分",
      "WMC26OV":"{awayTeam} 赢26分以上",

      "WMH3":"{homeTeam} 会赢3分以上",
      "WMC3":"{awayTeam} 会赢3分以上",
      "WMO":"其他分数",
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
    "text": {"OEUU": "低于{total}分", "OEUE": "等于{total}分", "OEUO": "高于{total}分"},
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
      'QWMH': '{homeTeam}赢3分以上',
      'QWMC': '{awayTeam}赢3分以上',
      'QWMO': '其他'
    },
    "sort": ["QWMH", "QWMC", "QWMO"]
  },
  "QOUH": {
    "col": 2,
    "text": {"QOUHO": "大 {ratio}", "QOUHU": "小 {ratio}"},
    "sort": ["QOUHO", "QOUHU"]
  },
  "QOUC": {
    "col": 2,
    "text": {"QOUCO": "大 {ratio}", "QOUCU": "小 {ratio}"},
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
    "text": {"QRPH": "{homeTeam}", "QRPN": "无", "QRPC": "{awayTeam}"},
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
      "OUHLP0": "0或5",
      "OUHLP1": "1或6",
      "OUHLP2": "2或7",
      "OUHLP3": "3或8",
      "OUHLP4": "4或9"
    },
    "sort": ["OUHLP0", "OUHLP1", "OUHLP2", "OUHLP3", "OUHLP4"]
  },
  "OUCLP": {
    "col": 2,
    "col188": 1,
    "text": {
      "OUCLP0": "0或5",
      "OUCLP1": "1或6",
      "OUCLP2": "2或7",
      "OUCLP3": "3或8",
      "OUCLP4": "4或9"
    },
    "sort": ["OUCLP0", "OUCLP1", "OUCLP2", "OUCLP3", "OUCLP4"]
  },

  "PDH": {
    "col": 2,
    "col188": 1,
    "text": {
      "PDH0": "0或5",
      "PDH1": "1或6",
      "PDH2": "2或7",
      "PDH3": "3或8",
      "PDH4": "4或9"
    },
    "sort": ["PDH0", "PDH1", "PDH2", "PDH3", "PDH4"]
  },
  "RPDH": {
    "col": 2,
    "col188": 1,
    "text": {
      "RPDH0": "0或5",
      "RPDH1": "1或6",
      "RPDH2": "2或7",
      "RPDH3": "3或8",
      "RPDH4": "4或9"
    },
    "sort": ["RPDH0", "RPDH1", "RPDH2", "RPDH3", "RPDH4"]
  },
  "PDC": {
    "col": 2,
    "col188": 1,
    "text": {
      "PDC0": "0或5",
      "PDC1": "1或6",
      "PDC2": "2或7",
      "PDC3": "3或8",
      "PDC4": "4或9"
    },
    "sort": ["PDC0", "PDC1", "PDC2", "PDC3", "PDC4"]
  },
  "RPDC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RPDC0": "0或5",
      "RPDC1": "1或6",
      "RPDC2": "2或7",
      "RPDC3": "3或8",
      "RPDC4": "4或9"
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
      'FNH': '和局/{homeTeam}',
      'FNC': '和局/{awayTeam}',
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
      'RFNH': '和局/{homeTeam}',
      'RFNC': '和局/{awayTeam}',
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
      "2P": "二分球", "3P": "三分球", "PS": "罚球",
      "LGA": "二分球", "LGB": "三分球", "LGC": "罚球"
    },
    "sort": [
      "2P", "3P", "PS",
      "LGA", "LGB", "LGC"
    ]
  },
  "FG": {
    "col": 3,
    "col188": 1,
    "text": {
      "2P": "二分球", "3P": "三分球", "PS": "罚球",
      "FGA": "二分球", "FGB": "三分球", "FGC": "罚球"
    },
    "sort": [
      "2P", "3P", "PS",
      "FGA", "FGB", "FGC"
    ]
  },
  "OUHT": {
    "col": 2,
    "text": {"OUHTO": "大 {ratio}", "OUHTU": "小 {ratio}"},
    "sort": ["OUHTO", "OUHTU"]
  },
  "OUCT": {
    "col": 2,
    "text": {"OUCTO": "大 {ratio}", "OUCTU": "小 {ratio}"},
    "sort": ["OUCTO", "OUCTU"]
  },
  "OUHOT": {
    "col": 2,
    "text": {"OUHOTO": "大 {ratio}", "OUHOTU": "小 {ratio}"},
    "sort": ["OUHOTO", "OUHOTU"]
  },
  "OUCOT": {
    "col": 2,
    "text": {"OUCOTO": "大 {ratio}", "OUCOTU": "小 {ratio}"},
    "sort": ["OUCOTO", "OUCOTU"]
  },
  "OUHST": {
    "col": 2,
    "text": {"OUHSTO": "大 {ratio}", "OUHSTU": "小 {ratio}"},
    "sort": ["OUHSTO", "OUHSTU"]
  },
  "OUCST": {
    "col": 2,
    "text": {"OUCSTO": "大 {ratio}", "OUCSTU": "小 {ratio}"},
    "sort": ["OUCSTO", "OUCSTU"]
  },
  "PQ": {"col": 2, "text": {}, "sort": []},
  "APP": {"col": 2, "text": {}, "sort": []},
  "FFG": {"col": 2, "text": {}, "sort": []},
  "HAOU": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  
  "TOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTOUC": "{homeTeam} 大 {ratio}",
      "HTOUH": "{homeTeam} 小 {ratio}",
      "CTOUC": "{awayTeam} 大 {ratio}",
      "CTOUH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["HTOUC", "HTOUH", "CTOUC", "CTOUH"]
  },
  "WMB": {
    "col": 2,
    "col188": 1,
    "text": {
      'WM15': '任一队伍赢1-5分',
      'WM610': '任一队伍赢6-10分',
      'WM1115': '任一队伍赢11-15分',
      'WM1620': '任一队伍赢16-20分',
      'WM2125': '任一队伍赢21-25分',
      'WM2630': '任一队伍赢26-30分',
      'WM31OV': '任一队伍赢31分以上',
    },
    "sort": ["WM15", "WM610", "WM1115", "WM1620", "WM2125", "WM2630", "WM31OV"]
  },
  "WMA": {
    "col": 3,
    "col188": 1,
    "text": {
      "WMH6OV": "{homeTeam}赢6分以上",
      "WMC6OV": "{awayTeam}赢6分以上",
      "WM5": "任一队伍赢5分或更少",
    },
    "sort": ['WMH6OV', 'WMC6OV', 'WM5',]
  },
  "WMC": {
    "col": 2,
    "col188": 1,
    "text": {
      'WMH15': '{homeTeam}赢1-5分',
      'WMH610': '{homeTeam}赢6-10分',
      'WMH1115': '{homeTeam}赢11-15分',
      'WMH1620': '{homeTeam}赢16-20分',
      'WMH2125': '{homeTeam}赢21-25分',
      'WMH26OV': '{homeTeam}赢26分以上',
      'WMC15': '{awayTeam}赢1-5分',
      'WMC610': '{awayTeam}赢6-10分',
      'WMC1115': '{awayTeam}赢11-15分',
      'WMC1620': '{awayTeam}赢16-20分',
      'WMC2125': '{awayTeam}赢21-25分',
      'WMC26OV': '{awayTeam}赢26分以上',
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
      'RWM15': '任一队伍赢1-5分',
      'RWM610': '任一队伍赢6-10分',
      'RWM1115': '任一队伍赢11-15分',
      'RWM1620': '任一队伍赢16-20分',
      'RWM2125': '任一队伍赢21-25分',
      'RWM2630': '任一队伍赢26-30分',
      'RWM31OV': '任一队伍赢31分以上',
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
      "RWMH6OV": "{homeTeam}赢6分以上",
      "RWMC6OV": "{awayTeam}赢6分以上",
      "RWM5": "任一队伍赢5分或更少",
    },
    "sort": ['RWMH6OV', 'RWMC6OV', 'RWM5']
  },
  "RWMC": {
    "col": 2,
    "col188": 1,
    "text": {
      'RWMH15': '{homeTeam} 赢1-5分',
      'RWMH610': '{homeTeam} 赢6-10分',
      'RWMH1115': '{homeTeam} 赢11-15分',
      'RWMH1620': '{homeTeam} 赢16-20分',
      'RWMH2125': '{homeTeam} 赢21-25分',
      'RWMH26OV': '{homeTeam} 赢26分以上',
      'RWMC15': '{awayTeam} 赢1-5分',
      'RWMC610': '{awayTeam} 赢6-10分',
      'RWMC1115': '{awayTeam} 赢11-15分',
      'RWMC1620': '{awayTeam} 赢16-20分',
      'RWMC2125': '{awayTeam} 赢21-25分',
      'RWMC26OV': '{awayTeam} 赢26分以上',
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
    "col188": 1,
    "text": {
      "HTOUHO": "{homeTeam} 大 {ratio}",
      "HTOUHU": "{homeTeam} 小 {ratio}",
      "HTOUCO": "{awayTeam} 大 {ratio}",
      "HTOUCU": "{awayTeam} 小 {ratio}"
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
    'text': {'RAGC': '大 {ratio}', 'RAGH': '小 {ratio}'},
    'sort': ['RAGC', 'RAGH']
  },
  "RTOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "RTOUHO": "{homeTeam} 大 {ratio}",
      "RTOUHU": "{homeTeam} 小 {ratio}",
      "RTOUCO": "{awayTeam} 大 {ratio}",
      "RTOUCU": "{awayTeam} 小 {ratio}",
    },
    "sort": ["RTOUHO", "RTOUHU", "RTOUCO", "RTOUCU"]
  },
  'PD': {
    'col': 2,
    "col188": 1,
    'text': {
      'PDH0': '{homeTeam} 0或5',
      'PDH1': '{homeTeam} 1或6',
      'PDH2': '{homeTeam} 2或7',
      'PDH3': '{homeTeam} 3或8',
      'PDH4': '{homeTeam} 4或9',
      'PDC0': '{awayTeam} 0或5',
      'PDC1': '{awayTeam} 1或6',
      'PDC2': '{awayTeam} 2或7',
      'PDC3': '{awayTeam} 3或8',
      'PDC4': '{awayTeam} 4或9'
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
      'RPDH0': '{homeTeam} 0或5',
      'RPDH1': '{homeTeam} 1或6',
      'RPDH2': '{homeTeam} 2或7',
      'RPDH3': '{homeTeam} 3或8',
      'RPDH4': '{homeTeam} 4或9',
      'RPDC0': '{awayTeam} 0或5',
      'RPDC1': '{awayTeam} 1或6',
      'RPDC2': '{awayTeam} 2或7',
      'RPDC3': '{awayTeam} 3或8',
      'RPDC4': '{awayTeam} 4或9'
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
        'RMOUHO': '{homeTeam} 大 {ratio}',
        'RMOUHU': '{homeTeam} 小 {ratio}',
        'RMOUCO': '{awayTeam} 大 {ratio}',
        'RMOUCU': '{awayTeam} 小 {ratio}'
      },
      'sort': ['RMOUHO', 'RMOUHU', 'RMOUCO', 'RMOUCU']
    },
  'RHCOU': {
    'col': 2,
    "col188": 1,
    'text': {
      'RHCOUHO': '{homeTeam} 大 {ratio}',
      'RHCOUHU': '{homeTeam} 小 {ratio}',
      'RHCOUCO': '{awayTeam} 大 {ratio}',
      'RHCOUCU': '{awayTeam} 小 {ratio}'
    },
    'sort': ['RHCOUHO', 'RHCOUHU', 'RHCOUCO', 'RHCOUCU']
  },
  'RWM': {
    'col': 2,
    "col188": 1,
    'text': {
      "RWMH12": "{homeTeam} 赢1-2分",
      "RWMH36": "{homeTeam} 赢3-6分",
      "RWMH79": "{homeTeam} 赢7-9分",
      "RWMH1013": "{homeTeam} 赢10-13分",
      "RWMH1416": "{homeTeam} 赢14-16分",
      "RWMH1720": "{homeTeam} 赢17-20分",
      "RWMH21OV": "{homeTeam} 赢21分以上",
      "RWMC12": "{awayTeam} 赢1-2分",
      "RWMC36": "{awayTeam} 赢3-6分",
      "RWMC79": "{awayTeam} 赢7-9分",
      "RWMC1013": "{awayTeam} 赢10-13分",
      "RWMC1416": "{awayTeam} 赢14-16分",
      "RWMC1720": "{awayTeam} 赢17-20分",
      "RWMC21OV": "{awayTeam} 赢21分以上",
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
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "EO_OT": {
    "col": 2,
    "text": {"EOO": "单", "EOE": "双"},
    "sort": ["EOO", "EOE"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "单", "REOE": "双"},
    "sort": ["REOO", "REOE"]
  },
   "ROUH_OT": {
    "col": 2,
    "text": {"ROUHO": "大 {ratio}", "ROUHU": "小 {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC_OT": {
    "col": 2,
    "text": {"ROUCO": "大 {ratio}", "ROUCU": "小 {ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "OUH_OT": {
    "col": 2,
    "text": {"OUHO": "大 {ratio}", "OUHU": "小 {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC_OT": {
    "col": 2,
    "text": {"OUCO": "大 {ratio}", "OUCU": "小 {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },

};
