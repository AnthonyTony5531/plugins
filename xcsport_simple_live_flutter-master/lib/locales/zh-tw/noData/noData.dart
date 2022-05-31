var nodataMap = {
  //所有體育項滾球置空
  'RB': {
    "title": '這個時候暫時沒有滾球比賽！',
    "content": '滾球是指正在進行的比賽，部分規則稍稍有些區別哦...',
    "btn": '刷新',
  },

  //足球今日早盤完場置空
  'FT': {
    "title": '這裏暫時沒有足球比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //網球今日早盤完場置空
  'TN': {
    "title": '這裏暫時沒有網球比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //籃球今日早盤完場置空
  'BK': {
    "title": '這裏暫時沒有籃球比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  'channelLeague': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": '這裏暫時沒有聯賽！',
    "content": '到處溜溜再回來看看吧~',
    "btn": '去關註',
  },





  //電競今日早盤完場置空
  'OP_DJ': {
    "title": '這裏暫時沒有電競比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  'dynamic_empty': {
    "title": '你還沒有收到任何動態！',
    "content": '關註比賽大咖後，他們的動態會留在這裏噢...',
    "btn": '去關註', //點擊刷新
  },

  //棒球今日早盤完場置空
  'BS': {
    "title": '這裏暫時沒有棒球比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //其他球類今日早盤完場置空
  'other': {
    "title": '這裏暫時沒有比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  // 所有體育項比賽為空
  'matchSport': {
    "title": '這裏暫時沒有比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '回到首頁', //跳轉到首頁
  },

  // 主播直播為空
  "anchorLive": {
    "img": 'assets/images/nodataicon/no-data-rb.png',
    "title": "主播馬上梳妝完畢，正在路上！",
    "content": "去別去看看吧，記得回來哦~",
    "btn": "回到首頁"
  },

  // 詳情直播為空
  "detailLive": {
    "img": 'assets/images/nodataicon/icon_empty_detail_video.png',
    "title": "暫時沒有比賽直播",
  },

  // 比賽比分
  "gameScore": {
    "title": "這裏暫無比分數據！",
    "content": "看看後面的日子有什麼新鮮賽事~",
    "btn": "回到首頁"
  },


  //比賽已投
  'gameBet': {
    "title": '暫未投註過相關比賽！',
    "content": '去看看熱門投註項，你也可以做大咖~',
    "btn": '回到首頁', //跳轉到首頁
  },

  //足球比賽已投
  'FT_GameBet': {
    "title": '暫未投註過足球賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //網球比賽已投
  'TN_GameBet': {
    "title": '暫未投註過網球賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //籃球比賽已投
  'BK_GameBet': {
    "title": '暫未投註過籃球賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //電競比賽已投
  'OP_DJ_GameBet': {
    "title": '暫未投註過電競賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //棒球比賽已投
  'BS_GameBet': {
    "title": '暫未投註過棒球賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //其他球類比賽已投
  'other_GameBet': {
    "title": '暫未投註過賽事！',
    "content": '去投一註試試看...',
    "btn": '回到首頁', //跳轉到首頁
  },

  //投註單
  'betShip': {
    "title": '沒有可以投註的選項！',
    "content": '給自己定一個小目標，先贏他一個億...',
    "btn": '去投註', //關閉投註單
  },

  //投註歷史
  'betHistory': {
    "title": '暫無任何投註記錄！',
    "content": '夢想還是要有的，萬一實現了呢...',
    "btn": '去投註', //關閉投註單
  },

  //可提前結算的投註歷史
  'earlySettleBetHistory': {
    "title": '暫無可以提前結算的註單！',
    "content": '刷新一下試試...',
    "btn": '去投註', //關閉投註單
  },

  // 爆单-投注历史
  'shareBetOrderHistory': {
    "title": '投注额大于100才可以爆料哦~', ////
    "content": '多去投注吧，让我们彼此了解一下...',
    "btn": '去竞猜',
  },

  //分享競猜歷史
  'shareBetHistory': {
    "title": '暫未找到符合條件的註單', ////
    "content": '多去投註吧，讓我們彼此了解一下...',
    "btn": '去競猜',
  },

  //個人分享的競猜歷史
  'playerShareBetHistory': {
    "title": '這裏暫時沒有曬單！', ////
    "content": '自信點！分享你的第一個註單吧...',
    "btn": '去競猜',
  },

  // 其他人分享的競猜歷史
  'otherPlayerShareBetHistory': {
    "title": '這裏暫時沒有曬單！', ////
    "content": '去別處看看吧，或許有意外的驚喜...',
    "btn": '去競猜',
  },

  //錢包
  'wallet': {
    "title": '暫無任何錢包記錄！',
    "content": '那些大風大雨還有上班的人，絕對是因為窮...'
  },

  //消息
  'massage': {
    "title": '你還沒有收到任何消息！',
    "content": '關註比賽大咖後，他們的動態會留在這裏噢...',
    "btn": '去關註', //點擊跳轉到添加關註大咖
  },

  //沒有網絡
  'net': {
    "title": '網絡不給力，點擊屏幕重試!',
    "content": '唯有愛和WIFI不可辜負...',
    "btn": '刷新', //點擊刷新
  },

  'funding': {
    "title": '暫無相關資金明細!',
    "content": '暫無相關資金明細',
    "btn": '刷新', //點擊刷新
  },

  'promotions': {
    "title": '暫無相關優惠活動!',
    "content": '可能是隱藏的活動，快去找出來吧...',
    "btn": '刷新', //點擊刷新
  },


  // 版本說明
  'version': {
    "title": '這裏空空如也!',
    "btn": '回到首頁', //跳轉到首頁
  },


  //
  'virual': {
    "title": '暫無往期賽果!',
    "content": '此處沒有往期賽果了...',
    "btn": '刷新', //點擊刷新
  },


  //收藏
  'favorites': {
    "title": '暫未收藏任何比賽！',
    "content": '點擊比賽的小星星，以後就可以在這裏找到...',
  },

  //收藏
  'favorites_vlog': {
    "title": '你還沒有收藏小視頻哦～！',
    "content": '球場上沒有讓你心動的身影嗎？',
  },

  'favorites_league': {
    "title": '您還未收藏任何聯賽！',
    "content": '收藏之後能實時收到聯賽的相關信息哦',
  },

  'favorites_team': {
    "title": '您還未關註任何球隊！',
    "content": '總有一個隊伍會得到您的賞識~',
  },

  'anchor_dynamic': {
    "title": '主播暫未發布動態~',
    "content": '',
  },

  //關註
  'interest': {
    "title": '暫未關註任何大咖！',
    "content": '聽說，關註大咖的人運氣都不會差...',
    // "btn": '去關註', //點擊跳轉到添加關註大咖
  },

  //粉絲
  'fans': {
    "title": '暫未粉絲關註你哦~ ',
    "content": '讓自己元氣滿滿，會吸引別人的目光...',
  },

  //主播
  'anchor': {
    "title": '暫未關註任何主播！',
    "content": '聽說，關註主播的人運氣都不會差...',
  },

  //無法查看他人主頁
  'homePage': {
    "title": '這家主人設置了隱私，無法查看！',
    "content": '註定要去的地方，不管多晚都有光...',
  },

  //比賽詳情-拉盤
  'closeBet': {
    "title": '盤口已關閉！',
    "content": '本場賽況發生變化, 盤口即將推出...',
    // "btn": '刷新盤口', //跳轉到首頁
  },
  //比賽詳情橫屏-拉盤
  'horizontalCloseBet': {
    "title": '盤口已關閉！',
    "content": '比賽狀態發生變化',
    // "btn": '刷新盤口', //跳轉到首頁
  },
  //比賽詳情-跟投
  'detail_follow_bet': {
    "title": '暫時沒有可以跟投的大咖！',
    "content": '等會再來，大咖正在趕來的路上...',
  },
  //跟投列表
  'follow_bet_list': {
    "title": '暫時沒有大咖跟投項',
    "content": '您可以做自己的大咖，加油！',
  },
  //聯賽積分空數據
  'noLeaugeScore': {
    "title": '積分榜暫時沒有數據！',
    "content": '關註聯賽，實時收到聯賽的最新消息~',
    "btn": '刷新', //跳轉到首頁
  },
  //冠軍玩法空數據
  'noChampionPlay': {
    "title": '這裏暫時沒有冠軍玩法！',
    "content": '暫無冠軍玩法，去看看別的比賽吧...',
    "btn": '刷新', //跳轉到首頁
  },
  //聯賽詳情-比賽空數據
  'noLeaugeGame': {
    "title": '最近都沒有該聯賽的比賽！',
    "content": '其他聯賽也有好看的比賽，去看看吧~',
    "btn": '刷新', //跳轉到首頁
  },
  //沒有賽程數據
  'noScheduleMatch': {
    "title": '最近都沒有該聯賽的比賽！',
    "content": '其他聯賽也有好看的比賽，去看看吧~',
    "btn": '刷新', //跳轉到首頁
  },
  //沒有賽果數據
  'noFinishMatch': {
    "title": '這裏暫時沒有賽果！',
    "content": '暫無賽果，點擊刷新看看...',
    "btn": '刷新', //跳轉到首頁
  },
  //搜索
  'search': {
    "title": '沒有找到您要搜索的結果',
    "content": '換個搜索詞試試，或許會遇到真愛呢...',
    "btn": '',
  },
  //熱門
  'hot': {
    "title": '這裏暫時沒有熱門投註項！',
    "content": '暫無熱門投註項，去看看別的吧...',
    "btn": '返回',
  },
  //跟投
  'followBet': {
    "title": '暫時沒有可以跟投的大咖！',
    "content": '等會再來，大咖正在趕來的路上...',
    "btn": '回到首頁',
  },
  //新聞
  'news': {
    "title": '這裏暫時沒有新聞！',
    "content": '相信你一定能搞出點大事情...',
    "btn": '返回首頁',
  },

  //這裏暫時沒有賽果
  'result': {
    "title": '這裏暫時沒有賽果！',
    "content": '去看看別的賽果吧...',
    "btn": '返回首頁',
  },

  'match_result': {
    "title": '這裏暫時沒有相關的賽果！',
    "content": '有一種闊能，外星人羅納爾多擄走了我們的比賽...',
    "btn": '返回首頁',
  },

  'today':{
    "title": '這裏暫時沒有比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '刷新', //跳轉到首頁
  },

  'early':{
    "title": '這裏暫時沒有比賽！',
    "content": '賽場打掃中，去看看別的比賽吧...',
    "btn": '刷新', //跳轉到首頁
  },

  'league':{
    "title": '這裏暫時沒有聯賽！',
    "content": '賽場打掃中，去看看別的吧...',
    "btn": '刷新', //跳轉到首頁
  },

  //賽季
  'season': {
    "title": '暫時沒有人上榜！!',
    "content": '難道您不想趁此機會一飛沖天嗎',
  },
  //關閉比賽
  'closeMatch': {
    "title": '趕巧了老鐵, 本場比賽已結束！',
    // "content": '偷偷告訴你其實比賽已經打完',
    "btn": '返回',
  },

  //比賽結束
  'finishMatch': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": '本場比賽已結束，賽果正在趕來的路上',
    "content": '',
    "btn": '回到首頁',
  },

  //虛擬比賽結束投註
  'virtual_closeMatch': {
    "title": '趕巧了老鐵, 本場比賽已停止投註！',
    // "content": '偷偷告訴你其實比賽已經打完',
    "btn": '返回',
  },

  'match_halfTime': {
    "title": '中場休息，稍後回來!',
    // "content": '偷偷告訴你其實比賽已經打完',
    "btn": '返回',
  },



  //關閉比賽
  'horizontalCloseMatch': {
    "title": '比賽已拉盤，無法繼續投註！',
    "content": '偷偷告訴你其實比賽已經打完，視頻只是會延時幾分鐘...',
    //"btn": '返回',
  },
  'FT_to_RB_Match': {
    "title": '趕巧了老鐵, 本場比賽正在轉為滾球盤，請稍後再來！',
    // "content": '偷偷告訴你其實比賽已經打完',
    "btn": '返回',
  },

  //完場
  'finish_video': {
    "title": '這裏暫時沒有視頻!',
    "content": '去看看別的完場視頻吧',
  },

  'global_error': {
    "title": '遇到未知錯誤，請重試!',
    // "content": '',
    "btn": '返回首頁'
  },

  // 商戶禁用或App禁用
  'merchant_forbid': {
    "title": '對不起，您訪問的頁面已被設置禁止訪問!',
    "content": '如果您有任何疑問，請聯系平臺客服',
    // "btn": '返回首頁'
  },
  // 請求數據出錯
  'request_error': {
    "title": '數據正在趕來的路上！',
    "content": '刷新試試',
    "btn": '刷新'
  },

  //收米列表空
  'shoumi': {
    "title": '這裏暫時沒有收米數據！',
    "content": '有一種闊能，外星人羅納爾多擄走了我們的比賽...',
    //"btn": '', //跳轉到首頁
  },
  //星座列表空
  'xinzhou': {
    "title": '',
    "content": '你的路由好像被熊孩子踢壞了！',
    "btn": '刷新', //刷新
  },

  //大咖動態列表空
  'casting_dynamic_empty': {
    "title": '暫無大咖的動態！',
    "content": '關註更多大咖了解第一手比賽動態...',
    "btn": '去關註', //刷新
  },

  'empty_data': {
    "title": '',
    "img": 'assets/images/nodataicon/no-data-other.png',

    "content": '這裡暫時沒有數據,空空如也~',
    "btn": '刷新', //Refresh
  },

  //關註大咖為空
  'attentionStarEmpty': {
    "img": 'assets/images/nodataicon/no-data-massage.png',
    "title": '大咖們最近都很沈默！',
    "content": '去排行榜找找別的大咖，也能帶你起飛~',
    "btn": '去關註', //刷新
  },

  //詳情註單分享列表空
  'bet_share_empty': {
    "title": '暫時沒有分享的註單！',
    "content": '分享是美好的品德，需要你主動一點',
    "btn": '刷新', //刷新
  },

  //詳情主播註單分享列表空
  'anchor_bet_share_empty': {
    "title": '主播還未推單',
    "content": '去右邊看看，那裏也有很多大神~',
    "btn": '刷新', //刷新
  },

  //主播用戶貢獻榜
  'anchor_contribution_empty': {
    "title": '暫無榜單數據',
    "content": '送個小心心上榜吧~',
    "btn": '刷新', //刷新
  },

  //收藏比賽
  'collectGame': {
    "title": '這裏還沒有你收藏過的比賽',
    "content": '點擊比賽列表的星星，就可以收藏到這裏~',
    "btn": '刷新',
  },
  //已投比賽
  'betGame': {
    "title": '沒有找到你投註的比賽',
    "content": '投註的比賽在這裏查看，助你實時掌握球場狀況',
    "btn": '刷新',
  },

  //多錢包列表
  'wallet_list': {
    "img": 'assets/images/nodataicon/no-data-wallet.png',
    "title": '錢包加載失敗…',
    "content": '數錢的時候可能打了個盹，試試刷新？',
    "btn": '刷新',
  },

  // 排行榜
  'rank_list': {
    "img": 'assets/images/nodataicon/no-data-rb.png',
    "title": '暫時沒有榜單數據!',
    "content": '這個時候出手讓夥伴看到你~',
    "btn": '刷新',
  },
  // 爆料排行榜netError
  'rank_error':{
    "img": 'assets/images/nodataicon/img_all_empty_wifi_black.svg',
    "title": '網絡不給力，點擊屏幕重試!',
    "content": '唯有愛和WIFI不可辜負...',
    "btn": '刷新', //點擊刷新
  },
  //个人中心爆料
  'personal_share': {
    "title": '您暫時沒有爆料',
    "img": 'assets/images/nodataicon/no-data-other.png',
    "content": '去投注吧，讓我們彼此了解一下~',
    "btn": '返回爆料頁', //點擊刷新
  },
  // web小游戏
  'game_error':{
    "img": 'assets/images/nodataicon/no-data-rb.png',
    "title": '遊戲加載失敗',
    "content": "換個姿勢再試試吧~",
    "btn": '刷新', //點擊刷新
  },
  //比赛结束
  'share_order_removed': {
    "img": 'assets/images/nodataicon/no-data-other.png',
    "title": '爆料已被刪除!',
    "content": '換個姿勢，去看看別的爆料吧',
    "btn": '返回爆料',
  },
  // 爆料首頁
  'share_order_page':{
    "title": '稍等片刻，大神正在爆料中...',
    "content": '讓我們從"發布爆料"開始吧~',
    "btn": '點擊刷新',
  }
};