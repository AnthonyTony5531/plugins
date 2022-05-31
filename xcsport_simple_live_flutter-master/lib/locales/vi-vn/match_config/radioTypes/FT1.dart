const dynamic ftRadioTypes = {
  "WTW": {
    "col": 2,
    "text": {"WTWH": "{homeTeam}", "WTWC": "{awayTeam}"},
    "sort": ["WTWH", "WTWC"]
  },
  "WMD": {
    "col": 3,
    "text": {
      "WMD1RT": "Thời gian thi đấu chính thức chủ thắng",
      "WMD1OT": "Hiệp phụ chủ thắng",
      "WMD1SO": "Loạt sút luân lưu chủ thắng",
      "WMD2RT": "Thời gian thi đấu chính thức khách thắng",
      "WMD2OT": "Hiệp phụ khách thắng",
      "WMD2SO": "Loạt sút luân lưu khách thắng"
    },
    "sort": ["WMD1RT", "WMD1OT", "WMD1SO", "WMD2RT", "WMD2OT", "WMD2SO"]
  },
  "LG": {
    "col": 3,
    "text": {"LGH": "{homeTeam}", "LGA": "{awayTeam}", "LGN": "không có bàn thắng"},
    "sort": ["LGH", "LGA", "LGN"]
  },
  "EGS": {
    "col": 2,
    "text": {
      "EGS1_0": "0",
      "EGS1_1": "1",
      "EGS1_2": "2",
      "EGS1_3": "3",
      "EGS1_4": "4",
      "EGS1_5+": "5+",
      "EGS2_0": "0",
      "EGS2_1": "1",
      "EGS2_2": "2",
      "EGS2_3": "3",
      "EGS2_4": "4",
      "EGS2_5": "5",
      "EGS2_6+": "6+",
      "EGS3_0": "0",
      "EGS3_1": "1",
      "EGS3_2": "2",
      "EGS3_3": "3",
      "EGS3_4": "4",
      "EGS3_5": "5",
      "EGS3_6": "6",
      "EGS3_7": "7",
      "EGS3_8": "8",
      "EGS3_9+": "9+"
    },
    "sort": [
      "EGS1_0",
      "EGS1_1",
      "EGS1_2",
      "EGS1_3",
      "EGS1_4",
      "EGS1_5+",
      "EGS2_0",
      "EGS2_1",
      "EGS2_2",
      "EGS2_3",
      "EGS2_4",
      "EGS2_5",
      "EGS2_6+",
      "EGS3_0",
      "EGS3_1",
      "EGS3_2",
      "EGS3_3",
      "EGS3_4",
      "EGS3_5",
      "EGS3_6",
      "EGS3_7",
      "EGS3_8",
      "EGS3_9+"
    ]
  },
  "EGHT": {
    "col": 2,
    "text": {"EGHT0": "0", "EGHT1": "1", "EGHT2": "2", "EGHT3+": "3+"},
    "sort": ["EGHT0", "EGHT1", "EGHT2", "EGHT3+"]
  },
  "EGAT": {
    "col": 2,
    "text": {"EGAT0": "0", "EGAT1": "1", "EGAT2": "2", "EGAT3+": "3+"},
    "sort": ["EGAT0", "EGAT1", "EGAT2", "EGAT3+"]
  },
  "OEHT": {
    "col": 2,
    "text": {"OEHTO": "Lẻ ", "OEHTE": "Chẵn"},
    "sort": ["OEHTO", "OEHTE"]
  },
  "OEAT": {
    "col": 2,
    "text": {"OEATO": "Lẻ ", "OEATE": "Chẵn"},
    "sort": ["OEATO", "OEATE"]
  },
  "WTTS": {
    "col": 2,
    "text": {"WTTSH": "chỉ có đội nhà", "WTTSA": "chỉ có đội khách", "WTTSB": "chủ khách đều có bàn thắng", "WTTSN": "không có bàn thắng"},
    "sort": ["WTTSH", "WTTSA", "WTTSB", "WTTSN"]
  },
  "CSHT": {
    "col": 2,
    "text": {"CSHTY": "Phải", "CSHTN": "Không"},
    "sort": ["CSHTY", "CSHTN"]
  },
  "CSAT": {
    "col": 2,
    "text": {"CSATY": "Phải", "CSATN": "Không"},
    "sort": ["CSATY", "CSATN"]
  },
  "WHN": {
    "col": 2,
    "text": {"WHNY": "Phải", "WHNN": "Không"},
    "sort": ["WHNY", "WHNN"]
  },
  "WHA": {
    "col": 2,
    "text": {"WHAY": "Phải", "WHAN": "Không"},
    "sort": ["WHAY", "WHAN"]
  },
  "BTTS": {
    "col": 3,
    "text": {
      "BTTSHY": "Chủ thắng/Phải",
      "BTTSHN": "Chủ thắng/Không",
      "BTTSDY": "Hòa/Phải",
      "BTTSDN": "Hòa/Không",
      "BTTSAY": "Khách thắng/Phải",
      "BTTSAN": "Khách thắng/Không"
    },
    "sort": ["BTTSHY", "BTTSHN", "BTTSDY", "BTTSDN", "BTTSAY", "BTTSAN"]
  },
  "TBTS": {
    "col": 2,
    "text": {
      "TBTSOY": "Tài{total}/Phải",
      "TBTSUY": "Xỉu{total}/Phải",
      "TBTSON": "Tài{total}/Không",
      "TBTSUN": "Xỉu{total}/Không"
    },
    "sort": ["TBTSOY", "TBTSUY", "TBTSON", "TBTSUN"]
  },
  "MOU": {
    "col": 2,
    "text": {
      "MOUHO": "Chủ thắng/Tài{total}",
      "MOUHU": "Chủ thắng/Xỉu{total}",
      "MOUDO": "Hòa/Tài{total}",
      "MOUDU": "Hòa/Xỉu{total}",
      "MOUAO": "Khách thắng/Tài{total}",
      "MOUAU": "Khách thắng/Xỉu{total}"
    },
    "sort": ["MOUHO", "MOUHU", "MOUDO", "MOUDU", "MOUAO", "MOUAU"]
  },
  "HTWBH": {
    "col": 2,
    "text": {"HTWBHY": "Phải", "HTWBHN": "Không"},
    "sort": ["HTWBHY", "HTWBHN"]
  },
  "ATWBH": {
    "col": 2,
    "text": {"ATWBHY": "Phải", "ATWBHN": "Không"},
    "sort": ["ATWBHY", "ATWBHN"]
  },
  "HTWEH": {
    "col": 2,
    "text": {"HTWEHY": "Phải", "HTWEHN": "Không"},
    "sort": ["HTWEHY", "HTWEHN"]
  },
  "ATWEH": {
    "col": 2,
    "text": {"ATWEHY": "Phải", "ATWEHN": "Không"},
    "sort": ["ATWEHY", "ATWEHN"]
  },
  "SHSH": {
    "col": 3,
    "text": {"SHSH1": "Hiệp 1", "SHSH2": "Hiệp 2", "SHSHE": "điểm số bằng nhau"},
    "sort": ["SHSH1", "SHSH2", "SHSHE"]
  },
  "HSHH": {
    "col": 3,
    "text": {"HSHH1": "Hiệp 1", "HSHH2": "Hiệp 2", "HSHHE": "điểm số bằng nhau"},
    "sort": ["HSHH1", "HSHH2", "HSHHE"]
  },
  "HSHA": {
    "col": 3,
    "text": {"HSHA1": "Hiệp 1", "HSHA2": "Hiệp 2", "HSHAE": "điểm số bằng nhau"},
    "sort": ["HSHA1", "HSHA2", "HSHAE"]
  },
  "HBTS": {
    "col": 2,
    "text": {
      "HBTSNN": "Không/Không",
      "HBTSYN": "Phải/Không",
      "HBTSYY": "Phải/Phải",
      "HBTSNY": "Không/Phải"
    },
    "sort": ["HBTSNN", "HBTSYN", "HBTSYY", "HBTSNY"]
  },
  "SBH_H": {
    "col": 2,
    "text": {"SBH_HY": "Phải", "SBH_HN": "Không"},
    "sort": ["SBH_HY", "SBH_HN"]
  },
  "SBH_C": {
    "col": 2,
    "text": {"SBH_CY": "Phải", "SBH_CN": "Không"},
    "sort": ["SBH_CY", "SBH_CN"]
  },
  "DC_H": {
    "col": 3,
    "text": {"DC_H1X": "chủ hòa", "DC_H12": "chủ khách", "DC_HX2": "hòa khách"},
    "sort": ["DC_H1X", "DC_H12", "DC_HX2"]
  },
  "DNB_H": {
    "col": 2,
    "text": {"DNB_HH": "{homeTeam}", "DNB_HA": "{awayTeam}"},
    "sort": ["DNB_HH", "DNB_HA"]
  },
  "HEG": {
    "col": 2,
    "text": {
      "HEG10": "0",
      "HEG11": "1",
      "HEG12": "2+",
      "HEG20": "0",
      "HEG21": "1",
      "HEG22": "2",
      "HEG23": "3+",
      "HEG30": "0",
      "HEG31": "1",
      "HEG32": "2",
      "HEG33": "3",
      "HEG34": "4+"
    },
    "sort": [
      "HEG10",
      "HEG11",
      "HEG12",
      "HEG20",
      "HEG21",
      "HEG22",
      "HEG23",
      "HEG30",
      "HEG31",
      "HEG32",
      "HEG33",
      "HEG34"
    ]
  },
  "BTS_H": {
    "col": 2,
    "text": {"BTS_HY": "Phải", "BTS_HN": "Không"},
    "sort": ["BTS_HY", "BTS_HN"]
  },
  "MBTS_H": {
    "col": 2,
    "text": {
      "MBTS_HHY": "Chủ thắng/Phải",
      "MBTS_HHN": "Chủ thắng/Không",
      "MBTS_HDY": "Hòa/Phải",
      "MBTS_HDN": "Hòa/Không",
      "MBTS_HAY": "Khách thắng/Phải",
      "MBTS_HAN": "Khách thắng/Không"
    },
    "sort": [
      "MBTS_HHY",
      "MBTS_HHN",
      "MBTS_HDY",
      "MBTS_HDN",
      "MBTS_HAY",
      "MBTS_HAN"
    ]
  },
  "MOU_H": {
    "col": 2,
    "text": {
      "MOU_HHO": "Chủ thắng/Tài{total}",
      "MOU_HHU": "Chủ thắng/Xỉu{total}",
      "MOU_HDO": "Hòa/Tài{total}",
      "MOU_HDU": "Hòa/Xỉu{total}",
      "MOU_HAO": "Khách thắng/Tài{total}",
      "MOU_HAU": "Khách thắng/Xỉu{total}"
    },
    "sort": ["MOU_HHO", "MOU_HHU", "MOU_HDO", "MOU_HDU", "MOU_HAO", "MOU_HAU"]
  },
  "HM2": {
    "col": 3,
    "text": {"HM2H": "{homeTeam}", "HM2D": "Hòa", "HM2A": "{awayTeam}"},
    "sort": ["HM2H", "HM2D", "HM2A"]
  },
  "HR2": {
    "col": 2,
    "text": {"HR2H": "{homeTeam} {ratio}", "HR2C": "{awayTeam} {ratio}"},
    "sort": ["HR2H", "HR2C"]
  },
  "HOU2": {
    "col": 2,
    "text": {"HOU2O": "Tài {ratio}", "HOU2U": "Xỉu {ratio}"},
    "sort": ["HOU2O", "HOU2U"]
  },
  "HEG2": {
    "col": 3,
    "text": {"HEG2_0": "0", "HEG2_1": "1", "HEG2_2": "2+"},
    "sort": ["HEG2_0", "HEG2_1", "HEG2_2"]
  },
  "HEO2": {
    "col": 2,
    "text": {"HEO2O": "Lẻ ", "HEO2E": "Chẵn"},
    "sort": ["HEO2O", "HEO2E"]
  },
  "BTTS2": {
    "col": 2,
    "text": {"BTTS2Y": "Phải", "BTTS2N": "Không"},
    "sort": ["BTTS2Y", "BTTS2N"]
  },
  "AM_FM": {
    "col": 3,
    "text": {"AM_FMH": "{homeTeam}", "AM_FMD": "Hòa", "AM_FMA": "{awayTeam}"},
    "sort": ["AM_FMH", "AM_FMD", "AM_FMA"]
  },
  "AOU_FOU": {
    "col": 2,
    "text": {"AOU_FOUO": "Tài {ratio}", "AOU_FOUU": "Xỉu {ratio}"},
    "sort": ["AOU_FOUO", "AOU_FOUU"]
  },
  "TM_FM": {
    "col": 3,
    "text": {"TM_FMH": "{homeTeam}", "TM_FMD": "Hòa", "TM_FMA": "{awayTeam}"},
    "sort": ["TM_FMH", "TM_FMD", "TM_FMA"]
  },
  "TOU_FOU": {
    "col": 2,
    "text": {"TOU_FOUO": "Tài {ratio}", "TOU_FOUU": "Xỉu {ratio}"},
    "sort": ["TOU_FOUO", "TOU_FOUU"]
  },
  "OTG": {
    "col": 2,
    "text": {"OTGY": "Phải", "OTGN": "Không"},
    "sort": ["OTGY", "OTGN"]
  },
  "OTM": {
    "col": 3,
    "text": {"OTMH": "{homeTeam}", "OTMD": "Hòa", "OTMA": "{awayTeam}"},
    "sort": ["OTMH", "OTMD", "OTMA"]
  },
  "OTOU": {
    "col": 2,
    "text": {"OTOUO": "Tài {ratio}", "OTOUU": "Xỉu {ratio}"},
    "sort": ["OTOUO", "OTOUU"]
  },
  "OTR": {
    "col": 2,
    "text": {"OTRH": "{homeTeam} {ratio}", "OTRC": "{awayTeam} {ratio}"},
    "sort": ["OTRH", "OTRC"]
  },
  "OTHM": {
    "col": 3,
    "text": {"OTHMH": "{homeTeam}", "OTHMD": "Hòa", "OTHMA": "{awayTeam}"},
    "sort": ["OTHMH", "OTHMD", "OTHMA"]
  },
  "OTHR": {
    "col": 2,
    "text": {"OTHRH": "{homeTeam} {ratio}", "OTHRC": "{awayTeam} {ratio}"},
    "sort": ["OTHRH", "OTHRC"]
  },
  "WBP": {
    "col": 2,
    "text": {"WBPY": "Phải", "WBPN": "Không"},
    "sort": ["WBPY", "WBPN"]
  },
  "B": {
    "col": 3,
    "text": {"BH": "{homeTeam}", "BA": "{awayTeam}", "BN": "Không"},
    "sort": ["BH", "BA", "BN"]
  },
  "C": {
    "col": 3,
    "text": {"CH": "{homeTeam}", "CA": "{awayTeam}", "CN": "Không"},
    "sort": ["CH", "CA", "CN"]
  },
  "LC": {
    "col": 3,
    "text": {"LCH": "{homeTeam}", "LCA": "{awayTeam}", "LCN": "Không"},
    "sort": ["LCH", "LCA", "LCN"]
  },
  "RA": {
    "col": 3,
    "text": {"RA08": "0-8", "RA911": "9-11", "RA12": "12+"},
    "sort": ["RA08", "RA911", "RA12"]
  },
  "1M_FOU": {
    "col": 2,
    "text": {"1M_FOUO": "Tài {ratio}", "1M_FOUU": "Xỉu {ratio}"},
    "sort": ["1M_FOUO", "1M_FOUU"]
  },
  "OT": {
    "col": 2,
    "text": {"OTY": "Phải", "OTN": "Không"},
    "sort": ["OTY", "OTN"]
  },
  "ROT": {
    "col": 2,
    "text": {"ROTY": "Phải", "ROTN": "Không"},
    "sort": ["ROTY", "ROTN"]
  },
  "W_H": {
    "col": 2,
    "text": {"W_HY": "Phải", "W_HN": "Không"},
    "sort": ["W_HY", "W_HN"]
  },
  "A_H": {
    "col": 2,
    "text": {"A_HY": "Phải", "A_HN": "Không"},
    "sort": ["A_HY", "A_HN"]
  },
  "ANY_W": {
    "col": 2,
    "text": {"ANY_WY": "Phải", "ANY_WN": "Không"},
    "sort": ["ANY_WY", "ANY_WN"]
  },
  "TJG": {
    "col": 2,
    "text": {
      "TJG1": "Bắt đầu trận đấu-15:59",
      "TJG2": "16:00-30:59",
      "TJG3": "31:00-45:59",
      "TJG4": "46-60",
      "TJG5": "61-75",
      "TJG6": "76-90",
      "TJGN": "không có bàn thắng"
    },
    "sort": ["TJG1", "TJG2", "TJG3", "TJG4", "TJG5", "TJG6", "TJGN"]
  },
  "FGT": {
    "col": 3,
    "text": {
      "FGTS": "Sút",
      "FGTH": "Đánh đầu",
      "FGTN": "Đá phản lưới nhà",
      "FGTP": "Phạt đền",
      "FGTF": "Đá phạt",
      "FGTO": "không có bàn thắng"
    },
    "sort": ["FGTS", "FGTH", "FGTN", "FGTP", "FGTF", "FGTO"]
  },
  "WM1": {
    "col": 2,
    "text": {
      "WM1H1": "Đội nhà-thắng cách biệt 1 bàn",
      "WM1H2": "Đội nhà-thắng cách biệt 2 bàn",
      "WM1H3": "Đội nhà-thắng cách biệt 3 bàn",
      "WM1C1": "Đội khách-thắng cách biệt 1 bàn",
      "WM1C2": "Đội khách-thắng cách biệt 2 bàn",
      "WM1C3": "Đội khách-thắng cách biệt 3 bàn",
      "WM1N": "Hòa"
    },
    "sort": ["WM1H1", "WM1H2", "WM1H3", "WM1C1", "WM1C2", "WM1C3", "WM1N"]
  },
  "WM": {
    "col": 2,
    "text": {
      "WMH1": "Đội nhà-thắng cách biệt 1 bàn",
      "WMH2": "Đội nhà-thắng cách biệt 2 bàn",
      "WMH3": "Đội nhà-thắng cách biệt 3 bàn",
      "WMHOV": "Đội nhà-thắng cách biệt 4 bàn trở lên",
      "WMC1": "Đội khách-thắng cách biệt 1 bàn",
      "WMC2": "Đội khách-thắng cách biệt 2 bàn",
      "WMC3": "Đội khách-thắng cách biệt 3 bàn",
      "WMCOV": "Đội khách-thắng cách biệt 4 bàn trở lên",
      "WM0": "0-0 Hòa",
      "WMN": "Các tỷ lệ hòa khác"
    },
    "sort": [
      "WMH1",
      "WMC1",
      "WMH2",
      "WMC2",
      "WMH3",
      "WMC3",
      "WMHOV",
      "WMCOV",
      "WM0",
      "WMN"
    ]
  },
  "MTS": {
    "col": 3,
    "text": {
      "MTSHY": "Chủ thắng/Phải",
      "MTSHN": "Chủ thắng/Không",
      "MTSNY": "Hòa/Phải",
      "MTSNN": "Hòa/Không",
      "MTSCY": "Khách thắng/Phải",
      "MTSCN": "Khách thắng/Không",
      'MTSDY': 'Hòa/Phải',
      'MTSDN': 'Hòa/Không',
      'MTSHW': 'Đội nhà/Thắng trọn vẹn không bàn thua',
      'MTSCW': 'Đội khách/Thắng trọn vẹn không bàn thua'
    },
    "sort": [
      'MTSHY',
      'MTSHN',
      'MTSNY',
      'MTSNN',
      'MTSCY',
      'MTSCN',
      'MTSDY',
      'MTSDN',
      'MTSHW',
      'MTSCW'
    ]
  },
  "RMTS": {
    "col": 3,
    "text": {
      "RMTSHY": "Chủ thắng/Phải",
      "RMTSHN": "Chủ thắng/Không",
      "RMTSNY": "Hòa/Phải",
      "RMTSNN": "Hòa/Không",
      "RMTSCY": "Khách thắng/Phải",
      "RMTSCN": "Khách thắng/Không"
    },
    "sort": ["RMTSHY", "RMTSHN", "RMTSNY", "RMTSNN", "RMTSCY", "RMTSCN"]
  },
  "OUTA": {
    "col": 2,
    "text": {
      "OUTAOY": "Tài 1.5 & Phải",
      "OUTAON": "Tài 1.5 & Không Phải",
      "OUTAUY": "Xỉu 1.5 & Phải ",
      "OUTAUN": "Xỉu 1.5 & Không Phải"
    },
    "sort": ["OUTAOY", "OUTAON", "OUTAUY", "OUTAUN"]
  },
  "RUTA": {
    "col": 2,
    "text": {
      "RUTAOY": "Tài 1.5 & Phải",
      "RUTAON": "Tài 1.5 & Không phải",
      "RUTAUY": "Xỉu 1.5 & Phải ",
      "RUTAUN": "Xỉu 1.5 & Không phải"
    },
    "sort": ["RUTAOY", "RUTAON", "RUTAUY", "RUTAUN"]
  },
  "OUTB": {
    "col": 2,
    "text": {
      "OUTBOY": "Tài 2.5 & Phải",
      "OUTBON": "Tài 2.5 & Không phải",
      "OUTBUY": "Xỉu 2.5 & Phải ",
      "OUTBUN": "Xỉu 2.5 & Không phải"
    },
    "sort": ["OUTBOY", "OUTBON", "OUTBUY", "OUTBUN"]
  },
  "RUTB": {
    "col": 2,
    "text": {
      "RUTBOY": "Tài 2.5 & Phải",
      "RUTBON": "Tài 2.5 & Không phải",
      "RUTBUY": "Xỉu 2.5 & Phải ",
      "RUTBUN": "Xỉu 2.5 & Không phải"
    },
    "sort": ["RUTBOY", "RUTBON", "RUTBUY", "RUTBUN"]
  },
  "OUTC": {
    "col": 2,
    "text": {
      "OUTCOY": "Tài 3.5 & Phải",
      "OUTCON": "Tài 3.5 & Không phải",
      "OUTCUY": "Xỉu 3.5 & Phải ",
      "OUTCUN": "Xỉu 3.5 & Không phải"
    },
    "sort": ["OUTCOY", "OUTCON", "OUTCUY", "OUTCUN"]
  },
  "RUTC": {
    "col": 2,
    "text": {
      "RUTCOY": "Tài 3.5 & Phải",
      "RUTCON": "Tài 3.5 & Không phải",
      "RUTCUY": "Xỉu 3.5 & Phải ",
      "RUTCUN": "Xỉu 3.5 & Không phải"
    },
    "sort": ["RUTCOY", "RUTCON", "RUTCUY", "RUTCUN"]
  },
  "OUTD": {
    "col": 2,
    "text": {
      "OUTDOY": "Tài 4.5 & Phải",
      "OUTDON": "Tài 4.5 & Không phải",
      "OUTDUY": "Xỉu 4.5 & Phải ",
      "OUTDUN": "Xỉu 4.5 & Không phải"
    },
    "sort": ["OUTDOY", "OUTDON", "OUTDUY", "OUTDUN"]
  },
  "RUTD": {
    "col": 2,
    "text": {
      "RUTDOY": "Tài 4.5 & Phải",
      "RUTDON": "Tài 4.5 & Không phải",
      "RUTDUY": "Xỉu 4.5 & Phải ",
      "RUTDUN": "Xỉu 4.5 & Không phải"
    },
    "sort": ["RUTDOY", "RUTDON", "RUTDUY", "RUTDUN"]
  },
  "MOUA": {
    "col": 2,
    "text": {
      "MOUACO": "Khách thắng & Tài 1.5",
      "MOUACU": "Khách thắng & Xỉu 1.5 ",
      "MOUAHO": "Chủ thắng & Tài 1.5",
      "MOUAHU": "Chủ thắng & Xỉu 1.5",
      "MOUANO": "Hòa & Tài 1.5",
      "MOUANU": "Hòa & Xỉu 1.5"
    },
    "sort": ['MOUAHO', 'MOUAHU', 'MOUACO', 'MOUACU', 'MOUANO', 'MOUANU']
  },
  "MOUB": {
    "col": 2,
    "text": {
      "MOUBCO": "Khách thắng & Tài 2.5",
      "MOUBCU": "Khách thắng & Xỉu 2.5 ",
      "MOUBHO": "Chủ thắng & Tài 2.5",
      "MOUBHU": "Chủ thắng & Xỉu 2.5",
      "MOUBNO": "Hòa & Tài 2.5",
      "MOUBNU": "Hòa & Xỉu 2.5"
    },
    "sort": ["MOUBCO", "MOUBCU", "MOUBHO", "MOUBHU", "MOUBNO", "MOUBNU"]
  },
  "MOUC": {
    "col": 2,
    "text": {
      "MOUCCO": "Khách thắng & Tài 3.5",
      "MOUCCU": "Khách thắng & Xỉu 3.5 ",
      "MOUCHO": "Chủ thắng & Tài 3.5",
      "MOUCHU": "Chủ thắng & Xỉu 3.5",
      "MOUCNO": "Hòa & Tài 3.5",
      "MOUCNU": "Hòa & Xỉu 3.5"
    },
    "sort": ["MOUCCO", "MOUCCU", "MOUCHO", "MOUCHU", "MOUCNO", "MOUCNU"]
  },
  "MOUD": {
    "col": 2,
    "text": {
      "MOUDCO": "Khách thắng & Tài 4.5",
      "MOUDCU": "Khách thắng & Xỉu 4.5 ",
      "MOUDHO": "Chủ thắng & Tài 4.5",
      "MOUDHU": "Chủ thắng & Xỉu 4.5",
      "MOUDNO": "Hòa & Tài 4.5",
      "MOUDNU": "Hòa & Xỉu 4.5"
    },
    "sort": ["MOUDCO", "MOUDCU", "MOUDHO", "MOUDHU", "MOUDNO", "MOUDNU"]
  },
  "MG": {
    "col": 3,
    "text": {"MGH": "Hiệp 1", "MGC": "Hiệp 2", "MGN": "điểm số bằng nhau "},
    "sort": ["MGH", "MGC", "MGN"]
  },
  "HTS": {
    "col": 2,
    "text": {"HTSY": "Phải", "HTSN": "Không "},
    "sort": ["HTSY", "HTSN"]
  },
  "RTS2": {
    "col": 2,
    "text": {"RTS2Y": "Phải", "RTS2N": "Không "},
    "sort": ["RTS2Y", "RTS2N"]
  },
  "RPS": {
    "col": 2,
    "text": {"RPSY": "Phải", "RPSN": "Không "},
    "sort": ["RPSY", "RPSN"]
  },
  "RNBA": {
    "col": 2,
    "text": {"RNBAH": "{homeTeam}", "RNBAC": "{awayTeam}"},
    "sort": ["RNBAH", "RNBAC"]
  },
  "RNBB": {
    "col": 2,
    "text": {"RNBBH": "{homeTeam}", "RNBBC": "{awayTeam}"},
    "sort": ["RNBBH", "RNBBC"]
  },
  "RNBC": {
    "col": 2,
    "text": {"RNBCH": "{homeTeam}", "RNBCC": "{awayTeam}"},
    "sort": ["RNBCH", "RNBCC"]
  },
  "RNBD": {
    "col": 2,
    "text": {"RNBDH": "{homeTeam}", "RNBDC": "{awayTeam}"},
    "sort": ["RNBDH", "RNBDC"]
  },
  "RNBE": {
    "col": 2,
    "text": {"RNBEH": "{homeTeam}", "RNBEC": "{awayTeam}"},
    "sort": ["RNBEH", "RNBEC"]
  },
  "RNBF": {
    "col": 2,
    "text": {"RNBFH": "{homeTeam}", "RNBFC": "{awayTeam}"},
    "sort": ["RNBFH", "RNBFC"]
  },
  "RNBG": {
    "col": 2,
    "text": {"RNBGH": "{homeTeam}", "RNBGC": "{awayTeam}"},
    "sort": ["RNBGH", "RNBGC"]
  },
  "RNBH": {
    "col": 2,
    "text": {"RNBHH": "{homeTeam}", "RNBHC": "{awayTeam}"},
    "sort": ["RNBHH", "RNBHC"]
  },
  "RNBI": {
    "col": 2,
    "text": {"RNBIH": "{homeTeam}", "RNBIC": "{awayTeam}"},
    "sort": ["RNBIH", "RNBIC"]
  },
  "RNBJ": {
    "col": 2,
    "text": {"RNBJH": "{homeTeam}", "RNBJC": "{awayTeam}"},
    "sort": ["RNBJH", "RNBJC"]
  },
  "RNBK": {
    "col": 2,
    "text": {"RNBKH": "{homeTeam}", "RNBKC": "{awayTeam}"},
    "sort": ["RNBKH", "RNBKC"]
  },
  "RNBL": {
    "col": 2,
    "text": {"RNBLH": "{homeTeam}", "RNBLC": "{awayTeam}"},
    "sort": ["RNBLH", "RNBLC"]
  },
  "RNBM": {
    "col": 2,
    "text": {"RNBMH": "{homeTeam}", "RNBMC": "{awayTeam}"},
    "sort": ["RNBMH", "RNBMC"]
  },
  "RNBN": {
    "col": 2,
    "text": {"RNBNH": "{homeTeam}", "RNBNC": "{awayTeam}"},
    "sort": ["RNBNH", "RNBNC"]
  },
  "RNBO": {
    "col": 2,
    "text": {"RNBOH": "{homeTeam}", "RNBOC": "{awayTeam}"},
    "sort": ["RNBOH", "RNBOC"]
  },
  "RNC1": {
    "col": 2,
    "text": {"RNC1H": "{homeTeam}", "RNC1C": "{awayTeam}"},
    "sort": ["RNC1H", "RNC1C"]
  },
  "RNC2": {
    "col": 2,
    "text": {"RNC2H": "{homeTeam}", "RNC2C": "{awayTeam}"},
    "sort": ["RNC2H", "RNC2C"]
  },
  "RNC3": {
    "col": 2,
    "text": {"RNC3H": "{homeTeam}", "RNC3C": "{awayTeam}"},
    "sort": ["RNC3H", "RNC3C"]
  },
  "RNC4": {
    "col": 2,
    "text": {"RNC4H": "{homeTeam}", "RNC4C": "{awayTeam}"},
    "sort": ["RNC4H", "RNC4C"]
  },
  "RNC5": {
    "col": 2,
    "text": {"RNC5H": "{homeTeam}", "RNC5C": "{awayTeam}"},
    "sort": ["RNC5H", "RNC5C"]
  },
  "RNC6": {
    "col": 2,
    "text": {"RNC6H": "{homeTeam}", "RNC6C": "{awayTeam}"},
    "sort": ["RNC6H", "RNC6C"]
  },
  "RNC7": {
    "col": 2,
    "text": {"RNC7H": "{homeTeam}", "RNC7C": "{awayTeam}"},
    "sort": ["RNC7H", "RNC7C"]
  },
  "RNC8": {
    "col": 2,
    "text": {"RNC8H": "{homeTeam}", "RNC8C": "{awayTeam}"},
    "sort": ["RNC8H", "RNC8C"]
  },
  "RNC9": {
    "col": 2,
    "text": {"RNC9H": "{homeTeam}", "RNC9C": "{awayTeam}"},
    "sort": ["RNC9H", "RNC9C"]
  },
  "RNCA": {
    "col": 2,
    "text": {"RNCAH": "{homeTeam}", "RNCAC": "{awayTeam}"},
    "sort": ["RNCAH", "RNCAC"]
  },
  "RNCB": {
    "col": 2,
    "text": {"RNCBH": "{homeTeam}", "RNCBC": "{awayTeam}"},
    "sort": ["RNCBH", "RNCBC"]
  },
  "RNCC": {
    "col": 2,
    "text": {"RNCCH": "{homeTeam}", "RNCCC": "{awayTeam}"},
    "sort": ["RNCCH", "RNCCC"]
  },
  "RNCD": {
    "col": 2,
    "text": {"RNCDH": "{homeTeam}", "RNCDC": "{awayTeam}"},
    "sort": ["RNCDH", "RNCDC"]
  },
  "RNCE": {
    "col": 2,
    "text": {"RNCEH": "{homeTeam}", "RNCEC": "{awayTeam}"},
    "sort": ["RNCEH", "RNCEC"]
  },
  "RNCF": {
    "col": 2,
    "text": {"RNCFH": "{homeTeam}", "RNCFC": "{awayTeam}"},
    "sort": ["RNCFH", "RNCFC"]
  },
  "RNCG": {
    "col": 2,
    "text": {"RNCGH": "{homeTeam}", "RNCGC": "{awayTeam}"},
    "sort": ["RNCGH", "RNCGC"]
  },
  "RNCH": {
    "col": 2,
    "text": {"RNCHH": "{homeTeam}", "RNCHC": "{awayTeam}"},
    "sort": ["RNCHH", "RNCHC"]
  },
  "RNCI": {
    "col": 2,
    "text": {"RNCIH": "{homeTeam}", "RNCIC": "{awayTeam}"},
    "sort": ["RNCIH", "RNCIC"]
  },
  "RNCJ": {
    "col": 2,
    "text": {"RNCJH": "{homeTeam}", "RNCJC": "{awayTeam}"},
    "sort": ["RNCJH", "RNCJC"]
  },
  "RNCK": {
    "col": 2,
    "text": {"RNCKH": "{homeTeam}", "RNCKC": "{awayTeam}"},
    "sort": ["RNCKH", "RNCKC"]
  },
  "RNCL": {
    "col": 2,
    "text": {"RNCLH": "{homeTeam}", "RNCLC": "{awayTeam}"},
    "sort": ["RNCLH", "RNCLC"]
  },
  "RNCM": {
    "col": 2,
    "text": {"RNCMH": "{homeTeam}", "RNCMC": "{awayTeam}"},
    "sort": ["RNCMH", "RNCMC"]
  },
  "RNCN": {
    "col": 2,
    "text": {"RNCNH": "{homeTeam}", "RNCNC": "{awayTeam}"},
    "sort": ["RNCNH", "RNCNC"]
  },
  "RNCO": {
    "col": 2,
    "text": {"RNCOH": "{homeTeam}", "RNCOC": "{awayTeam}"},
    "sort": ["RNCOH", "RNCOC"]
  },
  "RNCP": {
    "col": 2,
    "text": {"RNCPH": "{homeTeam}", "RNCPC": "{awayTeam}"},
    "sort": ["RNCPH", "RNCPC"]
  },
  "RNCQ": {
    "col": 2,
    "text": {"RNCQH": "{homeTeam}", "RNCQC": "{awayTeam}"},
    "sort": ["RNCQH", "RNCQC"]
  },
  "RNCR": {
    "col": 2,
    "text": {"RNCRH": "{homeTeam}", "RNCRC": "{awayTeam}"},
    "sort": ["RNCRH", "RNCRC"]
  },
  "RNCS": {
    "col": 2,
    "text": {"RNCSH": "{homeTeam}", "RNCSC": "{awayTeam}"},
    "sort": ["RNCSH", "RNCSC"]
  },
  "RNCT": {
    "col": 2,
    "text": {"RNCTH": "{homeTeam}", "RNCTC": "{awayTeam}"},
    "sort": ["RNCTH", "RNCTC"]
  },
  "RNCU": {
    "col": 2,
    "text": {"RNCUH": "{homeTeam}", "RNCUC": "{awayTeam}"},
    "sort": ["RNCUH", "RNCUC"]
  },
  "DG": {
    "col": 3,
    "text": {
      "DGHH": "Đội nhà/Hòa & Đội nhà(Ghi bàn thắng trước) ",
      "DGHC": "Đội nhà/Hòa & Đội khách(Ghi bàn thắng trước) ",
      "DGCC": "Đội khách/Hòa & Đội khách(Ghi bàn thắng trước) ",
      "DGCH": "Đội khách/Hòa & Đội nhà(Ghi bàn thắng trước) ",
      "DGSH": "Đội nhà/Đội khách & Đội nhà(Ghi bàn thắng trước) ",
      "DGSC": "Đội nhà/Đội khách & Đội khách(Ghi bàn thắng trước) "
    },
    "sort": ["DGHH", "DGHC", "DGCC", "DGCH", "DGSH", "DGSC"]
  },
  "RDG": {
    "col": 3,
    "text": {
      "RDGHH": "Đội nhà/Hòa & Đội nhà(Ghi bàn thắng trước) ",
      "RDGHC": "Đội nhà/Hòa & Đội khách(Ghi bàn thắng trước) ",
      "RDGCC": "Đội khách/Hòa & Đội khách(Ghi bàn thắng trước) ",
      "RDGCH": "Đội khách/Hòa & Đội nhà(Ghi bàn thắng trước) ",
      "RDGSH": "Đội nhà/Đội khách & Đội nhà(Ghi bàn thắng trước) ",
      "RDGSC": "Đội nhà/Đội khách & Đội khách(Ghi bàn thắng trước) "
    },
    "sort": ["RDGHH", "RDGHC", "RDGCC", "RDGCH", "RDGSH", "RDGSC"]
  },
  "DS": {
    "col": 3,
    "text": {
      "DSHY": "Đội nhà/Hòa & Phải",
      "DSHN": "Đội nhà/Hòa & Không",
      "DSSY": "Đội nhà/Đội khách & Phải",
      "DSSN": "Đội nhà/Đội khách & Không",
      "DSCY": "Hòa/Đội khách & Phải",
      "DSCN": "Hòa/Đội khách & Không"
    },
    "sort": ["DSHY", "DSHN", "DSSY", "DSSN", "DSCY", "DSCN"]
  },
  "RDS": {
    "col": 3,
    "text": {
      "RDSHY": "Đội nhà/Hòa & Phải",
      "RDSHN": "Đội nhà/Hòa & Không",
      "RDSSY": "Đội nhà/Đội khách & Phải",
      "RDSSN": "Đội nhà/Đội khách & Không",
      "RDSCY": "Hòa/Đội khách & Phải",
      "RDSCN": "Hòa/Đội khách & Không"
    },
    "sort": ["RDSHY", "RDSHN", "RDSSY", "RDSSN", "RDSCY", "RDSCN"]
  },
  "DUA": {
    "col": 3,
    "text": {
      "DUAHO": "Đội nhà/Hòa & Tài 1.5",
      "DUAHU": "Đội nhà/Hòa & Xỉu 1.5 ",
      "DUACO": "Đội khách/Hòa & Tài 1.5",
      "DUACU": "Đội khách/Hòa & Xỉu 1.5 ",
      "DUASO": "Đội nhà/Đội khách & Tài 1.5 ",
      "DUASU": "Đội nhà/Đội khách & Xỉu 1.5 "
    },
    "sort": ["DUAHO", "DUAHU", "DUACO", "DUACU", "DUASO", "DUASU"]
  },
  "RDUA": {
    "col": 3,
    "text": {
      "RDUAHO": "Đội nhà/Hòa & Tài 1.5",
      "RDUAHU": "Đội nhà/Hòa & Xỉu 1.5 ",
      "RDUACO": "Đội khách/Hòa & Tài 1.5",
      "RDUACU": "Đội khách/Hòa & Xỉu 1.5 ",
      "RDUASO": "Đội nhà/Đội khách & Tài 1.5 ",
      "RDUASU": "Đội nhà/Đội khách & Xỉu 1.5 "
    },
    "sort": ["RDUAHO", "RDUAHU", "RDUACO", "RDUACU", "RDUASO", "RDUASU"]
  },
  "DUB": {
    "col": 3,
    "text": {
      "DUBHO": "Đội nhà/Hòa & Tài 2.5",
      "DUBHU": "Đội nhà/Hòa & Xỉu 2.5 ",
      "DUBCO": "Đội khách/Hòa & Tài 2.5",
      "DUBCU": "Đội khách/Hòa & Xỉu 2.5 ",
      "DUBSO": "Đội nhà/Đội khách & Tài 2.5 ",
      "DUBSU": "Đội nhà/Đội khách & Xỉu 2.5 "
    },
    "sort": ["DUBHO", "DUBHU", "DUBCO", "DUBCU", "DUBSO", "DUBSU"]
  },
  "RDUB": {
    "col": 3,
    "text": {
      "RDUBHO": "Đội nhà/Hòa & Tài 2.5",
      "RDUBHU": "Đội nhà/Hòa & Xỉu 2.5 ",
      "RDUBCO": "Đội khách/Hòa & Tài 2.5",
      "RDUBCU": "Đội khách/Hòa & Xỉu 2.5 ",
      "RDUBSO": "Đội nhà/Đội khách & Tài 2.5 ",
      "RDUBSU": "Đội nhà/Đội khách & Xỉu 2.5 "
    },
    "sort": ["RDUBHO", "RDUBHU", "RDUBCO", "RDUBCU", "RDUBSO", "RDUBSU"]
  },
  "DUC": {
    "col": 3,
    "text": {
      "DUCHO": "Đội nhà/Hòa & Tài 3.5",
      "DUCHU": "Đội nhà/Hòa & Xỉu 3.5 ",
      "DUCCO": "Đội khách/Hòa & Tài 3.5",
      "DUCCU": "Đội khách/Hòa & Xỉu 3.5 ",
      "DUCSO": "Đội nhà/Đội khách & Tài 3.5 ",
      "DUCSU": "Đội nhà/Đội khách & Xỉu 3.5 "
    },
    "sort": ["DUCHO", "DUCHU", "DUCCO", "DUCCU", "DUCSO", "DUCSU"]
  },
  "RDUC": {
    "col": 3,
    "text": {
      "RDUCHO": "Đội nhà/Hòa & Tài 3.5",
      "RDUCHU": "Đội nhà/Hòa & Xỉu 3.5 ",
      "RDUCCO": "Đội khách/Hòa & Tài 3.5",
      "RDUCCU": "Đội khách/Hòa & Xỉu 3.5 ",
      "RDUCSO": "Đội nhà/Đội khách & Tài 3.5 ",
      "RDUCSU": "Đội nhà/Đội khách & Xỉu 3.5 "
    },
    "sort": ["RDUCHO", "RDUCHU", "RDUCCO", "RDUCCU", "RDUCSO", "RDUCSU"]
  },
  "DUD": {
    "col": 3,
    "text": {
      "DUDHO": "Đội nhà/Hòa & Tài 4.5",
      "DUDHU": "Đội nhà/Hòa & Xỉu 4.5 ",
      "DUDCO": "Đội khách/Hòa & Tài 4.5",
      "DUDCU": "Đội khách/Hòa & Xỉu 4.5 ",
      "DUDSO": "Đội nhà/Đội khách & Tài 4.5 ",
      "DUDSU": "Đội nhà/Đội khách & Xỉu 4.5 "
    },
    "sort": ["DUDHO", "DUDHU", "DUDCO", "DUDCU", "DUDSO", "DUDSU"]
  },
  "RDUD": {
    "col": 3,
    "text": {
      "RDUDHO": "Đội nhà/Hòa & Tài 4.5",
      "RDUDHU": "Đội nhà/Hòa & Xỉu 4.5 ",
      "RDUDCO": "Đội khách/Hòa & Tài 4.5",
      "RDUDCU": "Đội khách/Hòa & Xỉu 4.5 ",
      "RDUDSO": "Đội nhà/Đội khách & Tài 4.5 ",
      "RDUDSU": "Đội nhà/Đội khách & Xỉu 4.5 "
    },
    "sort": ["RDUDHO", "RDUDHU", "RDUDCO", "RDUDCU", "RDUDSO", "RDUDSU"]
  },
  "HEOH": {
    "col": 2,
    "text": {"HEOHO": "Lẻ ", "HEOHE": "Chẵn"},
    "sort": ["HEOHO", "HEOHE"]
  },
  "RHEOH": {
    "col": 2,
    "text": {"RHEOHO": "Lẻ ", "RHEOHE": "Chẵn"},
    "sort": ["RHEOHO", "RHEOHE"]
  },
  "HEOC": {
    "col": 2,
    "text": {"HEOCO": "Lẻ ", "HEOCE": "Chẵn"},
    "sort": ["HEOCO", "HEOCE"]
  },
  "RHEOC": {
    "col": 2,
    "text": {"RHEOCO": "Lẻ ", "RHEOCE": "Chẵn"},
    "sort": ["RHEOCO", "RHEOCE"]
  },
  "MPG": {
    "col": 2,
    "text": {
      "MPGHH": "Chủ thắng & Đội nhà ghi bàn thắng đầu tiên ",
      "MPGCC": "Khách thắng & Đội khách ghi bàn thắng đầu tiên ",
      "MPGHC": "Chủ thắng & Đội khách ghi bàn thắng đầu tiên",
      "MPGCH": "Khách thắng & Đội nhà ghi bàn thắng đầu tiên ",
      "MPGNH": "Hòa & Đội nhà ghi bàn thắng đầu tiên ",
      "MPGNC": "Hòa & Đội khách ghi bàn thắng đầu tiên"
    },
    "sort": ["MPGHH", "MPGCC", "MPGHC", "MPGCH", "MPGNH", "MPGNC"]
  },
  "RMPG": {
    "col": 2,
    "text": {
      "RMPGCC": "Khách thắng & Đội khách ghi bàn thắng đầu tiên ",
      "RMPGCH": "Khách thắng & Đội nhà ghi bàn thắng đầu tiên ",
      "RMPGHC": "Chủ thắng & Đội khách ghi bàn thắng đầu tiên",
      "RMPGHH": "Chủ thắng & Đội nhà ghi bàn thắng đầu tiên ",
      "RMPGNC": "Hòa & Đội khách ghi bàn thắng đầu tiên",
      "RMPGNH": "Hòa & Đội nhà ghi bàn thắng đầu tiên "
    },
    "sort": ["RMPGCC", "RMPGCH", "RMPGHC", "RMPGHH", "RMPGNC", "RMPGNH"]
  },
  "MQ": {
    "col": 2,
    "text": {
      "MQH": "Thời gian thi đấu chính thức chủ thắng",
      "MQHOT": "Hiệp phụ chủ thắng",
      "MQHPK": "Loạt sút luân lưu chủ thắng",
      "MQC": "Thời gian thi đấu chính thức khách thắng",
      "MQCOT": "Hiệp phụ khách thắng",
      "MQCPK": "Loạt sút luân lưu khách thắng"
    },
    "sort": ["MQH", "MQHOT", "MQHPK", "MQC", "MQCOT", "MQCPK"]
  },
  "OG": {
    "col": 2,
    "text": {"OGY": "Phải", "OGN": "Không"},
    "sort": ["OGY", "OGN"]
  },
  "OUEA": {
    "col": 2,
    "text": {
      "OUEAOO": "Tài 1.5 & Lẻ ",
      "OUEAOE": "Tài 1.5 & Chẵn",
      "OUEAUO": "Xỉu 1.5 & Lẻ ",
      "OUEAUE": "Xỉu 1.5 & Chẵn"
    },
    "sort": ["OUEAOO", "OUEAOE", "OUEAUO", "OUEAUE"]
  },
  "RUEA": {
    "col": 2,
    "text": {
      "RUEAOO": "Tài 1.5 & Lẻ ",
      "RUEAOE": "Tài 1.5 & Chẵn",
      "RUEAUO": "Xỉu 1.5 & Lẻ ",
      "RUEAUE": "Xỉu 1.5 & Chẵn"
    },
    "sort": ["RUEAOO", "RUEAOE", "RUEAUO", "RUEAUE"]
  },
  "OUEB": {
    "col": 2,
    "text": {
      "OUEBOO": "Tài 2.5 & Lẻ ",
      "OUEBOE": "Tài 2.5 & Chẵn",
      "OUEBUO": "Xỉu 2.5 & Lẻ ",
      "OUEBUE": "Xỉu 2.5 & Chẵn"
    },
    "sort": ["OUEBOO", "OUEBOE", "OUEBUO", "OUEBUE"]
  },
  "RUEB": {
    "col": 2,
    "text": {
      "RUEBOO": "Tài 2.5 & Lẻ ",
      "RUEBOE": "Tài 2.5 & Chẵn",
      "RUEBUO": "Xỉu 2.5 & Lẻ ",
      "RUEBUE": "Xỉu 2.5 & Chẵn"
    },
    "sort": ["RUEBOO", "RUEBOE", "RUEBUO", "RUEBUE"]
  },
  "OUEC": {
    "col": 2,
    "text": {
      "OUECOO": "Tài 3.5 & Lẻ ",
      "OUECOE": "Tài 3.5 & Chẵn",
      "OUECUO": "Xỉu 3.5 & Lẻ ",
      "OUECUE": "Xỉu 3.5 & Chẵn"
    },
    "sort": ["OUECOO", "OUECOE", "OUECUO", "OUECUE"]
  },
  "RUEC": {
    "col": 2,
    "text": {
      "RUECOO": "Tài 3.5 & Lẻ ",
      "RUECOE": "Tài 3.5 & Chẵn",
      "RUECUO": "Xỉu 3.5 & Lẻ ",
      "RUECUE": "Xỉu 3.5 & Chẵn"
    },
    "sort": ["RUECOO", "RUECOE", "RUECUO", "RUECUE"]
  },
  "OUED": {
    "col": 2,
    "text": {
      "OUEDOO": "Tài 4.5 & Lẻ ",
      "OUEDOE": "Tài 4.5 & Chẵn",
      "OUEDUO": "Xỉu 4.5 & Lẻ ",
      "OUEDUE": "Xỉu 4.5 & Chẵn"
    },
    "sort": ["OUEDOO", "OUEDOE", "OUEDUO", "OUEDUE"]
  },
  "RUED": {
    "col": 2,
    "text": {
      "RUEDOO": "Tài 4.5 & Lẻ ",
      "RUEDOE": "Tài 4.5 & Chẵn",
      "RUEDUO": "Xỉu 4.5 & Lẻ ",
      "RUEDUE": "Xỉu 4.5 & Chẵn"
    },
    "sort": ["RUEDOO", "RUEDOE", "RUEDUO", "RUEDUE"]
  },
  "OUPA": {
    "col": 2,
    "text": {
      "OUPAOH": "Tài 1.5 & Đội nhà",
      "OUPAOC": "Tài 1.5 & Đội khách",
      "OUPAUH": "Xỉu 1.5 & Đội nhà",
      "OUPAUC": "Xỉu 1.5 & Đội khách"
    },
    "sort": ["OUPAOH", "OUPAOC", "OUPAUH", "OUPAUC"]
  },
  "RUPA": {
    "col": 2,
    "text": {
      "RUPAOH": "Tài 1.5 & Đội nhà",
      "RUPAOC": "Tài 1.5 & Đội khách",
      "RUPAUH": "Xỉu 1.5 & Đội nhà",
      "RUPAUC": "Xỉu 1.5 & Đội khách"
    },
    "sort": ["RUPAOH", "RUPAOC", "RUPAUH", "RUPAUC"]
  },
  "OUPB": {
    "col": 2,
    "text": {
      "OUPBOH": "Tài 2.5 & Đội nhà",
      "OUPBOC": "Tài 2.5 & Đội khách",
      "OUPBUH": "Xỉu 2.5 & Đội nhà",
      "OUPBUC": "Xỉu 2.5 & Đội khách"
    },
    "sort": ["OUPBOH", "OUPBOC", "OUPBUH", "OUPBUC"]
  },
  "RUPB": {
    "col": 2,
    "text": {
      "RUPBOH": "Tài 2.5 & Đội nhà",
      "RUPBOC": "Tài 2.5 & Đội khách",
      "RUPBUH": "Xỉu 2.5 & Đội nhà",
      "RUPBUC": "Xỉu 2.5 & Đội khách"
    },
    "sort": ["RUPBOH", "RUPBOC", "RUPBUH", "RUPBUC"]
  },
  "OUPC": {
    "col": 2,
    "text": {
      "OUPCOH": "Tài 3.5 & Đội nhà",
      "OUPCOC": "Tài 3.5 & Đội khách",
      "OUPCUH": "Xỉu 3.5 & Đội nhà",
      "OUPCUC": "Xỉu 3.5 & Đội khách"
    },
    "sort": ["OUPCOH", "OUPCOC", "OUPCUH", "OUPCUC"]
  },
  "RUPC": {
    "col": 2,
    "text": {
      "RUPCOH": "Tài 3.5 & Đội nhà",
      "RUPCOC": "Tài 3.5 & Đội khách",
      "RUPCUH": "Xỉu 3.5 & Đội nhà",
      "RUPCUC": "Xỉu 3.5 & Đội khách"
    },
    "sort": ["RUPCOH", "RUPCOC", "RUPCUH", "RUPCUC"]
  },
  "OUPD": {
    "col": 2,
    "text": {
      "OUPDOH": "Tài 4.5 & Đội nhà",
      "OUPDOC": "Tài 4.5 & Đội khách",
      "OUPDUH": "Xỉu 4.5 & Đội nhà",
      "OUPDUC": "Xỉu 4.5 & Đội khách"
    },
    "sort": ["OUPDOH", "OUPDOC", "OUPDUH", "OUPDUC"]
  },
  "RUPD": {
    "col": 2,
    "text": {
      "RUPDOH": "Tài 4.5 & Đội nhà",
      "RUPDOC": "Tài 4.5 & Đội khách",
      "RUPDUH": "Xỉu 4.5 & Đội nhà",
      "RUPDUC": "Xỉu 4.5 & Đội khách"
    },
    "sort": ["RUPDOH", "RUPDOC", "RUPDUH", "RUPDUC"]
  },
  "RPF": {
    "col": 2,
    "text": {"RPF1": "vòng 3", "RPF2": "vòng 4", "RPF3": "vòng 5", "RPFOV": "vòng 6 hoặc vòng sau"},
    "sort": ["RPF1", "RPF2", "RPF3", "RPFOV"]
  },
  "RPXA": {
    "col": 3,
    "text": {"RPXAH": "{homeTeam}", "RPXAN": "Hòa", "RPXAC": "{awayTeam}"},
    "sort": ["RPXAH", "RPXAN", "RPXAC"]
  },
  "RPXB": {
    "col": 3,
    "text": {"RPXBH": "{homeTeam}", "RPXBN": "Hòa", "RPXBC": "{awayTeam}"},
    "sort": ["RPXBH", "RPXBN", "RPXBC"]
  },
  "RPXC": {
    "col": 3,
    "text": {"RPXCH": "{homeTeam}", "RPXCN": "Hòa", "RPXCC": "{awayTeam}"},
    "sort": ["RPXCH", "RPXCN", "RPXCC"]
  },
  "RPXD": {
    "col": 3,
    "text": {"RPXDH": "{homeTeam}", "RPXDN": "Hòa", "RPXDC": "{awayTeam}"},
    "sort": ["RPXDH", "RPXDN", "RPXDC"]
  },
  "RPXE": {
    "col": 3,
    "text": {"RPXEH": "{homeTeam}", "RPXEN": "Hòa", "RPXEC": "{awayTeam}"},
    "sort": ["RPXEH", "RPXEN", "RPXEC"]
  },
  "RPXF": {
    "col": 3,
    "text": {"RPXFH": "{homeTeam}", "RPXFN": "Hòa", "RPXFC": "{awayTeam}"},
    "sort": ["RPXFH", "RPXFN", "RPXFC"]
  },
  "RPXG": {
    "col": 3,
    "text": {"RPXGH": "{homeTeam}", "RPXGN": "Hòa", "RPXGC": "{awayTeam}"},
    "sort": ["RPXGH", "RPXGN", "RPXGC"]
  },
  "RPXH": {
    "col": 3,
    "text": {"RPXHH": "{homeTeam}", "RPXHN": "Hòa", "RPXHC": "{awayTeam}"},
    "sort": ["RPXHH", "RPXHN", "RPXHC"]
  },
  "RPXI": {
    "col": 3,
    "text": {"RPXIH": "{homeTeam}", "RPXIN": "Hòa", "RPXIC": "{awayTeam}"},
    "sort": ["RPXIH", "RPXIN", "RPXIC"]
  },
  "RPXJ": {
    "col": 3,
    "text": {"RPXJH": "{homeTeam}", "RPXJN": "Hòa", "RPXJC": "{awayTeam}"},
    "sort": ["RPXJH", "RPXJN", "RPXJC"]
  },
  "RPXK": {
    "col": 3,
    "text": {"RPXKH": "{homeTeam}", "RPXKN": "Hòa", "RPXKC": "{awayTeam}"},
    "sort": ["RPXKH", "RPXKN", "RPXKC"]
  },
  "RPXL": {
    "col": 3,
    "text": {"RPXLH": "{homeTeam}", "RPXLN": "Hòa", "RPXLC": "{awayTeam}"},
    "sort": ["RPXLH", "RPXLN", "RPXLC"]
  },
  "RPXM": {
    "col": 3,
    "text": {"RPXMH": "{homeTeam}", "RPXMN": "Hòa", "RPXMC": "{awayTeam}"},
    "sort": ["RPXMH", "RPXMN", "RPXMC"]
  },
  "RPXN": {
    "col": 3,
    "text": {"RPXNH": "{homeTeam}", "RPXNN": "Hòa", "RPXNC": "{awayTeam}"},
    "sort": ["RPXNH", "RPXNN", "RPXNC"]
  },
  "RPXO": {
    "col": 3,
    "text": {"RPXOH": "{homeTeam}", "RPXON": "Hòa", "RPXOC": "{awayTeam}"},
    "sort": ["RPXOH", "RPXON", "RPXOC"]
  },
  "RSCA": {
    "col": 2,
    "text": {"RSCAY": "Phải", "RSCAN": "Không"},
    "sort": ["RSCAY", "RSCAN"]
  },
  "RSCB": {
    "col": 2,
    "text": {"RSCBY": "Phải", "RSCBN": "Không"},
    "sort": ["RSCBY", "RSCBN"]
  },
  "RSCC": {
    "col": 2,
    "text": {"RSCCY": "Phải", "RSCCN": "Không"},
    "sort": ["RSCCY", "RSCCN"]
  },
  "RSCD": {
    "col": 2,
    "text": {"RSCDY": "Phải", "RSCDN": "Không"},
    "sort": ["RSCDY", "RSCDN"]
  },
  "RSCE": {
    "col": 2,
    "text": {"RSCEY": "Phải", "RSCEN": "Không"},
    "sort": ["RSCEY", "RSCEN"]
  },
  "RSCF": {
    "col": 2,
    "text": {"RSCFY": "Phải", "RSCFN": "Không"},
    "sort": ["RSCFY", "RSCFN"]
  },
  "RSCG": {
    "col": 2,
    "text": {"RSCGY": "Phải", "RSCGN": "Không"},
    "sort": ["RSCGY", "RSCGN"]
  },
  "RSCH": {
    "col": 2,
    "text": {"RSCHY": "Phải", "RSCHN": "Không"},
    "sort": ["RSCHY", "RSCHN"]
  },
  "RSCI": {
    "col": 2,
    "text": {"RSCIY": "Phải", "RSCIN": "Không"},
    "sort": ["RSCIY", "RSCIN"]
  },
  "RSCJ": {
    "col": 2,
    "text": {"RSCJY": "Phải", "RSCJN": "Không"},
    "sort": ["RSCJY", "RSCJN"]
  },
  "RSCK": {
    "col": 2,
    "text": {"RSCKY": "Phải", "RSCKN": "Không"},
    "sort": ["RSCKY", "RSCKN"]
  },
  "RSCL": {
    "col": 2,
    "text": {"RSCLY": "Phải", "RSCLN": "Không"},
    "sort": ["RSCLY", "RSCLN"]
  },
  "RSCM": {
    "col": 2,
    "text": {"RSCMY": "Phải", "RSCMN": "Không"},
    "sort": ["RSCMY", "RSCMN"]
  },
  "RSCN": {
    "col": 2,
    "text": {"RSCNY": "Phải", "RSCNN": "Không"},
    "sort": ["RSCNY", "RSCNN"]
  },
  "RSCO": {
    "col": 2,
    "text": {"RSCOY": "Phải", "RSCON": "Không"},
    "sort": ["RSCOY", "RSCON"]
  },
  "RSHA": {
    "col": 2,
    "text": {"RSHAY": "Phải", "RSHAN": "Không"},
    "sort": ["RSHAY", "RSHAN"]
  },
  "RSHB": {
    "col": 2,
    "text": {"RSHBY": "Phải", "RSHBN": "Không"},
    "sort": ["RSHBY", "RSHBN"]
  },
  "RSHC": {
    "col": 2,
    "text": {"RSHCY": "Phải", "RSHCN": "Không"},
    "sort": ["RSHCY", "RSHCN"]
  },
  "RSHD": {
    "col": 2,
    "text": {"RSHDY": "Phải", "RSHDN": "Không"},
    "sort": ["RSHDY", "RSHDN"]
  },
  "RSHE": {
    "col": 2,
    "text": {"RSHEY": "Phải", "RSHEN": "Không"},
    "sort": ["RSHEY", "RSHEN"]
  },
  "RSHF": {
    "col": 2,
    "text": {"RSHFY": "Phải", "RSHFN": "Không"},
    "sort": ["RSHFY", "RSHFN"]
  },
  "RSHG": {
    "col": 2,
    "text": {"RSHGY": "Phải", "RSHGN": "Không"},
    "sort": ["RSHGY", "RSHGN"]
  },
  "RSHH": {
    "col": 2,
    "text": {"RSHHY": "Phải", "RSHHN": "Không"},
    "sort": ["RSHHY", "RSHHN"]
  },
  "RSHI": {
    "col": 2,
    "text": {"RSHIY": "Phải", "RSHIN": "Không"},
    "sort": ["RSHIY", "RSHIN"]
  },
  "RSHJ": {
    "col": 2,
    "text": {"RSHJY": "Phải", "RSHJN": "Không"},
    "sort": ["RSHJY", "RSHJN"]
  },
  "RSHK": {
    "col": 2,
    "text": {"RSHKY": "Phải", "RSHKN": "Không"},
    "sort": ["RSHKY", "RSHKN"]
  },
  "RSHL": {
    "col": 2,
    "text": {"RSHLY": "Phải", "RSHLN": "Không"},
    "sort": ["RSHLY", "RSHLN"]
  },
  "RSHM": {
    "col": 2,
    "text": {"RSHMY": "Phải", "RSHMN": "Không"},
    "sort": ["RSHMY", "RSHMN"]
  },
  "RSHN": {
    "col": 2,
    "text": {"RSHNY": "Phải", "RSHNN": "Không"},
    "sort": ["RSHNY", "RSHNN"]
  },
  "RSHO": {
    "col": 2,
    "text": {"RSHOY": "Phải", "RSHON": "Không"},
    "sort": ["RSHOY", "RSHON"]
  },
  "RTW": {
    "col": 2,
    "text": {
      "RTWH1": "Đội nhà chênh lệch bàn thắng 1 bàn",
      "RTWH2": "Đội nhà chênh lệch bàn thắng 2 bàn",
      "RTWHOV": "Đội nhà chênh lệch bàn thắng 3 bàn trở lên",
      "RTWC1": "Đội khách chênh lệch bàn thắng 1 bàn",
      "RTWC2": "Đội khách chênh lệch bàn thắng 2 bàn",
      "RTWCOV": "Đội khách chênh lệch bàn thắng 3 bàn trở lên",
      "RTW0": "không có bàn thắng",
      "RTWN": "Các tỷ lệ hòa khác"
    },
    "sort": [
      "RTWH1 ",
      "RTWH2",
      "RTWHOV",
      "RTWC1",
      "RTWC2",
      "RTWCOV",
      "RTW0",
      "RTWN"
    ]
  },
  "TARU": {
    "col": 2,
    "text": {"TARUO": "Tài {ratio}", "TARUU": "Xỉu {ratio}"},
    "sort": ["TARUO", "TARUU"]
  },
  "TBRU": {
    "col": 2,
    "text": {"TBRUO": "Tài {ratio}", "TBRUU": "Xỉu {ratio}"},
    "sort": ["TBRUO", "TBRUU"]
  },
  "TCRU": {
    "col": 2,
    "text": {"TCRUO": "Tài {ratio}", "TCRUU": "Xỉu {ratio}"},
    "sort": ["TCRUO", "TCRUU"]
  },
  "TDRU": {
    "col": 2,
    "text": {"TDRUO": "Tài {ratio}", "TDRUU": "Xỉu {ratio}"},
    "sort": ["TDRUO", "TDRUU"]
  },
  "TERU": {
    "col": 2,
    "text": {"TERUO": "Tài {ratio}", "TERUU": "Xỉu {ratio}"},
    "sort": ["TERUO", "TERUU"]
  },
  "EOH": {
    "col": 2,
    "text": {"EOHO": "Lẻ ", "EOHE": "Chẵn"},
    "sort": ["EOHO", "EOHE"]
  },
  "EOC": {
    "col": 2,
    "text": {"EOCO": "Lẻ ", "EOCE": "Chẵn"},
    "sort": ["EOCO", "EOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {"REOHO": "Lẻ ", "REOHE": "Chẵn"},
    "sort": ["REOHO", "REOHE"]
  },
  "REOC": {
    "col": 2,
    "text": {"EOCO": "Lẻ ", "EOCE": "Chẵn"},
    "sort": ["REOCO", "REOCE"]
  },
  "F2G2": {
    "col": 2,
    "text": {"F2G2H": "{homeTeam}", "F2G2C": "{awayTeam}"},
    "sort": ["F2G2H", "F2G2C"]
  },
  "F3G2": {
    "col": 2,
    "text": {"F3G2H": "{homeTeam}", "F3G2C": "{awayTeam}"},
    "sort": ["F3G2H", "F3G2C"]
  },
  "MPS": {
    "col": 2,
    "text": {
      "MPSHY": "Chủ thắng & Phải",
      "MPSHN": "Chủ thắng & Không",
      "MPSCY": "Khách thắng & Phải",
      "MPSCN": "Khách thắng & Không",
      "MPSNY": "Hòa & Phải",
      "MPSNN": "Hòa & Không"
    },
    "sort": ["MPSHY", "MPSHN", "MPSCY", "MPSCN", "MPSNY", "MPSNN"]
  },
  "OTHOUH": {
    "col": 2,
    "text": {"OTHOUHC": "Tài {ratio}", "OTHOUHH": "Xỉu {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTHOUC": {
    "col": 2,
    "text": {"OTHOUHC": "Tài {ratio}", "OTHOUHH": "Xỉu {ratio}"},
    "sort": ["OTHOUHC", "OTHOUHH"]
  },
  "OTOUH": {
    "col": 2,
    "text": {"OTOUHC": "Tài {ratio}", "OTOUHH": "Xỉu {ratio}"},
    "sort": ["OTOUHC", "OTOUHH"]
  },
  "OTOUC": {
    "col": 2,
    "text": {"OTOUCC": "Tài {ratio}", "OTOUCH": "Xỉu {ratio}"},
    "sort": ["OTOUCC", "OTOUCH"]
  },
  "OTTS": {
    "col": 2,
    "text": {"OTTSY": "Phải", "OTTSN": "Không"},
    "sort": ["OTTSY", "OTTSN"]
  },
  "OTARG": {
    "col": 3,
    "text": {"OTARGH": "{homeTeam}", "OTARGC": "{awayTeam}", "OTARGN": "không có bàn thắng"},
    "sort": ["OTARGH", "OTARGC", "OTARGN"]
  },
  "OTEO": {
    "col": 2,
    "text": {"OTEOO": "Lẻ ", "OTEOE": "Chẵn"},
    "sort": ["OTEOO", "OTEOE"]
  },
  "OTDC": {
    "col": 3,
    "text": {"OTDCHN": "Chủ hòa", "OTDCHC": "Chủ Khách", "OTDCCN": "Hòa khách"},
    "sort": ["OTDCHN", "OTDCHC", "OTDCCN"]
  },
  "OTBRG": {
    "col": 3,
    "text": {"OTBRGH": "{homeTeam}", "OTBRGC": "{awayTeam}", "OTBRGN": "không có bàn thắng"},
    "sort": ["OTBRGH", "OTBRGC", "OTBRGN"]
  },
  "M3": {
    "col": 3,
    "text": {"M3H": "{homeTeam}", "M3N": "Hòa", "M3C": "{awayTeam}"},
    "sort": ["M3H", "M3N", "M3C"]
  },
  "SCO1ST": {
    "col": 2,
    "text": {"SCO1ST1": "SCO1ST1", "SCO1ST2": "SCO1ST2"},
    "sort": ["SCO1ST1", "SCO1ST2"]
  },
  "SCOLAST": {
    "col": 2,
    "text": {"SCOLAST1": "SCOLAST1", "SCOLAST2": "SCOLAST2"},
    "sort": ["SCOLAST1", "SCOLAST2"]
  },
  "SCOANT": {
    "col": 2,
    "text": {"SCOANT1": "SCOANT1", "SCOANT2": "SCOANT2"},
    "sort": ["SCOANT1", "SCOANT2"]
  },
  "R_promote": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SDFC": {
    "col": 2,
    "text": {"SDFCH": "{homeTeam}", "SDFCC": "{awayTeam}"},
    "sort": ["SDFCH", "SDFCC"]
  },
  "SDLC": {
    "col": 2,
    "text": {"SDLCH": "{homeTeam}", "SDLCC": "{awayTeam}"},
    "sort": ["SDLCH", "SDLCC"]
  },
  "SDFT": {
    "col": 2,
    "text": {"SDFTH": "{homeTeam}", "SDFTC": "{awayTeam}"},
    "sort": ["SDFTH", "SDFTC"]
  },
  "SDLT": {
    "col": 2,
    "text": {"SDLTH": "{homeTeam}", "SDLTC": "{awayTeam}"},
    "sort": ["SDLTH", "SDLTC"]
  },
  "LO": {
    "col": 2,
    "text": {"LOH": "{homeTeam}", "LOC": "{awayTeam}"},
    "sort": ["LOH", "LOC"]
  },
  "LS": {
    "col": 2,
    "text": {"LSH": "{homeTeam}", "LSC": "{awayTeam}"},
    "sort": ["LSH", "LSC"]
  },
  "OTRNC1": {
    "col": 2,
    "text": {"OTRNC1H": "{homeTeam}", "OTRNC1C": "{awayTeam}"},
    "sort": ["OTRNC1H", "OTRNC1C"]
  },
  "OTRNC2": {
    "col": 2,
    "text": {"OTRNC2H": "{homeTeam}", "OTRNC2C": "{awayTeam}"},
    "sort": ["OTRNC2H", "OTRNC2C"]
  },
  "OTRNC3": {
    "col": 2,
    "text": {"OTRNC3H": "{homeTeam}", "OTRNC3C": "{awayTeam}"},
    "sort": ["OTRNC3H", "OTRNC3C"]
  },
  "OTRNC4": {
    "col": 2,
    "text": {"OTRNC4H": "{homeTeam}", "OTRNC4C": "{awayTeam}"},
    "sort": ["OTRNC4H", "OTRNC4C"]
  },
  "OTRNC5": {
    "col": 2,
    "text": {"OTRNC5H": "{homeTeam}", "OTRNC5C": "{awayTeam}"},
    "sort": ["OTRNC5H", "OTRNC5C"]
  },
  "OTRNBA": {
    "col": 2,
    "text": {"OTRNBAH": "{homeTeam}", "OTRNBAC": "{awayTeam}"},
    "sort": ["OTRNBAH", "OTRNBAC"]
  },
  "OTHOU": {
    "col": 2,
    "text": {"OTHOUC": "Tài {ratio}", "OTHOUH": "Xỉu {ratio}"},
    "sort": ["OTHOUC", "OTHOUH"]
  },
  "FO": {
    "col": 2,
    "text": {"FOH": "{homeTeam}", "FOC": "{awayTeam}"},
    "sort": ["FOH", "FOC"]
  },
  "FS": {
    "col": 2,
    "text": {"FSH": "{homeTeam}", "FSC": "{awayTeam}"},
    "sort": ["FSH", "FSC"]
  },
  "FGK": {
    "col": 2,
    "text": {"FGKH": "{homeTeam}", "FGKC": "{awayTeam}"},
    "sort": ["FGKH", "FGKC"]
  },
  "LGK": {
    "col": 2,
    "text": {"LGKH": "{homeTeam}", "LGKC": "{awayTeam}"},
    "sort": ["LGKH", "LGKC"]
  },
  "FTI": {
    "col": 2,
    "text": {"FTIH": "{homeTeam}", "FTIC": "{awayTeam}"},
    "sort": ["FTIH", "FTIC"]
  },
  "LTI": {
    "col": 2,
    "text": {"LTIH": "{homeTeam}", "LTIC": "{awayTeam}"},
    "sort": ["LTIH", "LTIC"]
  },
  "FFK": {
    "col": 2,
    "text": {"FFKH": "{homeTeam}", "FFKC": "{awayTeam}"},
    "sort": ["FFKH", "FFKC"]
  },
  "LFK": {
    "col": 2,
    "text": {"LFKH": "{homeTeam}", "LFKC": "{awayTeam}"},
    "sort": ["LFKH", "LFKC"]
  },
  "OTCRG": {
    "col": 3,
    "text": {"OTCRGH": "{homeTeam}", "OTCRGC": "{awayTeam}", "OTCRGN": "không có bàn thắng"},
    "sort": ["OTCRGH", "OTCRGC", "OTCRGN"]
  },
  "OTDRG": {
    "col": 3,
    "text": {"OTDRGH": "{homeTeam}", "OTDRGC": "{awayTeam}", "OTDRGN": "không có bàn thắng"},
    "sort": ["OTDRGH", "OTDRGC", "OTDRGN"]
  },
  "T": {
    "col": 2,
    "text": {"T01": "0-1 Bàn", "T23": "2-3 Bàn", "T46": "4-6 Bàn", "OVER": "7 bàn trở lên"},
    "sort": ["T01", "T23", "T46", "OVER"]
  },
  "RT": {
    "col": 2,
    "text": {
      "RT01": "0-1 bàn",
      "RT23": "2-3 bàn",
      "RT46": "4-6 bàn",
      "ROVER": "7 bàn trở lên",
      "RT0": "0",
      "RT1": "1",
      "RT2": "2",
      "RTOV": "3+"
    },
    "sort": ["RT01", "RT23", "RT46", "ROVER", "RT0", "RT1", "RT2", "RTOV"]
  },
  "MW": {
    "col": 2,
    "text": {
      "MWH": "Thời gian thi đấu chính thức chủ thắng",
      "MWHOT": "Hiệp phụ chủ thắng",
      "MWHPK": "Loạt sút luân lưu chủ thắng",
      "MWC": "Thời gian thi đấu chính thức khách thắng",
      "MWCOT": "Hiệp phụ khách thắng",
      "MWCPK": "Loạt sút luân lưu khách thắng"
    },
    "sort": ["MWH", "MWHOT", "MWHPK", "MWC", "MWCOT", "MWCPK"]
  },
  "OUconner": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOconner": {
    "col": 2,
    "text": {"EOO": "Lẻ ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "Rconner": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUcard": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "EOcard": {
    "col": 2,
    "text": {"EOO": "Lẻ ", "EOE": "Chẵn"},
    "sort": ["EOO", "EOE"]
  },
  "Rcard": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "HOUcard": {
    "col": 2,
    "text": {"HOUC": "Tài {ratio}", "HOUH": "Xỉu {ratio}"},
    "sort": ["HOUC", "HOUH"]
  },
  "HRconner": {
    "col": 2,
    "text": {"HRH": "{homeTeam} {ratio}", "HRC": "{awayTeam} {ratio}"},
    "sort": ["HRH", "HRC"]
  },
  "RDT": {
    "col": 2,
    "text": {"RDT0": "0", "RDT1": "1", "RDT2": "2", "RDTOV": "3+"},
    "sort": ["RDT0", "RDT1", "RDT2", "RDTOV"]
  },
  "TTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RCDOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "FSM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "FSR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "FSOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "BP": {
    "col": 2,
    "text": {"BPH": "{homeTeam} {ratio}", "BPC": "{awayTeam} {ratio}"},
    "sort": ["BPH", "BPC"]
  },
  "OSM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "OSR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OSOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "GSP": {
    "col": 3,
    "text": {"GSPF": "Cầu thủ ghi bàn đầu tiên", "GLPA": "Cầu thủ ghi bàn trong bất kỳ thời gian nào", "GSPL": "Cầu thủ ghi bàn cuối cùng"},
    "sort": ["GSPF", "GLPA", "GSPL"]
  },
  "HG3": {
    "col": 3,
    "text": {"HG3H": "Hiệp 1", "HG3N": "Hòa", "HG3C": "Hiệp 2"},
    "sort": ["HG3H", "HG3N", "HG3C"]
  },
  "UPGM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPGR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPGOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "SOTM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "SOTR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "SOTOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "UPCM": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "UPCR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "UPCOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "TG": {
    "col": 2,
    "text": {
      "TGH0": "{homeTeam} 0",
      "TGH1": "{homeTeam} 1",
      "TGH2": "{homeTeam} 2",
      "TGH3": "{homeTeam} 3",
      "TGH4+": "{homeTeam} 4+",
      "TGC0": "{awayTeam} 0",
      "TGC1": "{awayTeam} 1",
      "TGC2": "{awayTeam} 2",
      "TGC3": "{awayTeam} 3",
      "TGC4+": "{awayTeam} 4+"
    },
    "sort": [
      "TGH0",
      "TGH1",
      "TGH2",
      "TGH3",
      "TGH4+",
      "TGC0",
      "TGC1",
      "TGC2",
      "TGC3",
      "TGC4+"
    ]
  },
  "HTG": {
    "col": 2,
    "text": {
      "HTGH0": "{homeTeam} 0",
      "HTGH1": "{homeTeam} 1",
      "HTGH2": "{homeTeam} 2",
      "HTGH3": "{homeTeam} 3",
      "HTGH4": '{homeTeam} 4',
      "HTGH4+": "{homeTeam} 4+",
      "HTGC0": "{awayTeam} 0",
      "HTGC1": "{awayTeam} 1",
      "HTGC2": "{awayTeam} 2",
      "HTGC3": "{awayTeam} 3",
      "HTGC4": '{awayTeam} 4',
      "HTGC4+": "{awayTeam} 4+"
    },
    "sort": ['HTGH0',  'HTGC0','HTGH1', 'HTGC1', 'HTGH2','HTGC2',  'HTGH3', 'HTGC3','HTGH4', 'HTGC4','HTGH4+',  'HTGC4+']
  },
  "TGOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTGOU": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HTTG": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "HW3": {
    "col": 3,
    "text": {
      "HW3H": "{homeTeam} {ratio}",
      "HW3N": "Hòa {ratio}",
      "HW3C": "{awayTeam} {ratio}"
    },
    "sort": ["HW3H", "HW3N", "HW3C"]
  },
  "TCS": {
    "col": 2,
    "text": {
      "TCSHY": "Phải",
      "TCSHN": "Không",
      "TCSCY": "Phải",
      "TCSCN": "Không"
    },
    "sort": ["TCSHY", "TCSHN", "TCSCY", "TCSCN"]
  },
  "TSB": {
    "col": 2,
    "text": {
      "TSBHY": "Phải",
      "TSBHN": "Không",
      "TSBCY": "Phải",
      "TSBCN": "Không"
    },
    "sort": ["TSBHY", "TSBHN", "TSBCY", "TSBCN"]
  },
  "HTSB": {
    "col": 2,
    "text": {
      "HTSBHY": "Phải",
      "HTSBHN": "Không",
      "HTSBCY": "Phải",
      "HTSBCN": "Không"
    },
    "sort": ["HTSBHY", "HTSBHN", "HTSBCY", "HTSBCN"]
  },
  "HTSB2": {
    "col": 2,
    "text": {
      "HTSB2HY": "Phải",
      "HTSB2HN": "Không",
      "HTSB2CY": "Phải",
      "HTSB2CN": "Không"
    },
    "sort": ["HTSB2HY", "HTSB2HN", "HTSB2CY", "HTSB2CN"]
  },
  
  "OUT": {
    "col": 2,
    "text": {
      "OUT01": "0-1 bàn",
      "OUT02": "0-2 bàn",
      "OUT03": "0-3 bàn",
      "OUT23": "2-3 bàn",
      "OUT46": "4-6 bàn",
      "OUT2O": "2+",
      "OUT3O": "3+",
      "OUT4O": "4+",
      "OUT5O": "5+",
      "OUT6O": "6+",
      "OUT7O": "7+"
    },
    "sort": [
      "OUT01",
      "OUT02",
      "OUT03",
      "OUT23",
      "OUT46",
      "OUT2O",
      "OUT3O",
      "OUT4O",
      "OUT5O",
      "OUT6O",
      "OUT7O"
    ]
  },
  "TGB": {
    "col": 2,
    "text": {"TGBY": "Phải", "TGBN": "Không"},
    "sort": ["TGBY", "TGBN"]
  },
  "AHG": {
    "col": 2,
    "text": {
      "AHG0": "0 bàn",
      "AHG01": "0-1 bàn",
      "AHG1+": "1+",
      "AHG2+": "2+",
      "AHG3+": "3+"
    },
    "sort": ["AHG0", "AHG01", "AHG1+", "AHG2+", "AHG3+"]
  },
  "BHG": {
    "col": 2,
    "text": {
      "BHG0": "0 bàn",
      "BHG01": "0-1 bàn",
      "BHG1+": "1+",
      "BHG2+": "2+",
      "BHG3+": "3+"
    },
    "sort": ["BHG0", "BHG01", "BHG1+", "BHG2+", "BHG3+"]
  },
  "T1G": {
    "col": 2,
    "text": {
      "T1G1": "Bắt đầu trận đấu - 14:59",
      'T1G2': 'Hiệp 1 15:00 - 29:59',
      'T1G3': 'Hiệp 1 30:00 -  Kết thúc nửa trận',
      'T1G4': 'Hiệp 2 bắt đầu - 59:59',
      'T1G5': 'Hiệp 2 60:00 - 74:59',
      'T1G6': 'Hiệp 2 75:00 - Kết thúc trận đấu',
      "T1GN": "không ghi bàn",
      "T1G7": "1-10 Phút",
      "T1G8": "11-20 Phút",
      "T1G9": "21-30 Phút",
      "T1G10": "31-40 Phút",
      "T1G11": "41-50 Phút",
      "T1G12": "51-60 Phút",
      "T1G13": "61-70 Phút",
      "T1G14": "71-80 Phút",
      "T1G15": "81-90 Phút"
    },
    "sort": [
      "T1G1",
      "T1G2",
      "T1G3",
      "T1G4",
      "T1G5",
      "T1G6",
      "T1GN",
      "T1G7",
      "T1G8",
      "T1G9",
      "T1G10",
      "T1G11",
      "T1G12",
      "T1G13",
      "T1G14",
      "T1G15"
    ]
  },
  "BSO": {
    "col": 2,
    "text": {"BSOY": "Phải", "BSON": "Không"},
    "sort": ["BSOY", "BSON"]
  },
  "FOUB": {
    "col": 2,
    "text": {
      "FOUBHHO": "Chủ/Chủ & Tài 2.5",
      "FOUBHHU": "Chủ/Chủ & Xỉu 2.5",
      "FOUBHNO": "Chủ/Hòa & Tài 2.5",
      "FOUBHNU": "Chủ/Hòa & Xỉu 2.5",
      "FOUBHCO": "Chủ/Khách & Tài 2.5",
      "FOUBCHO": "Khách/Chủ & Tài 2.5",
      "FOUBCCO": "Khách/Khách & Tài 2.5",
      "FOUBCCU": "Khách/Khách & Xỉu 2.5",
      "FOUBCNO": "Khách/Hòa & Tài 2.5",
      "FOUBCNU": "Khách/Hòa & Xỉu 2.5",
      "FOUBNNO": "Hòa/Hòa & Tài 2.5",
      "FOUBNNU": "Hòa/Hòa & Xỉu 2.5",
      "FOUBNHO": "Hòa/Chủ & Tài 2.5",
      "FOUBNHU": "Hòa/Chủ & Xỉu 2.5",
      "FOUBNCO": "Hòa/Khách & Tài 2.5",
      "FOUBNCU": "Hòa/Khách & Xỉu 2.5"
    },
    "sort": [
      "FOUBHHO",
      "FOUBHHU",
      "FOUBHNO",
      "FOUBHNU",
      "FOUBHCO",
      "FOUBCHO",
      "FOUBCCO",
      "FOUBCCU",
      "FOUBCNO",
      "FOUBCNU",
      "FOUBNNO",
      "FOUBNNU",
      "FOUBNHO",
      "FOUBNHU",
      "FOUBNCO",
      "FOUBNCU"
    ]
  },
  "HMOUA": {
    "col": 3,
    "text": {
      "HMOUAHO": "Chủ thắng & Tài1.5",
      "HMOUAHU": "Chủ thắng & Xỉu1.5",
      "HMOUANO": "Hòa & Tài1.5",
      "HMOUANU": "Hòa & Xỉu1.5",
      "HMOUACO": "Khách thắng & Tài1.5",
      "HMOUACU": "Khách thắng & Xỉu1.5"
    },
    "sort": ["HMOUAHO", "HMOUAHU", "HMOUANO", "HMOUANU", "HMOUACO", "HMOUACU"]
  },
  "PDD": {
    "col": 2,
    "text": {
      "PDD1": "1-0, 2-0, 3-0",
      "PDD2": "4-0, 5-0, 6-0",
      "PDD3": "2-1, 3-1, 4-1",
      "PDD4": "3-2, 4-2, 4-3, 5-1",
      "PDD5": "0-1, 0-2, 0-3",
      "PDD6": "0-4, 0-5, 0-6",
      "PDD7": "1-2, 1-3, 1-4",
      "PDD8": "2-3, 2-4, 3-4, 1-5"
    },
    "sort": ["PDD1", "PDD2", "PDD3", "PDD4", "PDD5", "PDD6", "PDD7", "PDD8"]
  },
  "TGA": {
    "col": 2,
    "text": {"TGAY": "Phải", "TGAN": "Không"},
    "sort": ["TGAY", "TGAN"]
  },
  "TGC": {
    "col": 2,
    "text": {"TGCY": "Phải", "TGCN": "Không"},
    "sort": ["TGCY", "TGCN"]
  },
  "TGD": {
    "col": 2,
    "text": {"TGDY": "Phải", "TGDN": "Không"},
    "sort": ["TGDY", "TGDN"]
  },
  "TGE": {
    "col": 2,
    "text": {"TGEY": "Phải", "TGEN": "Không"},
    "sort": ["TGEY", "TGEN"]
  },
  "TGF": {
    "col": 2,
    "text": {"TGFY": "Phải", "TGFN": "Không"},
    "sort": ["TGFY", "TGFN"]
  },
  "TGG": {
    "col": 2,
    "text": {"TGGY": "Phải", "TGGN": "Không"},
    "sort": ["TGGY", "TGGN"]
  },
  "HM2_conner": {
    "col": 3,
    "text": {"HM2H": "{homeTeam}", "HM2N": "Hòa", "HM2C": "{awayTeam}"},
    "sort": ["HM2H", "HM2N", "HM2C"]
  },
  "HOU2_conner": {
    "col": 2,
    "text": {"HOU2C": "Tài {ratio}", "HOU2H": "Xỉu {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "OU3_conner": {
    "col": 3,
    "text": {"OUC": "Tài {ratio}", "OUE": "Vừa đúng {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUE", "OUH"]
  },
  "W3_conner": {
    "col": 3,
    "text": {
      "W3H": "{homeTeam} {ratio}",
      "W3N": "Hòa {ratio}",
      "W3C": "{awayTeam} {ratio}"
    },
    "sort": ["W3H", "W3N", "W3C"]
  },
  "BTSH": {
    "col": 2,
    "text": {"BTSHY": "Phải", "BTSHN": "Không"},
    "sort": ["BTSHY", "BTSHN"]
  },
  "FGTA": {
    "col": 2,
    "text": {
      "FGTAS": "Sút",
      "FGTAH": "Đánh đầu",
      "FGTAN": "không có bàn thắng",
      "FGTAP": "Phạt đền",
      "FGTAF": "Đá phạt",
      "FGTAO": "Đá phản lưới nhà"
    },
    "sort": ["FGTAS", "FGTAH", "FGTAN", "FGTAP", "FGTAF", "FGTAO"]
  },
  "FGTB": {
    "col": 2,
    "text": {
      "FGTBS": "Sút",
      "FGTBH": "Đánh đầu",
      "FGTBN": "không có bàn thắng",
      "FGTBP": "Phạt đền",
      "FGTBF": "Đá phạt",
      "FGTBO": "Đá phản lưới nhà"
    },
    "sort": ["FGTBS", "FGTBH", "FGTBN", "FGTBP", "FGTBF", "FGTBO"]
  },
  "FGTC": {
    "col": 2,
    "text": {
      "FGTCS": "Sút",
      "FGTCH": "Đánh đầu",
      "FGTCN": "không có bàn thắng",
      "FGTCP": "Phạt đền",
      "FGTCF": "Đá phạt",
      "FGTCO": "Đá phản lưới nhà"
    },
    "sort": ["FGTCS", "FGTCH", "FGTCN", "FGTCP", "FGTCF", "FGTCO"]
  },
  "FGTD": {
    "col": 2,
    "text": {
      "FGTDS": "Sút",
      "FGTDH": "Đánh đầu",
      "FGTDN": "không có bàn thắng",
      "FGTDP": "Phạt đền",
      "FGTDF": "Đá phạt",
      "FGTDO": "Đá phản lưới nhà"
    },
    "sort": ["FGTDS", "FGTDH", "FGTDN", "FGTDP", "FGTDF", "FGTDO"]
  },
  "FGTE": {
    "col": 2,
    "text": {
      "FGTES": "Sút",
      "FGTEH": "Đánh đầu",
      "FGTEN": "không có bàn thắng",
      "FGTEP": "Phạt đền",
      "FGTEF": "Đá phạt",
      "FGTEO": "Đá phản lưới nhà"
    },
    "sort": ["FGTES", "FGTEH", "FGTEN", "FGTEP", "FGTEF", "FGTEO"]
  },
  "FGTF": {
    "col": 2,
    "text": {
      "FGTFS": "Sút",
      "FGTFH": "Đánh đầu",
      "FGTFN": "không có bàn thắng",
      "FGTFP": "Phạt đền",
      "FGTFF": "Đá phạt",
      "FGTFO": "Đá phản lưới nhà"
    },
    "sort": ["FGTFS", "FGTFH", "FGTFN", "FGTFP", "FGTFF", "FGTFO"]
  },
  "FGTG": {
    "col": 2,
    "text": {
      "FGTGS": "Sút",
      "FGTGH": "Đánh đầu",
      "FGTGN": "không có bàn thắng",
      "FGTGP": "Phạt đền",
      "FGTGF": "Đá phạt",
      "FGTGO": "Đá phản lưới nhà"
    },
    "sort": ["FGTGS", "FGTGH", "FGTGN", "FGTGP", "FGTGF", "FGTGO"]
  },
  "FGTH": {
    "col": 2,
    "text": {
      "FGTHS": "Sút",
      "FGTHH": "Đánh đầu",
      "FGTHN": "không có bàn thắng",
      "FGTHP": "Phạt đền",
      "FGTHF": "Đá phạt",
      "FGTHO": "Đá phản lưới nhà"
    },
    "sort": ["FGTHS", "FGTHH", "FGTHN", "FGTHP", "FGTHF", "FGTHO"]
  },
  "FGTI": {
    "col": 2,
    "text": {
      "FGTIS": "Sút",
      "FGTIH": "Đánh đầu",
      "FGTIN": "không có bàn thắng",
      "FGTIP": "Phạt đền",
      "FGTIF": "Đá phạt",
      "FGTIO": "Đá phản lưới nhà"
    },
    "sort": ["FGTIS", "FGTIH", "FGTIN", "FGTIP", "FGTIF", "FGTIO"]
  },
  "FGTJ": {
    "col": 2,
    "text": {
      "FGTJS": "Sút",
      "FGTJH": "Đánh đầu",
      "FGTJN": "không có bàn thắng",
      "FGTJP": "Phạt đền",
      "FGTJF": "Đá phạt",
      "FGTJO": "Đá phản lưới nhà"
    },
    "sort": ["FGTJS", "FGTJH", "FGTJN", "FGTJP", "FGTJF", "FGTJO"]
  },
  "RT3_conner": {
    "col": 3,
    "text": {"RT3H": "{homeTeam}", "RT3N": "Đều không phải", "RT3C": "{awayTeam}"},
    "sort": ["RT3H", "RT3N", "RT3C"]
  },
  "RT5_conner": {
    "col": 3,
    "text": {"RT5H": "{homeTeam}", "RT5N": "Đều không phải", "RT5C": "{awayTeam}"},
    "sort": ["RT5H", "RT5N", "RT5C"]
  },
  "RT7_conner": {
    "col": 3,
    "text": {"RT7H": "{homeTeam}", "RT7N": "Đều không phải", "RT7C": "{awayTeam}"},
    "sort": ["RT7H", "RT7N", "RT7C"]
  },
  "RT9_conner": {
    "col": 3,
    "text": {"RT9H": "{homeTeam}", "RT9N": "Đều không phải", "RT9C": "{awayTeam}"},
    "sort": ["RT9H", "RT9N", "RT9C"]
  },
  "PC": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "PRC": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "PP": {
    "col": 2,
    "text": {},
    "sort": [""]
  },
  "HGC1": {
    "col": 2,
    "text": {"HGC1": "Hiệp 1 Tài là   0.5 & Hiệp 2 Tài là 0.5"},
    "sort": ["HGC1"]
  },
  "HGC2": {
    "col": 2,
    "text": {"HGC2": "Hiệp 1 Tài là   0.5 & Hiệp 2 Tài là 1.5"},
    "sort": ["HGC2"]
  },
  "HGC3": {
    "col": 2,
    "text": {"HGC3": "Hiệp 1 Tài là   1.5 & Hiệp 2 Tài là 1.5"},
    "sort": ["HGC3"]
  },
  "W2M": {
    "col": 2,
    "text": {"W2MH": "{homeTeam}", "W2MC": "{awayTeam}"},
    "sort": ["W2MH", "W2MC"]
  },
  "TTB_card": {
    "col": 2,
    "text": {
      "TTBHO": "{homeTeam} Tài {ratio}",
      "TTBHU": "{homeTeam} Xỉu {ratio}",
      "TTBCO": "{awayTeam} Tài {ratio}",
      "TTBCU": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["TTBHO", "TTBHU", "TTBCO", "TTBCU"]
  },
  "HSR": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CSR": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HFS": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "CFS": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HOS": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "COS": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "PAOU": {
    "col": 2,
    "text": {"OUC": " Tài {ratio}", "OUH": " Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "HAR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "RTTG": {
    "col": 2,
    "text": {
      "ROUHC": "{homeTeam} Tài {ratio}",
      "ROUHH": "{homeTeam} Xỉu {ratio}",
      "ROUCC": "{awayTeam} Tài {ratio}",
      "ROUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["ROUHC", "ROUHH", "ROUCC", "ROUCH"]
  },
  "RLG": {
    "col": 3,
    "text": {"RLGH": "{homeTeam}", "RLGA": "{awayTeam}", "RLGN": "không có bàn thắng"},
    "sort": ["RLGH", "RLGA", "RLGN"]
  },
  "RTG": {
      'col': 2,
      'text': {
        'RTGH0': '{homeTeam} 0',
        'RTGH1': '{homeTeam} 1',
        'RTGH2': '{homeTeam} 2',
        'RTGH3': '{homeTeam} 3',
        'RTGH4': '{homeTeam} 4',
        'RTGH5': '{homeTeam} 5',
        'RTGH6': '{homeTeam} 6',
        'RTGH4+': '{homeTeam} 4+',
        'RTGH5+': '{homeTeam} 5+',
        'RTGH6+': '{homeTeam} 6+',
        'RTGC0': '{awayTeam} 0',
        'RTGC1': '{awayTeam} 1',
        'RTGC2': '{awayTeam} 2',
        'RTGC3': '{awayTeam} 3',
        'RTGC4': '{awayTeam} 4',
        'RTGC5': '{awayTeam} 5',
        'RTGC6': '{awayTeam} 6',
        'RTGC4+': '{awayTeam} 4+',
        'RTGC5+': '{awayTeam} 5+',
        'RTGC6+': '{awayTeam} 6+'
      },
      'sort': [
        'RTGH0',
        'RTGH1',
        'RTGH2',
        'RTGH3',
        'RTGH4',
        'RTGH5',
        'RTGH6',
        'RTGH4+',
        'RTGH5+',
        'RTGH6+',
        'RTGC0',
        'RTGC1',
        'RTGC2',
        'RTGC3',
        'RTGC4',
        'RTGC5',
        'RTGC6',
        'RTGC4+',
        'RTGC5+',
        'RTGC6+']
    },
  "HRTG": {
    "col": 2,
    "text": {
      'HRTGH0': '{homeTeam} 0',
      'HRTGH1': '{homeTeam} 1',
      'HRTGH2': '{homeTeam} 2',
      'HRTGH3': '{homeTeam} 3',
      'HRTGH4': '{homeTeam} 4',
      'HRTGH4+': '{homeTeam} 4+',
      'HRTGC0': '{awayTeam} 0',
      'HRTGC1': '{awayTeam} 1',
      'HRTGC2': '{awayTeam} 2',
      'HRTGC3': '{awayTeam} 3',
      'HRTGC4': '{awayTeam} 4',
      'HRTGC4+': '{awayTeam} 4+'
    },
    "sort": ['HRTGH0',  'HRTGC0','HRTGH1', 'HRTGC1',  'HRTGH2', 'HRTGC2','HRTGH3', 'HRTGC3','HRTGH4','HRTGC4','HRTGH4+', 'HRTGC4+']
  },
  "RHTS": {
    "col": 2,
    "text": {"HRTSY": "Phải", "HRTSN": "Không "},
    "sort": ["HRTSY", "HRTSN"]
  },
  "RTGOU": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRTTG": {
    "col": 2,
    "text": {
      "HROUHC": "{homeTeam} Tài {ratio}",
      "HROUHH": "{homeTeam} Xỉu {ratio}",
      "HROUCC": "{awayTeam} Tài {ratio}",
      "HROUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["HROUHC", "HROUHH", "HROUCC", "HROUCH"]
  },
  
  "RTM": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "Hòa", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "ROU3_conner": {
    "col": 3,
    "text": {"ROUC": "Tài {ratio}", "ROUE": "Vừa đúng {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUE", "ROUH"]
  },
  "RW3_conner": {
    "col": 3,
    "text": {
      "RW3H": "{homeTeam} {ratio}",
      "RW3N": "Hòa {ratio}",
      "RW3C": "{awayTeam} {ratio}"
    },
    "sort": ["RW3H", "RW3N", "RW3C"]
  },
  "NM5A": {
    "col": 3,
    "text": {
      "NM5AGY": "Ghi bàn Phải",
      "NM5AGN": "Ghi bàn Không",
      "NM5ACY": "Phạt góc Phải",
      "NM5ACN": "Phạt góc Không",
      "NM5AFY": "Đá phạt Phải",
      "NM5AFN": "Đá phạt Không",
      "NM5AKY": "Phát bóng Phải",
      "NM5AKN": "Phát bóng Không",
      "NM5ABY": "Ném biên Phải",
      "NM5ABN": "Ném biên Không",
      "NM5APY": "Phạt đền Phải",
      "NM5APN": "Phạt đền Không"
    },
    "sort": [
      "NM5AGY",
      "NM5AGN",
      "NM5ACY",
      "NM5ACN",
      "NM5AFY",
      "NM5AFN",
      "NM5AKY",
      "NM5AKN",
      "NM5ABY",
      "NM5ABN",
      "NM5APY",
      "NM5APN"
    ]
  },
  "NM5B": {
    "col": 3,
    "text": {
      "NM5BGY": "Ghi bàn Phải",
      "NM5BGN": "Ghi bàn Không",
      "NM5BCY": "Phạt góc Phải",
      "NM5BCN": "Phạt góc Không",
      "NM5BFY": "Đá phạt Phải",
      "NM5BFN": "Đá phạt Không",
      "NM5BKY": "Phát bóng Phải",
      "NM5BKN": "Phát bóng Không",
      "NM5BBY": "Ném biên Phải",
      "NM5BBN": "Ném biên Không",
      "NM5BPY": "Phạt đền Phải",
      "NM5BPN": "Phạt đền Không"
    },
    "sort": [
      "NM5BGY",
      "NM5BGN",
      "NM5BCY",
      "NM5BCN",
      "NM5BFY",
      "NM5BFN",
      "NM5BKY",
      "NM5BKN",
      "NM5BBY",
      "NM5BBN",
      "NM5BPY",
      "NM5BPN"
    ]
  },
  "NM5C": {
    "col": 3,
    "text": {
      "NM5CGY": "Ghi bàn Phải",
      "NM5CGN": "Ghi bàn Không",
      "NM5CCY": "Phạt góc Phải",
      "NM5CCN": "Phạt góc Không",
      "NM5CFY": "Đá phạt Phải",
      "NM5CFN": "Đá phạt Không",
      "NM5CKY": "Phát bóng Phải",
      "NM5CKN": "Phát bóng Không",
      "NM5CBY": "Ném biên Phải",
      "NM5CBN": "Ném biên Không",
      "NM5CPY": "Phạt đền Phải",
      "NM5CPN": "Phạt đền Không"
    },
    "sort": [
      "NM5CGY",
      "NM5CGN",
      "NM5CCY",
      "NM5CCN",
      "NM5CFY",
      "NM5CFN",
      "NM5CKY",
      "NM5CKN",
      "NM5CBY",
      "NM5CBN",
      "NM5CPY",
      "NM5CPN"
    ]
  },
  "NM5D": {
    "col": 3,
    "text": {
      "NM5DGY": "Ghi bàn Phải",
      "NM5DGN": "Ghi bàn Không",
      "NM5DCY": "Phạt góc Phải",
      "NM5DCN": "Phạt góc Không",
      "NM5DFY": "Đá phạt Phải",
      "NM5DFN": "Đá phạt Không",
      "NM5DKY": "Phát bóng Phải",
      "NM5DKN": "Phát bóng Không",
      "NM5DBY": "Ném biên Phải",
      "NM5DBN": "Ném biên Không",
      "NM5DPY": "Phạt đền Phải",
      "NM5DPN": "Phạt đền Không"
    },
    "sort": [
      "NM5DGY",
      "NM5DGN",
      "NM5DCY",
      "NM5DCN",
      "NM5DFY",
      "NM5DFN",
      "NM5DKY",
      "NM5DKN",
      "NM5DBY",
      "NM5DBN",
      "NM5DPY",
      "NM5DPN"
    ]
  },
  "NM1A": {
    "col": 3,
    "text": {
      "NM1AGY": "Ghi bàn Phải",
      "NM1AGN": "Ghi bàn Không",
      "NM1ACY": "Phạt góc Phải",
      "NM1ACN": "Phạt góc Không",
      "NM1AFY": "Đá phạt Phải",
      "NM1AFN": "Đá phạt Không",
      "NM1AKY": "Phát bóng Phải",
      "NM1AKN": "Phát bóng Không",
      "NM1ABY": "Ném biên Phải",
      "NM1ABN": "Ném biên Không"
    },
    "sort": [
      "NM1AGY",
      "NM1AGN",
      "NM1ACY",
      "NM1ACN",
      "NM1AFY",
      "NM1AFN",
      "NM1AKY",
      "NM1AKN",
      "NM1ABY",
      "NM1ABN"
    ]
  },
  "NM1B": {
    "col": 3,
    "text": {
      "NM1BGY": "Ghi bàn Phải",
      "NM1BGN": "Ghi bàn Không",
      "NM1BCY": "Phạt góc Phải",
      "NM1BCN": "Phạt góc Không",
      "NM1BFY": "Đá phạt Phải",
      "NM1BFN": "Đá phạt Không",
      "NM1BKY": "Phát bóng Phải",
      "NM1BKN": "Phát bóng Không",
      "NM1BBY": "Ném biên Phải",
      "NM1BBN": "Ném biên Không"
    },
    "sort": [
      "NM1BGY",
      "NM1BGN",
      "NM1BCY",
      "NM1BCN",
      "NM1BFY",
      "NM1BFN",
      "NM1BKY",
      "NM1BKN",
      "NM1BBY",
      "NM1BBN"
    ]
  },
  "NM1C": {
    "col": 3,
    "text": {
      "NM1CGY": "Ghi bàn Phải",
      "NM1CGN": "Ghi bàn Không",
      "NM1CCY": "Phạt góc Phải",
      "NM1CCN": "Phạt góc Không",
      "NM1CFY": "Đá phạt Phải",
      "NM1CFN": "Đá phạt Không",
      "NM1CKY": "Phát bóng Phải",
      "NM1CKN": "Phát bóng Không",
      "NM1CBY": "Ném biên Phải",
      "NM1CBN": "Ném biên Không"
    },
    "sort": [
      "NM1CGY",
      "NM1CGN",
      "NM1CCY",
      "NM1CCN",
      "NM1CFY",
      "NM1CFN",
      "NM1CKY",
      "NM1CKN",
      "NM1CBY",
      "NM1CBN"
    ]
  },
  "NM1D": {
    "col": 3,
    "text": {
      "NM1DGY": "Ghi bàn Phải",
      "NM1DGN": "Ghi bàn Không",
      "NM1DCY": "Phạt góc Phải",
      "NM1DCN": "Phạt góc Không",
      "NM1DFY": "Đá phạt Phải",
      "NM1DFN": "Đá phạt Không",
      "NM1DKY": "Phát bóng Phải",
      "NM1DKN": "Phát bóng Không",
      "NM1DBY": "Ném biên Phải",
      "NM1DBN": "Ném biên Không"
    },
    "sort": [
      "NM1DGY",
      "NM1DGN",
      "NM1DCY",
      "NM1DCN",
      "NM1DFY",
      "NM1DFN",
      "NM1DKY",
      "NM1DKN",
      "NM1DBY",
      "NM1DBN"
    ]
  },
  "WH5MA": {
    "col": 3,
    "text": {
      "WH5MAG": 'Ghi bàn',
      "WH5MAC": 'Phạt góc',
      "WH5MAP": 'Phạt đền',
      "WH5MAD": 'Phạt thẻ',
      "WH5MAF": 'Đá phạt',
      "WH5MAK": 'Phát bóng',
      "WH5MAB": 'Ném biên',
      "WH5MAN": 'Không có chuyện gì xảy ra',
    },
    'sort': [
      'WH5MAG',
      'WH5MAC',
      'WH5MAP',
      'WH5MAD',
      'WH5MAF',
      'WH5MAK',
      'WH5MAB',
      'WH5MAN'
    ]
  },
  'WH5MB': {
    'col': 3,
    'text': {
      'WH5MBG': 'Ghi bàn',
      'WH5MBC': 'Phạt góc',
      'WH5MBP': 'Phạt đền',
      'WH5MBD': 'Phạt thẻ',
      'WH5MBF': 'Đá phạt',
      'WH5MBK': 'Phát bóng',
      'WH5MBB': 'Ném biên',
      'WH5MBN': 'Không có chuyện gì xảy ra',
    },
    'sort': [
      'WH5MBG',
      'WH5MBC',
      'WH5MBP',
      'WH5MBD',
      'WH5MBF',
      'WH5MBK',
      'WH5MBB',
      'WH5MBN'
    ]
  },
  'WH5MC': {
    'col': 3,
    'text': {
      'WH5MCG': 'Ghi bàn',
      'WH5MCC': 'Phạt góc',
      'WH5MCP': 'Phạt đền',
      'WH5MCD': 'Phạt thẻ',
      'WH5MCF': 'Đá phạt',
      'WH5MCK': 'Phát bóng',
      'WH5MCB': 'Ném biên',
      'WH5MCN': 'Không có chuyện gì xảy ra',
    },
    'sort': [
      'WH5MCG',
      'WH5MCC',
      'WH5MCD',
      'WH5MCP',
      'WH5MCF',
      'WH5MCK',
      'WH5MCB',
      'WH5MCN'
    ]
  },
  'WH5MD': {
    'col': 3,
    'text': {
      'WH5MDG': 'Ghi bàn',
      'WH5MDC': 'Phạt góc',
      'WH5MDP': 'Phạt đền',
      'WH5MDD': 'Phạt thẻ',
      'WH5MDF': 'Đá phạt',
      'WH5MDK': 'Phát bóng',
      'WH5MDB': 'Ném biên',
      'WH5MDN': 'Không có chuyện gì xảy ra',
    },
    'sort': [
      'WH5MDG',
      'WH5MDC',
      'WH5MDD',
      'WH5MDP',
      'WH5MDF',
      'WH5MDK',
      'WH5MDB',
      'WH5MDN'
    ]
  },
  "WH1MA": {
    "col": 3,
    "text": {
      "WH1MAG": "Ghi bàn",
      "WH1MAC": "Phạt góc",
      'WH1MAD': 'Phạt thẻ',
      'WH1MAP': 'Phạt đền',
      "WH1MAF": "Đá phạt",
      "WH1MAK": "Phát bóng",
      "WH1MAB": "Ném biên",
      "WH1MAN": "Không có chuyện gì xảy ra"
    },
    "sort": [
      'WH1MAG',
      'WH1MAC',
      'WH1MAD',
      'WH1MAP',
      'WH1MAF',
      'WH1MAK',
      'WH1MAB',
      'WH1MAN'
    ]
  },
  "WH1MB": {
    "col": 3,
    "text": {
      "WH1MBG": "Ghi bàn",
      "WH1MBC": "Phạt góc",
      'WH1MBD': 'Phạt thẻ',
      'WH1MBP': 'Phạt đền',
      "WH1MBF": "Đá phạt",
      "WH1MBK": "Phát bóng",
      "WH1MBB": "Ném biên",
      "WH1MBN": "Không có chuyện gì xảy ra"
    },
    "sort": [
      'WH1MBG',
      'WH1MBC',
      'WH1MBD',
      'WH1MBP',
      'WH1MBF',
      'WH1MBK',
      'WH1MBB',
      'WH1MBN'
    ]
  },
  "WH1MC": {
    "col": 3,
    "text": {
      "WH1MCG": "Ghi bàn",
      "WH1MCC": "Phạt góc",
      'WH1MCD': 'Phạt thẻ',
      'WH1MCP': 'Phạt đền',
      "WH1MCF": "Đá phạt",
      "WH1MCK": "Phát bóng",
      "WH1MCB": "Ném biên",
      "WH1MCN": "Không có chuyện gì xảy ra"
    },
    "sort": [
      'WH1MCG',
      'WH1MCC',
      'WH1MCD',
      'WH1MCP',
      'WH1MCF',
      'WH1MCK',
      'WH1MCB',
      'WH1MCN'
    ]
  },
  "WH1MD": {
    "col": 3,
    "text": {
      "WH1MDG": "Ghi bàn",
      "WH1MDC": "Phạt góc",
      'WH1MDD': 'Phạt thẻ',
      'WH1MDP': 'Phạt đền',
      "WH1MDF": "Đá phạt",
      "WH1MDK": "Phát bóng",
      "WH1MDB": "Ném biên",
      "WH1MDN": "Không có chuyện gì xảy ra"
    },
    "sort": [
      'WH1MDG',
      'WH1MDC',
      'WH1MDD',
      'WH1MDP',
      'WH1MDF',
      'WH1MDK',
      'WH1MDB',
      'WH1MDN'
    ]
  },
  "REC2_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC3_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC4_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC5_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC6_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC7_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC8_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC9_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC10_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC11_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC12_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC13_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC14_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC15_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC16_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC17_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC18_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC19_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "REC20_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "GS1": {"col": 2, "text": {}, "sort": []},
  "GS2": {"col": 2, "text": {}, "sort": []},
  "GS3": {"col": 2, "text": {}, "sort": []},
  "GS4": {"col": 2, "text": {}, "sort": []},
  "GS5": {"col": 2, "text": {}, "sort": []},
  "GS6": {"col": 2, "text": {}, "sort": []},
  "GS7": {"col": 2, "text": {}, "sort": []},
  "GS8": {"col": 2, "text": {}, "sort": []},
  "GS9": {"col": 2, "text": {}, "sort": []},
  "GS10": {"col": 2, "text": {}, "sort": []},
  "TEARM": {
    "col": 3,
    "text": {"TEARMH": "{homeTeam}", "TEARMN": "Hòa", "TEARMC": "{awayTeam}"},
    "sort": ["TEARMH", "TEARMN", "TEARMC"]
  },
  "TEAR": {
    "col": 2,
    "text": {"TEARH": "{homeTeam} {ratio}", "TEARC": "{awayTeam} {ratio}"},
    "sort": ["TEARH", "TEARC"]
  },
  "TEAROU": {
    "col": 2,
    "text": {"TEAROUO": "Tài {ratio}", "TEAROUU": "Xỉu {ratio}"},
    "sort": ["TEAROUO", "TEAROUU"]
  },
  "FIARM": {
    "col": 3,
    "text": {"FIARMH": "{homeTeam}", "FIARMN": "Hòa", "FIARMC": "{awayTeam}"},
    "sort": ["FIARMH", "FIARMN", "FIARMC"]
  },
  "FIAR": {
    "col": 2,
    "text": {"FIARH": "{homeTeam} {ratio}", "FIARC": "{awayTeam} {ratio}"},
    "sort": ["FIARH", "FIARC"]
  },
  "FIBROU": {
    "col": 2,
    "text": {"FIBROUO": "Tài {ratio}", "FIBROUU": "Xỉu {ratio}"},
    "sort": ["FIBROUO", "FIBROUU"]
  },
  "TEBRM": {
    "col": 3,
    "text": {"TEBRMH": "{homeTeam}", "TEBRMN": "Hòa", "TEBRMC": "{awayTeam}"},
    "sort": ["TEBRMH", "TEBRMN", "TEBRMC"]
  },
  "TEBR": {
    "col": 2,
    "text": {"TEBRH": "{homeTeam} {ratio}", "TEBRC": "{awayTeam} {ratio}"},
    "sort": ["TEBRH", "TEBRC"]
  },
  "TEBROU": {
    "col": 2,
    "text": {"TEBROUO": "Tài {ratio}", "TEBROUU": "Xỉu {ratio}"},
    "sort": ["TEBROUO", "TEBROUU"]
  },
  "SAARM": {
    "col": 3,
    "text": {"SAARMH": "{homeTeam}", "SAARMN": "Hòa", "SAARMC": "{awayTeam}"},
    "sort": ["SAARMH", "SAARMN", "SAARMC"]
  },
  "SAAR": {
    "col": 2,
    "text": {"SAARH": "{homeTeam} {ratio}", "SAARC": "{awayTeam} {ratio}"},
    "sort": ["SAARH", "SAARC"]
  },
  "SAAROU": {
    "col": 2,
    "text": {"SAAROUO": "Tài {ratio}", "SAAROUU": "Xỉu {ratio}"},
    "sort": ["SAAROUO", "SAAROUU"]
  },
  "FICRM": {
    "col": 3,
    "text": {"FICRMH": "{homeTeam}", "FICRMN": "Hòa", "FICRMC": "{awayTeam}"},
    "sort": ["FICRMH", "FICRMN", "FICRMC"]
  },
  "FICR": {
    "col": 2,
    "text": {"FICRH": "{homeTeam} {ratio}", "FICRC": "{awayTeam} {ratio}"},
    "sort": ["FICRH", "FICRC"]
  },
  "FICROU": {
    "col": 2,
    "text": {"FICROUO": "Tài {ratio}", "FICROUU": "Xỉu {ratio}"},
    "sort": ["FICROUO", "FICROUU"]
  },
  "FIDRM": {
    "col": 3,
    "text": {"FIDRMH": "{homeTeam}", "FIDRMN": "Hòa", "FIDRMC": "{awayTeam}"},
    "sort": ["FIDRMH", "FIDRMN", "FIDRMC"]
  },
  "FIDR": {
    "col": 2,
    "text": {"FIDRH": "{homeTeam} {ratio}", "FIDRC": "{awayTeam} {ratio}"},
    "sort": ["FIDRH", "FIDRC"]
  },
  "FIDROU": {
    "col": 2,
    "text": {"FIDROUO": "Tài {ratio}", "FIDROUU": "Xỉu {ratio}"},
    "sort": ["FIDROUO", "FIDROUU"]
  },
  "FIERM": {
    "col": 3,
    "text": {"FIERMH": "{homeTeam}", "FIERMN": "Hòa", "FIERMC": "{awayTeam}"},
    "sort": ["FIERMH", "FIERMN", "FIERMC"]
  },
  "FIER": {
    "col": 2,
    "text": {"FIERH": "{homeTeam} {ratio}", "FIERC": "{awayTeam} {ratio}"},
    "sort": ["FIERH", "FIERC"]
  },
  "FIEROU": {
    "col": 2,
    "text": {"FIEROUO": "Tài {ratio}", "FIEROUU": "Xỉu {ratio}"},
    "sort": ["FIEROUO", "FIEROUU"]
  },
  "FIFRM": {
    "col": 3,
    "text": {"FIFRMH": "{homeTeam}", "FIFRMN": "Hòa", "FIFRMC": "{awayTeam}"},
    "sort": ["FIFRMH", "FIFRMN", "FIFRMC"]
  },
  "FIFR": {
    "col": 2,
    "text": {"FIFRH": "{homeTeam} {ratio}", "FIFRC": "{awayTeam} {ratio}"},
    "sort": ["FIFRH", "FIFRC"]
  },
  "FIFROU": {
    "col": 2,
    "text": {"FIFROUO": "Tài {ratio}", "FIFROUU": "Xỉu {ratio}"},
    "sort": ["FIFROUO", "FIFROUU"]
  },
  "FIGRM": {
    "col": 3,
    "text": {"FIGRMH": "{homeTeam}", "FIGRMN": "Hòa", "FIGRMC": "{awayTeam}"},
    "sort": ["FIGRMH", "FIGRMN", "FIGRMC"]
  },
  "FIGR": {
    "col": 2,
    "text": {"FIGRH": "{homeTeam} {ratio}", "FIGRC": "{awayTeam} {ratio}"},
    "sort": ["FIGRH", "FIGRC"]
  },
  "FIGROU": {
    "col": 2,
    "text": {"FIGROUO": "Tài {ratio}", "FIGROUU": "Xỉu {ratio}"},
    "sort": ["FIGROUO", "FIGROUU"]
  },
  "FIHRM": {
    "col": 3,
    "text": {"FIHRMH": "{homeTeam}", "FIHRMN": "Hòa", "FIHRMC": "{awayTeam}"},
    "sort": ["FIHRMH", "FIHRMN", "FIHRMC"]
  },
  "FIHR": {
    "col": 2,
    "text": {"FIHRH": "{homeTeam} {ratio}", "FIHRC": "{awayTeam} {ratio}"},
    "sort": ["FIHRH", "FIHRC"]
  },
  "FIHROU": {
    "col": 2,
    "text": {"FIHROUO": "Tài {ratio}", "FIHROUU": "Xỉu {ratio}"},
    "sort": ["FIHROUO", "FIHROUU"]
  },
  "FIIRM": {
    "col": 3,
    "text": {"FIIRMH": "{homeTeam}", "FIIRMN": "Hòa", "FIIRMC": "{awayTeam}"},
    "sort": ["FIIRMH", "FIIRMN", "FIIRMC"]
  },
  "FIIR": {
    "col": 2,
    "text": {"FIIRH": "{homeTeam} {ratio}", "FIIRC": "{awayTeam} {ratio}"},
    "sort": ["FIIRH", "FIIRC"]
  },
  "FIIROU": {
    "col": 2,
    "text": {"FIIROUO": "Tài {ratio}", "FIIROUU": "Xỉu {ratio}"},
    "sort": ["FIIROUO", "FIIROUU"]
  },
  "FIJRM": {
    "col": 3,
    "text": {"FIJRMH": "{homeTeam}", "FIJRMN": "Hòa", "FIJRMC": "{awayTeam}"},
    "sort": ["FIJRMH", "FIJRMN", "FIJRMC"]
  },
  "FIJR": {
    "col": 2,
    "text": {"FIJRH": "{homeTeam} {ratio}", "FIJRC": "{awayTeam} {ratio}"},
    "sort": ["FIJRH", "FIJRC"]
  },
  "FIJROU": {
    "col": 2,
    "text": {"FIJROUO": "Tài {ratio}", "FIJROUU": "Xỉu {ratio}"},
    "sort": ["FIJROUO", "FIJROUU"]
  },
  "FIKRM": {
    "col": 3,
    "text": {"FIKRMH": "{homeTeam}", "FIKRMN": "Hòa", "FIKRMC": "{awayTeam}"},
    "sort": ["FIKRMH", "FIKRMN", "FIKRMC"]
  },
  "FIKR": {
    "col": 2,
    "text": {"FIKRH": "{homeTeam} {ratio}", "FIKRC": "{awayTeam} {ratio}"},
    "sort": ["FIKRH", "FIKRC"]
  },
  "FIKROU": {
    "col": 2,
    "text": {"FIKROUO": "Tài {ratio}", "FIKROUU": "Xỉu {ratio}"},
    "sort": ["FIKROUO", "FIKROUU"]
  },
  "FILRM": {
    "col": 3,
    "text": {"FILRMH": "{homeTeam}", "FILRMN": "Hòa", "FILRMC": "{awayTeam}"},
    "sort": ["FILRMH", "FILRMN", "FILRMC"]
  },
  "FILR": {
    "col": 2,
    "text": {"FILRH": "{homeTeam} {ratio}", "FILRC": "{awayTeam} {ratio}"},
    "sort": ["FILRH", "FILRC"]
  },
  "FILROU": {
    "col": 2,
    "text": {"FILROUO": "Tài {ratio}", "FILROUU": "Xỉu {ratio}"},
    "sort": ["FILROUO", "FILROUU"]
  },
  "FIMRM": {
    "col": 3,
    "text": {"FIMRMH": "{homeTeam}", "FIMRMN": "Hòa", "FIMRMC": "{awayTeam}"},
    "sort": ["FIMRMH", "FIMRMN", "FIMRMC"]
  },
  "FIMR": {
    "col": 2,
    "text": {"FIMRH": "{homeTeam} {ratio}", "FIMRC": "{awayTeam} {ratio}"},
    "sort": ["FIMRH", "FIMRC"]
  },
  "FIMROU": {
    "col": 2,
    "text": {"FIMROUO": "Tài {ratio}", "FIMROUU": "Xỉu {ratio}"},
    "sort": ["FIMROUO", "FIMROUU"]
  },
  "FINRM": {
    "col": 3,
    "text": {"FINRMH": "{homeTeam}", "FINRMN": "Hòa", "FINRMC": "{awayTeam}"},
    "sort": ["FINRMH", "FINRMN", "FINRMC"]
  },
  "FINR": {
    "col": 2,
    "text": {"FINRH": "{homeTeam} {ratio}", "FINRC": "{awayTeam} {ratio}"},
    "sort": ["FINRH", "FINRC"]
  },
  "FINROU": {
    "col": 2,
    "text": {"FINROUO": "Tài {ratio}", "FINROUU": "Xỉu {ratio}"},
    "sort": ["FINROUO", "FINROUU"]
  },
  "FIORM": {
    "col": 3,
    "text": {"FIORMH": "{homeTeam}", "FIORMN": "Hòa", "FIORMC": "{awayTeam}"},
    "sort": ["FIORMH", "FIORMN", "FIORMC"]
  },
  "FIOR": {
    "col": 2,
    "text": {"FIORH": "{homeTeam} {ratio}", "FIORC": "{awayTeam} {ratio}"},
    "sort": ["FIORH", "FIORC"]
  },
  "FIOROU": {
    "col": 2,
    "text": {"FIOROUO": "Tài {ratio}", "FIOROUU": "Xỉu {ratio}"},
    "sort": ["FIOROUO", "FIOROUU"]
  },
  "FIPRM": {
    "col": 3,
    "text": {"FIPRMH": "{homeTeam}", "FIPRMN": "Hòa", "FIPRMC": "{awayTeam}"},
    "sort": ["FIPRMH", "FIPRMN", "FIPRMC"]
  },
  "FIPR": {
    "col": 2,
    "text": {"FIPRH": "{homeTeam} {ratio}", "FIPRC": "{awayTeam} {ratio}"},
    "sort": ["FIPRH", "FIPRC"]
  },
  "FIPROU": {
    "col": 2,
    "text": {"FIPROUO": "Tài {ratio}", "FIPROUU": "Xỉu {ratio}"},
    "sort": ["FIPROUO", "FIPROUU"]
  },
  "FIQRM": {
    "col": 3,
    "text": {"FIQRMH": "{homeTeam}", "FIQRMN": "Hòa", "FIQRMC": "{awayTeam}"},
    "sort": ["FIQRMH", "FIQRMN", "FIQRMC"]
  },
  "FIQR": {
    "col": 2,
    "text": {"FIQRH": "{homeTeam} {ratio}", "FIQRC": "{awayTeam} {ratio}"},
    "sort": ["FIQRH", "FIQRC"]
  },
  "FIQROU": {
    "col": 2,
    "text": {"FIQROUO": "Tài {ratio}", "FIQROUU": "Xỉu {ratio}"},
    "sort": ["FIQROUO", "FIQROUU"]
  },
  "TECRM": {
    "col": 3,
    "text": {"TECRMH": "{homeTeam}", "TECRMN": "Hòa", "TECRMC": "{awayTeam}"},
    "sort": ["TECRMH", "TECRMN", "TECRMC"]
  },
  "TECR": {
    "col": 2,
    "text": {"TECRH": "{homeTeam} {ratio}", "TECRC": "{awayTeam} {ratio}"},
    "sort": ["TECRH", "TECRC"]
  },
  "TECROU": {
    "col": 2,
    "text": {"TECROUO": "Tài {ratio}", "TECROUU": "Xỉu {ratio}"},
    "sort": ["TECROUO", "TECROUU"]
  },
  "TEDRM": {
    "col": 3,
    "text": {"TEDRMH": "{homeTeam}", "TEDRMN": "Hòa", "TEDRMC": "{awayTeam}"},
    "sort": ["TEDRMH", "TEDRMN", "TEDRMC"]
  },
  "TEDR": {
    "col": 2,
    "text": {"TEDRH": "{homeTeam} {ratio}", "TEDRC": "{awayTeam} {ratio}"},
    "sort": ["TEDRH", "TEDRC"]
  },
  "TEDROU": {
    "col": 2,
    "text": {"TEDROUO": "Tài {ratio}", "TEDROUU": "Xỉu {ratio}"},
    "sort": ["TEDROUO", "TEDROUU"]
  },
  "TEERM": {
    "col": 3,
    "text": {"TEERMH": "{homeTeam}", "TEERMN": "Hòa", "TEERMC": "{awayTeam}"},
    "sort": ["TEERMH", "TEERMN", "TEERMC"]
  },
  "TEER": {
    "col": 2,
    "text": {"TEERH": "{homeTeam} {ratio}", "TEERC": "{awayTeam} {ratio}"},
    "sort": ["TEERH", "TEERC"]
  },
  "TEEROU": {
    "col": 2,
    "text": {"TEEROUO": "Tài {ratio}", "TEEROUU": "Xỉu {ratio}"},
    "sort": ["TEEROUO", "TEEROUU"]
  },
  "TEFRM": {
    "col": 3,
    "text": {"TEFRMH": "{homeTeam}", "TEFRMN": "Hòa", "TEFRMC": "{awayTeam}"},
    "sort": ["TEFRMH", "TEFRMN", "TEFRMC"]
  },
  "TEFR": {
    "col": 2,
    "text": {"TEFRH": "{homeTeam} {ratio}", "TEFRC": "{awayTeam} {ratio}"},
    "sort": ["TEFRH", "TEFRC"]
  },
  "TEFROU": {
    "col": 2,
    "text": {"TEFROUO": "Tài {ratio}", "TEFROUU": "Xỉu {ratio}"},
    "sort": ["TEFROUO", "TEFROUU"]
  },
  "TEGRM": {
    "col": 2,
    "text": {"TEGRMH": "{homeTeam}", "TEGRMN": "Hòa", "TEGRMC": "{awayTeam}"},
    "sort": ["TEGRMH", "TEGRMN", "TEGRMC"]
  },
  "TEGR": {
    "col": 2,
    "text": {"TEGRH": "{homeTeam} {ratio}", "TEGRC": "{awayTeam} {ratio}"},
    "sort": ["TEGRH", "TEGRC"]
  },
  "TEGROU": {
    "col": 2,
    "text": {"TEGROUO": "Tài {ratio}", "TEGROUU": "Xỉu {ratio}"},
    "sort": ["TEGROUO", "TEGROUU"]
  },
  "TEHRM": {
    "col": 3,
    "text": {"TEHRMH": "{homeTeam}", "TEHRMN": "Hòa", "TEHRMC": "{awayTeam}"},
    "sort": ["TEHRMH", "TEHRMN", "TEHRMC"]
  },
  "TEHR": {
    "col": 2,
    "text": {"TEHRH": "{homeTeam} {ratio}", "TEHRC": "{awayTeam} {ratio}"},
    "sort": ["TEHRH", "TEHRC"]
  },
  "TEHROU": {
    "col": 2,
    "text": {"TEHROUO": "Tài {ratio}", "TEHROUU": "Xỉu {ratio}"},
    "sort": ["TEHROUO", "TEHROUU"]
  },
  "TEIRM": {
    "col": 3,
    "text": {"TEIRMH": "{homeTeam}", "TEIRMN": "Hòa", "TEIRMC": "{awayTeam}"},
    "sort": ["TEIRMH", "TEIRMN", "TEIRMC"]
  },
  "TEIR": {
    "col": 2,
    "text": {"TEIRH": "{homeTeam} {ratio}", "TEIRC": "{awayTeam} {ratio}"},
    "sort": ["TEIRH", "TEIRC"]
  },
  "TEIROU": {
    "col": 2,
    "text": {"TEIROUO": "Tài {ratio}", "TEIROUU": "Xỉu {ratio}"},
    "sort": ["TEIROUO", "TEIROUU"]
  },
  "TEJRM": {
    "col": 3,
    "text": {"TEJRMH": "{homeTeam}", "TEJRMN": "Hòa", "TEJRMC": "{awayTeam}"},
    "sort": ["TEJRMH", "TEJRMN", "TEJRMC"]
  },
  "TEJR": {
    "col": 2,
    "text": {"TEJRH": "{homeTeam} {ratio}", "TEJRC": "{awayTeam} {ratio}"},
    "sort": ["TEJRH", "TEJRC"]
  },
  "TEJROU": {
    "col": 2,
    "text": {"TEJROUO": "Tài {ratio}", "TEJROUU": "Xỉu {ratio}"},
    "sort": ["TEJROUO", "TEJROUU"]
  },
  "TEKRM": {
    "col": 3,
    "text": {"TEKRMH": "{homeTeam}", "TEKRMN": "Hòa", "TEKRMC": "{awayTeam}"},
    "sort": ["TEKRMH", "TEKRMN", "TEKRMC"]
  },
  "TEKR": {
    "col": 2,
    "text": {"TEKRH": "{homeTeam} {ratio}", "TEKRC": "{awayTeam} {ratio}"},
    "sort": ["TEKRH", "TEKRC"]
  },
  "TEKROU": {
    "col": 2,
    "text": {"TEKROUO": "Tài {ratio}", "TEKROUU": "Xỉu {ratio}"},
    "sort": ["TEKROUO", "TEKROUU"]
  },
  "TELRM": {
    "col": 3,
    "text": {"TELRMH": "{homeTeam}", "TELRMN": "Hòa", "TELRMC": "{awayTeam}"},
    "sort": ["TELRMH", "TELRMN", "TELRMC"]
  },
  "TELR": {
    "col": 2,
    "text": {"TELRH": "{homeTeam} {ratio}", "TELRC": "{awayTeam} {ratio}"},
    "sort": ["TELRH", "TELRC"]
  },
  "TELROU": {
    "col": 2,
    "text": {"TELROUO": "Tài {ratio}", "TELROUU": "Xỉu {ratio}"},
    "sort": ["TELROUO", "TELROUU"]
  },
  "TEMRM": {
    "col": 3,
    "text": {"TEMRMH": "{homeTeam}", "TEMRMN": "Hòa", "TEMRMC": "{awayTeam}"},
    "sort": ["TEMRMH", "TEMRMN", "TEMRMC"]
  },
  "TEMR": {
    "col": 2,
    "text": {"TEMRH": "{homeTeam} {ratio}", "TEMRC": "{awayTeam} {ratio}"},
    "sort": ["TEMRH", "TEMRC"]
  },
  "TEMROU": {
    "col": 2,
    "text": {"TEMROUO": "Tài {ratio}", "TEMROUU": "Xỉu {ratio}"},
    "sort": ["TEMROUO", "TEMROUU"]
  },
  "TENRM": {
    "col": 3,
    "text": {"TENRMH": "{homeTeam}", "TENRMN": "Hòa", "TENRMC": "{awayTeam}"},
    "sort": ["TENRMH", "TENRMN", "TENRMC"]
  },
  "TENR": {
    "col": 2,
    "text": {"TENRH": "{homeTeam} {ratio}", "TENRC": "{awayTeam} {ratio}"},
    "sort": ["TENRH", "TENRC"]
  },
  "TENROU": {
    "col": 2,
    "text": {"TENROUO": "Tài {ratio}", "TENROUU": "Xỉu {ratio}"},
    "sort": ["TENROUO", "TENROUU"]
  },
  "TEORM": {
    "col": 3,
    "text": {"TEORMH": "{homeTeam}", "TEORMN": "HòaHòa", "TEORMC": "{awayTeam}"},
    "sort": ["TEORMH", "TEORMN", "TEORMC"]
  },
  "TEOR": {
    "col": 2,
    "text": {"TEORH": "{homeTeam} {ratio}", "TEORC": "{awayTeam} {ratio}"},
    "sort": ["TEORH", "TEORC"]
  },
  "TEOROU": {
    "col": 2,
    "text": {"TEOROUO": "Tài {ratio}", "TEOROUU": "Xỉu {ratio}"},
    "sort": ["TEOROUO", "TEOROUU"]
  },
  "SABRM": {
    "col": 3,
    "text": {"SABRMH": "{homeTeam}", "SABRMN": "Hòa", "SABRMC": "{awayTeam}"},
    "sort": ["SABRMH", "SABRMN", "SABRMC"]
  },
  "SABR": {
    "col": 2,
    "text": {"SABRH": "{homeTeam} {ratio}", "SABRC": "{awayTeam} {ratio}"},
    "sort": ["SABRH", "SABRC"]
  },
  "SABROU": {
    "col": 2,
    "text": {"SABROUO": "Tài {ratio}", "SABROUU": "Xỉu {ratio}"},
    "sort": ["SABROUO", "SABROUU"]
  },
  "BM": {
    "col": 3,
    "text": {"BMH": "{homeTeam}", "BMN": "Hòa", "BMC": "{awayTeam}"},
    "sort": ["BMH", "BMN", "BMC"]
  },
  "BR": {
    "col": 2,
    "text": {"BRH": "{homeTeam} {ratio}", "BRC": "{awayTeam} {ratio}"},
    "sort": ["BRH", "BRC"]
  },
  "BROU": {
    "col": 2,
    "text": {"BROUO": "Tài {ratio}", "BROUU": "Xỉu {ratio}"},
    "sort": ["BROUO", "BROUU"]
  },
  "SACRM": {
    "col": 3,
    "text": {"SACRMH": "{homeTeam}", "SACRMN": "Hòa", "SACRMC": "{awayTeam}"},
    "sort": ["SACRMH", "SACRMN", "SACRMC"]
  },
  "SACR": {
    "col": 2,
    "text": {"SACRH": "{homeTeam} {ratio}", "SACRC": "{awayTeam} {ratio}"},
    "sort": ["SACRH", "SACRC"]
  },
  "SACROU": {
    "col": 2,
    "text": {"SACROUO": "Tài {ratio}", "SACROUU": "Xỉu {ratio}"},
    "sort": ["SACROUO", "SACROUU"]
  },
  "SADRM": {
    "col": 3,
    "text": {"SADRMH": "{homeTeam}", "SADRMN": "Hòa", "SADRMC": "{awayTeam}"},
    "sort": ["SADRMH", "SADRMN", "SADRMC"]
  },
  "SADR": {
    "col": 2,
    "text": {"SADRH": "{homeTeam} {ratio}", "SADRC": "{awayTeam} {ratio}"},
    "sort": ["SADRH", "SADRC"]
  },
  "SADROU": {
    "col": 2,
    "text": {"SADROUO": "Tài {ratio}", "SADROUU": "Xỉu {ratio}"},
    "sort": ["SADROUO", "SADROUU"]
  },
  "SAERM": {
    "col": 3,
    "text": {"SAERMH": "{homeTeam}", "SAERMN": "Hòa", "SAERMC": "{awayTeam}"},
    "sort": ["SAERMH", "SAERMN", "SAERMC"]
  },
  "SAER": {
    "col": 2,
    "text": {"SAERH": "{homeTeam} {ratio}", "SAERC": "{awayTeam} {ratio}"},
    "sort": ["SAERH", "SAERC"]
  },
  "SAEROU": {
    "col": 2,
    "text": {"SAEROUO": "Tài {ratio}", "SAEROUU": "Xỉu {ratio}"},
    "sort": ["SAEROUO", "SAEROUU"]
  },
  "SAFRM": {
    "col": 3,
    "text": {"SAFRMH": "{homeTeam}", "SAFRMN": "Hòa", "SAFRMC": "{awayTeam}"},
    "sort": ["SAFRMH", "SAFRMN", "SAFRMC"]
  },
  "SAFR": {
    "col": 2,
    "text": {"SAFRH": "{homeTeam} {ratio}", "SAFRC": "{awayTeam} {ratio}"},
    "sort": ["SAFRH", "SAFRC"]
  },
  "SAFROU": {
    "col": 2,
    "text": {"SAFROUO": "Tài {ratio}", "SAFROUU": "Xỉu {ratio}"},
    "sort": ["SAFROUO", "SAFROUU"]
  },
  "SAGRM": {
    "col": 3,
    "text": {"SAGRMH": "{homeTeam}", "SAGRMN": "Hòa", "SAGRMC": "{awayTeam}"},
    "sort": ["SAGRMH", "SAGRMN", "SAGRMC"]
  },
  "SAGR": {
    "col": 2,
    "text": {"SAGRH": "{homeTeam} {ratio}", "SAGRC": "{awayTeam} {ratio}"},
    "sort": ["SAGRH", "SAGRC"]
  },
  "SAGROU": {
    "col": 2,
    "text": {"SAGROUO": "Tài {ratio}", "SAGROUU": "Xỉu {ratio}"},
    "sort": ["SAGROUO", "SAGROUU"]
  },
  "SAHRM": {
    "col": 3,
    "text": {"SAHRMH": "{homeTeam}", "SAHRMN": "Hòa", "SAHRMC": "{awayTeam}"},
    "sort": ["SAHRMH", "SAHRMN", "SAHRMC"]
  },
  "SAHR": {
    "col": 2,
    "text": {"SAHRH": "{homeTeam} {ratio}", "SAHRC": "{awayTeam} {ratio}"},
    "sort": ["SAHRH", "SAHRC"]
  },
  "SAHROU": {
    "col": 2,
    "text": {"SAHROUO": "Tài {ratio}", "SAHROUU": "Xỉu {ratio}"},
    "sort": ["SAHROUO", "SAHROUU"]
  },
  "SAIRM": {
    "col": 3,
    "text": {"SAIRMH": "{homeTeam}", "SAIRMN": "Hòa", "SAIRMC": "{awayTeam}"},
    "sort": ["SAIRMH", "SAIRMN", "SAIRMC"]
  },
  "SAIR": {
    "col": 2,
    "text": {"SAIRH": "{homeTeam} {ratio}", "SAIRC": "{awayTeam} {ratio}"},
    "sort": ["SAIRH", "SAIRC"]
  },
  "SAIROU": {
    "col": 2,
    "text": {"SAIROUO": "Tài {ratio}", "SAIROUU": "Xỉu {ratio}"},
    "sort": ["SAIROUO", "SAIROUU"]
  },
  "RTTG_conner": {
    "col": 2,
    "text": {
      "OUHC": "{homeTeam} Tài {ratio}",
      "OUHH": "{homeTeam} Xỉu {ratio}",
      "OUCC": "{awayTeam} Tài {ratio}",
      "OUCH": "{awayTeam} Xỉu {ratio}"
    },
    "sort": ["OUHC", "OUHH", "OUCC", "OUCH"]
  },
  "RFGTA": {
    "col": 2,
    "text": {
      "RFGTAS": "Sút",
      "RFGTAH": "Đánh đầu",
      "RFGTAN": "không có bàn thắng",
      "RFGTAP": "Phạt đền",
      "RFGTAF": "Đá phạt",
      "RFGTAO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTAS", "RFGTAH", "RFGTAN", "RFGTAP", "RFGTAF", "RFGTAO"]
  },
  "RFGTB": {
    "col": 2,
    "text": {
      "RFGTBS": "Sút",
      "RFGTBH": "Đánh đầu",
      "RFGTBN": "không có bàn thắng",
      "RFGTBP": "Phạt đền",
      "RFGTBF": "Đá phạt",
      "RFGTBO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTBS", "RFGTBH", "RFGTBN", "RFGTBP", "RFGTBF", "RFGTBO"]
  },
  "RFGTC": {
    "col": 2,
    "text": {
      "RFGTCS": "Sút",
      "RFGTCH": "Đánh đầu",
      "RFGTCN": "không có bàn thắng",
      "RFGTCP": "Phạt đền",
      "RFGTCF": "Đá phạt",
      "RFGTCO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTCS", "RFGTCH", "RFGTCN", "RFGTCP", "RFGTCF", "RFGTCO"]
  },
  "RFGTD": {
    "col": 2,
    "text": {
      "RFGTDS": "Sút",
      "RFGTDH": "Đánh đầu",
      "RFGTDN": "không có bàn thắng",
      "RFGTDP": "Phạt đền",
      "RFGTDF": "Đá phạt",
      "RFGTDO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTDS", "RFGTDH", "RFGTDN", "RFGTDP", "RFGTDF", "RFGTDO"]
  },
  "RFGTE": {
    "col": 2,
    "text": {
      "RFGTES": "Sút",
      "RFGTEH": "Đánh đầu",
      "RFGTEN": "không có bàn thắng",
      "RFGTEP": "Phạt đền",
      "RFGTEF": "Đá phạt",
      "RFGTEO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTES", "RFGTEH", "RFGTEN", "RFGTEP", "RFGTEF", "RFGTEO"]
  },
  "RFGTF": {
    "col": 2,
    "text": {
      "RFGTFS": "Sút",
      "RFGTFH": "Đánh đầu",
      "RFGTFN": "không có bàn thắng",
      "RFGTFP": "Phạt đền",
      "RFGTFF": "Đá phạt",
      "RFGTFO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTFS", "RFGTFH", "RFGTFN", "RFGTFP", "RFGTFF", "RFGTFO"]
  },
  "RFGTG": {
    "col": 2,
    "text": {
      "RFGTGS": "Sút",
      "RFGTGH": "Đánh đầu",
      "RFGTGN": "không có bàn thắng",
      "RFGTGP": "Phạt đền",
      "RFGTGF": "Đá phạt",
      "RFGTGO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTGS", "RFGTGH", "RFGTGN", "RFGTGP", "RFGTGF", "RFGTGO"]
  },
  "RFGTH": {
    "col": 2,
    "text": {
      "RFGTHS": "Sút",
      "RFGTHH": "Đánh đầu",
      "RFGTHN": "không có bàn thắng",
      "RFGTHP": "Phạt đền",
      "RFGTHF": "Đá phạt",
      "RFGTHO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTHS", "RFGTHH", "RFGTHN", "RFGTHP", "RFGTHF", "RFGTHO"]
  },
  "RFGTI": {
    "col": 2,
    "text": {
      "RFGTIS": "Sút",
      "RFGTIH": "Đánh đầu",
      "RFGTIN": "không có bàn thắng",
      "RFGTIP": "Phạt đền",
      "RFGTIF": "Đá phạt",
      "RFGTIO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTIS", "RFGTIH", "RFGTIN", "RFGTIP", "RFGTIF", "RFGTIO"]
  },
  "RFGTJ": {
    "col": 2,
    "text": {
      "RFGTJS": "Sút",
      "RFGTJH": "Đánh đầu",
      "RFGTJN": "không có bàn thắng",
      "RFGTJP": "Phạt đền",
      "RFGTJF": "Đá phạt",
      "RFGTJO": "Đá phản lưới nhà"
    },
    "sort": ["RFGTJS", "RFGTJH", "RFGTJN", "RFGTJP", "RFGTJF", "RFGTJO"]
  },
  "RRT3_conner": {
    "col": 3,
    "text": {"RRT3H": "{homeTeam}", "RRT3N": "Đều không phải", "RRT3C": "{awayTeam}"},
    "sort": ["RRT3H", "RRT3N", "RRT3C"]
  },
  "RRT5_conner": {
    "col": 3,
    "text": {"RRT5H": "{homeTeam}", "RRT5N": "Đều không phải", "RRT5C": "{awayTeam}"},
    "sort": ["RRT5H", "RRT5N", "RRT5C"]
  },
  "RRT7_conner": {
    "col": 3,
    "text": {"RRT7H": "{homeTeam}", "RRT7N": "Đều không phải", "RRT7C": "{awayTeam}"},
    "sort": ["RRT7H", "RRT7N", "RRT7C"]
  },
  "RRT9_conner": {
    "col": 3,
    "text": {"RRT9H": "{homeTeam}", "RRT9N": "Đều không phải", "RRT9C": "{awayTeam}"},
    "sort": ["RRT9H", "RRT9N", "RRT9C"]
  },
  "RTEO": {
    "col": 2,
    "text": {
      "RTEOHO": "Lẻ ",
      "RTEOHE": "Chẵn",
      "RTEOCO": "Lẻ ",
      "RTEOCE": "Chẵn"
    },
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  "SP": {
    "col": 2,
    "text": {"SPH": "{homeTeam}", "SPC": "{awayTeam}"},
    "sort": ["SPH", "SPC"]
  },
  "MP": {
    "col": 2,
    "text": {"MPH": "{homeTeam}", "MPC": "{awayTeam}"},
    "sort": ["MPH", "MPC"]
  },
  "GZ": {
    "col": 3,
    "text": {
      "GZ01": "0-1",
      'GZ12': '1-2',
      "GZ23": "2-3",
      'GZ34': '3-4',
      "GZ45": "4-5",
      "GZ56": "5-6",
      "GZ78": "7-8",
      "GZ4OV": "4+",
      "GZ5OV": "5+",
      "GZ6OV": "6+",
      "GZ7OV": "7+",
      "GZ8OV": "8+",
      "GZ9OV": "9+"
    },
    "sort": [
      'GZ01',
      'GZ12',
      'GZ23',
      'GZ34',
      'GZ45',
      'GZ56',
      'GZ78',
      'GZ4OV',
      'GZ5OV',
      'GZ6OV',
      'GZ7OV',
      'GZ8OV',
      'GZ9OV'
    ]
  },
  "HRTS": {
    "col": 2,
    "text": {"HRTSY": "Phải", "HRTSN": "Không"},
    "sort": ["HRTSY", "HRTSN"]
  },
  "R2OU_conner": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "TSNT": {
    "col": 2,
    "text": {"TSNTY": "Phải", "TSNTN": "Không"},
    "sort": ["TSNTY", "TSNTN"]
  },
  "M_conner": {
    "col": 3,
    "text": {"MH": "{homeTeam}", "MN": "Hòa", "MC": "{awayTeam}"},
    "sort": ["MH", "MN", "MC"]
  },
  "R_conner": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU_conner": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RM_conner": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "Hòa", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_conner": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_conner": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_conner": {
    "col": 3,
    "text": {"HRMH": "{homeTeam}", "HRMN": "Hòa", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_conner": {
    "col": 2,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_conner": {
    "col": 2,
    "text": {"HROUC": "Tài {ratio}", "HROUH": "Xỉu {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "HROU2_conner": {
    "col": 2,
    "text": {"HOU2C": "Tài {ratio}", "HOU2H": "Xỉu {ratio}"},
    "sort": ["HOU2C", "HOU2H"]
  },
  "RM_OT": {
    "col": 3,
    "text": {"RMH": "{homeTeam}", "RMN": "Hòa", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMN", "RMC"]
  },
  "RE_OT": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_OT": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "HRM_OT": {
    "col": 3,
    "text": {"HRMH": "{homeTeam}", "HRMN": "Hòa", "HRMC": "{awayTeam}"},
    "sort": ["HRMH", "HRMN", "HRMC"]
  },
  "HRE_OT": {
    "col": 2,
    "text": {"HREH": "{homeTeam} {ratio}", "HREC": "{awayTeam} {ratio}"},
    "sort": ["HREH", "HREC"]
  },
  "HROU_OT": {
    "col": 2,
    "text": {"HROUC": "Tài {ratio}", "HROUH": "Xỉu {ratio}"},
    "sort": ["HROUC", "HROUH"]
  },
  "RE_PS": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU_PS": {
    "col": 2,
    "text": {"ROUC": "Tài {ratio}", "ROUH": "Xỉu {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "RDC_OT": {
    "col": 3,
    "text": {"RDCHN": "Chủ hòa", "RDCHC": "Chủ Khách", "RDCCN": "Hòa khách"},
    "sort": ["RDCHN", "RDCHC", "RDCCN"]
  },
  "REO_OT": {
    "col": 2,
    "text": {"REOO": "Lẻ ", "REOE": "Chẵn"},
    "sort": ["REOO", "REOE"]
  },
  "ARG_OT": {
    "col": 3,
    "text": {"ARGH": "{homeTeam}", "ARGN": "không ghi bàn", "ARGC": "{awayTeam}"},
    "sort": ["ARGH", "ARGC", "ARGN"]
  },
  "BRG_OT": {
    "col": 3,
    "text": {"BRGH": "{homeTeam}", "BRGN": "không ghi bàn", "BRGC": "{awayTeam}"},
    "sort": ["BRGH", "BRGC", "BRGN"]
  },
  "CRG_OT": {
    "col": 3,
    "text": {"CRGH": "{homeTeam}", "CRGN": "không ghi bàn", "CRGC": "{awayTeam}"},
    "sort": ["CRGH", "CRGC", "CRGN"]
  },
  "DRG_OT": {
    "col": 3,
    "text": {"DRGH": "{homeTeam}", "DRGN": "không ghi bàn", "DRGC": "{awayTeam}"},
    "sort": ["DRGH", "DRGC", "DRGN"]
  },
  "ERG_OT": {
    "col": 3,
    "text": {"ERGH": "{homeTeam}", "ERGN": "không ghi bàn", "ERGC": "{awayTeam}"},
    "sort": ["ERGH", "ERGC", "ERGN"]
  },
  "FRG_OT": {
    "col": 3,
    "text": {"FRGH": "{homeTeam}", "FRGN": "không ghi bàn", "FRGC": "{awayTeam}"},
    "sort": ["FRGH", "FRGC", "FRGN"]
  },
  "GRG_OT": {
    "col": 3,
    "text": {"GRGH": "{homeTeam}", "GRGN": "không ghi bàn", "GRGC": "{awayTeam}"},
    "sort": ["GRGH", "GRGC", "GRGN"]
  },
  "HRG_OT": {
    "col": 3,
    "text": {"HRGH": "{homeTeam}", "HRGN": "không ghi bàn", "HRGC": "{awayTeam}"},
    "sort": ["HRGH", "HRGC", "HRGN"]
  },
  "IRG_OT": {
    "col": 3,
    "text": {"IRGH": "{homeTeam}", "IRGN": "không ghi bàn", "IRGC": "{awayTeam}"},
    "sort": ["IRGH", "IRGC", "IRGN"]
  },
  "JRG_OT": {
    "col": 3,
    "text": {"JRGH": "{homeTeam}", "JRGN": "không ghi bàn", "JRGC": "{awayTeam}"},
    "sort": ["JRGH", "JRGC", "JRGN"]
  },
  "RTS_OT": {
    "col": 2,
    "text": {"RTSY": "Phải", "RTSN": "Không"},
    "sort": ["RTSY", "RTSN"]
  },
  "RTEO_OT": {
    "col": 2,
    "text": {"RTEOHO": "Phải", "RTEOHE": "Không", "RTEOCO": "Phải", "RTEOCE": "Không"},
    "sort": ["RTEOHO", "RTEOHE", "RTEOCO", "RTEOCE"]
  },
  'RW3_OT': {
    'col': 3,
    'text': {
      'RW3H': '{homeTeam} {ratio}',
      'RW3N': 'Hòa {ratio}',
      'RW3C': '{awayTeam} {ratio}'
    },
    'sort': ['RW3H', 'RW3N', 'RW3C']
  },
  'GZ_OT': {
    'col': 3,
    'text': {
      'GZ01': '0-1',
      'GZ23': '2-3',
      'GZ45': '4-5',
      'GZ56': '5-6',
      'GZ78': '7-8',
      'GZ4OV': '4+',
      'GZ5OV': '5+',
      'GZ6OV': '6+',
      'GZ7OV': '7+',
      'GZ8OV': '8+',
      'GZ9OV': '9+',
    },
    'sort': [
      'GZ01',
      'GZ23',
      'GZ45',
      'GZ56',
      'GZ78',
      'GZ4OV',
      'GZ5OV',
      'GZ6OV',
      'GZ7OV',
      'GZ8OV',
      'GZ9OV'
    ]
  },
  'RTTG_OT': {
    'col': 2,
    'text': {
      'ROUHC': '{homeTeam} Tài {ratio}',
      'ROUHH': '{homeTeam} Xỉu {ratio}',
      'ROUCC': '{awayTeam} Tài {ratio}',
      'ROUCH': '{awayTeam} Xỉu {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'RTG_OT': {
    'col': 2,
    'text': {
      'RTGH0': '{homeTeam} 0',
      'RTGH1': '{homeTeam} 1',
      'RTGH2': '{homeTeam} 2',
      'RTGH3': '{homeTeam} 3',
      'RTGH4+': '{homeTeam} 4+',
      'RTGC0': '{awayTeam} 0',
      'RTGC1': '{awayTeam} 1',
      'RTGC2': '{awayTeam} 2',
      'RTGC3': '{awayTeam} 3',
      'RTGC4+': '{awayTeam} 4+'
    },
    'sort': [
      'RTGH0',
      'RTGH1',
      'RTGH2',
      'RTGH3',
      'RTGH4+',
      'RTGC0',
      'RTGC1',
      'RTGC2',
      'RTGC3',
      'RTGC4+',
    ]
  },
  'RWN_OT': {
    'col': 2,
    'text': {'RWNH': '{homeTeam}', 'RWNC': '{awayTeam}'},
    'sort': ['RWNH', 'RWNC']
  },
  'DNB': {
    'col': 2,
    'text': {'DNBH': '{homeTeam}', 'DNBA': '{awayTeam}'},
    'sort': ['DNBH', 'DNBA']
  },
  'RM2_PS': {
    'col': 2,
    'text': {'RM2H': '{homeTeam}', 'RM2C': '{awayTeam}'},
    'sort': ['RM2H', 'RM2C']
  },
  'RSA_PS': {
    'col': 2,
    'text': {
      'RSAHY': '{homeTeam} Sút trúng phạt đền',
      'RSAHN': '{homeTeam} Sút trượt phạt đền',
      'RSACY': '{awayTeam} Sút trúng phạt đền',
      'RSACN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSAHY', 'RSAHN', 'RSACY', 'RSACN']
  },
  'RSB_PS': {
    'col': 2,
    'text': {
      'RSBHY': '{homeTeam} Sút trúng phạt đền',
      'RSBHN': '{homeTeam} Sút trượt phạt đền',
      'RSBCY': '{awayTeam} Sút trúng phạt đền',
      'RSBCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSBHY', 'RSBHN', 'RSBCY', 'RSBCN']
  },
  'RSC_PS': {
    'col': 2,
    'text': {
      'RSCHY': '{homeTeam} Sút trúng phạt đền',
      'RSCHN': '{homeTeam} Sút trượt phạt đền',
      'RSCCY': '{awayTeam} Sút trúng phạt đền',
      'RSCCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSCHY', 'RSCHN', 'RSCCY', 'RSCCN']
  },
  'RSD_PS': {
    'col': 2,
    'text': {
      'RSDHY': '{homeTeam} Sút trúng phạt đền',
      'RSDHN': '{homeTeam} Sút trượt phạt đền',
      'RSDCY': '{awayTeam} Sút trúng phạt đền',
      'RSDCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSDHY', 'RSDHN', 'RSDCY', 'RSDCN']
  },
  'RSE_PS': {
    'col': 2,
    'text': {
      'RSEHY': '{homeTeam} Sút trúng phạt đền',
      'RSEHN': '{homeTeam} Sút trượt phạt đền',
      'RSECY': '{awayTeam} Sút trúng phạt đền',
      'RSECN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSEHY', 'RSEHN', 'RSECY', 'RSECN']
  },
  'RSF_PS': {
    'col': 2,
    'text': {
      'RSFHY': '{homeTeam} Sút trúng phạt đền',
      'RSFHN': '{homeTeam} Sút trượt phạt đền',
      'RSFCY': '{awayTeam} Sút trúng phạt đền',
      'RSFCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSFHY', 'RSFHN', 'RSFCY', 'RSFCN']
  },
  'RSG_PS': {
    'col': 2,
    'text': {
      'RSGHY': '{homeTeam} Sút trúng phạt đền',
      'RSGHN': '{homeTeam} Sút trượt phạt đền',
      'RSGCY': '{awayTeam} Sút trúng phạt đền',
      'RSGCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSGHY', 'RSGHN', 'RSGCY', 'RSGCN']
  },
  'RSH_PS': {
    'col': 2,
    'text': {
      'RSHHY': '{homeTeam} Sút trúng phạt đền',
      'RSHHN': '{homeTeam} Sút trượt phạt đền',
      'RSHCY': '{awayTeam} Sút trúng phạt đền',
      'RSHCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSHHY', 'RSHHN', 'RSHCY', 'RSHCN']
  },
  'RSI_PS': {
    'col': 2,
    'text': {
      'RSIHY': '{homeTeam} Sút trúng phạt đền',
      'RSIHN': '{homeTeam} Sút trượt phạt đền',
      'RSICY': '{awayTeam} Sút trúng phạt đền',
      'RSICN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSIHY', 'RSIHN', 'RSICY', 'RSICN']
  },
  'RSJ_PS': {
    'col': 2,
    'text': {
      'RSJHY': '{homeTeam} Sút trúng phạt đền',
      'RSJHN': '{homeTeam} Sút trượt phạt đền',
      'RSJCY': '{awayTeam} Sút trúng phạt đền',
      'RSJCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSJHY', 'RSJHN', 'RSJCY', 'RSJCN']
  },
  'RSK_PS': {
    'col': 2,
    'text': {
      'RSKHY': '{homeTeam} Sút trúng phạt đền',
      'RSKHN': '{homeTeam} Sút trượt phạt đền',
      'RSKCY': '{awayTeam} Sút trúng phạt đền',
      'RSKCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSKHY', 'RSKHN', 'RSKCY', 'RSKCN']
  },
  'RSL_PS': {
    'col': 2,
    'text': {
      'RSLHY': '{homeTeam} Sút trúng phạt đền',
      'RSLHN': '{homeTeam} Sút trượt phạt đền',
      'RSLCY': '{awayTeam} Sút trúng phạt đền',
      'RSLCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSLHY', 'RSLHN', 'RSLCY', 'RSLCN']
  },
  'RSM_PS': {
    'col': 2,
    'text': {
      'RSMHY': '{homeTeam} Sút trúng phạt đền',
      'RSMHN': '{homeTeam} Sút trượt phạt đền',
      'RSMCY': '{awayTeam} Sút trúng phạt đền',
      'RSMCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSMHY', 'RSMHN', 'RSMCY', 'RSMCN']
  },
  'RSN_PS': {
    'col': 2,
    'text': {
      'RSNHY': '{homeTeam} Sút trúng phạt đền',
      'RSNHN': '{homeTeam} Sút trượt phạt đền',
      'RSNCY': '{awayTeam} Sút trúng phạt đền',
      'RSNCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSNHY', 'RSNHN', 'RSNCY', 'RSNCN']
  },
  'RSO_PS': {
    'col': 2,
    'text': {
      'RSOHY': '{homeTeam} Sút trúng phạt đền',
      'RSOHN': '{homeTeam} Sút trượt phạt đền',
      'RSOCY': '{awayTeam} Sút trúng phạt đền',
      'RSOCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSOHY', 'RSOHN', 'RSOCY', 'RSOCN']
  },
  'RSP_PS': {
    'col': 2,
    'text': {
      'RSPHY': '{homeTeam} Sút trúng phạt đền',
      'RSPHN': '{homeTeam} Sút trượt phạt đền',
      'RSPCY': '{awayTeam} Sút trúng phạt đền',
      'RSPCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSPHY', 'RSPHN', 'RSPCY', 'RSPCN']
  },
  'RSQ_PS': {
    'col': 2,
    'text': {
      'RSQHY': '{homeTeam} Sút trúng phạt đền',
      'RSQHN': '{homeTeam} Sút trượt phạt đền',
      'RSQCY': '{awayTeam} Sút trúng phạt đền',
      'RSQCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSQHY', 'RSQHN', 'RSQCY', 'RSQCN']
  },
  'RSR_PS': {
    'col': 2,
    'text': {
      'RSRHY': '{homeTeam} Sút trúng phạt đền',
      'RSRHN': '{homeTeam} Sút trượt phạt đền',
      'RSRCY': '{awayTeam} Sút trúng phạt đền',
      'RSRCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSRHY', 'RSRHN', 'RSRCY', 'RSRCN']
  },
  'RSS_PS': {
    'col': 2,
    'text': {
      'RSSHY': '{homeTeam} Sút trúng phạt đền',
      'RSSHN': '{homeTeam} Sút trượt phạt đền',
      'RSSCY': '{awayTeam} Sút trúng phạt đền',
      'RSSCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSSHY', 'RSSHN', 'RSSCY', 'RSSCN']
  },
  'RST_PS': {
    'col': 2,
    'text': {
      'RSTHY': '{homeTeam} Sút trúng phạt đền',
      'RSTHN': '{homeTeam} Sút trượt phạt đền',
      'RSTCY': '{awayTeam} Sút trúng phạt đền',
      'RSTCN': '{awayTeam} Sút trượt phạt đền'
    },
    'sort': ['RSTHY', 'RSTHN', 'RSTCY', 'RSTCN']
  },
  'RPSD_PS': {
    'col': 2,
    'text': {'RPSDY': 'Phải', 'RPSDN': 'Không'},
    'sort': ['RPSDY', 'RPSDN']
  },
  'RLS_PS': {
    'col': 2,
    'text': {'RLSH': '{homeTeam}', 'RLSC': '{awayTeam}'},
    'sort': ['RLSH', 'RLSC']
  },
  'RTTG_PS': {
    'col': 2,
    'text': {
      'ROUHC': '{homeTeam} Tài {ratio}',
      'ROUHH': '{homeTeam} Xỉu {ratio}',
      'ROUCC': '{awayTeam} Tài {ratio}',
      'ROUCH': '{awayTeam} Xỉu {ratio}'
    },
    'sort': ['ROUHC', 'ROUHH', 'ROUCC', 'ROUCH']
  },
  'TQ': {
    'col': 2,
    'text': {'TQH': '{homeTeam}', 'TQC': '{awayTeam}'},
    'sort': ['TQH', 'TQC']
  },
  "FSG": {
    "col": 3,
    "text": {"FSGH": "{homeTeam}", "FSGA": "{awayTeam}", "FSGN": "không có bàn thắng"},
    "sort": ["FSGH", "FSGA", "FSGN"]
  },

  "HTSBH2": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTSB2HY": "Phải",
      "HTSB2HN": "Không",
    },
    "sort": ["HTSB2HY", "HTSB2HN"]
  },
  "HTSBC2": {
    "col": 2,
    "col188": 1,
    "text": {
      "HTSB2CY": "Phải",
      "HTSB2CN": "Không",
    },
    "sort": ["HTSB2CY", "HTSB2CN"]
  },
  "TSBH": {
    "col": 2,
    "col188": 1,
    "text": {
      "TSBHY": "Phải",
      "TSBHN": "Không",
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "TSBC": {
    "col": 2,
    "col188": 1,
    "text": {
      "TSBCY": "Phải",
      "TSBCN": "Không"
    },
    "sort": ["TSBHY", "TSBHN"]
  },
  "HOU_conner": {
    "col": 2,
    "text": {'HOUC': 'Tài {ratio}', 'HOUH': 'Xỉu {ratio}'},
    "sort": ['HOUC', 'HOUH']
  },
};
