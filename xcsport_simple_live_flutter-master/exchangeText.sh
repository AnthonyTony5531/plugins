#!/bin/bash

# 移除因执行sed命令产生的中间文件
function removeTempFile() {
  # 删除以n-place结尾的临时文件
  add="n-place"
  path="$1$add"	
  [[ -f $path ]] && rm $path

  # 删除以-e结尾的临时文件
  append="-e"
  path=$1$append
  [[ -f $path ]] && rm $path
}

function exchangeText() {
  # $1 # 源路径 ./lib
  for f in `ls $1`; do
    if [[ -f $1/$f ]]; then
      if [[ $f =~ '.dart' ]]; then
        local content=$(cat $1/$f)
        if [[ $content =~ "Text(" ]]; then
          # 替换
          sed -in-place -e 's/Text(/AiText(/g' $1/$f
          # 导入class
          if [[ $content =~ "utils/ai_image.dart" ]]; then 
            sed -i '' '1i\
import "package:fast_ai/utils/ai_image.dart";
          ' $1/$f
          fi
          removeTempFile $1/$f
        # else
        #   echo "00-not has Text file=$f"
        fi
      # else
      #   echo "11-not dart file : $f"
      fi
    else
      exchangeText $1/$f
    fi
  done
}

exchangeText $(pwd)/lib