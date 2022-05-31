//Khúc côn cầu
const dynamic op_fhRadioTypes = {
  
  "DC": {
    "col": 3,
    "text": {"DCHN": "Chủ nhà/Hòa", "DCCN": "Đội khách/Hòa", "DCHC": "Chủ nhà/Đội khách"},
    "sort": ["DCHN", "DCCN", "DCHC"]
  },
  "RFM": {
    "col": 3,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "Hòa {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  
  "OUH": {
    "col": 2,
    "text": {"OUHC": "Tài {ratio}", "OUHH": "Xỉu {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCC": "Tài {ratio}", "OUCH": "Xỉu {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
 
  "TS": {
    "col": 2,
    "text": {"TSY": "Có", "TSN": "Không"},
    "sort": ["TSY", "TSN"]
  },
  "WRC": {
    "col": 2,
    "text": {"WRCH": "Chỉ đội chủ nhà ghi bàn", "WRCC": "Chỉ đội khách ghi bàn", "WRCB": "Đều ghi bàn", "WRCN": "Bình quân ko ghi điểm"},
    "sort": ["WRCH", "WRCC", "WRCB", "WRCN"]
  },
  "RF": {
    "col": 3,
    "text": {
      "RFHH": "Chủ/Chủ",
      "RFHN": "Chủ/Hòa",
      "RFHC": "Chủ/Khách",
      "RFNH": "Hòa/Chủ",
      "RFNN": "Hòa/Hòa",
      "RFNC": "Hòa/Khách",
      "RFCH": "Khách/Chủ",
      "RFCN": "Khách/Hòa",
      "RFCC": "Khách/Khách"
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
    "text": {"HMH": "{homeTeam}", "HMN": "Hòa", "HMC": "{awayTeam}"},
    "text2": {"HMH": "{homeTeam}Thắng", "HMN": "Hòa", "HMC": "{awayTeam}Thắng"},
    "textAsia": {"HMH": "", "HMN": "X", "HMC": ""},
    "sort": ["HMH", "HMN", "HMC"],
    "sort_asia": ["HMH", "HMC", "HMN"]
  },
  "HDC": {
    "col": 3,
    "text": {"HDCHN": "Đội chủ nhà/Hòa", "HDCHC": "Đội chủ  nhà/Đội khách", "HDCNC": "Đội khách/Hòa"},
    "sort": ["HDCHN", "HDCHC", "HDCNC"]
  },
  "HRFM": {
    "col": 2,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Hòa {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HSQ": {
    "col": 2,
    "text": {
      "HSQ1": "Phần 1",
      "HSQ2": "Phần 2",
      "HSQ3": "Phần 3",
      "HSQ4": "Phần 4",
      "HSQN": "Điểm số bằng nhau"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQN"]
  },
  "QM": {
    "col": 3,
    "text": {"QMH": "{homeTeam}", "QMN": "Hòa", "QMC": "{awayTeam}"},
    "sort": ["QMH", "QMN", "QMC"]
  },
  "QOU": {
    "col": 2,
    "text": {"QOUO": "Tài {ratio}", "QOUU": "Xỉu {ratio}"},
    "sort": ["QOUO", "QOUU"]
  },
  "QR": {
    "col": 2,
    "text": {"QRH": "{homeTeam} {ratio}", "QRC": "{awayTeam} {ratio}"},
    "sort": ["QRH", "QRC"]
  },
  "QEO": {
    "col": 2,
    "text": {"QEOO": "Lẻ", "QEOE": "Chẵn"},
    "sort": ["QEOO", "QEOE"]
  },
  "RP": {
    "col": 3,
    "text": {"RPH": "{homeTeam}", "RPNE": "Không", "RPC": "{awayTeam}"},
    "sort": ["RPH", "RPNE", "RPC"]
  }
};
