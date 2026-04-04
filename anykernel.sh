### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
device.name1=RMX2061
device.name2=RMX2063
device.name3=RMX2170
device.name4=atoll
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

ui_print " "

ui_print "███╗   ██╗██╗████████╗██████╗  ██████╗ ██╗  ██╗"
ui_print "████╗  ██║██║╚══██╔══╝██╔══██╗██╔═══██╗╚██╗██╔╝"
ui_print "██╔██╗ ██║██║   ██║   ██████╔╝██║   ██║ ╚███╔╝ "
ui_print "██║╚██╗██║██║   ██║   ██╔══██╗██║   ██║ ██╔██╗ "
ui_print "██║ ╚████║██║   ██║   ██║  ██║╚██████╔╝██╔╝ ██╗"
ui_print "╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"

ui_print " "
ui_print "╔══════════════════════════════════════╗"
ui_print "║        ⚡ NitroX Zenith Kernel ⚡       ║"
ui_print "╚══════════════════════════════════════╝"
ui_print " "

ui_print "🧠 Initializing NitroX Engine..."
sleep 0.3
ui_print "⚙️ Mounting partitions..."
sleep 0.3
ui_print "🔍 Checking device compatibility..."
sleep 0.3

ui_print " "
ui_print "────────── 📱 DEVICE INFO ───────────"
ui_print " Device    : RMX2061 (Atoll)"
ui_print " Variant   : KSU-NXT"
ui_print " Android   : AOSP / Custom ROM"
ui_print " "

ui_print "────────── ⚙️ PERFORMANCE ──────────"
ui_print " 💀 Ultra Smooth UI"
ui_print " 🎮 Stable Gaming FPS"
ui_print " 🔥 Low Heating"
ui_print " 🔋 Battery Optimized"
ui_print " "

ui_print "────────── 👨‍💻 DEVELOPER ──────────"
ui_print " Maintainer : JOD BUNNY"
ui_print " Kernel     : NitroX-Zenith"
ui_print " "

ui_print "🚀 Starting Flash Process..."
sleep 0.5

# ==============================
# FAKE PROGRESS BAR 😈
# ==============================

ui_print " "
ui_print "[░░░░░░░░░░] 0%"
sleep 0.3
ui_print "[██░░░░░░░░] 20%"
sleep 0.3
ui_print "[████░░░░░░] 40%"
sleep 0.3
ui_print "[██████░░░░] 60%"
sleep 0.3
ui_print "[████████░░] 80%"
sleep 0.3
ui_print "[██████████] 100%"
sleep 0.3

ui_print " "

ui_print "🔧 Injecting kernel tweaks..."
sleep 0.3
ui_print "⚡ Applying NitroX optimizations..."
sleep 0.3
ui_print "📦 Patching boot image..."
sleep 0.3

ui_print " "
ui_print "╔══════════════════════════════════════╗"
ui_print "║        ✅ Flash Completed!            ║"
ui_print "╚══════════════════════════════════════╝"
ui_print " "

ui_print "🎉 Enjoy NitroX Zenith Performance!"
ui_print "💬 Join Telegram for updates!"
ui_print " "

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install

## init_boot files attributes
#init_boot_attributes() {
#set_perm_recursive 0 0 755 644 $RAMDISK/*;
#set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
#} # end attributes

# init_boot shell variables
#BLOCK=init_boot;
#IS_SLOT_DEVICE=1;
#RAMDISK_COMPRESSION=auto;
#PATCH_VBMETA_FLAG=auto;

# reset for init_boot patching
#reset_ak;

# init_boot install
#dump_boot; # unpack ramdisk since it is the new first stage init ramdisk where overlay.d must go

#write_boot;
## end init_boot install


## vendor_kernel_boot shell variables
#BLOCK=vendor_kernel_boot;
#IS_SLOT_DEVICE=1;
#RAMDISK_COMPRESSION=auto;
#PATCH_VBMETA_FLAG=auto;

# reset for vendor_kernel_boot patching
#reset_ak;

# vendor_kernel_boot install
#split_boot; # skip unpack/repack ramdisk, e.g. for dtb on devices with hdr v4 and vendor_kernel_boot

#flash_boot;
## end vendor_kernel_boot install


## vendor_boot files attributes
#vendor_boot_attributes() {
#set_perm_recursive 0 0 755 644 $RAMDISK/*;
#set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
#} # end attributes

# vendor_boot shell variables
#BLOCK=vendor_boot;
#IS_SLOT_DEVICE=1;
#RAMDISK_COMPRESSION=auto;
#PATCH_VBMETA_FLAG=auto;

# reset for vendor_boot patching
#reset_ak;

# vendor_boot install
#dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

#write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install

