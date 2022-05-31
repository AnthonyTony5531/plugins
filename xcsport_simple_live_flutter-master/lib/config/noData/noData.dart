import 'package:fast_ai/config/config.dart';

var nodata = config.langMap['noData'];

var nodataMap = {
  //所有体育项滚球置空
  'RB': {
    "img": 'assets/images/nodataicon/no-data-rb.png',
    "title": nodata['RB']['title'],
    "content": nodata['RB']['content'],
    "btn": nodata['RB']['btn'],
  },

  //足球今日早盘完场置空
  'FT': {
    "img": 'assets/images/nodataicon/no-data-ft.png',
    "title": nodata['FT']['title'],
    "content": nodata['FT']['content'],
    "btn": nodata['FT']['btn'],
  },

  //网球今日早盘完场置空
  'TN': {
    "img": 'assets/images/nodataicon/no-data-tn.png',
    "title": nodata['TN']['title'],
    "content": nodata['TN']['content'],
    "btn": nodata['TN']['btn'],
  },

  //篮球今日早盘完场置空
  'BK': {
    "img": 'assets/images/nodataicon/no-data-bk.png',
    "title": nodata['BK']['title'],
    "content": nodata['BK']['content'],
    "btn": nodata['BK']['btn'],
  },

  //电竞今日早盘完场置空
  'OP_DJ': {
    "img": 'assets/images/nodataicon/no-data-dj.png',
    "title": nodata['OP_DJ']['title'],
    "content": nodata['OP_DJ']['content'],
    "btn": nodata['OP_DJ']['btn'],
  },

  //棒球今日早盘完场置空
  'BS': {
    "img": 'assets/images/nodataicon/no-data-baseball.png',
    "title": nodata['BS']['title'],
    "content": nodata['BS']['content'],
    "btn": nodata['BS']['btn'],
  },

  //其他球类今日早盘完场置空
  'other': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": nodata['other']['title'],
    "content": nodata['other']['content'],
    "btn": nodata['other']['btn'],
  },

  'matchSport': {
    "img": nodata['matchSport']['img'],
    "title": nodata['matchSport']['title'],
    "content": nodata['matchSport']['content'],
    "btn": nodata['matchSport']['btn'],
  },

  'anchorLive': {
    "img": nodata['anchorLive']['img'],
    "title": nodata['anchorLive']['title'],
    "content": nodata['anchorLive']['content'],
    "btn": nodata['matchSport']['btn'],
  },

  'finishMatch': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": nodata['finishMatch']['title'],
    "content": nodata['finishMatch']['content'],
    "btn": nodata['finishMatch']['btn'],
  },

  // 详情直播为空
  "detailLive": {
    "img": nodata['detailLive']['img'],
    "title": nodata['detailLive']['title'],
  },

  // sdk频道联赛为空
  'channelLeague': {
    "img": nodata['channelLeague']['img'],
    "title": nodata['channelLeague']['title'],
    "content": nodata['channelLeague']['content'],
    "btn": nodata['channelLeague']['btn'],
  },

  //比赛比分
  'gameScore': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": nodata['gameScore']['title'],
    "content": nodata['gameScore']['content'],
    "btn": nodata['gameScore']['btn'],
  },

  //比赛已投
  'gameBet': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": nodata['gameBet']['title'],
    "content": nodata['gameBet']['content'],
    "btn": nodata['gameBet']['btn'],
  },
  //足球比赛已投
    'FT_GameBet': {
      "img": 'assets/images/nodataicon/no-data-ft.png',
      "title": nodata['FT_GameBet']['title'],
      "content": nodata['FT_GameBet']['content'],
      "btn": nodata['FT_GameBet']['btn'],
    },

  //钱包
  'funding': {
    "img": 'assets/images/nodataicon/no-data-wallet.png',
    "title": nodata['funding']['title'],
    "content": nodata['funding']['content'],
  },

  //钱包
  'promotions': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": nodata['promotions']['title'],
    "content": nodata['promotions']['content'],
  },

    //网球比赛已投
    'TN_GameBet': {
      "img": 'assets/images/nodataicon/no-data-tn.png',
      "title": nodata['TN_GameBet']['title'],
      "content": nodata['TN_GameBet']['content'],
      "btn": nodata['TN_GameBet']['btn'],
    },

    //篮球比赛已投
    'BK_GameBet': {
      "img": 'assets/images/nodataicon/no-data-bk.png',
      "title": nodata['BK_GameBet']['title'],
      "content": nodata['BK_GameBet']['content'],
      "btn": nodata['BK_GameBet']['btn'],
    },

    //电竞比赛已投
    'OP_DJ_GameBet': {
      "img": 'assets/images/nodataicon/no-data-dj.png',
      "title": nodata['OP_DJ_GameBet']['title'],
      "content": nodata['OP_DJ_GameBet']['content'],
      "btn": nodata['OP_DJ_GameBet']['btn'],
    },

    //棒球比赛已投
    'BS_GameBet': {
      "img": 'assets/images/nodataicon/no-data-baseball.png',
      "title": nodata['BS_GameBet']['title'],
      "content": nodata['BS_GameBet']['content'],
      "btn": nodata['BS_GameBet']['btn'],
    },

    //其他球类比赛已投
    'other_GameBet': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['other_GameBet']['title'],
      "content": nodata['other_GameBet']['content'],
      "btn": nodata['other_GameBet']['btn'],
    },

    //投注单
    'betShip': {
      "img": 'assets/images/nodataicon/no-data-betship.png',
      "title": nodata['betShip']['title'],
      "content": nodata['betShip']['content'],
      "btn": nodata['betShip']['btn'],
    },

    //投注历史
    'betHistory': {
      "img": 'assets/images/nodataicon/no-data-bethistory.png',
      "title": nodata['betHistory']['title'],
      "content": nodata['betHistory']['content'],
      "btn": nodata['betHistory']['btn'],
    },

    //投注历史
    'earlySettleBetHistory': {
      "img": 'assets/images/nodataicon/no-data-bethistory.png',
      "title": nodata['earlySettleBetHistory']['title'],
      "content": nodata['earlySettleBetHistory']['content'],
      "btn": nodata['earlySettleBetHistory']['btn'],
    },

  // 爆单-投注历史
  'shareBetOrderHistory': {
    "img": 'assets/images/nodataicon/no-data-bethistory.png',
    "title": nodata['shareBetOrderHistory']['title'],
    "content": nodata['shareBetOrderHistory']['content'],
    "btn": nodata['shareBetOrderHistory']['btn'],
  },

    //分享投注历史
    'shareBetHistory': {
      "img": 'assets/images/nodataicon/no-data-bethistory.png',
      "title": nodata['shareBetHistory']['title'],
      "content": nodata['shareBetHistory']['content'],
      "btn": nodata['shareBetHistory']['btn'],
    },

    //个人分享的投注历史
    'playerShareBetHistory': {
      "img": 'assets/images/nodataicon/no-data-bethistory.png',
      "title": nodata['playerShareBetHistory']['title'],
      "content": nodata['playerShareBetHistory']['content'],
      "btn": nodata['playerShareBetHistory']['btn'],
    },

    //钱包
    'wallet': {
      "img": 'assets/images/nodataicon/no-data-wallet.png',
      "title": nodata['wallet']['title'],
      "content": nodata['wallet']['content'],
    },

    //消息
    'massage': {
      "img": 'assets/images/nodataicon/no-data-massage.png',
      "title": nodata['massage']['title'],
      "content": nodata['massage']['content'],
      "btn": nodata['massage']['btn'],
    },

    //没有网络
    'net': {
      "img": 'assets/images/nodataicon/no-data-net.png',
      "title": nodata['net']['title'],
      "content": nodata['net']['content'],
      "btn": nodata['net']['btn'],
    },
    

    // 版本说明
    'version': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['version']['title'],
      "content": nodata['version']['content'],
    },
    //
    'virual': {
      "img": 'assets/images/nodataicon/no-data-net.png',
      "title": nodata['virual']['title'],
      "content": nodata['virual']['content'],
      "btn": nodata['virual']['btn'],
    },

  'dynamic_empty': {
    "img": 'assets/images/nodataicon/no-data-massage.png',
    "title": nodata['dynamic_empty']['title'],
    "content": nodata['dynamic_empty']['content'],
    "btn": nodata['dynamic_empty']['btn'],
  },


    //收藏
    'favorites': {
      "img": 'assets/images/nodataicon/no-data-favorites.png',
      "title": nodata['favorites']['title'],
      "content": nodata['favorites']['content'],
    },
  'favorites_vlog': {
    "img": 'assets/images/nodataicon/no-data-favorites.png',
    "title": nodata['favorites_vlog']['title'],
    "content": nodata['favorites_vlog']['content'],
  },
    'favorites_team': {
      "img": 'assets/images/nodataicon/no-data-favorites.png',
      "title": nodata['favorites_team']['title'],
      "content": nodata['favorites_team']['content'],
    },

    'favorites_league': {
      "img": 'assets/images/nodataicon/no-data-favorites.png',
      "title": nodata['favorites_league']['title'],
      "content": nodata['favorites_league']['content'],
    },

    'anchor_dynamic': {
      "img": 'assets/images/nodataicon/no-data-interest.png',
      "title": nodata['anchor_dynamic']['title'],
      "content": nodata['anchor_dynamic']['content'],
    },

    //关注
    'interest': {
      "img": 'assets/images/nodataicon/no-data-interest.png',
      "title": nodata['interest']['title'],
      "content": nodata['interest']['content'],
    },

    //粉丝
    'fans': {
      "img": 'assets/images/nodataicon/no-data-interest.png',
      "title": nodata['fans']['title'],
      "content": nodata['fans']['content'],
    },

    //主播
    'anchor': {
      "img": 'assets/images/nodataicon/no-data-interest.png',
      "title": nodata['anchor']['title'],
      "content": nodata['anchor']['content'],
    },

    //无法查看他人主页
    'homePage': {
      "img": 'assets/images/nodataicon/no-data-homepage.png',
      "title": nodata['homePage']['title'],
      "content": nodata['homePage']['content'],
    },

    //比赛详情-拉盘
    'closeBet': {
      "img": 'assets/images/nodataicon/no-data-betship.png',
      "title": nodata['closeBet']['title'],
      "content": nodata['closeBet']['content'],
    },
    //比赛详情横屏-拉盘
    'horizontalCloseBet': {
      "img": 'assets/images/nodataicon/no-data-closeBet.png',
      "title": nodata['horizontalCloseBet']['title'],
      "content": nodata['horizontalCloseBet']['content'],
    },
    //比赛详情-跟投
    'detail_follow_bet': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['detail_follow_bet']['title'],
      "content": nodata['detail_follow_bet']['content'],
    },
    //跟投列表
    'follow_bet_list': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['follow_bet_list']['title'],
      "content": nodata['follow_bet_list']['content'],
    },
    //联赛积分空数据
    'noLeaugeScore': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['noLeaugeScore']['title'],
      "content": nodata['noLeaugeScore']['content'],
      "btn": nodata['noLeaugeScore']['btn'],
    },
    //冠军玩法空数据
    'noChampionPlay': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['noChampionPlay']['title'],
      "content": nodata['noChampionPlay']['content'],
      "btn": nodata['noChampionPlay']['btn'],
    },
    //联赛比赛空数据
    'noLeaugeGame': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['noLeaugeGame']['title'],
      "content": nodata['noLeaugeGame']['content'],
      "btn": nodata['noLeaugeGame']['btn'],
    },
    //没有赛程数据
    'noScheduleMatch': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['noScheduleMatch']['title'],
      "content": nodata['noScheduleMatch']['content'],
      "btn": nodata['noScheduleMatch']['btn'],
    },
    //没有赛果数据
    'noFinishMatch': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['noFinishMatch']['title'],
      "content": nodata['noFinishMatch']['content'],
      "btn": nodata['noFinishMatch']['btn'],
    },
    //搜索
    'search': {
      "img": 'assets/images/nodataicon/no-data-ft.png',
      "title": nodata['search']['title'],
      "content": nodata['search']['content'],
      "btn": nodata['search']['btn'],
    },
    //热门
    'hot': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['hot']['title'],
      "content": nodata['hot']['content'],
      "btn": nodata['hot']['btn'],
    },
    //跟投
    'followBet': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['followBet']['title'],
      "content": nodata['followBet']['content'],
      "btn": nodata['followBet']['btn'],
    },
    //新闻
    'news': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['news']['title'],
      "content": nodata['news']['content'],
      "btn": nodata['news']['btn'],
    },

    //这里暂时没有赛果
    'result': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['result']['title'],
      "content": nodata['result']['content'],
      "btn": nodata['result']['btn'],
    },

    'today': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['today']['title'],
      "content": nodata['today']['content'],
      "btn": nodata['today']['btn'],
    },

    'early': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['early']['title'],
      "content": nodata['early']['content'],
      "btn": nodata['early']['btn'],
    },

    'league': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['league']['title'],
      "content": nodata['league']['content'],
      "btn": nodata['league']['btn'],
    },

    //赛季
    'season': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['season']['title'],
      "content": nodata['season']['content'],
    },
    //关闭比赛
    'closeMatch': {
      "img": 'assets/images/nodataicon/no-data-closegame0.png',
      "title": nodata['closeMatch']['title'],
      //"content": nodata['closeMatch']['content'],
      "btn": nodata['closeMatch']['btn'],
    },

    //虚拟比赛结束投注
    'virtual_closeMatch': {
      "img": 'assets/images/nodataicon/no-data-closegame0.png',
      "title": nodata['virtual_closeMatch']['title'],
      //"content": nodata['virtual_closeMatch']['content'],
      "btn": nodata['virtual_closeMatch']['btn'],
    },

  'match_halfTime': {
    "img": 'assets/images/nodataicon/no-data-closegame0.png',
    "title": nodata['match_halfTime']['title'],
    //"content": nodata['virtual_closeMatch']['content'],
    "btn": nodata['match_halfTime']['btn'],
  },



    //关闭比赛
    'horizontalCloseMatch': {
      "img": 'assets/images/nodataicon/no-data-closeGame.png',
      "title": nodata['horizontalCloseMatch']['title'],
      "content": nodata['horizontalCloseMatch']['content'],
    },
    'FT_to_RB_Match': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['FT_to_RB_Match']['title'],
      "btn": nodata['FT_to_RB_Match']['btn'],
    },

    //完场
    'finish_video': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['finish_video']['title'],
      "content": nodata['finish_video']['content'],
    },

    'global_error': {
      "img": 'assets/images/nodataicon/no-data-homepage.png',
      "title": nodata['global_error']['title'],
      "btn": nodata['global_error']['btn'],
    },

    // 商户禁用或App禁用
    'merchant_forbid': {
      "img": 'assets/images/nodataicon/no-data-homepage.png',
      "title": nodata['merchant_forbid']['title'],
      "content": nodata['merchant_forbid']['content'],
      // "btn": '返回首页'
    },
    // 请求数据出错
    'request_error': {
      "img": 'assets/images/nodataicon/no-data-ft.png',
      "title": nodata['request_error']['title'],
      "content": nodata['request_error']['content'],
      "btn": nodata['request_error']['btn'],
    },

    //收米列表空
    'shoumi': {
      "img": 'assets/images/nodataicon/no-data-ft.png',
      "title": nodata['shoumi']['title'],
      "content": nodata['shoumi']['content'],
    },
    //星座列表空
    'xinzhou': {
      "img": ' ',
      "title": nodata['xinzhou']['title'],
      "content": nodata['xinzhou']['content'],
      "btn": nodata['xinzhou']['btn'],
    },

     //数据为空
    'empty_data': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['empty_data']['title'],
      "content": nodata['empty_data']['content'],
      "btn": nodata['empty_data']['btn'],
    },

    //大咖动态列表空
    'casting_dynamic_empty': {
      "img": 'assets/images/nodataicon/no-data-interest.png',
      "title": nodata['casting_dynamic_empty']['title'],
      "content": nodata['casting_dynamic_empty']['content'],
      "btn": nodata['casting_dynamic_empty']['btn'],
    },

    //关注大咖为空
    'attentionStarEmpty': {
      "img": 'assets/images/nodataicon/no-data-massage.png',
      "title": nodata['attentionStarEmpty']['title'],
      "content": nodata['attentionStarEmpty']['content'],
      "btn": nodata['attentionStarEmpty']['btn'],
    },

    //普通用户分享注单列表空
    'bet_share_empty': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['bet_share_empty']['title'],
      "content": nodata['bet_share_empty']['content'],
      "btn": nodata['bet_share_empty']['btn'],
    },

    //主播分享注单列表空
    'anchor_bet_share_empty': {
      "img": 'assets/images/nodataicon/no-data-bethistory.png',
      "title": nodata['anchor_bet_share_empty']['title'],
      "content": nodata['anchor_bet_share_empty']['content'],
      "btn": nodata['anchor_bet_share_empty']['btn'],
    },

    //主播用户贡献排行
    'anchor_contribution_empty': {
      "img": 'assets/images/nodataicon/no-data-other.png',
      "title": nodata['anchor_contribution_empty']['title'],
      "content": nodata['anchor_contribution_empty']['content'],
      "btn": nodata['anchor_contribution_empty']['btn'],
    },

    //收藏比赛
    'collectGame': {
      "img": 'assets/images/nodataicon/no-data-rb.png',
      "title": nodata['collectGame']['title'],
      "content": nodata['collectGame']['content'],
      "btn": nodata['collectGame']['btn'],
    },

    //已投比赛
    'betGame': {
      "img": 'assets/images/nodataicon/no-data-rb.png',
      "title": nodata['betGame']['title'],
      "content": nodata['betGame']['content'],
      "btn": nodata['betGame']['btn'],
    },

    //跟投列表
    'wallet_list': {
      "img": 'assets/images/nodataicon/no-data-wallet.png',
      "title": nodata['wallet_list']['title'],
      "content": nodata['wallet_list']['content'],
      "btn": nodata['wallet_list']['btn'],
    },

    // 排行榜
    'rank_list':{
      "img": 'assets/images/nodataicon/no-data-rb.png',
      "title":nodata['rank_list']['title'],
      "content":nodata['rank_list']['content'],
      "btn": nodata['rank_list']['btn'],
    },

};
