// Bóng chày 
const dynamic op_ckRadioTypes = {
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "WSO": {
    "col": 2,
    "text": {"WSOY": "Có", "WSOS": "Không"},
    "sort": ["WSOY", "WSOS"]
  },
  "RDM": {
    "col": 3,
    "text": {
      "RDMC": "Bắt bóng",
      "RDMB": "Kết liễu",
      "RDML": "Cắt bóng",
      "RDMR": "Bị loại",
      "RDMS": "Ra ngoài",
      "RDMO": "Khác"
    },
    "sort": ["RDMC", "RDMB", "RDML", "RDMR", "RDMS", "RDMO"]
  },
  "MDL": {
    "col": 2,
    "text": {"MDLC": "Bắt bóng", "MDLNC": "Không bắt được bóng"},
    "sort": ["MDLC", "MDLNC"]
  },
  "RRH": {
    "col": 3,
    "text": {
      "RRH049": "0-49",
      "RRH5059": "50-59",
      "RRH6064": "60-64",
      "RRH6569": "65-69",
      "RRH7074": "70-74",
      "RRH7579": "75-79",
      "RRH8084": "80-84",
      "RRH8594": "85-94",
      "RRH95": "95+",
      "RRH024": "0-24",
      "RRH2529": "25-29",
      "RRH3034": "30-34",
      "RRH3539": "35-39",
      "RRH4044": "40-44",
      "RRH4549": "45-49",
      "RRH5054": "50-54",
      "RRH5559": "55-59",
      "RRH60": "60+"
    },
    "sort": [
      "RRH049",
      "RRH5059",
      "RRH6064",
      "RRH6569",
      "RRH7074",
      "RRH7579",
      "RRH8084",
      "RRH8594",
      "RRH95",
      "RRH024",
      "RRH2529",
      "RRH3034",
      "RRH3539",
      "RRH4044",
      "RRH4549",
      "RRH5054",
      "RRH5559",
      "RRH60"
    ]
  },
  "RRC": {
    "col": 3,
    "text": {
      "RRC049": "0-49",
      "RRC5059": "50-59",
      "RRC6064": "60-64",
      "RRC6569": "65-69",
      "RRC7074": "70-74",
      "RRC7579": "75-79",
      "RRC8084": "80-84",
      "RRC8594": "85-94",
      "RRC95": "95+",
      "RRC024": "0-24",
      "RRC2529": "25-29",
      "RRC3034": "30-34",
      "RRC3539": "35-39",
      "RRC4044": "40-44",
      "RRC4549": "45-49",
      "RRC5054": "50-54",
      "RRC5559": "55-59",
      "RRC60": "60+"
    },
    "sort": [
      "RRC049",
      "RRC5059",
      "RRC6064",
      "RRC6569",
      "RRC7074",
      "RRC7579",
      "RRC8084",
      "RRC8594",
      "RRC95",
      "RRC024",
      "RRC2529",
      "RRC3034",
      "RRC3539",
      "RRC4044",
      "RRC4549",
      "RRC5054",
      "RRC5559",
      "RRC60"
    ]
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
  "SOU": {
    "col": 2,
    "text": {"SOUC": "Tài {ratio}", "SOUH": "Xỉu {ratio}"},
    "sort": ["SOUC", "SOUH"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "Lẻ", "EOHE": "Chẵn"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "Lẻ", "EOCE": "Chẵn"},
    "sort": ["EOCO", "EOCE"]
  },
  "SEO": {
    "col": 2,
    "text": {"SEOO": "Lẻ", "SEOE": "Chẵn"},
    "sort": ["SEOO", "SEOE"]
  },
  "IOU": {
    "col": 2,
    "text": {"IOUO": "Tài {ratio}", "IOUU": "Xỉu {ratio}"},
    "sort": ["IOUO", "IOUU"]
  },
  "IEO": {
    "col": 2,
    "text": {"IEOO": "Lẻ", "IEOE": "Chẵn"},
    "sort": ["IEOO", "IEOE"]
  },
  "FDM": {
    "col": 3,
    "text": {
      "FDMC": "Bắt bóng",
      "FDMB": "Đánh trúng mục tiêu",
      "FDML": "Chạm ra ngoài",
      "FDMR": "Bám sát",
      "FDMS": "Tiêu diệt",
      "FDMO": "Khác"
    },
    "sort": ["FDMC", "FDMB", "FDML", "FDMR", "FDMS", "FDMO"]
  },
  "MFS": {
    "col": 2,
    "text": {"MFSY": "Có", "MFSN": "Không"},
    "sort": ["MFSY", "MFSN"]
  },
  "MHS": {
    "col": 2,
    "text": {"MHSY": "Có", "MHSN": "Không"},
    "sort": ["MHSY", "MHSN"]
  },
  'TT': {
      'col': 2,
      'text': {
        'TTH': '{homeTeam} {ratio}',
        'TTC': '{awayTeam} {ratio}'
      },
      'sort': ['TTH', 'TTC']
    },
  "HOP": {
    "col": 3,
    "text": {"HOPH": "{homeTeam} ", "HOPN": "Hòa", "HOPC": "{awayTeam} "},
    "sort": ["HOPH", "HOPN", "HOPC"]
  },
  'MS': {
    'col': 3,
    'text': {'MSH': '{homeTeam} ', 'MSN': 'Hòa', 'MSC': '{awayTeam} '},
    'sort': ['MSH', 'MSN', 'MSC']
  },
  "THO": {
    "col": 2,
    "text": {"THOH": "{homeTeam} {ratio}", "THOC": "{awayTeam} {ratio}"},
    "sort": ["THOH", "THOC"]
  },
  "MRO": {
    "col": 3,
    "text": {"MROH": "{homeTeam} ", "MRON": "Hòa", "MROC": "{awayTeam} "},
    "sort": ["MROH", "MRON", "MROC"]
  },
  "FW": {
    "col": 2,
    "text": {"FWH": "Xỉu {ratio}", "FWC": "Tài {ratio}"},
    "sort": ["FWC", "FWH"]
  },
  "FOU": {
    "col": 2,
    "text": {"FOUH": "Xỉu {ratio}", "FOUC": "Tài {ratio}"},
    "sort": ["FOUC", "FOUH"]
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
  "ROU5A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU10A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU15A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU20A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU25A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU30A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU35A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU40A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU45A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU5B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU10B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU15B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU20B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU25B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU30B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU35B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU40B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "ROU45B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RW21A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW22A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW23A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW24A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW25A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW26A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW27A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW28A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW29A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW30A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW31A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW32A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW33A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW34A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW35A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW36A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW37A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW38A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW39A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW40A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW41A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW42A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW43A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW44A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW45A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW46A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW47A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW48A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW49A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW50A": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW21B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW22B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW23B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW24B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW25B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW26B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "ChẵnChẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW27B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW28B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW29B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW30B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW31B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW32B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW33B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW34B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW35B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW36B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW37B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW38B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW39B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW40B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW41B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW42B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW43B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW44B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW45B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW46B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW47B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW48B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW49B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RW50B": {
    "col": 2,
    "text": {"RWY": "Lẻ", "RWN": "Chẵn"},
    "sort": ["RWY", "RWN"]
  },
  "RR21A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR22A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR23A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR24A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR25A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR26A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR27A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR28A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR29A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR30A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR31A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR32A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR33A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR34A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR35A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR36A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR37A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR38A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR39A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR40A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR41A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR42A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR43A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR44A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR45A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR46A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR47A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR48A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR49A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR50A": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR21B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR22B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR23B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR24B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR25B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR26B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR27B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR28B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR29B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR30B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR31B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR32B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR33B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR34B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR35B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR36B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR37B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR38B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR39B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR40B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR41B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR42B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR43B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR44B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR45B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR46B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR47B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR48B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR49B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RR50B": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO21A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO22A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO23A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO24A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO25A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO26A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO27A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO28A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO29A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO30A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO31A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO32A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO33A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO34A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO35A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO36A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO37A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO38A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO39A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO40A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO41A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO42A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO43A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO44A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO45A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO46A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO47A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO48A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO49A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO50A": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO21B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO22B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "ChẵnChẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO23B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO24B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO25B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO26B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO27B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO28B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO29B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO30B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO31B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO32B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO33B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO34B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO35B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO36B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO37B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO38B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO39B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO40B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO41B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO42B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO43B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO44B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO45B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO46B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO47B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO48B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO49B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "REO50B": {
    "col": 2,
    "text": {"REOO": "Lẻ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  'ABH': {'col': 2, 'text': {}, 'sort': []},
  'ATB': {'col': 2, 'text': {}, 'sort': []}
};
