// Bóng chày
const dynamic bsRadioTypes = {
  "MN": {
    "col": 3,
    "text": {"MNH": "{homeTeam}", "MNN": "Hòa", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNN", "MNC"]
  },
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUHO": "Tài {ratio}", "OUHU": "Xỉu {ratio}"},
    "sort": ["OUHO", "OUHU"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCO": "Tài {ratio}", "OUCU": "Xỉu {ratio}"},
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
      "HIS1": "Vòng 1",
      "HIS2": "Vòng 2",
      "HIS3": "Vòng 3",
      "HIS4": "Vòng 4",
      "HIS5": "Vòng 5",
      "HIS6": "Vòng 6",
      "HIS7": "Vòng 7",
      "HIS8": "Vòng 8",
      "HIS9": "Vòng 9",
      "HISN": "Điểm số bằng nhau"
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
    "text": {"HOUHO": "Tài {ratio}", "HOUHU": "Xỉu {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HOUC": {
    "col": 2,
    "text": {"HOUCO": "Tài {ratio}", "HOUCU": "Xỉu {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "IM": {
    "col": 3,
    "text": {"IMH": "{homeTeam}", "IMN": "Hòa", "IMC": "{awayTeam}"},
    "sort": ["IMH", "IMN", "IMC"]
  },
  "IOU": {
    "col": 2,
    "text": {"IOUO": "Tài {ratio}", "IOUU": "Xỉu {ratio}"},
    "sort": ["IOUO", "IOUU"]
  },
  "IR": {
    "col": 2,
    "text": {"IRH": "{homeTeam} {ratio}", "IRC": "{awayTeam} {ratio}"},
    "sort": ["IRH", "IRC"]
  },
  "IOUH": {
    "col": 2,
    "text": {"IOUHO": "Tài {ratio}", "IOUHU": "Xỉu {ratio}"},
    "sort": ["IOUHO", "IOUHU"]
  },
  "IOUC": {
    "col": 2,
    "text": {"IOUCO": "Tài {ratio}", "IOUCU": "Xỉu {ratio}"},
    "sort": ["IOUCO", "IOUCU"]
  },
  "WM1": {
    "col": 2,
    "text": {
      "WM1H1": "{homeTeam} Thắng 1 hiệp",
      "WM1H2": "{homeTeam} Thắng 2 hiệp",
      "WM1H3": "{homeTeam} Thắng 3 hiệp trở lên",
      "WM1C1": "{awayTeam} Thắng 1 hiệp",
      "WM1C2": "{awayTeam} Thắng 2 hiệp",
      "WM1C3": "{awayTeam} Thắng 3 hiệp trở lên"
    },
    "sort": ['WM1H1', 'WM1C1', 'WM1H2', 'WM1C2', 'WM1H3', 'WM1C3']
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "Chủ nhà thắng 1 bóng",
      "WMH2": "Chủ nhà thắng 2 bóng",
      "WMH3": "Chủ nhà thắng 3 bóng",
      "WMH4": "Chủ nhà thắng 4 bóng",
      "WMHOV": "Chủ nhà thắng 4+",
      "WMC1": "Đội khách thắng 1 bóng",
      "WMC2": "Đội khách thắng 2 bóng",
      "WMC3": "Đội khách thắng 3 bóng",
      "WMC4": "Đội khách thắng 4 bóng",
      "WMCOV": "Đội khách thắng 4+",
      "WMH0": "Hòa"
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
      "RWMH1": 'Chủ nhà thắng 1 bóng',
      "RWMH2": 'Chủ nhà thắng 2 bóng',
      "RWMH3": 'Chủ nhà thắng 3 bóng',
      "WMH1": 'Chủ nhà thắng 1 bóng',
      "WMH2": 'Chủ nhà thắng 2 bóng',
      "WMH3": 'Chủ nhà thắng 3 bóng',
      "WMHOV": 'Chủ nhà thắng 4 bóng hoặc nhiều hơn',
      "WMC1": 'Đội khách thắng 1 bóng',
      "WMC2": 'Đội khách thắng 2 bóng',
      "WMC3": 'Đội khách thắng 3 bóng',
      "WMCOV": 'Đội khách thắng 4 bóng hoặc nhiều hơn',
      "RWMH4": 'Đội khách thắng 4 bóng',
      "RWMC1": 'Đội khách thắng 1 bóng',
      "RWMC2": 'Đội khách thắng 2 bóng',
      "RWMC3": 'Đội khách thắng 3 bóng',
      "RWMC4": 'Đội khách thắng 4 bóng',
      "RWMH0": 'Hòa'
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
      "HWMH1": "Chủ nhà thắng 1 bóng",
      "HWMH2": "Chủ nhà thắng 2 bóng",
      "HWMH3": "Chủ nhà thắng 3 bóng",
      "HWMH4": "Chủ nhà thắng 4 bóng",
      "HWMC1": "Đội khách thắng 1 bóng",
      "HWMC2": "Đội khách thắng 2 bóng",
      "HWMC3": "Đội khách thắng 3 bóng",
      "HWMC4": "Đội khách thắng 4 bóng",
      "HWMH0": "Hòa"
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
    "text": {"OTY": "Có", "OTN": "Không"},
    "sort": ["OTY", "OTN"]
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
  "HRUH": {
    "col": 2,
    "text": {"HOUHO": "Tài {ratio}", "HOUHU": "Xỉu {ratio}"},
    "sort": ["HOUHO", "HOUHU"]
  },
  "HRUC": {
    "col": 2,
    "text": {"HOUCO": "Tài {ratio}", "HOUCU": "Xỉu {ratio}"},
    "sort": ["HOUCO", "HOUCU"]
  },
  "HRWM": {
    "col": 3,
    "text": {
      "HRWMH1": "Chủ nhà thắng 1 bóng",
      "HRWMH2": "Chủ nhà thắng 2 bóng",
      "HRWMH3": "Chủ nhà thắng 3 bóng",
      "HRWMH4": "Chủ nhà thắng 4 bóng",
      "HRWMC1": "Đội khách thắng 1 bóng",
      "HRWMC2": "Đội khách thắng 2 bóng",
      "HRWMC3": "Đội khách thắng 3 bóng",
      "HRWMC4": "Đội khách thắng 4 bóng",
      "HRWMH0": "Hòa"
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
    "text": {"ROTY": "Có", "ROTN": "Không"},
    "sort": ["ROTY", "ROTN"]
  },
  "AEO": {
    "col": 2,
    "text": {"AEOO": "Lẻ", "AEOE": "Chẵn"},
    "sort": ["AEOO", "AEOE"]
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
  'OUW3': {
    'col': 3,
    'text': {'OUW3O': 'Tài {ratio}', 'OUW3E': 'Vừa đúng {ratio}', 'OUW3U': 'Xỉu {ratio}'},
    'sort': ['OUW3O', 'OUW3E', 'OUW3U']
  },
  "TEO": {
    "col": 2,
    "text": {
      "TEOHO": "Lẻ",
      "TEOHE": "Chẵn",
      "TEOCO": "Lẻ",
      "TEOCE": "Chẵn"
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
    'text': {'AGC': 'Tài {ratio}', 'AGH': 'Xỉu {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "HSQ": {
    "col": 3,
    "text": {"HSQ1": "5 vòng đầu", "HSQ2": "Hòa", "HSQ3": "Các vòng khác"},
    "sort": ["HSQ1", "HSQ2", "HSQ3"]
  },
  "HST": {
    "col": 3,
    "text": {"HSTH": "{homeTeam}", "HSTN": "Hòa ", "HSTC": "{awayTeam}"},
    "sort": ["HSTH", "HSTN", "HSTC"]
  },
  "ARG": {
    "col": 2,
    "text": {"ARGY": "Có", "ARGN": "Không"},
    "sort": ["ARGY", "ARGN"]
  },
  "TOU": {
    "col": 2,
    "text": {
      "TOUHC": "{homeTeam} Tài {ratio}",
      "TOUHH": "{homeTeam} Xỉu {ratio}",
      "TOUCC": "{awayTeam} Tài {ratio}",
      "TOUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["TOUHC", "TOUHH", "TOUCC", "TOUCH"]
  },
  "UA": {
    "col": 3,
    "text": {"UAO": "Tài {ratio}", "UAE": "Vừa đúng {ratio}", "UAU": "Xỉu {ratio}"},
    "sort": ["UAO", "UAE", "UAU"]
  },
  "UB": {
    "col": 3,
    "text": {"UBO": "Tài {ratio}", "UBE": "Vừa đúng {ratio}", "UBU": "Xỉu {ratio}"},
    "sort": ["UBO", "UBE", "UBU"]
  },
  "UC": {
    "col": 3,
    "text": {"UCO": "Tài {ratio}", "UCE": "Vừa đúng {ratio}", "UCU": "Xỉu {ratio}"},
    "sort": ["UCO", "UCE", "UCU"]
  },
  "MA": {
    "col": 3,
    "text": {"MAH": "{homeTeam}", "MAN": "Hòa", "MAC": "{awayTeam}"},
    "sort": ["MAH", "MAN", "MAC"]
  },
  "MB": {
    "col": 3,
    "text": {"MBH": "{homeTeam}", "MBN": "Hòa", "MBC": "{awayTeam}"},
    "sort": ["MBH", "MBN", "MBC"]
  },
  "MC": {
    "col": 3,
    "text": {"MCH": "{homeTeam}", "MCN": "Hòa", "MCC": "{awayTeam}"},
    "sort": ["MCH", "MCN", "MCC"]
  },
  "MD": {
    "col": 3,
    "text": {"MDH": "{homeTeam}", "MDN": "Hòa", "MDC": "{awayTeam}"},
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
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "DC": {
    "col": 3,
    "text": {
      "DCHH": "Chủ/Chủ",
      "DCHC": "Chủ/Khách",
      "DCHN": "Chủ/Hòa",
      "DCCC": "Khách/Khách",
      "DCCH": "Khách/Chủ",
      "DCCN": "Khách/Hòa",
      "DCNH": "Hòa/Chủ",
      "DCNC": "Hòa/Khách",
      "DCNN": "Hòa/Hòa"
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
    "text": {"RWBOY": "Có", "RWBON": "Không"},
    "sort": ["RWBOY", "RWBON"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "Lẻ",
      "RTEOHE": "Chẵn",
      "RTEOCO": "Lẻ",
      "RTEOCE": "Chẵn"
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
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
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  'RTTG': {
    'col': 2,
    'text': {
      'ROUHC': '{homeTeam} Tài {ratio}',
      'ROUHH': '{homeTeam} Xỉu {ratio}',
      'ROUCC': '{awayTeam} Tài {ratio}',
      'ROUCH': '{awayTeam} Xỉu {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'PPA': {
    'col': 3,
    'text': {'PPAB': 'Trên đế', 'PPAO': 'Hòa', 'PPAHR': 'Home run'},
    'sort': ['PPAB', 'PPAO', 'PPAHR']
  },
  'PATS': {
    'col': 2,
    'text': {'PATSY': 'Có', 'PATSN': 'Không'},
    'sort': ['PATSY', 'PATSN']
  },
  'NR': {
    'col': 3,
    'text': {'NRH': '{homeTeam}', 'NRN': 'Không ghi điểm', 'NRA': '{awayTeam}'},
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
    'text': {'PHRC': 'Tài {ratio}', 'PHRH': 'Xỉu {ratio}'},
    'sort': ['PHRC', 'PHRH']
  },
  'PSO': {
    'col': 2,
    'text': {'PSOC': 'Tài {ratio}', 'PSOH': 'Xỉu {ratio}'},
    'sort': ['PSOC', 'PSOH']
  },
  'PH': {
    'col': 2,
    'text': {'PHC': 'Tài {ratio}', 'PHH': 'Xỉu {ratio}'},
    'sort': ['PHC', 'PHH']
  },
  'PTB': {
    'col': 2,
    'text': {'PTBC': 'Tài {ratio}', 'PTBH': 'Xỉu {ratio}'},
    'sort': ['PTBC', 'PTBH']
  },
  'PHA': {
    'col': 2,
    'text': {'PHAC': 'Tài {ratio}', 'PHAH': 'Xỉu {ratio}'},
    'sort': ['PHAC', 'PHAH']
  },
  'PHRA': {
    'col': 2,
    'text': {'PHRAC': 'Tài {ratio}', 'PHRAH': 'Xỉu {ratio}'},
    'sort': ['PHRAC', 'PHRAH']
  },
  'PSOT': {
    'col': 2,
    'text': {'PSOTC': 'Tài {ratio}', 'PSOTH': 'Xỉu {ratio}'},
    'sort': ['PSOTC', 'PSOTH']
  },
  'OUA': {
    'col': 2,
    'text': {'OUAC': 'Tài {ratio}', 'OUAH': 'Xỉu {ratio}'},
    'sort': ['OUAC', 'OUAH']
  },
  'HTOU': {
    'col': 2,
    'text': {
      'HTOUHC': '{homeTeam} Tài {ratio}',
      'HTOUHH': '{homeTeam} Xỉu {ratio}',
      'HTOUCC': '{awayTeam} Tài {ratio}',
      'HTOUCH': '{awayTeam} Xỉu {ratio}'
    },
    'sort': ['HTOUHC', 'HTOUHH', 'HTOUCC', 'HTOUCH']
  },
  'RW3': {
    'col': 3,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'Hòa {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'F2G': {
    'col': 3,
    'text': {'F2GH': '{homeTeam}', 'F2GN': 'đều không phải', 'F2GC': '{awayTeam}'},
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    'text': {'F3GH': '{homeTeam}', 'F3GN': 'đều không phải', 'F3GC': '{awayTeam}'},
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'F4G': {
    'col': 3,
    'text': {'F4GH': '{homeTeam}', 'F4GN': 'đều không phải', 'F4GC': '{awayTeam}'},
    'sort': ['F4GH', 'F4GC', 'F4GN']
  },
  'F5G': {
    'col': 3,
    'text': {'F5GH': '{homeTeam}', 'F5GN': 'đều không phải', 'F5GC': '{awayTeam}'},
    'sort': ['F5GH', 'F5GC', 'F5GN']
  },
  'F6G': {
    'col': 3,
    'text': {'F6GH': '{homeTeam}', 'F6GN': 'đều không phải', 'F6GC': '{awayTeam}'},
    'sort': ['F6GH', 'F6GC', 'F6GN']
  },
  'F7G': {
    'col': 3,
    'text': {'F7GH': '{homeTeam}', 'F7GN': 'đều không phải', 'F7GC': '{awayTeam}'},
    'sort': ['F7GH', 'F7GC', 'F7GN']
  },
  'RM1': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM2': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM3': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM4': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM5': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM6': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM7': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RM8': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMN', 'RMC']
  },
  'RDC': {
    'col': 2,
    'text': {
      'RDCHH': 'Chủ/Chủ',
      'RDCHC': 'Chủ/Khách',
      'RDCCC': 'Khách/Khách',
      'RDCCH': 'Khách/Chủ',
      'RDCNH': 'Hòa/Chủ',
      'RDCNC': 'Hòa/Khách'
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
    'text': {'ROUAC': 'Tài {ratio}', 'ROUAH': 'Xỉu {ratio}'},
    'sort': ['ROUAC', 'ROUAH']
  },
  'ROUG': {
    'col': 2,
    'text': {'ROUGC': 'Tài {ratio}', 'ROUGH': 'Xỉu {ratio}'},
    'sort': ['ROUGC', 'ROUAH']
  },
  'ROUB': {
    'col': 2,
    'text': {'ROUBC': 'Tài {ratio}', 'ROUBH': 'Xỉu {ratio}'},
    'sort': ['ROUBC', 'ROUBH']
  },
  'ROUD': {
    'col': 2,
    'text': {'ROUDC': 'Tài {ratio}', 'ROUDH': 'Xỉu {ratio}'},
    'sort': ['ROUDC', 'ROUAH']
  },
  'ROUE': {
    'col': 2,
    'text': {'ROUEC': 'Tài {ratio}', 'ROUEH': 'Xỉu {ratio}'},
    'sort': ['ROUEC', 'ROUAH']
  },
  'ROUF': {
    'col': 2,
    'text': {'ROUFC': 'Tài {ratio}', 'ROUFH': 'Xỉu {ratio}'},
    'sort': ['ROUFC', 'ROUAH']
  },
  'RHIT': {
    'col': 2,
    'text': {'RHITOUC': 'Tài {ratio}', 'RHITOUH': 'Xỉu {ratio}'},
    'sort': ['RHITOUC', 'RHITOUH']
  },
};
