### AnyKernel3 Ramdisk Mod Script
## Modified by Jod Bunny (Realme 6 Pro & 7 Pro Support)
## Based on osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0

# Supported devices
device.name1=RMX2061
device.name2=RMX2170
device.name3=atoll
device.name4=reatoll
device.name5=realme6pro
device.name6=realme7pro
device.name7=rmx2061
device.name8=rmx2170

# Supported Android versions
supported.versions=12-16
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
# Realme 6 Pro (RMX2061, atoll) & Realme 7 Pro (RMX2170, reatoll)
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;   # Both are A-only devices
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;


# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

ui_print " "
ui_print "██████╗ ██╗   ██╗███╗   ██╗███╗   ██╗██╗   ██╗"
ui_print "██╔══██╗██║   ██║████╗  ██║████╗  ██║╚██╗ ██╔╝"
ui_print "██████╔╝██║   ██║██╔██╗ ██║██╔██╗ ██║ ╚████╔╝ "
ui_print "██╔══██╗██║   ██║██║╚██╗██║██║╚██╗██║  ╚██╔╝  "
ui_print "██████╔╝╚██████╔╝██║ ╚████║██║ ╚████║   ██║   "
ui_print "╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝   ╚═╝   "
ui_print " "
ui_print "    🐰 BUNNY X ATOLL KERNEL"
ui_print "--------------------------------"
ui_print " Dev     : JOD BUNNY 07"
ui_print " Device  : RMX2061 / RMX2071"
ui_print " SoC     : Qualcomm SM7125"
ui_print "--------------------------------"
ui_print " "

# 🔄 Installation Flow (clean UX)
ui_print "➤ Initializing..."
ui_print "➤ Patching Kernel..."
ui_print "➤ Applying Performance Tweaks..."
ui_print "➤ Finalizing..."
ui_print "➤ Done ✔"
ui_print " "

# 🐰 Final Signature
ui_print "--------------------------------"
ui_print "🐰 Powered by BunnyX Kernel"
ui_print "✨ Flash Complete — Enjoy BunnyX Power!"
ui_print "--------------------------------"
ui_print " "

# init.rc
backup_file init.rc;
replace_string init.rc "cpuctl cpu,timer_slack" "mount cgroup none /dev/cpuctl cpu" "mount cgroup none /dev/cpuctl cpu,timer_slack";

# init.tuna.rc
backup_file init.tuna.rc;
insert_line init.tuna.rc "nodiratime barrier=0" after "mount_all /fstab.tuna" "\tmount ext4 /dev/block/platform/omap/omap_hsmmc.0/by-name/userdata /data remount nosuid nodev noatime nodiratime barrier=0";
append_file init.tuna.rc "bootscript" init.tuna;

# fstab.tuna
backup_file fstab.tuna;
patch_fstab fstab.tuna /system ext4 options "noatime,barrier=1" "noatime,nodiratime,barrier=0";
patch_fstab fstab.tuna /cache ext4 options "barrier=1" "barrier=0,nomblk_io_submit";
patch_fstab fstab.tuna /data ext4 options "data=ordered" "nomblk_io_submit,data=writeback";
append_file fstab.tuna "usbdisk" fstab;

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
