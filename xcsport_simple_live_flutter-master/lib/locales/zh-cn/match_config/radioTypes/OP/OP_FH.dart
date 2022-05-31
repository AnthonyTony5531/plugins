//曲棍球
const dynamic op_fhRadioTypes = {
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "主队/和局", "DCCN": "客队/和局", "DCHC": "主队/客队"},
    "sort": ["DCHN", "DCCN", "DCHC"]
  },
  "RFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "和局 {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  "OUH": {
    "col": 2,
    "text": {"OUHC": "大 {ratio}", "OUHH": "小 {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCC": "大 {ratio}", "OUCH": "小 {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
 
  "TS": {
    "col": 2,
    "text": {"TSY": "是", "TSN": "否"},
    "sort": ["TSY", "TSN"]
  },
  "WRC": {
    "col": 2,
    "col188": 1,
    "text": {"WRCH": "只有主队得分", "WRCC": "只有客队得分", "WRCB": "都得分", "WRCN": "均不得分"},
    "sort": ["WRCH", "WRCC", "WRCB", "WRCN"]
  },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFHH": "主/主",
      "RFHN": "主/平",
      "RFHC": "主/客",
      "RFNH": "平/主",
      "RFNN": "平/平",
      "RFNC": "平/客",
      "RFCH": "客/主",
      "RFCN": "客/平",
      "RFCC": "客/客"
    },
    "sort": [
      "RFHH",
      "RFNN",
      "RFCC",
      "RFHN",
      "RFNH",
      "RFCN",
      "RFHC",
      "RFNC",
      "RFCH"
    ]
  },
  "HM": {
    "half": true,
    "col": 3,
    "col188": 1,
    "text": {"HMH": "{homeTeam}", "HMN": "平", "HMC": "{awayTeam}"},
    "text2": {"HMH": "{homeTeam}获胜", "HMN": "平", "HMC": "{awayTeam}获胜"},
    "textAsia": {"HMH": "", "HMN": "X", "HMC": ""},
    "sort": ["HMH", "HMN", "HMC"],
    "sort_asia": ["HMH", "HMC", "HMN"]
  },
  "HDC": {
    "col": 3,
    "col188": 1,
    "text": {"HDCHN": "主队/和局", "HDCHC": "主队/客队", "HDCNC": "客队/和局"},
    "sort": ["HDCHN", "HDCHC", "HDCNC"]
  },
  "HRFM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "平局 {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  "HR": {
    "col": 2,
    "col188": 1,
    "text": {"HRH": "{homeTeam} {ratio}", "HRC": "{awayTeam} {ratio}"},
    "sort": ["HRH", "HRC"]
  },
  "HOU": {
    "col": 2,
    "text": {"HOUC": "大 {ratio}", "HOUH": "小 {ratio}"},
    "sort": ["HOUC", "HOUH"]
  },
  
  "HSQ": {
    "col": 2,
    "col188": 1,
    "text": {
      "HSQ1": "第1节",
      "HSQ2": "第2节",
      "HSQ3": "第3节",
      "HSQ4": "第4节",
      "HSQN": "得分相同"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQN"]
  },
  "QM": {
    "col": 3,
    "col188": 1,
    "text": {"QMH": "{homeTeam}", "QMN": "平", "QMC": "{awayTeam}"},
    "sort": ["QMH", "QMN", "QMC"]
  },
  "QOU": {
    "col": 2,
    "text": {"QOUO": "大 {ratio}", "QOUU": "小 {ratio}"},
    "sort": ["QOUO", "QOUU"]
  },
  "QR": {
    "col": 2,
    "col188": 1,
    "text": {"QRH": "{homeTeam} {ratio}", "QRC": "{awayTeam} {ratio}"},
    "sort": ["QRH", "QRC"]
  },
  "QEO": {
    "col": 2,
    "text": {"QEOO": "单", "QEOE": "双"},
    "sort": ["QEOO", "QEOE"]
  },
  "RP": {
    "col": 3,
    "col188": 1,
    "text": {"RPH": "{homeTeam}", "RPNE": "无", "RPC": "{awayTeam}"},
    "sort": ["RPH", "RPNE", "RPC"]
  }
};
