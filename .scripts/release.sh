# 编译中文本地化文件
echo "Compiling Gothic 2 NotR Chinese Localizations..."

# 修改循环条件，仅针对中文目录
for dir in release/langs/zh_*; do
    if [ -d "$dir" ]; then
        LANG=$(basename "$dir")
        ENC=$(get_encoding "$LANG")
        echo "Compiling Gothic 2 NotR: Language $LANG with $ENC"

        .scripts/dacode compile -c "$dir" -i $ENC -g g2a -p gothic,menu

        # 继续执行结构调整和打包操作，这部分代码保持不变
        mkdir -p "$dir/_work/Data/Scripts"
        mv "$dir"/_compiled "$dir"/_work/Data/Scripts/_compiled
        mv "$dir"/Content   "$dir"/_work/Data/Scripts/Content
        mv "$dir"/System    "$dir"/_work/Data/Scripts/System

        echo "Packing mod files for language $LANG"
        .scripts/vdfs -b "$dir" -c "Gothic 2 NotR localization project ($LANG)" -o release/release/Data/modvdf/G2A_$LANG.mod .scripts/g2a.yml

        cp .scripts/GothicLocalized.ini release/release/System/GothicLocalized_$LANG.ini
        sed -i "s/{lang}/$LANG/g; s/{ver}/$VER/g; s/{enc}/$ENC/g" release/release/System/GothicLocalized_$LANG.ini
    fi
done

# 注意：后续的zip操作可能需要根据实际情况调整，确认是否仅打包中文相关文件
# 如果确定只需要中文mod的zip，确保之前的操作没有误处理其他语言的文件
# 下面是原始的zip命令，可能无需改动
cd release/release
zip -r "Gothic_2_NotR_Chinese_Localized.zip" Data System
