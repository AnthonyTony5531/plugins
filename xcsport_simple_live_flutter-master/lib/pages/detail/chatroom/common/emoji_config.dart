/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */



//表情判断表达式,用来搜索
import 'package:fast_ai/config/config.dart';

const emojiRegExpSearch = r"\d{2}\_\d{2}\[gif\]";
//表情内容匹配
const emojiRegExp = r".*\d{2}\_\d{2}\[gif\].*";

//表情配置


// //表情配置
//  var  defualtEmojiConfig = config.langMap['baseLang']['detail']['chatEmojiConfig'];



//表情名：表情消息内容
Map<String, String> defualtEmojiName2EmojiMessageSwitcher = !config.isDeleteInternationalAppointModule
      ? {
          "emoji_good":"01_01[gif]",
          "emoji_lao_tie":"01_16[gif]",
          "emoji_shui_le":"01_15[gif]",
          "emoji_shou_mi":"01_14[gif]",
          "emoji_time_less":"01_13[gif]",
          "emoji_qiang_yan":"01_12[gif]",
          "emoji_yan_shen":"01_11[gif]",
          "emoji_pi":"01_10[gif]",
          "emoji_mo_mo_da":"01_09[gif]",
          "emoji_ke_lian":"01_08[gif]",
          "emoji_ke_chi":"01_06[gif]",
          "emoji_kan_qiu":"01_05[gif]",
          "emoji_fen_nu":"01_04[gif]",
          "emoji_dai_bu_dong":"01_03[gif]",
          "emoji_bu_zhi_shi":"01_02[gif]",
          "emoji_jia_qiu":"01_07[gif]"
        }
      :
        {
          "internation_run":"01_12[gif]",
          "internation_oh yes":"01_11[gif]",
          "internation_laugh":"01_10[gif]",
          "internation_hum":"01_09[gif]",
          "internation_happy":"01_08[gif]",
          "internation_goal":"01_07[gif]",
          "internation_fretful":"01_06[gif]",
          "internation_flummox":"01_05[gif]",
          "internation_cry":"01_04[gif]",
          "internation_cheers":"01_03[gif]",
          "internation_champion":"01_02[gif]",
          "internation_angry":"01_01[gif]",
        };

//表情名：表情消息内容
Map<String, String> defualtEmojiMessage2EmojiAssetSwitcher= !config.isDeleteInternationalAppointModule
        ? {
            "01_01[gif]":"assets/images/detail/chatroom/emoji/emoji_good.gif",
            "01_16[gif]":"assets/images/detail/chatroom/emoji/emoji_lao_tie.gif",
            "01_15[gif]":"assets/images/detail/chatroom/emoji/emoji_shui_le.gif",
            "01_14[gif]":"assets/images/detail/chatroom/emoji/emoji_shou_mi.gif",
            "01_13[gif]":"assets/images/detail/chatroom/emoji/emoji_time_less.gif",
            "01_12[gif]":"assets/images/detail/chatroom/emoji/emoji_qiang_yan.gif",
            "01_11[gif]":"assets/images/detail/chatroom/emoji/emoji_yan_shen.gif",
            "01_10[gif]":"assets/images/detail/chatroom/emoji/emoji_pi.gif",
            "01_09[gif]":"assets/images/detail/chatroom/emoji/emoji_mo_mo_da.gif",
            "01_08[gif]":"assets/images/detail/chatroom/emoji/emoji_ke_lian.gif",
            "01_06[gif]":"assets/images/detail/chatroom/emoji/emoji_ke_chi.gif",
            "01_05[gif]":"assets/images/detail/chatroom/emoji/emoji_kan_qiu.gif",
            "01_04[gif]":"assets/images/detail/chatroom/emoji/emoji_fen_nu.gif",
            "01_03[gif]":"assets/images/detail/chatroom/emoji/emoji_dai_bu_dong.gif",
            "01_02[gif]":"assets/images/detail/chatroom/emoji/emoji_bu_zhi_shi.gif",
            "01_07[gif]":"assets/images/detail/chatroom/emoji/emoji_jia_qiu.gif"
            }
        : {
            "01_12[gif]":"assets/images/detail/chatroom/emoji/internation_run.gif",
            "01_11[gif]":"assets/images/detail/chatroom/emoji/internation_oh yes.gif",
            "01_10[gif]":"assets/images/detail/chatroom/emoji/internation_laugh.gif",
            "01_09[gif]":"assets/images/detail/chatroom/emoji/internation_hum.gif",
            "01_08[gif]":"assets/images/detail/chatroom/emoji/internation_happy.gif",
            "01_07[gif]":"assets/images/detail/chatroom/emoji/internation_goal.gif",
            "01_06[gif]":"assets/images/detail/chatroom/emoji/internation_fretful.gif",
            "01_05[gif]":"assets/images/detail/chatroom/emoji/internation_flummox.gif",
            "01_04[gif]":"assets/images/detail/chatroom/emoji/internation_cry.gif",
            "01_03[gif]":"assets/images/detail/chatroom/emoji/internation_cheers.gif",
            "01_02[gif]":"assets/images/detail/chatroom/emoji/internation_champion.gif",
            "01_01[gif]":"assets/images/detail/chatroom/emoji/internation_angry.gif",
          };

//默认表情目录
const defualtEmojiPath = "assets/images/detail/chatroom/emoji";
