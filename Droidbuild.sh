include_if_exists "$BASEDIR/incremental_vars.sh"

droidbuild(){
  LOCAL_PATH = $(dirname $BASH_SOURCE)
  if ndef BOOTLOADER_LOCK_SUPPORT; then
     info "Patching bootloader locking support"
     exec "patch $BASEDIR/build/core $LOCAL_PATH/patches/Makefile-fix-18.1.patch" 
     success "Patched bootload lock support"
     echo "BOOTLOADER_LOCK_SUPPORT=1" >> $BASEDIR/incremental_vars.sh
  else
     success "Bootloader locking support is already present"
  fi
}
