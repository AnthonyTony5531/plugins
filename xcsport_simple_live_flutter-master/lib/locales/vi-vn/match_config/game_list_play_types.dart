
//Danh sách trò chơi phiên bản chuyên nghiệp 
const dynamic laoniaoPlayTypeLang = {
  "FT": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "Góc",
      "key": ["rouConner", "ouConner"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "1H 1x2",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "1H HCP",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ]
    },
    {
      "name": "1H TOT",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUC', 'HROUH'],
        ['HOUC', 'HOUH']
      ],
    },
  ],
  "BK": [
    //Bóng rổ
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    // {
    //   "name": "Chẵn lẻ",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    //Ra đa
    // {
    //   "name": "Người chiến thắng",
    //   "key": ["RM0", "M0"],
    //   "sort": [
    //     ['RM0H', 'RM0C'],
    //     ['M0H', 'M0C']
    //   ],
    // },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name": "Thắng hiệp 1",
    //   "key": ["RM1", "M1"],
    //   "sort": [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },

    // {
    //   "name": "Chấp bóng hiệp 1",
    //   "key": ["RE1", "R1"],
    //   "sort": [
    //     ['RE1H', 'RE1C'],
    //     ['R1H', 'R1C']
    //   ],
    // },

    // {
    //   "name": "Tổng điểm hiệp 1",
    //   "key": ["ROU1", "OU1"],
    //   "sort": [
    //     ['ROU1H', 'ROU1C'],
    //     ['OU1H', 'OU1C']
    //   ],
    // },
  ],
  "TN": [
    //Quần vợt
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "Chẵn lẻ",
//      "key": ["EO", "EO"],
//      "sort": [
//        ['EOO', 'EOE'],
//        ['EOO', 'EOE']
//      ],
//    }
  ],
  "BS": [
    //Bóng chày
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "Thắng hiệp 1",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC'],
//        ['HMH', 'HMC']
//      ],
//    },
//    {
//      "name": "Chấp bóng hiệp 1",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "Tổng điểm hiệp 1",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    }
  ],
  "OP_DJ": [
    //Thể thao điện tử
    {
      //Thể thao điện tử. Trong thể thao điện tử Không có chấp bóng và cần được đổi thành chấp điểm
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "BK_AFT": [
    //Bóng bầu dục Mỹ
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "OP_RU": [
    //Bóng bầu dục liên hiệp Anh
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "Hiệp 1 Toàn thắng",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "Hiệp 1 chấp điểm",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "Tỷ số của hiệp một",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    },
  ],
  "OP_IH": [
    //Khúc côn cầu trên băng
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "OP_HB": [
    //Bóng ném
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "Hiệp 1 toàn thắng",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "Chấp bóng hiệp 1",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "Hiệp 1 Tài xỉu",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    },
  ],
  "OP": [
    //Khác
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Võ thuật tổng hợp
  "OP_MMA": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "Hoàn thành tất cả các vòng đấu trong trận Quyền Anh",
      "key": ["RWFD", "WFD"],
      "sort": [
        ['RWFDH', 'RWFDC'],
        ['WFDH', 'WFDC']
      ],
    }
  ],

  //Quyền Anh
  "OP_BO": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "Hoàn thành tất cả các vòng đấu trong trận Quyền Anh",
      "key": ["RWFD", "WFD"],
      "sort": [
        ['RWFDH', 'RWFDC'],
        ['WFDH', 'WFDC']
      ],
    }
  ],

  //Bóng bàn
  "OP_TN": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Phi tiêu
  "OP_DR": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "Tổng số ván thi đấu",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "Tổng số ván thi đấu",
      "key": ["RLOU", "LOU"],
      "sort": [
        ['RLOUH', 'RLOUC'],
        ['LOUH', 'LOUC']
      ],
    },
    {
      "name": "Chẵn lẻ số ván",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
  ],

  //Bóng chuyền bãi biển
  "OP_BV": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Bóng chày
  "OP_CK": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "Hiệp đầu tài xỉu",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "Hiệp một chẵn lẻ",
      "key": ["RSEO", "SEO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "Có hay không vòng siêu cấp",
      "key": ["RWSO", "WSO"],
      "sort": [
        ['RWSOH', 'RWSOC'],
        ['WSOH', 'WSOC']
      ],
    },
  ],

  //Bóng chuyền
  "OP_VB": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Bóng sàn
  "OP_FB": [
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Cầu lông
  "OP_BM": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //Bi da
  "OP_SN": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "Chẵn lẻ số séc đấu",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    }
  ],

  //Khúc côn cầu trên băng
  "OP_FH": [
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "1H 1x2",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "1H HCP",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ],
    },
    {
      "name": "1H TOT",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUH', 'HROUC'],
        ['HOUH', 'HOUC']
      ],
    }
  ],
  //Golf
  "OP_GF": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //Xe đạp
  "OP_BA": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行车
  "OP_CY": [
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  //Đua xe
  "OP_AR": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  // tài chánh
  "OP_JR": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  // 室内足球
  "OP_FU": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

};


