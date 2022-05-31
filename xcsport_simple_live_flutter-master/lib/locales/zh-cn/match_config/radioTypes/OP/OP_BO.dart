// 拳击
const dynamic op_boRadioTypes = {
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "MN": {
    "col": 2,
    "col188": 1,
    "text": {"MNH": "{homeTeam}", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNC"]
  },
  "WME": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMHK": "{homeTeam}通过KO取胜",
      "WMHD": "{homeTeam}通过判决取胜",
      "WMN": "平",
      "WMCK": "{awayTeam}通过KO取胜",
      "WMCD": "{awayTeam}通过判决取胜"
    },
    "sort": ["WMHK", "WMHD", "WMN", "WMCK", "WMCD"]
  },
  "WFD": {
    "col": 2,
    "col188": 1,
    "text": {"WFDY": "是", "WFDN": "否"},
    "sort": ["WFDY", "WFDN"]
  },
  "WER": {
    "col": 3,
    "col188": 1,
    "text": {
      "WERH1": "{homeTeam} 1回合",
      "WERH2": "{homeTeam} 2回合",
      "WERH3": "{homeTeam} 3回合",
      "WERH4": "{homeTeam} 4回合",
      "WERH5": "{homeTeam} 5回合",
      "WERH6": "{homeTeam} 6回合",
      "WERH7": "{homeTeam} 7回合",
      "WERH8": "{homeTeam} 8回合",
      "WERH9": "{homeTeam} 9回合",
      "WERH10": "{homeTeam} 10回合",
      "WERH11": "{homeTeam} 11回合",
      "WERH12": "{homeTeam} 12回合",
      "WERHD": "{homeTeam} 判决胜出",
      "WERN": "平",
      "WERC1": "{awayTeam} 1回合",
      "WERC2": "{awayTeam} 2回合",
      "WERC3": "{awayTeam} 3回合",
      "WERC4": "{awayTeam} 4回合",
      "WERC5": "{awayTeam} 5回合",
      "WERC6": "{awayTeam} 6回合",
      "WERC7": "{awayTeam} 7回合",
      "WERC8": "{awayTeam} 8回合",
      "WERC9": "{awayTeam} 9回合",
      "WERC10": "{awayTeam} 10回合",
      "WERC11": "{awayTeam} 11回合",
      "WERC12": "{awayTeam} 12回合",
      "WERCD": "{awayTeam} 判决胜出"
    },
    "sort": [
      "WERH1",
      "WERH2",
      "WERH3",
      "WERH4",
      "WERH5",
      "WERH6",
      "WERH7",
      "WERH8",
      "WERH9",
      "WERH10",
      "WERH11",
      "WERH12",
      "WERHD",
      "WERN",
      "WERC1",
      "WERC2",
      "WERC3",
      "WERC4",
      "WERC5",
      "WERC6",
      "WERC7",
      "WERC8",
      "WERC9",
      "WERC10",
      "WERC11",
      "WERC12",
      "WERCD"
    ]
  },
  "WRR": {
    "col": 2,
    "col188": 1,
    "text": {
      "WRRH0": "{homeTeam} 1-3回合",
      "WRRH1": "{homeTeam} 4-6回合",
      "WRRH2": "{homeTeam} 7-9回合",
      "WRRH3": "{homeTeam} 10-12回合",
      "WRRH4": "{homeTeam} 判决胜出",
      "WRRN5": "平",
      "WRRC6": "{awayTeam} 1-3回合",
      "WRRC7": "{awayTeam} 4-6回合",
      "WRRC8": "{awayTeam} 7-9回合",
      "WRRC9": "{awayTeam} 10-12回合",
      "WRRC0": "{awayTeam} 判决胜出"
    },
    "sort": [
      "WRRH0",
      "WRRH1",
      "WRRH2",
      "WRRH3",
      "WRRH4",
      "WRRN5",
      "WRRC6",
      "WRRC7",
      "WRRC8",
      "WRRC9",
      "WRRC0"
    ]
  },
  "WVM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WVHK": "主队通过击倒、技术击倒、对方取消资格或对方降服而胜出",
      "WVHD": "主队通过判决而胜出",
      "WVCK": "客队通过击倒、技术击倒、对方取消资格或对方降服而胜出",
      "WVCD": "客队通过判决而胜出",
      "WVN": "平局或技术平局"
    },
    "sort": ["WVHK", "WVHD", "WVCK", "WVCD", "WVN"]
  },
  "WERB": {
    "col": 2,
    "col188": 1,
    "text": {
      "WERBH1": "主队在第1回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH2": "主队在第2回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH3": "主队在第3回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH4": "主队在第4回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH5": "主队在第5回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH6": "主队在第6回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH7": "主队在第7回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH8": "主队在第8回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH9": "主队在第9回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH10": "主队在第10回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH11": "主队在第11回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH12": "主队在第12回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC1": "客队在第1回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC2": "客队在第2回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC3": "客队在第3回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC4": "客队在第4回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC5": "客队在第5回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC6": "客队在第6回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC7": "客队在第7回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC8": "客队在第8回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC9": "客队在第9回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC10": "客队在第10回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC11": "客队在第11回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC12": "客队在第12回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBHD": "主队通过判决而胜出",
      "WERBCD": "客队通过判决而胜出",
      "WERBN": "平局或技术平局"
    },
    "sort": [
      "WERBH1",
      "WERBH2",
      "WERBH3",
      "WERBH4",
      "WERBH5",
      "WERBH6",
      "WERBH7",
      "WERBH8",
      "WERBH9",
      "WERBH10",
      "WERBH11",
      "WERBH12",
      "WERBC1",
      "WERBC2",
      "WERBC3",
      "WERBC4",
      "WERBC5",
      "WERBC6",
      "WERBC7",
      "WERBC8",
      "WERBC9",
      "WERBC10",
      "WERBC11",
      "WERBC12",
      "WERBHD",
      "WERBCD",
      "WERBN"
    ]
  },
  "WERB2": {
    "col": 1,
    "col188": 1,
    "text": {
      "WERBH1": "主队在第1回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH2": "主队在第2回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBH3": "主队在第3回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC1": "客队在第1回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC2": "客队在第2回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBC3": "客队在第3回合通过击倒、技术击倒或对方放弃而胜出",
      "WERBN": "平局或技术平局"
    },
    "sort": [
      "WERBH1",
      "WERBH2",
      "WERBH3",
      "WERBC1",
      "WERBC2",
      "WERBC3",
      "WERBN"
    ]
  },
  "DC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RD1": "第1回合",
      "RD2": "第2回合",
      "RD3": "第3回合",
      "RD4": "第4回合",
      "RD5": "第5回合",
      "RDP": "分数"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  "WFO": {
    "col": 2,
    "col188": 1,
    "text": {"WFOK": "击倒/技术击倒", "WFOY": "降伏", "WFOP": "分数"},
    "sort": ["WFOK", "WFOY", "WFOP"]
  },
  "WRD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RD1": "第1回合",
      "RD2": "第2回合",
      "RD3": "第3回合",
      "RD4": "第4回合",
      "RD5": "第5回合",
      "RDP": "分数"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  'RBW': {
    'col': 1,
    'text': {
      'RBWH1': '{homeTeam}在第1回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWH2': '{homeTeam}在第2回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWH3': '{homeTeam}在第3回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWH4': '{homeTeam}在第4回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWH5': '{homeTeam}在第5回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWHD': '{homeTeam}通过判决胜出',
      'RBWC1': '{awayTeam}在第1回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWC2': '{awayTeam}在第2回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWC3': '{awayTeam}在第3回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWC4': '{awayTeam}在第4回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWC5': '{awayTeam}在第5回合通过击倒、技术击倒或对方放弃而胜出',
      'RBWCD': '{awayTeam}通过判决胜出',
      'RBWN': '平局或技术平局'
    },
    'sort': [
      'RBWH1',
      'RBWH2',
      'RBWH3',
      'RBWH4',
      'RBWH5',
      'RBWHD',
      'RBWC1',
      'RBWC2',
      'RBWC3',
      'RBWC4',
      'RBWC5',
      'RBWCD',
      'RBWN'
    ]
  },
  "MV": {
    "col": 2,
    "col188": 1,
    "text": {
      "MVHK": "{homeTeam}以击倒/技术击倒/对手犯规获胜",
      "MVHS": "{homeTeam}通过对方降伏获胜",
      "MVHP": "{homeTeam}以得分获胜",
      "MVN": "平",
      "MVCK": "{awayTeam}通过KO取胜",
      "MVCS": "{awayTeam}通过对方降伏获胜",
      "MVCP": "{awayTeam}以得分获胜"
    },
    "sort": ['MVHK', 'MVCK', 'MVHS', 'MVCS', 'MVHP', 'MVCP', 'MVN']
  },
  "FD": {
    "col": 2,
    "text": {"FDY": "是", "FDN": "否"},
    "sort": ["FDY", "FDN"]
  },
  'AG': {
    'col': 2,
    'text': {'AGC': '大 {ratio}', 'AGH': '小 {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "WC": {
    "col": 1,
    "col188": 1,
    "text": {
      "WCHK1": "{homeTeam}在第1回合以击倒/技术击倒/对手犯规获胜",
      "WCHK2": "{homeTeam}在第2回合以击倒/技术击倒/对手犯规获胜",
      "WCHK3": "{homeTeam}在第3回合以击倒/技术击倒/对手犯规获胜",
      "WCHK4": "{homeTeam}在第4回合以击倒/技术击倒/对手犯规获胜",
      "WCHK5": "{homeTeam}在第5回合以击倒/技术击倒/对手犯规获胜",
      "WCHS1": "{homeTeam}在第1回合通过对方降伏获胜",
      "WCHS2": "{homeTeam}在第2回合通过对方降伏获胜",
      "WCHS3": "{homeTeam}在第3回合通过对方降伏获胜",
      "WCHS4": "{homeTeam}在第4回合通过对方降伏获胜",
      "WCHS5": "{homeTeam}在第5回合通过对方降伏获胜",
      "WCCK1": "{awayTeam}在第1回合以击倒/技术击倒/对手犯规获胜",
      "WCCK2": "{awayTeam}在第2回合以击倒/技术击倒/对手犯规获胜",
      "WCCK3": "{awayTeam}在第3回合以击倒/技术击倒/对手犯规获胜",
      "WCCK4": "{awayTeam}在第4回合以击倒/技术击倒/对手犯规获胜",
      "WCCK5": "{awayTeam}在第5回合以击倒/技术击倒/对手犯规获胜",
      "WCCS1": "{awayTeam}在第1回合通过对方降伏获胜",
      "WCCS2": "{awayTeam}在第2回合通过对方降伏获胜",
      "WCCS3": "{awayTeam}在第3回合通过对方降伏获胜",
      "WCCS4": "{awayTeam}在第4回合通过对方降伏获胜",
      "WCCS5": "{awayTeam}在第5回合通过对方降伏获胜",
      "WCF": "平局或技术平局"
    },
    "sort": [
      "WCHK1",
      "WCHK2",
      "WCHK3",
      "WCHK4",
      "WCHK5",
      "WCHS1",
      "WCHS2",
      "WCHS3",
      "WCHS4",
      "WCHS5",
      "WCCK1",
      "WCCK2",
      "WCCK3",
      "WCCK4",
      "WCCK5",
      "WCCS1",
      "WCCS2",
      "WCCS3",
      "WCCS4",
      "WCCS5",
      "WCF"
    ]
  },
  "T2R": {
    "col": 2,
    "text": {"T2RY": "是", "T2RN": "否"},
    "sort": ["T2RY", "T2RN"]
  },
  "T3R": {
    "col": 2,
    "text": {"T3RY": "是", "T3RN": "否"},
    "sort": ["T3RY", "T3RN"]
  },
  "T4R": {
    "col": 2,
    "text": {"T4RY": "是", "T4RN": "否"},
    "sort": ["T4RY", "T4RN"]
  },
  "T5R": {
    "col": 2,
    "text": {"T5RY": "是", "T5RN": "否"},
    "sort": ["T5RY", "T5RN"]
  },
  "HWM": {
    "col": 2,
    "text": {"HWMY": "是", "HWMN": "否"},
    "sort": ["HWMY", "HWMN"]
  },
  "CWM": {
    "col": 2,
    "text": {"CWMY": "是", "CWMN": "否"},
    "sort": ["CWMY", "CWMN"]
  },
  'END': {
    'col': 2,
    'text': {'ENDY': '是', 'ENDN': '否'},
    'sort': ['ENDY', 'ENDN']
  },
  "WTO": {
    "col": 1,
    "col188": 1,
    "text": {
      "WTOHA": "{homeTeam}获胜&总回合数大于0.5",
      "WTOHB": "{homeTeam}获胜&总回合数大于1.5",
      "WTOHC": "{homeTeam}获胜&总回合数大于2.5",
      "WTOHD": "{homeTeam}获胜&总回合数大于3.5",
      "WTOHE": "{homeTeam}获胜&总回合数大于4.5",
      "WTOCA": "{awayTeam}获胜&总回合数大于0.5",
      "WTOCB": "{awayTeam}获胜&总回合数大于1.5",
      "WTOCC": "{awayTeam}获胜&总回合数大于2.5",
      "WTOCD": "{awayTeam}获胜&总回合数大于3.5",
      "WTOCE": "{awayTeam}获胜&总回合数大于4.5"
    },
    "sort": [
      "WTOHA",
      "WTOHB",
      "WTOHC",
      "WTOHD",
      "WTOHE",
      "WTOCA",
      "WTOCB",
      "WTOCC",
      "WTOCD",
      "WTOCE"
    ]
  },
  'WTU': {
    'col': 1,
    'text': {
      'WTUHA': '{homeTeam}获胜&总回合数小于0.5',
      'WTUHB': '{homeTeam}获胜&总回合数小于1.5',
      'WTUHC': '{homeTeam}获胜&总回合数小于2.5',
      'WTUHD': '{homeTeam}获胜&总回合数小于3.5',
      'WTUHE': '{homeTeam}获胜&总回合数小于4.5',
      'WTUCA': '{awayTeam}获胜&总回合数小于0.5',
      'WTUCB': '{awayTeam}获胜&总回合数小于1.5',
      'WTUCC': '{awayTeam}获胜&总回合数小于2.5',
      'WTUCD': '{awayTeam}获胜&总回合数小于3.5',
      'WTUCE': '{awayTeam}获胜&总回合数小于4.5'
    },
    'sort': [
      'WTUHA',
      'WTUHB',
      'WTUHC',
      'WTUHD',
      'WTUHE',
      'WTUCA',
      'WTUCB',
      'WTUCC',
      'WTUCD',
      'WTUCE'
    ]
  },
  "WT": {
    "col": 1,
    "text": {
      "WT1": "第1回合在第1分钟(00:00-01:59)分出胜负",
      "WT2": "第1回合在第2分钟(02:00-02:59)分出胜负",
      "WT3": "第1回合在第3分钟(03:00-03:59)分出胜负",
      "WT4": "第1回合在第4分钟(04:00-04:59)分出胜负",
      "WT5": "第1回合在第4分钟以后分出胜负",
      "WT6": "第2回合在第1分钟(00:00-01:59)分出胜负",
      "WT7": "第2回合在第2分钟(02:00-02:59)分出胜负",
      "WT8": "第2回合在第3分钟(03:00-03:59)分出胜负",
      "WT9": "第2回合在第4分钟(04:00-04:59)分出胜负",
      "WT10": "第2回合在第4分钟以后分出胜负",
      "WT11": "第3回合在第1分钟(00:00-01:59)分出胜负",
      "WT12": "第3回合在第2分钟(02:00-02:59)分出胜负",
      "WT13": "第3回合在第3分钟(03:00-03:59)分出胜负",
      "WT14": "第3回合在第4分钟(04:00-04:59)分出胜负",
      "WT15": "第3回合在第4分钟以后分出胜负",
      "WT16": "第4回合在第1分钟(00:00-01:59)分出胜负",
      "WT17": "第4回合在第2分钟(02:00-02:59)分出胜负",
      "WT18": "第4回合在第3分钟(03:00-03:59)分出胜负",
      "WT19": "第4回合在第4分钟(04:00-04:59)分出胜负",
      "WT20": "第4回合在第4分钟以后分出胜负",
      "WT21": "第5回合在第1分钟(00:00-01:59)分出胜负",
      "WT22": "第5回合在第2分钟(02:00-02:59)分出胜负",
      "WT23": "第5回合在第3分钟(03:00-03:59)分出胜负",
      "WT24": "第5回合在第4分钟(04:00-04:59)分出胜负",
      "WT25": "第5回合在第4分钟以后分出胜负",
      "WT26": "完成所有回合"
    },
    "sort": [
      "WT1",
      "WT2",
      "WT3",
      "WT4",
      "WT5",
      "WT6",
      "WT7",
      "WT8",
      "WT9",
      "WT10",
      "WT11",
      "WT12",
      "WT13",
      "WT14",
      "WT15",
      "WT16",
      "WT17",
      "WT18",
      "WT19",
      "WT20",
      "WT21",
      "WT22",
      "WT23",
      "WT24",
      "WT25",
      "WT26"
    ]
  },
  "WM": {
    "col": 1,
    "text": {"WM1": "击倒/技术击倒/对手犯规", "WM2": "降伏", "WM3": "得分", "WM4": "和局"},
    "sort": ["WM1", "WM2", "WM3", "WM4"]
  },
  "WDC": {
    "col": 1,
    "text": {
      "WDCA": "击倒,技术击倒,对手犯规/降伏",
      "WDCB": "降伏/得分",
      "WDCC": "击倒,技术击倒,对手犯规/得分"
    },
    "sort": ["WDCA", "WDCB", "WDCC"]
  },
  'TMW': {
    'col': 3,
    "col188": 1,
    'text': {'TMWH': '{homeTeam}', 'TMWC': '{awayTeam}', 'TMWN': '和局'},
    'sort': ['TMWH', 'TMWC', 'TMWN']
  },
  'MBOA': {
    'col': 3,
    "col188": 1,
    'text': {'MBOAH': '{homeTeam}', 'MBOAC': '{awayTeam}', 'MBOAN': '和局'},
    'sort': ['MBOAH', 'MBOAC', 'MBOAN']
  },
  "TD": {
    "col": 2,
    "col188": 1,
    "text": {"TDH": "{homeTeam}", "TDC": "{awayTeam}"},
    "sort": ["TDH", "TDC"]
  },
  "TM": {
    "col": 2,
    "col188": 1,
    "text": {"TMH": "{homeTeam}", "TMC": "{awayTeam}"},
    "sort": ["TMH", "TMC"]
  },
  'DA': {
    'col': 1,
    'text': {'DAY': '是'},
    'sort': ['DAY']
  },
  'UDA': {
    'col': 1,
    'text': {'UDAY': '是'},
    'sort': ['UDAY']
  },
  'UDB': {
    'col': 1,
    'text': {'UDBY': '是'},
    'sort': ['UDBY']
  },
  'DMA': {
    'col': 1,
    'text': {'DMAY': '是'},
    'sort': ['DMAY']
  },
  'DMB': {
    'col': 1,
    'text': {'DMBY': '是'},
    'sort': ['DMBY']
  },
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
 
};
