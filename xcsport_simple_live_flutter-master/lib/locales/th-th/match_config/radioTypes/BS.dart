// เบสบอล
const dynamic bsRadioTypes = {
  "MN": {
    "col": 3,
    "text": {"MNH": "{homeTeam}", "MNN": "เกมส์เสมอ", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNN", "MNC"]
  },
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "สูง{ratio}", "OUHU": "ต่ำ{ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "สูง{ratio}", "OUCU": "ต่ำ {ratio}"},
    "sort": ["OUCO", "OUCU"]
  },
  "RES": {
    "col": 3,
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
    "text": {
      "HIS1": "ตาที่1",
      "HIS2": "ตาที่2",
      "HIS3": "ตาที่3",
      "HIS4": "ตาที่4",
      "HIS5": "ตาที่5",
      "HIS6": "ตาที่6",
      "HIS7": "ตาที่7",
      "HIS8": "ตาที่8",
      "HIS9": "ตาที่9",
      "HISN": "ได้คะแนนเท่ากัน"
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
    "text": {"HOUHO": "สูง {ratio}", "HOUHU": "ต่ำ {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "สูง {ratio}", "HOUCU": "ต่ำ {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "IM": {
    "col": 3,
    "text": {"IMH": "{homeTeam}", "IMN": "เสมอ", "IMC": "{awayTeam}"},
    "sort": ["IMH", "IMN", "IMC"]
  },
  "IOU": {
    "col": 2,
    "text": {"IOUO": "สูง {ratio}", "IOUU": "ต่ำ {ratio}"},
    "sort": ["IOUO", "IOUU"]
  },
  "IR": {
    "col": 2,
    "text": {"IRH": "{homeTeam} {ratio}", "IRC": "{awayTeam} {ratio}"},
    "sort": ["IRH", "IRC"]
  },
  "IOUH": {
    "col": 2,
    "text": {"IOUHO": "สูง {ratio}", "IOUHU": "ต่ำ {ratio}"},
    "sort": ["IOUHO", "IOUHU"]
  },
  "IOUC": {
    "col": 2,
    "text": {"IOUCO": "สูง {ratio}", "IOUCU": "ต่ำ {ratio}"},
    "sort": ["IOUCO", "IOUCU"]
  },
  "WM1": {
    "col": 2,
    "text": {
      "WM1H1": "{homeTeam} ชนะ1ตา",
      "WM1H2": "{homeTeam} ชนะ2ตา",
      "WM1H3": "{homeTeam} ชนะ3ตาขึ้นไป",
      "WM1C1": "{awayTeam} ชนะ1ตา",
      "WM1C2": "{awayTeam} ชนะ2ตา",
      "WM1C3": "{awayTeam} ชนะ3ตาขึ้นไป"
    },
    "sort": ['WM1H1', 'WM1C1', 'WM1H2', 'WM1C2', 'WM1H3', 'WM1C3']
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "ทีมเจ้าบ้าน ชนะ1ลูก",
      "WMH2": "ทีมเจ้าบ้าน ชนะ2ลูก",
      "WMH3": "ทีมเจ้าบ้าน ชนะ3ลูก",
      "WMH4": "ทีมเจ้าบ้าน ชนะ4ลูก",
      "WMHOV": "ทีมเจ้าบ้าน ชนะ4+",
      "WMC1": "ทีมเยือน ชนะ1ลูก",
      "WMC2": "ทีมเยือน ชนะ2ลูก",
      "WMC3": "ทีมเยือน ชนะ3ลูก",
      "WMC4": "ทีมเยือนชนะ4ลูก",
      "WMCOV": "ทีมเยือน ชนะ4+",
      "WMH0": "เสมอ"
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
    "text": {
      "RWMH1": 'ทีมเจ้าบ้าน ชนะ1ลูก',
      "RWMH2": 'ทีมเจ้าบ้าน ชนะ2ลูก',
      "RWMH3": 'ทีมเจ้าบ้าน ชนะ3ลูก',
      "WMH1": 'ทีมเจ้าบ้าน ชนะ1ลูก',
      "WMH2": 'ทีมเจ้าบ้าน ชนะ2ลูก',
      "WMH3": 'ทีมเจ้าบ้าน ชนะ3ลูก',
      "WMHOV": 'ทีมเจ้าบ้าน ชนะ4ลูกหรือม่กกว่า',
      "WMC1": 'ทีมเยือน ชนะ1ลูก',
      "WMC2": 'ทีมเยือน ชนะ2ลูก',
      "WMC3": 'ทีมเยือน ชนะ3ลูก',
      "WMCOV": 'ทีมเยือน ชนะ4ลูกหรือมากกว่า',
      "RWMH4": 'ทีมเยือน ชนะ4ลูก',
      "RWMC1": 'ทีมเยือน ชนะ1ลูก',
      "RWMC2": 'ทีมเยือน ชนะ2ลูก',
      "RWMC3": 'ทีมเยือน ชนะ3ลูก',
      "RWMC4": 'ทีมเยือน ชนะ4ลูก',
      "RWMH0": 'เสมอ'
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
    "text": {
      "HWMH1": "ทีมเจ้าบ้าน ชนะ1ลูก",
      "HWMH2": "ทีมเจ้าบ้าน ชนะ2ลูก",
      "HWMH3": "ทีมเจ้าบ้าน ชนะ3ลูก",
      "HWMH4": "ทีมเจ้าบ้าน ชนะ4ลูก",
      "HWMC1": "ทีมเยือน ชนะ1ลูก",
      "HWMC2": "ทีมเยือน ชนะ2ลูก",
      "HWMC3": "ทีมเยือน ชนะ3ลูก",
      "HWMC4": "ทีมเยือน ชนะ4ลูก",
      "HWMH0": "เสมอ"
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
    "text": {"OTY": "ใช่", "OTN": "ไม่่"},
    "sort": ["OTY", "OTN"]
  },
  "ROUH": {
    "col": 2,
    "text": {"ROUHO": "สูง {ratio}", "ROUHU": "ต่ำ {ratio}"},
    "sort": ["ROUHO", "ROUHU"]
  },
  "ROUC": {
    "col": 2,
    "text": {"ROUCO": "สูง {ratio}", "ROUCU": "ต่ำ{ratio}"},
    "sort": ["ROUCO", "ROUCU"]
  },
  "HRUH": {
    "col": 2,
    "text": {"HOUHO": "สูง {ratio}", "HOUHU": "ต่ำ {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HRUC": {
    "col": 2,
    "text": {"HOUCO": "สูง {ratio}", "HOUCU": "ต่ำ {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "HRWM": {
    "col": 3,
    "text": {
      "HRWMH1": "ทีมเจ้าบ้าน ชนะ1ลูก",
      "HRWMH2": "ทีมเจ้าบ้าน ชนะ2ลูก",
      "HRWMH3": "ทีมเจ้าบ้าน ชนะ3ลูก",
      "HRWMH4": "ทีมเจ้าบ้าน ชนะ4ลูก",
      "HRWMC1": "ทีมเยือน ชนะ1ลูก",
      "HRWMC2": "ทีมเยือน ชนะ2ลูก",
      "HRWMC3": "ทีมเยือน ชนะ3ลูก",
      "HRWMC4": "ทีมเยือน ชนะ4ลูก",
      "HRWMH0": "เสมอ"
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
    "text": {"ROTY": "ใช่", "ROTN": "ไม่"},
    "sort": ["ROTY", "ROTN"]
  },
  "AEO": {
    "col": 2,
    "text": {"AEOO": "คี่", "AEOE": "คู่"},
    "sort": ["AEOO", "AEOE"]
  },
  "W3": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "เสมอ {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  'OUW3': {
    'col': 3,
    'text': {'OUW3O': 'สูง {ratio}', 'OUW3E': 'พอดี {ratio}', 'OUW3U': 'ต่ำ {ratio}'},
    'sort': ['OUW3O', 'OUW3E', 'OUW3U']
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "คี่",
      "TEOHE": "คู่",
      "TEOCO": "คี่",
      "TEOCE": "คู่"
    },
    "sort": ["TEOHO", "TEOHE", "TEOCO", "TEOCE"]
  },
  'AH': {
    'col': 2,
    'text': {'AHH': '{homeTeam} {ratio}', 'AHC': '{awayTeam} {ratio}'},
    'sort': ['AHH', 'AHC']
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'ใหญ่ {ratio}', 'AGH': 'เล็ก {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "HSQ": {
    "col": 3,
    "text": {"HSQ1": "5รอบแรก", "HSQ2": "เสมอ", "HSQ3": "เกมส์อื่นๆ"},
    "sort": ["HSQ1", "HSQ2", "HSQ3"]
  },
  "HST": {
    "col": 3,
    "text": {"HSTH": "{homeTeam}", "HSTN": "เสมอ ", "HSTC": "{awayTeam}"},
    "sort": ["HSTH", "HSTN", "HSTC"]
  },
  "ARG": {
    "col": 2,
    "text": {"ARGY": "ใช่", "ARGN": "ไม่"},
    "sort": ["ARGY", "ARGN"]
  },
  "TOU": {
    "col": 2,
    "text": {
      "TOUHC": "{homeTeam} สูง {ratio}",
      "TOUHH": "{homeTeam} ต่ำ {ratio}",
      "TOUCC": "{awayTeam} สูง {ratio}",
      "TOUCH": "{awayTeam} ต่ำ {ratio}"
    },
    "sort": ["TOUHC", "TOUHH", "TOUCC", "TOUCH"]
  },
  "UA": {
    "col": 3,
    "text": {"UAO": "สูง {ratio}", "UAE": "พอดี {ratio}", "UAU": "เลยเวลาการหยุดทำธุรกรรม {ratio}"},
    "sort": ["UAO", "UAE", "UAU"]
  },
  "UB": {
    "col": 3,
    "text": {"UBO": "สูง {ratio}", "UBE": "พอดี{ratio}", "UBU": "ต่ำ {ratio}"},
    "sort": ["UBO", "UBE", "UBU"]
  },
  "UC": {
    "col": 3,
    "text": {"UCO": "สูง {ratio}", "UCE": "พอดี {ratio}", "UCU": "ต่ำ {ratio}"},
    "sort": ["UCO", "UCE", "UCU"]
  },
  "MA": {
    "col": 3,
    "text": {"MAH": "{homeTeam}", "MAN": "เกมส์เสมอ", "MAC": "{awayTeam}"},
    "sort": ["MAH", "MAN", "MAC"]
  },
  "MB": {
    "col": 3,
    "text": {"MBH": "{homeTeam}", "MBN": "เสมอ", "MBC": "{awayTeam}"},
    "sort": ["MBH", "MBN", "MBC"]
  },
  "MC": {
    "col": 3,
    "text": {"MCH": "{homeTeam}", "MCN": "เสมอ", "MCC": "{awayTeam}"},
    "sort": ["MCH", "MCN", "MCC"]
  },
  "MD": {
    "col": 3,
    "text": {"MDH": "{homeTeam}", "MDN": "เสมอ", "MDC": "{awayTeam}"},
    "sort": ["MDH", "MDN", "MDC"]
  },
  "MLA": {
    "col": 2,
    "text": {"MLAH": "{homeTeam}", "MLAC": "{awayTeam}"},
    "sort": ["MLAH", "MLAC"]
  },
  "MLB": {
    "col": 2,
    "text": {"MLBH": "{homeTeam}", "MLBC": "{awayTeam}"},
    "sort": ["MLBH", "MLBC"]
  },
  "MLC": {
    "col": 2,
    "text": {"MLCH": "{homeTeam}", "MLCC": "{awayTeam}"},
    "sort": ["MLCH", "MLCC"]
  },
  "TS": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "DC": {
    "col": 3,
    "text": {
      "DCHH": "เจ้าบ้าน/เจ้าบ้าน",
      "DCHC": "เจ้าบ้าน/ทีมเยือน",
      "DCHN": "เจ้าบ้าน/ทีมรวม",
      "DCCC": "ทีมเยือน/ทีมเยือน",
      "DCCH": "ทีมเยือน/เจ้าบ้าน",
      "DCCN": "ทีมเยือน/ทีมรวม",
      "DCNH": "ทีมรวม/เจ้าบ้าน",
      "DCNC": "ทีมรวม/ทีมเยือน",
      "DCNN": "ทีมรวม/ทีมรวม"
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
    "text": {"RWBOY": "ใช่", "RWBON": "ไม่"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "คี่",
      "RTEOHE": "{homeTeam} คุ่",
      "RTEOCO": "คี่",
      "RTEOCE": "คู่"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
  "M2": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R2": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU2": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M1": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R1": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU1": {
    "col": 2,
    "text": {"ROUC": "สูง{ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M4": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R4": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU4": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M6": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R6": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU6": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M8": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R8": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU8": {
    "col": 2,
    "text": {"ROUC": "ใหญ่ {ratio}", "ROUH": "เล็ก {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "M9": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "R9": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "OU9": {
    "col": 2,
    "text": {"ROUC": "ต่ำ{ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RTTG': {
    'col': 2,
    'text': {
      'ROUHC': '{homeTeam} สูง {ratio}',
      'ROUHH': '{homeTeam} ต่ำ{ratio}',
      'ROUCC': '{awayTeam} สูง {ratio}',
      'ROUCH': '{awayTeam} ต่ำ {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'PPA': {
    'col': 3,
    'text': {'PPAB': 'บนฐาน', 'PPAO': 'เสมอ', 'PPAHR': 'โฮมรัน'},
    'sort': ['PPAB', 'PPAO', 'PPAHR']
  },
  'PATS': {
    'col': 2,
    'text': {'PATSY': 'ใช่', 'PATSN': 'ไม่'},
    'sort': ['PATSY', 'PATSN']
  },
  'NR': {
    'col': 3,
    'text': {'NRH': '{homeTeam}', 'NRN': 'ไม่ได้คะแนน', 'NRA': '{awayTeam}'},
    'sort': ['NRH', 'NRN', 'NRA']
  },
  'FS': {
    'col': 2,
    'text': {'FSH': '{homeTeam}', 'FSC': '{awayTeam}'},
    'sort': ['FSH', 'FSC']
  },
  'LS': {
    'col': 2,
    'text': {'LSH': '{homeTeam}', 'LSC': '{awayTeam}'},
    'sort': ['LSH', 'LSC']
  },
  'PHR': {
    'col': 2,
    'text': {'PHRC': 'ใหญ่ {ratio}', 'PHRH': 'เล็ก{ratio}'},
    'sort': ['PHRC', 'PHRH']
  },
  'PSO': {
    'col': 2,
    'text': {'PSOC': 'สูง {ratio}', 'PSOH': 'ต่ำ {ratio}'},
    'sort': ['PSOC', 'PSOH']
  },
  'PH': {
    'col': 2,
    'text': {'PHC': 'สูง {ratio}', 'PHH': 'ต่ำ {ratio}'},
    'sort': ['PHC', 'PHH']
  },
  'PTB': {
    'col': 2,
    'text': {'PTBC': 'สูง {ratio}', 'PTBH': 'ต่ำ{ratio}'},
    'sort': ['PTBC', 'PTBH']
  },
  'PHA': {
    'col': 2,
    'text': {'PHAC': 'สูง {ratio}', 'PHAH': 'ต่ำ1 {ratio}'},
    'sort': ['PHAC', 'PHAH']
  },
  'PHRA': {
    'col': 2,
    'text': {'PHRAC': 'สูง {ratio}', 'PHRAH': 'ต่ำ {ratio}'},
    'sort': ['PHRAC', 'PHRAH']
  },
  'PSOT': {
    'col': 2,
    'text': {'PSOTC': 'สูง {ratio}', 'PSOTH': 'ต่ำ {ratio}'},
    'sort': ['PSOTC', 'PSOTH']
  },
  'OUA': {
    'col': 2,
    'text': {'OUAC': 'สูง {ratio}', 'OUAH': 'ต่ำ {ratio}'},
    'sort': ['OUAC', 'OUAH']
  },
  'HTOU': {
    'col': 2,
    'text': {
      'HTOUHC': '{homeTeam} สูง{ratio}',
      'HTOUHH': '{homeTeam} ต่ำ {ratio}',
      'HTOUCC': '{awayTeam} สูง {ratio}',
      'HTOUCH': '{awayTeam} ต่ำ {ratio}'
    },
    'sort': ['HTOUHC', 'HTOUHH', 'HTOUCC', 'HTOUCH']
  },
  'RW3': {
    'col': 3,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'เสมอ {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'F2G': {
    'col': 3,
    'text': {'F2GH': '{homeTeam}', 'F2GN': 'ไม่ใช่ทั้งหมด', 'F2GC': '{awayTeam}'},
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    'text': {'F3GH': '{homeTeam}', 'F3GN': 'ไม่ใช่ทั้งหมด', 'F3GC': '{awayTeam}'},
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'F4G': {
    'col': 3,
    'text': {'F4GH': '{homeTeam}', 'F4GN': 'ไม่ใช่ทั้งหมด', 'F4GC': '{awayTeam}'},
    'sort': ['F4GH', 'F4GC', 'F4GN']
  },
  'F5G': {
    'col': 3,
    'text': {'F5GH': '{homeTeam}', 'F5GN': 'ไม่ใช่ทั้งหมด', 'F5GC': '{awayTeam}'},
    'sort': ['F5GH', 'F5GC', 'F5GN']
  },
  'F6G': {
    'col': 3,
    'text': {'F6GH': '{homeTeam}', 'F6GN': 'ไม่ใช่ทั้งหมด', 'F6GC': '{awayTeam}'},
    'sort': ['F6GH', 'F6GC', 'F6GN']
  },
  'F7G': {
    'col': 3,
    'text': {'F7GH': '{homeTeam}', 'F7GN': 'ไม่ใช่ทั้งหมด', 'F7GC': '{awayTeam}'},
    'sort': ['F7GH', 'F7GC', 'F7GN']
  },
  'RM1': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM2': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM3': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM4': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM5': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM6': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM7': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM8': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RDC': {
    'col': 2,
    'text': {
      'RDCHH': 'เจ้าบ้าน/เจ้าบ้าน',
      'RDCHC': 'เจ้าบ้าน/ทีมเยือน',
      'RDCCC': 'ทีมเยือน/ทีมเยือน',
      'RDCCH': 'ทีมเยือน/เจ้าบ้าน',
      'RDCNH': 'ทีมรวม/เจ้าบ้าน',
      'RDCNC': 'ทีมรวม/ทีมเยือน'
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
    'text': {'ROUAC': 'สูง {ratio}', 'ROUAH': 'ต่ำ {ratio}'},
    'sort': ['ROUAC', 'ROUAH']
  },
  'ROUG': {
    'col': 2,
    'text': {'ROUGC': 'สูง {ratio}', 'ROUGH': 'ต่ำ {ratio}'},
    'sort': ['ROUGC', 'ROUAH']
  },
  'ROUB': {
    'col': 2,
    'text': {'ROUBC': 'สูง {ratio}', 'ROUBH': 'ต่ำ {ratio}'},
    'sort': ['ROUBC', 'ROUBH']
  },
  'ROUD': {
    'col': 2,
    'text': {'ROUDC': 'สูง {ratio}', 'ROUDH': 'ต่ำ {ratio}'},
    'sort': ['ROUDC', 'ROUAH']
  },
  'ROUE': {
    'col': 2,
    'text': {'ROUEC': 'สูง {ratio}', 'ROUEH': 'ต่ำ {ratio}'},
    'sort': ['ROUEC', 'ROUAH']
  },
  'ROUF': {
    'col': 2,
    'text': {'ROUFC': 'สูง {ratio}', 'ROUFH': 'ต่ำ {ratio}'},
    'sort': ['ROUFC', 'ROUAH']
  },
  'RHIT': {
    'col': 2,
    'text': {'RHITOUC': 'สูง {ratio}', 'RHITOUH': 'ต่ำ {ratio}'},
    'sort': ['RHITOUC', 'RHITOUH']
  },
};
