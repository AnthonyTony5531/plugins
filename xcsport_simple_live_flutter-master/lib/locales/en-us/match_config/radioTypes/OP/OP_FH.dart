//Hockey
const dynamic op_fhRadioTypes = {
  
  "DC": {
    "col": 3,
    "col188": 1,
    "text": {"DCHN": "Home/Draw", "DCCN": "Away/Draw", "DCHC": "Home/Away"},
    "sort": ["DCHN", "DCCN", "DCHC"]
  },
  "RFM": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFMH": "{homeTeam} {ratio}",
      "RFMD": "Draw {ratio}",
      "RFMC": "{awayTeam} {ratio}"
    },
    "sort": ["RFMH", "RFMD", "RFMC"]
  },
  
  "OUH": {
    "col": 2,
    "text": {"OUHC": "Over {ratio}", "OUHH": "Under {ratio}"},
    "sort": ["OUHC", "OUHH"]
  },
  "OUC": {
    "col": 2,
    "text": {"OUCC": "Over {ratio}", "OUCH": "Under {ratio}"},
    "sort": ["OUCC", "OUCH"]
  },
  
  "TS": {
    "col": 2,
    "text": {"TSY": "Yes", "TSN": "No"},
    "sort": ["TSY", "TSN"]
  },
  "WRC": {
    "col": 2,
    "col188": 1,
    "text": {
      "WRCH": "Only home team score",
      "WRCC": "Only away team score",
      "WRCB": "Both team score",
      "WRCN": "Neither score"
    },
    "sort": ["WRCH", "WRCC", "WRCB", "WRCN"]
  },
  "RF": {
    "col": 3,
    "col188": 1,
    "text": {
      "RFHH": "Home/Home",
      "RFHN": "Home/Draw",
      "RFHC": "Home/Away",
      "RFNH": "Draw/Home",
      "RFNN": "Draw/Draw",
      "RFNC": "Draw/Away",
      "RFCH": "Away/Home",
      "RFCN": "Away/Draw",
      "RFCC": "Away/Away"
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
    "text": {"HMH": "{homeTeam}", "HMN": "Draw", "HMC": "{awayTeam}"},
    "text2": {"HMH": "{homeTeam}Won", "HMN": "Draw", "HMC": "{awayTeam}Won"},
    "textAsia": {"HMH": "", "HMN": "X", "HMC": ""},
    "sort": ["HMH", "HMN", "HMC"],
    "sort_asia": ["HMH", "HMC", "HMN"]
  },
  "HDC": {
    "col": 3,
    "col188": 1,
    "text": {"HDCHN": "Home/Draw", "HDCHC": "Home/Away", "HDCNC": "Away/Draw"},
    "sort": ["HDCHN", "HDCHC", "HDCNC"]
  },
  "HRFM": {
    "col": 2,
    "col188": 1,
    "text": {
      "HRFMH": "{homeTeam} {ratio}",
      "HRFMD": "Draw {ratio}",
      "HRFMC": "{awayTeam} {ratio}"
    },
    "sort": ["HRFMH", "HRFMD", "HRFMC"]
  },
  
  "HSQ": {
    "col": 2,
    "col188": 1,
    "text": {
      "HSQ1": " 1st quarter",
      "HSQ2": " 2nd quarter",
      "HSQ3": " 3rd quarter",
      "HSQ4": " 4th quarter",
      "HSQN": "Same Score"
    },
    "sort": ["HSQ1", "HSQ2", "HSQ3", "HSQ4", "HSQN"]
  },
  "QM": {
    "col": 3,
    "col188": 1,
    "text": {"QMH": "{homeTeam}", "QMN": "Draw", "QMC": "{awayTeam}"},
    "sort": ["QMH", "QMN", "QMC"]
  },
  "QOU": {
    "col": 2,
    "text": {"QOUO": "Over {ratio}", "QOUU": "Under {ratio}"},
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
    "text": {"QEOO": "Odd", "QEOE": "Even"},
    "sort": ["QEOO", "QEOE"]
  },
  "RP": {
    "col": 3,
    "col188": 1,
    "text": {"RPH": "{homeTeam}", "RPNE": "No Goal", "RPC": "{awayTeam}"},
    "sort": ["RPH", "RPNE", "RPC"]
  }
};
