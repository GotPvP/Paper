#!/usr/bin/env bash
basedir="$1"
workdir="$basedir/work"
mcver=$(cat "$workdir/BuildData/info.json" | grep minecraftVersion | cut -d '"' -f 4)
paperjar="../../Paper-Server/target/paper-$mcver.jar"
vanillajar="../$mcver/$mcver.jar"

cd "$workdir/Paperclip"
mvn clean package "-Dmcver=$mcver" "-Dpaperjar=$paperjar" "-Dvanillajar=$vanillajar" || exit 1
cd ..
cp "$workdir/Paperclip/target/paperclip-${mcver}.jar" "$basedir/paperclip.jar"

echo ""
echo ""
echo ""
echo "Build success!"
echo "Copied final jar to $basedir/paperclip.jar"
