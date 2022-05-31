  // 综合格斗

const dynamic op_mmaRadioTypes = {

  'M': {
    'col': 2,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
  },
  'MN': {
    'col': 2,
    'text': {'MNH': '{homeTeam}', 'MNC': '{awayTeam}'},
    'sort': ['MNH', 'MNC']
  },
  'WME': {
    'col': 2,
    'text': {
      'WMHK': '{homeTeam}ชนะ ผ่าน',
      'WMHS': '{homeTeam}ชนะโยฝ่ายตรงข้ามยอมแพ้',
      'WMHD': '{homeTeam}}ผ่านการชนะการตัดสิ',
      'WMN': 'เสมอ',
      'WMCK': '{awayTeam}ชนะ ผ่าน',
      'WMCS': '{awayTeam}ชนะโดนฝ่ายตรงข้ามยอมแพ้',
      'WMCD': '{awayTeam}ผ่านการชนะการตัดสิ'
    },
    'sort': ['WMHK', 'WMHS', 'WMHD', 'WMN', 'WMCK', 'WMCS', 'WMCD']
  },
  'WFD': {
    'col': 2,
    'text': {'WFDY': 'ใช่', 'WFDN': 'ไม่'},
    'sort': ['WFDY', 'WFDN']
  },
  'WER': {
    'col': 3,
    'text': {
      'WER3H1': '{homeTeam} รอบที่1',
      'WER3H2': '{homeTeam} รอบที่2',
      'WER3H3': '{homeTeam} รอบที่3',
      'WER3HD': '{homeTeam} ตัดสินผู้ชนะ',
      'WER3N': 'เสมอ',
      'WER3C1': '{awayTeam} รอบที่1',
      'WER3C2': '{awayTeam} รอบที่2',
      'WER3C3': '{awayTeam} รอบที่3',
      'WER3CD': '{awayTeam} ตัดสินผู้ชนะ',
      'WER5H1': '{homeTeam} รอบที่1',
      'WER5H2': '{homeTeam} รอบที่2',
      'WER5H3': '{homeTeam} รอบที่3',
      'WER5H4': '{homeTeam} รอบที่4',
      'WER5H5': '{homeTeam} รอบที่5',
      'WER5HD': '{homeTeam} ตัดสินผู้ชนะ',
      'WER5N': 'เสมอ',
      'WER5C1': '{awayTeam} รอบที่1',
      'WER5C2': '{awayTeam} รอบที่2',
      'WER5C3': '{awayTeam} รอบที่3',
      'WER5C4': '{awayTeam} รอบที่4',
      'WER5C5': '{awayTeam} รอบที่5',
      'WER5CD': '{awayTeam} ตัดสินผู้ชนะ'
    },
    'sort': [
      'WER3H1',
      'WER3H2',
      'WER3H3',
      'WER3HD',
      'WER3N',
      'WER3C1',
      'WER3C2',
      'WER3C3',
      'WER3CD',
      'WER5H1',
      'WER5H2',
      'WER5H3',
      'WER5H4',
      'WER5H5',
      'WER5HD',
      'WER5N',
      'WER5C1',
      'WER5C2',
      'WER5C3',
      'WER5C4',
      'WER5C5',
      'WER5CD'
    ]
  },

  'WVM': {
    'col': 2,
    'text': {
      'WVHK': 'เจ้าบ้านทำฝ่ายตรงข้ามล้มแล้วขอสละสิทธิ์ยอมแพ้',
      'WVHD': 'กรรมการตัดสินเจ้าบ้านผู้ชนะ',
      'WVCK': 'กรรมการตัดสินเจ้าบ้านผู้ชนะ',
      'WVCD': 'กรรมการตัดสินทีมเยือนผู้ชนะ',
      'WVN': 'เสมอหรือฟาวเทนิค',
    },
    'sort': ['WVHK', 'WVHD', 'WVCK', 'WVCD', 'WVN']
  },
  'WERB': {
    'col': 2,
    'text': {
      'WERBH1': 'ทีมเจ้าบ้านชนะรอบ1ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBH2': 'ทีมเจ้าบ้านชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBH3': 'ทีมเจ้าบ้านชนะรอบ3ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBC1': 'ทีมเยือนชนะรอบ1ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBC2': 'ทีมเยือนชนะรอบ2ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBC3': 'ทีมเยือนชนะรอบ3ด้วยการล้มลงทางเทคนิคหรือฝ่ายตรงข้ามขอย้อมแพ้',
      'WERBN':'เสมอหรือฟาวเทนิค'
    },
    'sort': ['WERBH1', 'WERBH2', 'WERBH3', 'WERBC1', 'WERBC2','WERBC3','WERBN']
  },

};
