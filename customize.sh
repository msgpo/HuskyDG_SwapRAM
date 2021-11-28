SECURE_DIR=/data/adb/modules/huskydg_swapram
chmod 755 $MODPATH/system/xbin/swapram
if [ -d "/system/xbin" ]; then
    ui_print "- Chosen path: /system/xbin"
else
    ui_print "- Chosen path: /system/bin"
    mkdir -p $MODPATH/system/bin
    mv -rf $MODPATH/system/xbin/swapram $MODPATH/system/bin
    rm -rf $MODPATH/system/xbin
fi
if [ -f "$SECURE_DIR/swap" ]; then
ui_print "- Detected swap file, keep after update..."
for m in swap swap.prop; do
ln $SECURE_DIR/$m $MODPATH/$m
done
fi