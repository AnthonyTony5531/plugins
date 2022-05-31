// 棒球
const dynamic bsRadioTypes = {
  "MN": {
    "col": 3,
    "col188": 1,
    "text": {"MNH": "{homeTeam}", "MNN": "平", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNN", "MNC"]
  },
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
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
  "RES": {
    "col": 3,
    "col188": 1,
    "text": {
      "RES4": "0-4",
      "RES6": "5-6",
      "RES8": "7-8",
      "RES10": "9-10",
      "RES13": "11-13",
      "RES14": "14+"
    },
    "sort": ["RES4", "RES6", "RES8", "RES10", "RES13", "RES14"]
  },
  "HIS": {
    "col": 2,
    "col188": 1,
    "text": {
      "HIS1": "第1局",
      "HIS2": "第2局",
      "HIS3": "第3局",
      "HIS4": "第4局",
      "HIS5": "第5局",
      "HIS6": "第6局",
      "HIS7": "第7局",
      "HIS8": "第8局",
      "HIS9": "第9局",
      "HISN": "得分相同"
    },
    "sort": [
      "HIS1",
      "HIS2",
      "HIS3",
      "HIS4",
      "HIS5",
      "HIS6",
      "HIS7",
      "HIS8",
      "HIS9",
      "HISN"
    ]
  },
  "HOUH": {
    "col": 2,
    "text": {"HOUHO": "大 {ratio}", "HOUHU": "小 {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "大 {ratio}", "HOUCU": "小 {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "IM": {
    "col": 3,
    "col188": 1,
    "text": {"IMH": "{homeTeam}", "IMN": "平", "IMC": "{awayTeam}"},
    "sort": ["IMH", "IMN", "IMC"]
  },
  "IOU": {
    "col": 2,
    "text": {"IOUO": "大 {ratio}", "IOUU": "小 {ratio}"},
    "sort": ["IOUO", "IOUU"]
  },
  "IR": {
    "col": 2,
    "col188": 1,
    "text": {"IRH": "{homeTeam} {ratio}", "IRC": "{awayTeam} {ratio}"},
    "sort": ["IRH", "IRC"]
  },
  "IOUH": {
    "col": 2,
    "text": {"IOUHO": "大 {ratio}", "IOUHU": "小 {ratio}"},
    "sort": ["IOUHO", "IOUHU"]
  },
  "IOUC": {
    "col": 2,
    "text": {"IOUCO": "大 {ratio}", "IOUCU": "小 {ratio}"},
    "sort": ["IOUCO", "IOUCU"]
  },
  "WM1": {
    "col": 2,
    "col188": 1,
    "text": {
      "WM1H1": "{homeTeam} 贏1局",
      "WM1H2": "{homeTeam} 贏2局",
      "WM1H3": "{homeTeam} 贏3局以上",
      "WM1C1": "{awayTeam} 贏1局",
      "WM1C2": "{awayTeam} 贏2局",
      "WM1C3": "{awayTeam} 贏3局以上"
    },
    "sort": ['WM1H1', 'WM1C1', 'WM1H2', 'WM1C2', 'WM1H3', 'WM1C3']
  },
  "WM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMH1": "主隊 贏1球",
      "WMH2": "主隊 贏2球",
      "WMH3": "主隊 贏3球",
      "WMH4": "主隊 贏4球",
      "WMHOV": "主隊 贏4+",
      "WMC1": "客隊 贏1球",
      "WMC2": "客隊 贏2球",
      "WMC3": "客隊 贏3球",
      "WMC4": "客隊 贏4球",
      "WMCOV": "客隊 贏4+",
      "WMH0": "平"
    },
    "sort": [
      'WMH1',
      'WMC1',
      'WMH2',
      'WMC2',
      'WMH3',
      'WMC3',
      'WMH4',
      'WMC4',
      'WMHOV',
      'WMCOV',
      'WMH0'
    ]
  },
  "RWM": {
    "col": 2,
    "col188": 1,
    "text": {
      "RWMH1": '主隊 贏1球',
      "RWMH2": '主隊 贏2球',
      "RWMH3": '主隊 贏3球',
      "WMH1": '主隊 贏1球',
      "WMH2": '主隊 贏2球',
      "WMH3": '主隊 贏3球',
      "WMHOV": '主隊 贏4球或更多',
      "WMC1": '客隊 贏1球',
      "WMC2": '客隊 贏2球',
      "WMC3": '客隊 贏3球',
      "WMCOV": '客隊 贏4球或更多',
      "RWMH4": '客隊 贏4球',
      "RWMC1": '客隊 贏1球',
      "RWMC2": '客隊 贏2球',
      "RWMC3": '客隊 贏3球',
      "RWMC4": '客隊 贏4球',
      "RWMH0": "平"
    },
    "sort": [
      'RWMH1',
      'WMH1',
      'WMC1',
      'RWMC1',
      'RWMH2',
      'WMH2',
      'WMC2',
      'RWMC2',
      'RWMH3',
      'WMC3',
      'WMH3',
      'RWMC3',
      'RWMH4',
      'RWMC4',
      'WMHOV',
      'WMCOV',
      'RWMH0'
    ]
  },
  "HWM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HWMH1": "主隊 贏1球",
      "HWMH2": "主隊 贏2球",
      "HWMH3": "主隊 贏3球",
      "HWMH4": "主隊 贏4球",
      "HWMC1": "客隊 贏1球",
      "HWMC2": "客隊 贏2球",
      "HWMC3": "客隊 贏3球",
      "HWMC4": "客隊 贏4球",
      "HWMH0": "平"
    },
    "sort": [
      "HWMH1",
      "HWMH2",
      "HWMH3",
      "HWMH4",
      "HWMC1",
      "HWMC2",
      "HWMC3",
      "HWMC4",
      "HWMH0"
    ]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "是", "OTN": "否"},
    "sort": ["OTY", "OTN"]
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
  "HRUH": {
    "col": 2,
    "text": {"HOUHO": "大 {ratio}", "HOUHU": "小 {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HRUC": {
    "col": 2,
    "text": {"HOUCO": "大 {ratio}", "HOUCU": "小 {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "HRWM": {
    "col": 3,
    "col188": 1,
    "text": {
      "HRWMH1": "主隊 贏1球",
      "HRWMH2": "主隊 贏2球",
      "HRWMH3": "主隊 贏3球",
      "HRWMH4": "主隊 贏4球",
      "HRWMC1": "客隊 贏1球",
      "HRWMC2": "客隊 贏2球",
      "HRWMC3": "客隊 贏3球",
      "HRWMC4": "客隊 贏4球",
      "HRWMH0": "平"
    },
    "sort": [
      "HRWMH1",
      "HRWMH2",
      "HRWMH3",
      "HRWMH4",
      "HRWMC1",
      "HRWMC2",
      "HRWMC3",
      "HRWMC4",
      "HRWMH0"
    ]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "是", "ROTN": "否"},
    "sort": ["ROTY", "ROTN"]
  },
  "AEO": {
    "col": 2,
    "text": {"AEOO": "單", "AEOE": "雙"},
    "sort": ["AEOO", "AEOE"]
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
  'OUW3': {
    'col': 3,
    "col188": 1,
    'text': {'OUW3O': '大 {ratio}', 'OUW3E': '正好 {ratio}', 'OUW3U': '小 {ratio}'},
    'sort': ['OUW3O', 'OUW3E', 'OUW3U']
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "單",
      "TEOHE": "雙",
      "TEOCO": "單",
      "TEOCE": "雙"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
  },
  'AH': {
    'col': 2,
    "col188": 1,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': '大 {ratio}', 'AGH': '小 {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "HSQ": {
    "col": 3,
    "col188": 1,
    "text": {"HSQ1": "首5局", "HSQ2": "和局", "HSQ3": "其他賽局"},
    "sort": ["HSQ1", "HSQ2", "HSQ3"]
  },
  "HST": {
    "col": 3,
    "col188": 1,
    "text": {"HSTH": "{homeTeam}", "HSTN": "平局 ", "HSTC": "{awayTeam}"},
    "sort": ["HSTH", "HSTN", "HSTC"]
  },
  "ARG": {
    "col": 2,
    "text": {"ARGY": "是", "ARGN": "否"},
    "sort": ["ARGY", "ARGN"]
  },
  "TOU": {
    "col": 2,
    "col188": 1,
    "text": {
      "TOUHC": "{homeTeam} 大 {ratio}",
      "TOUHH": "{homeTeam} 小 {ratio}",
      "TOUCC": "{awayTeam} 大 {ratio}",
      "TOUCH": "{awayTeam} 小 {ratio}"
    },
    "sort": ["TOUHC", "TOUHH", "TOUCC", "TOUCH"]
  },
  "UA": {
    "col": 3,
    "col188": 1,
    "text": {"UAO": "大 {ratio}", "UAE": "正好 {ratio}", "UAU": "小 {ratio}"},
    "sort": ["UAO", "UAE", "UAU"]
  },
  "UB": {
    "col": 3,
    "col188": 1,
    "text": {"UBO": "大 {ratio}", "UBE": "正好 {ratio}", "UBU": "小 {ratio}"},
    "sort": ["UBO", "UBE", "UBU"]
  },
  "UC": {
    "col": 3,
    "col188": 1,
    "text": {"UCO": "大 {ratio}", "UCE": "正好 {ratio}", "UCU": "小 {ratio}"},
    "sort": ["UCO", "UCE", "UCU"]
  },
  "MA": {
    "col": 3,
    "col188": 1,
    "text": {"MAH": "{homeTeam}", "MAN": "平", "MAC": "{awayTeam}"},
    "sort": ["MAH", "MAN", "MAC"]
  },
  "MB": {
    "col": 3,
    "col188": 1,
    "text": {"MBH": "{homeTeam}", "MBN": "平", "MBC": "{awayTeam}"},
    "sort": ["MBH", "MBN", "MBC"]
  },
  "MC": {
    "col": 3,
    "col188": 1,
    "text": {"MCH": "{homeTeam}", "MCN": "平", "MCC": "{awayTeam}"},
    "sort": ["MCH", "MCN", "MCC"]
  },
  "MD": {
    "col": 3,
    "col188": 1,
    "text": {"MDH": "{homeTeam}", "MDN": "平", "MDC": "{awayTeam}"},
    "sort": ["MDH", "MDN", "MDC"]
  },
  "MLA": {
    "col": 2,
    "col188": 1,
    "text": {"MLAH": "{homeTeam}", "MLAC": "{awayTeam}"},
    "sort": ["MLAH", "MLAC"]
  },
  "MLB": {
    "col": 2,
    "col188": 1,
    "text": {"MLBH": "{homeTeam}", "MLBC": "{awayTeam}"},
    "sort": ["MLBH", "MLBC"]
  },
  "MLC": {
    "col": 2,
    "col188": 1,
    "text": {"MLCH": "{homeTeam}", "MLCC": "{awayTeam}"},
    "sort": ["MLCH", "MLCC"]
  },
  "TS": {
    "col": 2,
    "text": {"TSY": "是", "TSN": "否"},
    "sort": ["TSY", "TSN"]
  },
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {
      "DCHH": "主/主",
      "DCHC": "主/客",
      "DCHN": "主/和",
      "DCCC": "客/客",
      "DCCH": "客/主",
      "DCCN": "客/和",
      "DCNH": "和/主",
      "DCNC": "和/客",
      "DCNN": "和/和"
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
  "RWBO": {
    "col": 2,
    "text": {"RWBOY": "是", "RWBON": "否"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "單",
      "RTEOHE": "雙",
      "RTEOCO": "單",
      "RTEOCE": "雙"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
 
  "M2": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R2": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU2": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M1": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R1": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU1": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M4": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R4": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU4": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M6": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R6": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU6": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M8": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R8": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU8": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M9": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R9": {
    "col": 2,
    "col188": 1,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU9": {
    "col": 2,
    "text": {"ROUC": "大 {ratio}", "ROUH": "小 {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RTTG': {
    'col': 2,
    "col188": 1,
    'text': {
      'ROUHC': '{homeTeam} 大 {ratio}',
      'ROUHH': '{homeTeam} 小 {ratio}',
      'ROUCC': '{awayTeam} 大 {ratio}',
      'ROUCH': '{awayTeam} 小 {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'PPA': {
    'col': 3,
    "col188": 1,
    'text': {'PPAB': '上壘', 'PPAO': "平", 'PPAHR': '全壘打'},
    'sort': ['PPAB', 'PPAO', 'PPAHR']
  },
  'PATS': {
    'col': 2,
    'text': {'PATSY': '是', 'PATSN': '否'},
    'sort': ['PATSY', 'PATSN']
  },
  'NR': {
    'col': 3,
    "col188": 1,
    'text': {'NRH': '{homeTeam}', 'NRN': '沒有得分', 'NRA': '{awayTeam}'},
    'sort': ['NRH', 'NRN', 'NRA']
  },
  'FS': {
    'col': 2,
    "col188": 1,
    'text': {'FSH': '{homeTeam}', 'FSC': '{awayTeam}'},
    'sort': ['FSH', 'FSC']
  },
  'LS': {
    'col': 2,
    "col188": 1,
    'text': {'LSH': '{homeTeam}', 'LSC': '{awayTeam}'},
    'sort': ['LSH', 'LSC']
  },
  'PHR': {
    'col': 2,
    'text': {'PHRC': '大 {ratio}', 'PHRH': '小 {ratio}'},
    'sort': ['PHRC', 'PHRH']
  },
  'PSO': {
    'col': 2,
    'text': {'PSOC': '大 {ratio}', 'PSOH': '小 {ratio}'},
    'sort': ['PSOC', 'PSOH']
  },
  'PH': {
    'col': 2,
    'text': {'PHC': '大 {ratio}', 'PHH': '小 {ratio}'},
    'sort': ['PHC', 'PHH']
  },
  'PTB': {
    'col': 2,
    'text': {'PTBC': '大 {ratio}', 'PTBH': '小 {ratio}'},
    'sort': ['PTBC', 'PTBH']
  },
  'PHA': {
    'col': 2,
    'text': {'PHAC': '大 {ratio}', 'PHAH': '小 {ratio}'},
    'sort': ['PHAC', 'PHAH']
  },
  'PHRA': {
    'col': 2,
    'text': {'PHRAC': '大 {ratio}', 'PHRAH': '小 {ratio}'},
    'sort': ['PHRAC', 'PHRAH']
  },
  'PSOT': {
    'col': 2,
    'text': {'PSOTC': '大 {ratio}', 'PSOTH': '小 {ratio}'},
    'sort': ['PSOTC', 'PSOTH']
  },
  'OUA': {
    'col': 2,
    'text': {'OUAC': '大 {ratio}', 'OUAH': '小 {ratio}'},
    'sort': ['OUAC', 'OUAH']
  },
  'HTOU': {
    'col': 2,
    "col188": 1,
    'text': {
      'HTOUHC': '{homeTeam} 大 {ratio}',
      'HTOUHH': '{homeTeam} 小 {ratio}',
      'HTOUCC': '{awayTeam} 大 {ratio}',
      'HTOUCH': '{awayTeam} 小 {ratio}'
    },
    'sort': ['HTOUHC', 'HTOUHH', 'HTOUCC', 'HTOUCH']
  },
  'RW3': {
    'col': 3,
    "col188": 1,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': '平局 {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'F2G': {
    'col': 3,
    "col188": 1,
    'text': {'F2GH': '{homeTeam}', 'F2GN': '都不是', 'F2GC': '{awayTeam}'},
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    "col188": 1,
    'text': {'F3GH': '{homeTeam}', 'F3GN': '都不是', 'F3GC': '{awayTeam}'},
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'F4G': {
    'col': 3,
    "col188": 1,
    'text': {'F4GH': '{homeTeam}', 'F4GN': '都不是', 'F4GC': '{awayTeam}'},
    'sort': ['F4GH', 'F4GC', 'F4GN']
  },
  'F5G': {
    'col': 3,
    "col188": 1,
    'text': {'F5GH': '{homeTeam}', 'F5GN': '都不是', 'F5GC': '{awayTeam}'},
    'sort': ['F5GH', 'F5GC', 'F5GN']
  },
  'F6G': {
    'col': 3,
    "col188": 1,
    'text': {'F6GH': '{homeTeam}', 'F6GN': '都不是', 'F6GC': '{awayTeam}'},
    'sort': ['F6GH', 'F6GC', 'F6GN']
  },
  'F7G': {
    'col': 3,
    "col188": 1,
    'text': {'F7GH': '{homeTeam}', 'F7GN': '都不是', 'F7GC': '{awayTeam}'},
    'sort': ['F7GH', 'F7GC', 'F7GN']
  },
  'RM1': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM2': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM3': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM4': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM5': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM6': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM7': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM8': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': "平", 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RDC': {
    'col': 2,
    "col188": 1,
    'text': {
      'RDCHH': '主/主',
      'RDCHC': '主/客',
      'RDCCC': '客/客',
      'RDCCH': '客/主',
      'RDCNH': '和/主',
      'RDCNC': '和/客'
    },
    'sort': [
      'RDCHH',
      'RDCHC',
      'RDCCC',
      'RDCCH',
      'RDCNH',
      'RDCNC',
    ]
  },
  'ROUA': {
    'col': 2,
    'text': {'ROUAC': '大 {ratio}', 'ROUAH': '小 {ratio}'},
    'sort': ['ROUAC', 'ROUAH']
  },
  'ROUG': {
    'col': 2,
    'text': {'ROUGC': '大 {ratio}', 'ROUGH': '小 {ratio}'},
    'sort': ['ROUGC', 'ROUAH']
  },
  'ROUB': {
    'col': 2,
    'text': {'ROUBC': '大 {ratio}', 'ROUBH': '小 {ratio}'},
    'sort': ['ROUBC', 'ROUBH']
  },
  'ROUD': {
    'col': 2,
    'text': {'ROUDC': '大 {ratio}', 'ROUDH': '小 {ratio}'},
    'sort': ['ROUDC', 'ROUAH']
  },
  'ROUE': {
    'col': 2,
    'text': {'ROUEC': '大 {ratio}', 'ROUEH': '小 {ratio}'},
    'sort': ['ROUEC', 'ROUAH']
  },
  'ROUF': {
    'col': 2,
    'text': {'ROUFC': '大 {ratio}', 'ROUFH': '小 {ratio}'},
    'sort': ['ROUFC', 'ROUAH']
  },
  'RHIT': {
    'col': 2,
    'text': {'RHITOUC': '大 {ratio}', 'RHITOUH': '小 {ratio}'},
    'sort': ['RHITOUC', 'RHITOUH']
  },
};
