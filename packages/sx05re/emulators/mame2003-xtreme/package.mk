# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="mame2003-xtreme"
PKG_VERSION="41c34973802caf42c821a50f1ef430799304de29"
PKG_SHA256="1a75497c18ea855afefbfb98f6eb38f702478a1adc181f374f2a026304122c46"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/KMFDManic/mame2003-xtreme"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro, with added game support, and optimized for performance and speed on the Mini Classics. "
PKG_TOOLCHAIN="make"

pre_configure_target() {
  cd ${PKG_BUILD}
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  case ${PROJECT} in
    Amlogic-ng)
        PKG_MAKE_OPTS_TARGET+=" platform=AMLG12B"
      ;;
    Amlogic)
        PKG_MAKE_OPTS_TARGET+=" platform=AMLGX"
      ;;
  esac
  PKG_MAKE_OPTS_TARGET+=" ARCH=\"\" CC=\"$CC\" NATIVE_CC=\"$CC\" LD=\"$CC\""
  
  # PKG_MAKE_OPTS_TARGET=" platform=rpi2 ARCH=\"\" CC=\"$CC\" NATIVE_CC=\"$CC\" LD=\"$CC\""
  
 }

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mame2003_libretro.so $INSTALL/usr/lib/libretro/km_mame2003_xtreme_libretro.so
  cp km_mame2003_xtreme_libretro.info $INSTALL/usr/lib/libretro/km_mame2003_xtreme_libretro.info
  
}
