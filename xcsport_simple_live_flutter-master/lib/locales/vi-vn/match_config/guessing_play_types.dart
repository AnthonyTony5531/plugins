const dynamic guessingLaoniaoPlayTypeLang = {
    "FT":[
    {
        "name":"Thắng Hòa Thua",
        "key":"M",
        "sort" : {
          'MH': 'Thắng',
          'MN': 'Hòa',
          'MC': 'Thua',
        }
    },
    {
        "name" : "Thắng Hòa Thua chấp điểm",
        "key" : "W3",
        "sort" : {
          'W3H': 'Thắng',
          'W3N': 'Hòa',
          'W3C': 'Thua',
        }
    },
    {
        "name":"Tỷ số",
        "key":"PD",
        "sort_list" : {  //Sắp xếp danh sách
          'H1C0': '1:0',
          'H2C0': '2:0',
          'H2C1': '2:1',
          'H0C0': '0:0',
          'H1C1': '1:1',
          'H2C2': '2:2',
          'H0C1': '0:1',
          'H0C2': '0:2',
          'H1C2': '1:2',
        },
        "sort" : {
          'H1C0': '1:0',
          'H2C0': '2:0',
          'H2C1': '2:1',
          'H3C0': '3:0',
          'H3C1': '3:1',
          'H3C2': '3:2',
          'H4C0': '4:0',
          'H4C1': '4:1',
          'H4C2': '4:2',
          'H4C3': '4:3',
          'H0C0': '0:0',
          'H1C1': '1:1',
          'H2C2': '2:2',
          'H3C3': '3:3',
          'H4C4': '4:4',
          'OVH': 'Khác',
          'H0C1': '0:1',
          'H0C2': '0:2',
          'H1C2': '1:2',
          'H0C3': '0:3',
          'H1C3': '1:3',
          'H2C3': '2:3',
          'H0C4': '0:4',
          'H1C4': '1:4',
          'H2C4': '2:4',
          'H3C4': '3:4',
        }
    },{
        "name" : "Tổng số bàn thắng",
        "key"  : "T",
        "sort" :{
          'T01': '0~1 Bóng',
          'T23': '2~3 Bóng',
          'T46': '4~6 Bóng',
          'OVER': '7+ Bóng'
        }
    },
    {
        "name" : "Nửa trận đầu/ toàn trận",
        "key" : "F",
        "sort" : {
          'FHH': 'Thắng/Thắng',
          'FHN': 'Thắng/Hòa',
          'FHC': 'Thắng/Thua',
          'FNH': 'Hòa/Thắng',
          'FNN': 'Hòa/Hòa',
          'FNC': 'Hòa/Thua',
          'FCH': 'Thua/Thắng',
          'FCN': 'Thua/Hòa',
          'FCC': 'Thua/Thua',
          // 'FHH': 'Chủ/Chủ',
          // 'FHN': 'Chủ/Hòa',
          // 'FHC': 'Chủ/Khách',
          // 'FNH': 'Hòa/Chủ',
          // 'FNN': 'Hòa/Hòa',
          // 'FNC': 'Hòa/Khách',
          // 'FCH': 'Khách/Chủ',
          // 'FCN': 'Khách/Hòa',
          // 'FCC': 'Khách/Khách',
        }
    },
    ],
    "BK":[
      {
          "name":"Thắng Thua",
          "key":"M",
          "sort" : {
            'MH': 'Thắng',
            'MC': 'Thua',
          }
      },
      {
          "name" : "Điểm tài xỉu",
          "key" : "OU",
          "sort" : {
            'OUC': 'tài {ratio}',
            'OUH': 'xỉu {ratio}',
          }
      },{
        "name":"Thắng Thua chấp điểm",
        "key":"R",
        "sort" : {
          'RH': 'Đội chủ nhà thắng {ratio}',
          'RC': 'Đội khách thắng {ratio}',
        }
      },
    ]
};

