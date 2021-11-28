#!/system/bin/sh
MODDIR={0%/*}
mod_prop(){ (
NAME=$1; VARPROP=$2; FILE="$3"; [ ! "$FILE" ] && FILE="$MODID/swap.prop"; no=/dev/null
if [ "$NAME" ] && [ ! "$NAME" == "=" ]; then
touch "$FILE" 2>$no
echo "$NAME=$VARPROP" | while read prop; do export newprop=$(echo ${prop} | cut -d '=' -f1); sed -i "/${newprop}/d" "$FILE"; cat="$(cat "$FILE")"; echo $prop > "$FILE"; echo -n "$cat" >>"$FILE"; done 2>$no
else
echo "Change property of a file\nusage: mod_prop NAME VALUE FILE"
fi
) }

del_prop(){ (
NAME=$1; FILE="$2"; [ ! "$FILE" ] && FILE=$MODID/swap.prop
noneprop="$NAME="
nonepropn="$noneprop\n"
if [ "$NAME" ] && [ ! "$NAME" == "=" ]; then
sed -i "/${nonepropn}/d" "$FILE" 2>/dev/null
sed -i "/${noneprop}/d" "$FILE" 2>/dev/null
else
echo "Delete property from a file\nusage: del_prop NAME FILE"
fi
) }

grep_prop() {
  local REGEX="s/^$1=//p"
  shift
  local FILES=$@
  [ -z "$FILES" ] && FILES='/system/build.prop'
  cat $FILES 2>/dev/null | dos2unix | sed -n "$REGEX" | head -n 1
}

if [ "$(grep_prop ENABLE_SWAP $MODDIR/swap.prop)" == "true" ]; then
mkswap $MODDIR/swap
swapon $MODDIR/swap
fi