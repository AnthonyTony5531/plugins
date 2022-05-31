// Quyền Anh
const dynamic op_boRadioTypes = {
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "MN": {
    "col": 2,
    "text": {"MNH": "{homeTeam}", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNC"]
  },
  "WME": {
    "col": 2,
    "text": {
      "WMHK": "{homeTeam}Thông qua Knock out giành chiến thắng",
      "WMHD": "{homeTeam}Thông qua phán quyết giành chiến thắng ",
      "WMN": "Hòa",
      "WMCK": "{awayTeam}Thông qua Knock out giành chiến thắng",
      "WMCD": "{awayTeam}Thông qua phán quyết giành chiến thắng"
    },
    "sort": ["WMHK", "WMHD", "WMN", "WMCK", "WMCD"]
  },
  "WFD": {
    "col": 2,
    "text": {"WFDY": "Có", "WFDN": "Không"},
    "sort": ["WFDY", "WFDN"]
  },
  "WER": {
    "col": 3,
    "text": {
      "WERH1": "{homeTeam} Vòng đấu 1",
      "WERH2": "{homeTeam} Vòng đấu 2",
      "WERH3": "{homeTeam} Vòng đấu 3",
      "WERH4": "{homeTeam} Vòng đấu 4",
      "WERH5": "{homeTeam} Vòng đấu 5",
      "WERH6": "{homeTeam} Vòng đấu 6",
      "WERH7": "{homeTeam} Vòng đấu 7",
      "WERH8": "{homeTeam} Vòng đấu 8",
      "WERH9": "{homeTeam} 9Vòng đấu 9",
      "WERH10": "{homeTeam} Vòng đấu 10",
      "WERH11": "{homeTeam} Vòng đấu 11",
      "WERH12": "{homeTeam} Vòng đấu 12",
      "WERHD": "{homeTeam} Phán quyết giành chiến thắng",
      "WERN": "Hòa",
      "WERC1": "{awayTeam} Vòng đấu 1",
      "WERC2": "{awayTeam} Vòng đấu 2",
      "WERC3": "{awayTeam} Vòng đấu 3",
      "WERC4": "{awayTeam} Vòng đấu 4",
      "WERC5": "{awayTeam} Vòng đấu 5",
      "WERC6": "{awayTeam} Vòng đấu 6",
      "WERC7": "{awayTeam} Vòng đấu 7",
      "WERC8": "{awayTeam} Vòng đấu 8",
      "WERC9": "{awayTeam} Vòng đấu 9",
      "WERC10": "{awayTeam} Vòng đấu 10",
      "WERC11": "{awayTeam} Vòng đấu 11",
      "WERC12": "{awayTeam} Vòng đấu 12",
      "WERCD": "{awayTeam} Phán quyết giành chiến thắng"
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
    "text": {
      "WRRH0": "{homeTeam} Vòng đấu 1-3",
      "WRRH1": "{homeTeam} Vòng đấu 4-6",
      "WRRH2": "{homeTeam} Vòng đấu 7-9",
      "WRRH3": "{homeTeam} Vòng đấu 10-12",
      "WRRH4": "{homeTeam} Phán quyết giành chiến thắng",
      "WRRN5": "Hòa",
      "WRRC6": "{awayTeam} Vòng đấu 1-3",
      "WRRC7": "{awayTeam} Vòng đấu 4-6",
      "WRRC8": "{awayTeam} Vòng đấu 7-9",
      "WRRC9": "{awayTeam} Vòng đấu 10-12",
      "WRRC0": "{awayTeam} Phán quyết giành chiến thắng"
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
    "text": {
      "WVHK": "Đội nhà thông qua cú Knock out, kỹ thuật Knock out, đối phương hủy bỏ  tư cách hoặc đối phương đầu hàng mà giành chiến thắng",
      "WVHD": "Đội nhà  thông qua phán quyết  giành chiến thắng",
      "WVCK": "Đội Khách thông qua cú Knock out, kỹ thuật Knock out, đối phương hủy bỏ  tư cách hoặc đối phương đầu hàng mà giành chiến thắng",
      "WVCD": "Đội khách  thông qua phán quyết  giành chiến thắng",
      "WVN": "Trận hòa hoặc kỹ thuật hòa"
    },
    "sort": ["WVHK", "WVHD", "WVCK", "WVCD", "WVN"]
  },
  "WERB": {
    "col": 2,
    "text": {
      "WERBH1": "Đội nhà tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH2": "Đội nhà tại vòng đấu 2, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH3": "Đội nhà tại vòng đấu 3, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH4": "Đội nhà tại vòng đấu 4, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH5": "Đội nhà tại vòng đấu 5, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH6": "Đội nhà tại vòng đấu 6, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH7": "Đội nhà tại vòng đấu 7, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH8": "Đội nhà tại vòng đấu 8, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH9": "Đội nhà tại vòng đấu 9, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH10": "Đội nhà tại vòng đấu10, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH11": "Đội nhà tại vòng đấu 11, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH12": "Đội nhà tại vòng đấu 12, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC1": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC2": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC3": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC4": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC5": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC6": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC7": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC8": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC9": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC10": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC11": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC12": "Đội Khách tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBHD": "Đội nhà thông qua phán quyết giành chiến thắng",
      "WERBCD": "Đội Khách thông qua phán quyết giành chiến thắng",
      "WERBN": "Trận hòa hoặc kỹ thuật hòa"
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
    "text": {
      "WERBH1": "Đội nhà tại vòng đấu 1, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH2": "Đội nhà tại vòng đấu 2, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBH3": "Đội nhà tại vòng đấu 3, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC1": "Đội Khách tại vòng đấu 1, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC2": "Đội Khách tại vòng đấu 2, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBC3": "Đội Khách tại vòng đấu 3, thông qua Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng",
      "WERBN": "Trận hòa hoặc kỹ thuật hòa"
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
    "text": {
      "RD1": "Vòng đấu 1",
      "RD2": "Vòng đấu 2",
      "RD3": "Vòng đấu 3",
      "RD4": "Vòng đấu 4",
      "RD5": "Vòng đấu 5",
      "RDP": "Đểm số"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  "WFO": {
    "col": 2,
    "text": {"WFOK": "Knock out, kỹ thuật Knock out", "WFOY": "đầu hàng", "WFOP": "điểm số"},
    "sort": ["WFOK", "WFOY", "WFOP"]
  },
  "WRD": {
    "col": 2,
    "text": {
      "RD1": "Vòng đấu 1",
      "RD2": "Vòng đấu 2",
      "RD3": "Vòng đấu 3",
      "RD4": "Vòng đấu 4",
      "RD5": "Vòng đấu 5",
      "RDP": "Đểm số"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  'RBW': {
    'col': 1,
    'text': {
      'RBWH1': '{homeTeam}Tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWH2': '{homeTeam}Tại vòng đấu 2, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWH3': '{homeTeam}Tại vòng đấu 3, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWH4': '{homeTeam}Tại vòng đấu 4, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWH5': '{homeTeam}Tại vòng đấu 5, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWHD': '{homeTeam}Phán quyết giành chiến thắng',
      'RBWC1': '{awayTeam}Tại vòng đấu 1, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWC2': '{awayTeam}Tại vòng đấu 2, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWC3': '{awayTeam}Tại vòng đấu 3, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWC4': '{awayTeam}Tại vòng đấu 4, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWC5': '{awayTeam}Tại vòng đấu 5, thông qua cú Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc mà giành chiến thắng',
      'RBWCD': '{awayTeam}Phán quyết giành chiến thắng',
      'RBWN': 'Trận hòa hoặc kỹ thuật hòa'
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
    "text": {
      "MVHK": "{homeTeam} Dựa vào cú Knock out, kỹ thuật Knock out / đối phương phạm lỗi mà giành chiến thắng",
      "MVHS": "{homeTeam} Thông qua đối phương đầu hàng mà giành chiến thắng",
      "MVHP": "{homeTeam} Thông qua ghi điểm giành chiến thắng",
      "MVN": "Hòa",
      "MVCK": "{awayTeam}Thông qua KO( cú đo ván) giành chiến thắng",
      "MVCS": "{awayTeam}Thông qua đối phương đầu hàng mà giành chiến thắng",
      "MVCP": "{awayTeam}Thông qua ghi điểm giành chiến thắng"
    },
    "sort": ['MVHK', 'MVCK', 'MVHS', 'MVCS', 'MVHP', 'MVCP', 'MVN']
  },
  "FD": {
    "col": 2,
    "text": {"FDY": "Có", "FDN": "Không"},
    "sort": ["FDY", "FDN"]
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'Tài {ratio}', 'AGH': 'Xỉu {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "WC": {
    "col": 1,
    "text": {
      "WCHK1": "{homeTeam}Tại vòng 1, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCHK2": "{homeTeam}Tại vòng 2, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCHK3": "{homeTeam}Tại vòng 3, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCHK4": "{homeTeam}Tại vòng 4, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCHK5": "{homeTeam}Tại vòng 5, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCHS1": "{homeTeam}Tại vòng 1, thông qua đối phương đầu hàng giành chiến thắng",
      "WCHS2": "{homeTeam}Tại vòng 2，thông qua đối phương đầu hàng giành chiến thắng",
      "WCHS3": "{homeTeam}Tại vòng 3, thông qua đối phương đầu hàng giành chiến thắng",
      "WCHS4": "{homeTeam}Tại vòng 4, thông qua đối phương đầu hàng giành chiến thắng",
      "WCHS5": "{homeTeam}Tại vòng 5, thông qua đối phương đầu hàng giành chiến thắng",
      "WCCK1": "{awayTeam}Tại vòng 1, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCCK2": "{awayTeam}Tại vòng 2, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCCK3": "{awayTeam}Tại vòng 3, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCCK4": "{awayTeam}Tại vòng 4, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCCK5": "{awayTeam}Tại vòng 5, dựa vào cú Knock out, kỹ thuật Knock out/đối phương phạm lỗi giành thắng",
      "WCCS1": "{awayTeam}Tại vòng 1, thông qua đối phương đầu hàng giành chiến thắng",
      "WCCS2": "{awayTeam}Tại vòng 2, thông qua đối phương đầu hàng giành chiến thắng",
      "WCCS3": "{awayTeam}Tại vòng 3, thông qua đối phương đầu hàng giành chiến thắng",
      "WCCS4": "{awayTeam}Tại vòng 4, thông qua đối phương đầu hàng giành chiến thắng",
      "WCCS5": "{awayTeam}Tại vòng 5, thông qua đối phương đầu hàng giành chiến thắng",
      "WCF": "Trận hòa hoặc kỹ thuật hòa"
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
    "text": {"T2RY": "Có", "T2RN": "Không"},
    "sort": ["T2RY", "T2RN"]
  },
  "T3R": {
    "col": 2,
    "text": {"T3RY": "Có", "T3RN": "Không"},
    "sort": ["T3RY", "T3RN"]
  },
  "T4R": {
    "col": 2,
    "text": {"T4RY": "Có", "T4RN": "Không"},
    "sort": ["T4RY", "T4RN"]
  },
  "T5R": {
    "col": 2,
    "text": {"T5RY": "Có", "T5RN": "Không"},
    "sort": ["T5RY", "T5RN"]
  },
  "HWM": {
    "col": 2,
    "text": {"HWMY": "Có", "HWMN": "Không"},
    "sort": ["HWMY", "HWMN"]
  },
  "CWM": {
    "col": 2,
    "text": {"CWMY": "Có", "CWMN": "Không"},
    "sort": ["CWMY", "CWMN"]
  },
  'END': {
    'col': 2,
    'text': {'ENDY': 'Có', 'ENDN': 'Không'},
    'sort': ['ENDY', 'ENDN']
  },
  "WTO": {
    "col": 1,
    "text": {
      "WTOHA": "{homeTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 0.5",
      "WTOHB": "{homeTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 1.5",
      "WTOHC": "{homeTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 2.5",
      "WTOHD": "{homeTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 3.5",
      "WTOHE": "{homeTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 4.5",
      "WTOCA": "{awayTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 0.5",
      "WTOCB": "{awayTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 1.5",
      "WTOCC": "{awayTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 2.5",
      "WTOCD": "{awayTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 3.5",
      "WTOCE": "{awayTeam}Chiến thắng và tổng điểm các vòng đấu Tài là 4.5"
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
      'WTUHA': '{homeTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 0.5',
      'WTUHB': '{homeTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 1.5',
      'WTUHC': '{homeTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 2.5',
      'WTUHD': '{homeTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 3.5',
      'WTUHE': '{homeTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 4.5',
      'WTUCA': '{awayTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 0.5',
      'WTUCB': '{awayTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 1.5',
      'WTUCC': '{awayTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 2.5',
      'WTUCD': '{awayTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 3.5',
      'WTUCE': '{awayTeam}Chiến thắng và tổng điểm các vòng đấu Xỉu là 4.5'
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
      "WT1": "Tại phút thứ nhất vòng đấu 1 (00:00-01:59) phân định được thắng thua",
      "WT2": "Tại phút thứ hai vòng đấu 1 (02:00-02:59) phân định được thắng thua",
      "WT3": "Tại phút thứ ba vòng đấu 1 (03:00-03:59) phân định được thắng thua",
      "WT4": "Tại phút thứ tư vòng đấu 1 (04:00-04:59) phân định được thắng thua",
      "WT5": "Sau phút thứ 4 vòng đấu 1 phân định được thắng thua",
      "WT6": "Tại phút thứ nhất vòng đấu 2 (00:00-01:59) phân định được thắng thua",
      "WT7": "Tại phút thứ hai vòng đấu 2 (02:00-02:59) phân định được thắng thua",
      "WT8": "Tại phút thứ ba vòng đấu 2 (03:00-03:59) phân định được thắng thua",
      "WT9": "Tại phút thứ tư vòng đấu 2 (04:00-04:59) phân định được thắng thua",
      "WT10": "Sau phút thứ 4 vòng đấu 2 phân định được thắng thua",
      "WT11": "Tại phút thứ nhất vòng đấu 3 (00:00-01:59) phân định được thắng thua",
      "WT12": "Tại phút thứ hai vòng đấu 3 (02:00-02:59) phân định được thắng thua",
      "WT13": "Tại phút thứ ba vòng đấu 3 (03:00-03:59) phân định được thắng thua",
      "WT14": "Tại phút thứ tư vòng đấu 3 (04:00-04:59) phân định được thắng thua",
      "WT15": "Sau phút thứ 4 vòng đấu 3 phân định được thắng thua",
      "WT16": "Tại phút thứ nhất vòng đấu 4 (00:00-01:59) phân định được thắng thua",
      "WT17": "Tại phút thứ hai vòng đấu 4 (02:00-02:59) phân định được thắng thua",
      "WT18": "Tại phút thứ ba vòng đấu 4 (03:00-03:59) phân định được thắng thua",
      "WT19": "Tại phút thứ tư vòng đấu 4 (04:00-04:59) phân định được thắng thua",
      "WT20": "Sau phút thứ 4 vòng đấu 4 phân định được thắng thua",
      "WT21": "Tại phút thứ nhất vòng đấu 5 (00:00-01:59) phân định được thắng thua",
      "WT22": "Tại phút thứ hai vòng đấu 5 (02:00-02:59) phân định được thắng thua",
      "WT23": "Tại phút thứ ba vòng đấu 5 (03:00-03:59) phân định được thắng thua",
      "WT24": "Tại phút thứ tư vòng đấu 5 (04:00-04:59) phân định được thắng thua",
      "WT25": "Sau phút thứ 4 vòng đấu 5 phân định được thắng thua",
      "WT26": "Hoàn thành tất cả các vòng đấu"
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
    "text": {"WM1": "Cú Knock out, kỹ thuật Knock out/ đối phương phạm lỗi", "WM2": "đầu hàng", "WM3": "ghi điểm", "WM4": "trận hòa"},
    "sort": ["WM1", "WM2", "WM3", "WM4"]
  },
  "WDC": {
    "col": 1,
    "text": {
      "WDCA": "Knock out，kỹ thuật Knock out，đối phương phạm lỗi/đầu hàng",
      "WDCB": "Đầu hàng/ghi điểm",
      "WDCC": "Knock out，kỹ thuật Knock out，đối phương phạm lỗi/ghi điểm"
    },
    "sort": ["WDCA", "WDCB", "WDCC"]
  },
  'TMW': {
    'col': 3,
    'text': {'TMWH': '{homeTeam}', 'TMWC': '{awayTeam}', 'TMWN': 'Hòa'},
    'sort': ['TMWH', 'TMWC', 'TMWN']
  },
  'MBOA': {
    'col': 3,
    'text': {'MBOAH': '{homeTeam}', 'MBOAC': '{awayTeam}', 'MBOAN': 'Hòa'},
    'sort': ['MBOAH', 'MBOAC', 'MBOAN']
  },
  "TD": {
    "col": 2,
    "text": {"TDH": "{homeTeam}", "TDC": "{awayTeam}"},
    "sort": ["TDH", "TDC"]
  },
  "TM": {
    "col": 2,
    "text": {"TMH": "{homeTeam}", "TMC": "{awayTeam}"},
    "sort": ["TMH", "TMC"]
  },
  'DA': {
    'col': 1,
    'text': {'DAY': 'Có'},
    'sort': ['DAY']
  },
  'UDA': {
    'col': 1,
    'text': {'UDAY': 'Có'},
    'sort': ['UDAY']
  },
  'UDB': {
    'col': 1,
    'text': {'UDBY': 'Có'},
    'sort': ['UDBY']
  },
  'DMA': {
    'col': 1,
    'text': {'DMAY': 'Có'},
    'sort': ['DMAY']
  },
  'DMB': {
    'col': 1,
    'text': {'DMBY': 'Có'},
    'sort': ['DMBY']
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
};