//列表小白玩法展示
const dynamic xiaobaiPlayTypeLang = {
  "FT": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name":"Chấp bóng cả trận",
    //   "key":["RE","R"],
    //   "sort" : [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name":"Tài xỉu cả trận",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "BK": [
    // {
    //   "name":"Tổng điểm",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name":"Chẵn lẻ",
    //   "key":["REO","EO"],
    //   "sort" : [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },

    //Ra đa
    {
      "name": "Đội thắng",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name":"Tổng điểm",
    //   "key":["ROU0","OU0"],
    //   "sort" : [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name":"Thắng hiệp 1",
    //   "key":["RM1","M1"],
    //   "sort" : [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },
  ],
  "TN": [
    {
      //Quần vợt
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Chẵn lẻ số ván",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "Đội thắng",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },
    
    // {
    //   "name": "Chấp điểm hiệp 1",
    //   "key": ["RE1", "R1"],
    //   "sort": [
    //     ['RE1H', 'RE1C'],
    //     ['R1H', 'R1C']
    //   ],
    // },
  ],
  "BS": [
    {
      //Bóng chày
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tài xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "OP_DJ": [
    {
      //Thể thao điện tử
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng số ván",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "BK_AFT": [
    {
      //Bóng bầu dục Mỹ
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Chẵn lẻ",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP_RU": [
    //Bóng bầu dục liên hiệp Anh
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name": "Tài xỉu cả trận",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "OP_IH": [
    //Khúc côn cầu trên băng
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    // {
    //   "name": "Chẵn lẻ cả trận",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP_HB": [
    //Bóng ném
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        [
          'RMH',
          'RMN',
          'RMC',
        ],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name": "Toàn trận chẵn lẻ",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],

  //Võ thuật tổng hợp
  "OP_MMA": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng số vòng đấu Tài Xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Hoàn thành tất cả các vòng đấu trong trận Quyền Anh",
    //   "key": ["RWFD", "WFD"],
    //   "sort": [
    //     ['RWFDH', 'RWFDC'],
    //     ['WFDH', 'WFDC']
    //   ],
    // }
  ],

  //Quyền Anh
  "OP_BO": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng số vòng đấu Tài Xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Hoàn thành tất cả các vòng đấu trong trận Quyền Anh",
    //   "key": ["RWFD", "WFD"],
    //   "sort": [
    //     ['RWFDH', 'RWFDC'],
    //     ['WFDH', 'WFDC']
    //   ],
    // }
  ],

  //Bóng bàn
  "OP_TN": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC' 'OUH']
    //   ],
    // },
    // {
    //   "name": "Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //Phi tiêu
  "OP_DR": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Chấp điểm theo séc đấu",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "Tổng số séc đấu",
    //   "key": ["RSOU", "SOU"],
    //   "sort": [
    //     ['RSOUH', 'RSOUC'],
    //     ['SOUH', 'SOUC']
    //   ],
    // },
  ],

  //Bóng chuyền bãi biển
  "OP_BV": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //Bóng chày
  "OP_CK": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Vòng đấu đầu tiên Tài Xỉu",
    //   "key": ["RSOU", "SOU"],
    //   "sort": [
    //     ['RSOUC', 'RSOUH'],
    //     ['SOUC', 'SOUH']
    //   ],
    // },
  ],

  //Bóng chuyền
  "OP_VB": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //Bóng sàn
  "OP_FB": [
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tài xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
  ],

  //Cầu lông
  "OP_BM": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng điểm",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //Bi da
  "OP_SN": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Tổng số ván Tài xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Tổng số ván Chẵn Lẻ",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    // {
    //   "name": "Tổng số ván Chấp điểm",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //Khúc côn cầu trên băng
  "OP_FH": [
    {
      //Khác
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "Toàn trận Tài xỉu",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "Chấp điểm Toàn trận",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
  ],
  //Golf
  "OP_GF": [
//    {
//      "name": "Chấp bóng cả trận",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "Tài xỉu cả trận",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  //Xe đạp
  "OP_BA": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行车
  "OP_CY": [
//    {
//      "name": "让分",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "大小",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "Đội thắng",
      "key": ["M"],
      "sort": [

        ['MH', 'MC']
      ],
    },
  ],
  //Đua xe
  "OP_AR": [
//    {
//      "name": "Chấp điểm",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "Tổng điểm",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  // tài chánh
  "OP_JR": [
    {
      "name": "Đội thắng",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
//    {
//      "name": "HCP",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "TOT",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
  ],
  // 室内足球
  "OP_FU": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
//    {
//      "name": "HCP",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "TOT",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
  ],

};
