//มวยสากล
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
      "WMHK": "{homeTeam}ผ่านKOชนะ",
      "WMHD": "{homeTeam}ผ่านการชนะการตัดสิน",
      "WMN": "เสมอ",
      "WMCK": "{awayTeam}ผ่านKOชนะ",
      "WMCD": "{awayTeam}ผ่านการชนะการตัดสิ"
    },
    "sort": ["WMHK", "WMHD", "WMN", "WMCK", "WMCD"]
  },
  "WFD": {
    "col": 2,
    "text": {"WFDY": "ใช่", "WFDN": "ไม่"},
    "sort": ["WFDY", "WFDN"]
  },
  "WER": {
    "col": 3,
    "text": {
      "WERH1": "{homeTeam} รอบ1",
      "WERH2": "{homeTeam} รอบ2",
      "WERH3": "{homeTeam} รอบ3",
      "WERH4": "{homeTeam} รอบ4",
      "WERH5": "{homeTeam} รอบ5",
      "WERH6": "{homeTeam} รอบ6",
      "WERH7": "{homeTeam} รอบ7",
      "WERH8": "{homeTeam} รอบ8",
      "WERH9": "{homeTeam} รอบ9",
      "WERH10": "{homeTeam} รอบ10",
      "WERH11": "{homeTeam} รออบ11",
      "WERH12": "{homeTeam} รอบ12",
      "WERHD": "{homeTeam} ตัดสินผู้ชนะ",
      "WERN": "เสมอ",
      "WERC1": "{awayTeam} รอบ1",
      "WERC2": "{awayTeam} รอบ2",
      "WERC3": "{awayTeam} รอบ3",
      "WERC4": "{awayTeam} รอบ4",
      "WERC5": "{awayTeam} รอบ5",
      "WERC6": "{awayTeam} รอบ6",
      "WERC7": "{awayTeam} รอบ7",
      "WERC8": "{awayTeam} รอบ8",
      "WERC9": "{awayTeam} รอบ9",
      "WERC10": "{awayTeam} รอบ10",
      "WERC11": "{awayTeam} รอบ11",
      "WERC12": "{awayTeam} รอบ12",
      "WERCD": "{awayTeam} ตัดสินผู็ชนะ"
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
      "WRRH0": "{homeTeam} รอบ1-3",
      "WRRH1": "{homeTeam} รอบ4-6",
      "WRRH2": "{homeTeam} รอบ7-9",
      "WRRH3": "{homeTeam} รอบ10-12",
      "WRRH4": "{homeTeam} ตัดสินผู้ชนะ",
      "WRRN5": "เสมอ",
      "WRRC6": "{awayTeam} รอบ1-3",
      "WRRC7": "{awayTeam} รอบ4-6",
      "WRRC8": "{awayTeam} รอบ7-9",
      "WRRC9": "{awayTeam} รอบ10-12",
      "WRRC0": "{awayTeam} ตัดสินผู้ชนะ"
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
      "WVHK": "เจ้าบ้านทำฝ่ายตรงข้ามล้มแล้วขอสละสิทธิ์ยอมแพ้",
      "WVHD": "กรรมการตัดสินเจ้าบ้านผู้ชนะ",
      "WVCK": "ทีมเยือนทำฝ่ายตรงข้ามล้มแล้วสละสิทธิ์ยอมแพ้",
      "WVCD": "กรรมการตัดสินทีมเยือนผู้ชนะ",
      "WVN": "เสมอ"
    },
    "sort": ["WVHK", "WVHD", "WVCK", "WVCD", "WVN"]
  },
  "WERB": {
    "col": 2,
    "text": {
      "WERBH1": "ทีมเจ้าบ้านชนะรอบ1ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH2": "ทีมเจ้าบ้านชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH3": "ทีมเจ้าบ้านชนะรอบ3ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH4": "ทีมเจ้าบ้านชนะรอบ4ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH5": "ทีมเจ้าบ้านชนะรอบ5ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH6": "ทีมเจ้าบ้านชนะรอบ6ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH7": "ทีมเจ้าบ้านชนะรอบ7ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH8": "ทีมเจ้าบ้านชนะรอบ8เด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH9": "ทีมเจ้าบ้านชนะรอบ9เด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH10": "ทีมเจ้าบ้านชนะรอบ10เด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH11": "ทีมเจ้าบ้านชนะรอบ11เด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH12": "ทีมเจ้าบ้านชนะรอบ12เด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC1": "ทีมเยือนชนะรอบ1ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC2": "ทีมเยือนชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC3": "ทีมเยือนชนะรอบ3ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC4": "ทีมเยือนชนะรอบ4ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC5": "ทีมเยือนชนะรอบ5ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC6": "ทีมเยือนชนะรอบ6ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC7": "ทีมเยือนชนะรอบ7ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC8": "ทีมเยือนชนะรอบ8ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC9": "ทีมเยือนชนะรอบ9ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC10": "ทีมเยือนชนะรอบ10ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC11": "ทีมเยือนชนะรอบ11ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC12": "ทีมเยือนชนะรอบ12ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBHD": "กรรมการตัดสินเจ้าบ้านผู้ชนะ",
      "WERBCD": "กรรมการตัดสินทีมเยือนผู้ชนะ",
      "WERBN": "เสมอ"
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
      "WERBH1": "ทีมเจ้าบ้านชนะ1แรกด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH2": "ทีมเจ้าบ้านชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBH3": "ทีมเจ้าบ้านชนะรอบส3ด้วยการล้มลงหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC1": "ทีมเยือนชนะรอบ1ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC2": "ทีมเยือนชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBC3": "ทีมเยือนชนะรอบ3ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้",
      "WERBN": "เสมอ"
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
      "RD1": "รอบที่1",
      "RD2": "รอบที่2",
      "RD3": "รอบที่3",
      "RD4": "รอบที่4",
      "RD5": "รอบที่5",
      "RDP": "คะแนะ"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  "WFO": {
    "col": 2,
    "text": {"WFOK": "ล้มลง/ล้มลงทางเทคนิค", "WFOY": "ยอมแพ้", "WFOP": "คะแนะ"},
    "sort": ["WFOK", "WFOY", "WFOP"]
  },
  "WRD": {
    "col": 2,
    "text": {
      "RD1": "รอบที่1",
      "RD2": "รอบที่2",
      "RD3": "รอบที่3",
      "RD4": "รอบที่4",
      "RD5": "รอบที่5",
      "RDP": "คะแนะ"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  'RBW': {
    'col': 1,
    'text': {
      'RBWH1': '{homeTeam}รอบ1ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWH2': '{homeTeam}รอบ2ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWH3': '{homeTeam}รอบ3ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWH4': '{homeTeam}รอบ4ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWH5': '{homeTeam}รอบ5ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWHD': '{homeTeam}ผ่านการชนะการตัดสิน',
      'RBWC1': '{awayTeam}รอบ1ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWC2': '{awayTeam}รอบ2ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWC3': '{awayTeam}รอบ3ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWC4': '{awayTeam}รอบ4ชนะด้วยการล้มทางเทคนิคหรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWC5': '{awayTeam}รอบ5ชนะด้วยการล้มทางเทคนิค หรือฝ่ายตรงข้ามขอยอมแพ้',
      'RBWCD': '{awayTeam}ผ่านการชนะการตัดสิน',
      'RBWN': 'เสมอ'
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
      "MVHK": "{homeTeam}ล้มลงโดยการเทคนิคหรือชนะโดยการปรับแพ้",
      "MVHS": "{homeTeam}ชนะฝ่ายตรงข้ามยอมแพ้",
      "MVHP": "{homeTeam}คะแนนผลชนะ",
      "MVN": "เสมอ",
      "MVCK": "{awayTeam}ผ่านKOชนะ",
      "MVCS": "{awayTeam}ชนะฝ่ายตรงข้ามยอมแพ้",
      "MVCP": "{awayTeamคะแนนผลชนะ"
    },
    "sort": ['MVHK', 'MVCK', 'MVHS', 'MVCS', 'MVHP', 'MVCP', 'MVN']
  },
  "FD": {
    "col": 2,
    "text": {"FDY": "ใช่", "FDN": "ไม่"},
    "sort": ["FDY", "FDN"]
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'ใหญ่ {ratio}', 'AGH': 'เล็ก {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "WC": {
    "col": 1,
    "text": {
      "WCHK1": "{homeTeam}รอบที่1ล้มลง ทางเทคนิค ตรงข้ามฟาวล์",
      "WCHK2": "{homeTeam}รอบที่2ล้มลง ทางเทคนิค ตรงข้ามฟาวล์",
      "WCHK3": "{homeTeam}รอบที่3ล้มลง ทางเทคนิค ตรงข้ามฟาวล์",
      "WCHK4": "{homeTeam}รอบที่4ล้มลง ทางเทคนิค ตรงข้ามฟาวล์",
      "WCHK5": "{homeTeam}รอบที่5ล้มลง ทางเทคนิค ตรงข้ามฟาวล์",
      "WCHS1": "{homeTeam}รอบที่1ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCHS2": "{homeTeam}รอบที่2ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCHS3": "{homeTeamรอบที่3ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCHS4": "{homeTeam}รอบที่4ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCHS5": "{homeTeam}รอบที่5ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCCK1": "{awayTeam}รอบที่1ชนะโดยการเทคนิคหรือชนะโดยการปรับแพ้",
      "WCCK2": "{awayTeam}รอบที่2ชนะโดยการเทคนิคหรือชนะโดยการปรับแพ้",
      "WCCK3": "{awayTeam}รอบที่3ชนะโดยการเทคนิดหรือชนะโดยการปรับแพ้",
      "WCCK4": "{awayTeam}รอบที่4ชนะโดยการเทคนิคหรือชนะโดยการปรับแพ้",
      "WCCK5": "{awayTeamรอบที่5ชนะโดยการเทคนิคหรือชนะโดยการปรับแพ้",
      "WCCS1": "{awayTeam}รอบที่1ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCCS2": "{awayTeam}รอบที่2ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCCS3": "{awayTeam}รอบที่3ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCCS4": "{awayTeam}รอบที่4ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCCS5": "{awayTeam}รอบที่5ชนะฝ่ายตรงข้ามยอมแพ้",
      "WCF": "เสมอ"
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
    "text": {"T2RY": "ใช่", "T2RN": "ไม่"},
    "sort": ["T2RY", "T2RN"]
  },
  "T3R": {
    "col": 2,
    "text": {"T3RY": "ใช่", "T3RN": "ไม่"},
    "sort": ["T3RY", "T3RN"]
  },
  "T4R": {
    "col": 2,
    "text": {"T4RY": "ใช่", "T4RN": "ไม่"},
    "sort": ["T4RY", "T4RN"]
  },
  "T5R": {
    "col": 2,
    "text": {"T5RY": "ใช่", "T5RN": "ไม่"},
    "sort": ["T5RY", "T5RN"]
  },
  "HWM": {
    "col": 2,
    "text": {"HWMY": "ใช่", "HWMN": "ไม่"},
    "sort": ["HWMY", "HWMN"]
  },
  "CWM": {
    "col": 2,
    "text": {"CWMY": "ใช่", "CWMN": "ไม่"},
    "sort": ["CWMY", "CWMN"]
  },
  'END': {
    'col': 2,
    'text': {'ENDY': 'ใช่', 'ENDN': 'ไม่'},
    'sort': ['ENDY', 'ENDN']
  },
  "WTO": {
    "col": 1,
    "text": {
      "WTOHA": "{homeTeam}การชนะและรอบรวมมากกว่า0.5",
      "WTOHB": "{homeTeam}การชนะและรอบรวมมากกว่า1.5",
      "WTOHC": "{homeTeam}การชนะและรอบรวมมากกว่า1.5",
      "WTOHD": "{homeTeam}การชนะและรอบรวมมากกว่า3.5",
      "WTOHE": "{homeTeam}การชนะและรอบรวมมากกว่า4.5",
      "WTOCA": "{awayTeam}การชนะและรอบรวมมากกว่า0.5",
      "WTOCB": "{awayTeam}การชนะและรอบรวมมากกว่า1.5",
      "WTOCC": "{awayTeam}การชนะและรอบรวมมากกว่า2.5",
      "WTOCD": "{awayTeam}การชนะและรอบรวมมากกว่า3.5",
      "WTOCE": "{awayTeam}การชนะและรอบรวมมากกว่า4.5"
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
      'WTUHA': '{homeTeam}การชนะและรอบรวมน้อยกว่า0.5',
      'WTUHB': '{homeTeam}การชนะและรอบรวมน้อยกว่า1.5',
      'WTUHC': '{homeTeam}การชนะและรอบรวมน้อยกว่า1.5',
      'WTUHD': '{homeTeam}การชนะและรอบรวมน้อยกว่า3.5',
      'WTUHE': '{homeTeam}การชนะและรอบรวมน้อยกว่า4.5',
      'WTUCA': '{awayTeam}การชนะและรอบรวมน้อยกว่า0.5',
      'WTUCB': '{awayTeam}การชนะและรอบรวมน้อยกว่า1.5',
      'WTUCC': '{awayTeam}การชนะและรอบรวมน้อยกว่า2.5',
      'WTUCD': '{awayTeam}การชนะและรอบรวมน้อยกว่า.5',
      'WTUCE': '{awayTeam}การชนะและรอบรวมน้อยกว่า4.5'
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
      "WT1": "รอบที่1ของ1นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT2": "รอบที่1ของ2นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT3": "รอบที่1ของ3นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT4": "รอบที่1ของ4นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT5": "รอบที่1ของ4นาทีแบ่งผู้ชนะและแพ้",
      "WT6": "รอบที2ของ1นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT7": "รอบที2ของ2นาที(02:00-02:59)แบ่งผู้ชนะและแพ้",
      "WT8": "รอบที2ของ3นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT9": "รอบที2ของ4นาที(04:00-04:59)แบ่งผู้ชนะและแพ้",
      "WT10": "รอบที่2ของ4นาทีแบ่งผู้ชนะและแพ้",
      "WT11": "รอบที่3ของ1นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT12": "รอบที่3ของ2นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT13": "รอบที่3ของ3นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT14": "รอบที่3ของ4นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT15": "รอบที่3ของ4นาทีแบ่งผู้ชนะและแพ้",
      "WT16": "รอบที่4ของ1นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT17": "รอบที่4ของ2นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT18": "รอบที่4ของ3นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT19": "รอบที่4ของ4นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT20": "รอบที่4ของ4นาทีแบ่งผู้ชนะและแพ้",
      "WT21": "รอบที่5ของ1นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT22": "รอบที่5ของ2นาที(00:00-01:59)แบ่งผู้ชนะและแพ้",
      "WT23": "รอบที่5ของ3นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT24": "รอบที่5ของ4นาที(03:00-03:59)แบ่งผู้ชนะและแพ้",
      "WT25": "รอบที่5ของ4นาทีแบ่งผู้ชนะและแพ้",
      "WT26": "ยอดรวมสุทธิ"
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
    "text": {"WM1": "ล้มลงโดยการเทคนิคหรือชนะโดยการปรับแพ้", "WM2": "ยอมแพ้", "WM3": "ได้คะแนน", "WM4": "เสมอ"},
    "sort": ["WM1", "WM2", "WM3", "WM4"]
  },
  "WDC": {
    "col": 1,
    "text": {
      "WDCA": "ล้มลงโดยการเทคนิคหรือชนะโดยการยอมแพ้",
      "WDCB": "ยอมแพ้หรือคะแนน",
      "WDCC": "ล้มลง,ล้มลงมางเทศนิด,ตรงข้ามฟาวล์ได้คะแนน"
    },
    "sort": ["WDCA", "WDCB", "WDCC"]
  },
  'TMW': {
    'col': 3,
    'text': {'TMWH': '{homeTeam}', 'TMWC': '{awayTeam}', 'TMWN': 'เสมอ'},
    'sort': ['TMWH', 'TMWC', 'TMWN']
  },
  'MBOA': {
    'col': 3,
    'text': {'MBOAH': '{homeTeam}', 'MBOAC': '{awayTeam}', 'MBOAN': 'เสมอ'},
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
    'text': {'DAY': 'ใช่'},
    'sort': ['DAY']
  },
  'UDA': {
    'col': 1,
    'text': {'UDAY': "ใช่"},
    'sort': ['UDAY']
  },
  'UDB': {
    'col': 1,
    'text': {'UDBY': 'ใช่'},
    'sort': ['UDBY']
  },
  'DMA': {
    'col': 1,
    'text': {'DMAY': 'ใช่'},
    'sort': ['DMAY']
  },
  'DMB': {
    'col': 1,
    'text': {'DMBY': 'ใช่'},
    'sort': ['DMBY']
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
};
