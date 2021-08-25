TERMUX_PKG_HOMEPAGE=https://github.com/desktop-app/qt5ct
TERMUX_PKG_DESCRIPTION="This program allows users to configure Qt5 settings (theme, font, icons, etc.) under DE/WM without Qt integration"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="Yisus7u7 <jesuspixel5@gmail.com>"
TERMUX_PKG_VERSION=1.1
TERMUX_PKG_SRCURL=https://github.com/desktop-app/qt5ct/archive/refs/heads/master.zip
TERMUX_PKG_SHA256=59c8889189808cfcd42cf49bea42589c82a45e462029bfc7c17824d955f75db1
TERMUX_PKG_DEPENDS="qt5-qtbase, qt5-qtsvg, qt5-qtx11extras, libx11"
TERMUX_PKG_BUILD_DEPENDS="qt5-qtbase-cross-tools, qt5-qttools-cross-tools"

termux_step_pre_configure(){
	mkdir -p ${TERMUX_PREFIX}/libexec/qt/platformthemes
	mkdir -p ${TERMUX_PREFIX}/libexec/qt/styles
	mkdir -p ${TERMUX_PREFIX}/share/applications
	mkdir -p ${TERMUX_PREFIX}/share/qt5ct/colors
	mkdir -p ${TERMUX_PREFIX}/share/qt5ct/qss
	}
	
termux_step_configure(){
	cd ${TERMUX_PKG_SRCDIR}
	"${TERMUX_PREFIX}/opt/qt/cross/bin/qmake" .
	}
	
termux_step_make(){
	make
	}
	
termux_step_make_install(){
	cp -rf ./src/qt5ct-qtplugin/libqt5ct.so ${TERMUX_PREFIX}/libexec/qt/platformthemes/libqt5ct.so
	cp -rr ./src/qt5ct-style/libqt5ct-style.so ${TERMUX_PREFIX}/libexec/qt/styles/libqt5ct-style.so
	cp -rf ./src/qt5ct/qt5ct ${TERMUX_PREFIX}/bin/qt5ct
	cp -rf ./src/qt5ct/qt5ct.desktop ${TERMUX_PREFIX}/share/applications/qt5ct.desktop
	cp -rf ./qss/* ${TERMUX_PREFIX}/share/qt5ct/qss/
	cp -rf ./colors/* ${TERMUX_PREFIX}/share/qt5ct/colors/
	}
