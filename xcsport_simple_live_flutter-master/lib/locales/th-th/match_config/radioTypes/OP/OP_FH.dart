//ฮ็อกกี้
const dynamic op_fhRadioTypes = {
  "M": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "เสมอ", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "DC": {
    "col": 3,
    "text": {"DCHN": "เจ้าบ้าน/เสมอ", "DCCN": "เจ้าบ้าน/เสมอ", "DCHC": "เจ้าบ้าน/ทีมเยือน"},
    "sort": ["DCHN", "DCCN", "DCHC"]
  },
  "RFM": {
    "col": 3,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "เสมอ {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  
  "OUH": {
    "col": 2,
    "text": {"OUHC": "สูง {ratio}", "OUHH": "ต่ำ {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCC": "สูง {ratio}", "OUCH": "ต่ำ {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
 
  "TS": {
    "col": 2,
    "text": {"TSY": "ใช่", "TSN": "ไม่"},
    "sort": ["TSY", "TSN"]
  },
  "WRC": {
    "col": 2,
    "text": {"WRCH": "มีแค่เจ้าบ้านได้คะแนน", "WRCC": "มีแค่ทีมเยือนได้คะแนน", "WRCB": "ได้คะแนนทั้ง2ทีม", "WRCN": "ไม่ได้คะแนน"},
    "sort": ["WRCH", "WRCC", "WRCB", "WRCN"]
  },
  "RF": {
    "col": 3,
    "text": {
      "RFHH": "เจ้าบ้าน/เจ้าบ้าน",
      "RFHN": "เจ้าบ้าน/เสมอ",
      "RFHC": "เจ้าบ้าน/ทีมเยือน",
      "RFNH": "เสมอ/เจ้าบ้าน",
      "RFNN": "เสมอ/เสมอ",
      "RFNC": "เสมอ/ทีมเยือน",
      "RFCH": "ทีมเยือน/เจ้าบ้าน",
      "RFCN": "ทีมเยือน/เสมอ",
      "RFCC": "ทีมเยือน/ทีมเยือน"
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
    "text": {"HMH": "{homeTeam}", "HMN": "เสมอ", "HMC": "{awayTeam}"},
    "text2": {"HMH": "{homeTeam}ชนะ", "HMN": "เสมอ", "HMC": "{awayTeam}ชนะ"},
    "textAsia": {"HMH": "", "HMN": "X", "HMC": ""},
    "sort": ["HMH", "HMN", "HMC"],
    "sort_asia": ["HMH", "HMC", "HMN"]
  },
  "HDC": {
    "col": 3,
    "text": {"HDCHN": "เจ้าบ้าน/เสมอ", "HDCHC": "เจ้าบ้าน/ทีมเยือน", "HDCNC": "ทีมเยือน/เสมอ"},
    "sort": ["HDCHN", "HDCHC", "HDCNC"]
  },
  "HRFM": {
    "col": 2,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "เสมอ {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HSQ": {
    "col": 2,
    "text": {
      "HSQ1": "รอบที่1",
      "HSQ2": "รอบที่2",
      "HSQ3": "รอบที่3",
      "HSQ4": "รอบที่4",
      "HSQN": "ได้คะแนนเท่ากัน"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQN"]
  },
  "QM": {
    "col": 3,
    "text": {"QMH": "{homeTeam}", "QMN": "เสมอ", "QMC": "{awayTeam}"},
    "sort": ["QMH", "QMN", "QMC"]
  },
  "QOU": {
    "col": 2,
    "text": {"QOUO": "สูง {ratio}", "QOUU": "ต่ำ {ratio}"},
    "sort": ["QOUO", "QOUU"]
  },
  "QR": {
    "col": 2,
    "text": {"QRH": "{homeTeam} {ratio}", "QRC": "{awayTeam} {ratio}"},
    "sort": ["QRH", "QRC"]
  },
  "QEO": {
    "col": 2,
    "text": {"QEOO": "คี่", "QEOE": "คู่"},
    "sort": ["QEOO", "QEOE"]
  },
  "RP": {
    "col": 3,
    "text": {"RPH": "{homeTeam}", "RPNE": "ไม่มี", "RPC": "{awayTeam}"},
    "sort": ["RPH", "RPNE", "RPC"]
  }
};
