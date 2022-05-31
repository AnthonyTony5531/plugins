#!/bin/bash

:<<EOF
dart插件/模块 资源访问替换
准备工作：
脚本添加权限命令：chmod +x exchange_assets_method.sh
脚本运行：./exchange_assets_method.sh
EOF

# 打包计时
SECONDS=0

# 修改资源获展示
function exchangeTextStyleMethod() {
  # $1 # 源路径 $(pwd)/lib,绝对地址
  # echo "入参：$1"
  for f in `ls $1`; do
    if [[ -f $1/$f ]]; then
      if [[ ! "sdk_assets.dart,sdk_asset_download_page.dart,ai_image.dart,ai_appbar.dart,ai_flexible_space_bar.dart,ai_html.dart,ai_rich_text_parser.dart,ai_tabs.dart,nokeybord_textfield.dart,purekeyboard_textfield.dart,circle_widget.dart" =~ $f ]]; then
        content=$(cat $1/$f)
        if [[ $content =~ "AiTextStyle(" ]]; then
          echo "已替换文件：$f"
        else
          if [[ $content =~ "TextStyle(" ]]; then
		        echo "当前修改文件：$f"
            sed -in-place -e 's/TextStyle(/AiTextStyle(/g' $1/$f
            # 导入class
            sed -i '' '1i\
            import "package:fast_ai/utils/ai_image.dart";
            ' $1/$f # 在第一个行钱插入文字和回车，单引号会被自动删除因此用双引号
            removeTempFile $1/$f
          fi
  		  fi
      else
        echo "指定文件：$f"
        if [[ $f = 'circle_widget.dart' ]]; then
          if [[ $content =~ "AiTextStyle(" ]]; then
            echo "已替换文件：$f"
          else
            if [[ $content =~ " TextStyle(" ]]; then
              echo "当前修改文件：$f"
              sed -in-place -e 's/ TextStyle(/ AiTextStyle(/g' $1/$f
              # 导入class
              sed -i '' '1i\
              import "package:fast_ai/utils/ai_image.dart";
              ' $1/$f # 在第一个行钱插入文字和回车，单引号会被自动删除因此用双引号
              removeTempFile $1/$f
            fi
          fi
        fi
  	  fi
  	else
	  # 文件夹
      exchangeTextStyleMethod $1/$f
    fi
  done
}


# 移除因执行sed命令产生的中间文件
function removeTempFile() {
	# 删除以n-place结尾的临时文件
	add="n-place"
	path="$1$add"	
	[[ -f $path ]] && rm $path

	# 删除以-e结尾的临时文件
	append="-e"
	path="$1$append"
	[[ -f $path ]] && rm $path
}

exchangeTextStyleMethod $(pwd)/lib

echo " ****************** 修改TextStyle方法耗时：${SECONDS}秒 ****************** "