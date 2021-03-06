{ stdenv, fetchgit, qtbase, qtquick1, qmakeHook }:

stdenv.mkDerivation rec {
  version = "0.1.0";
  name = "qmltermwidget-${version}";

  src = fetchgit {
    url = "https://github.com/Swordfish90/qmltermwidget.git";
    rev = "refs/tags/v${version}";
    sha256 = "19pz27jsdpa3pybj8sghmmd1zqgr73js1mp3875rhx158dav37nz";
  };

  buildInputs = [ qtbase qtquick1 ];
  nativeBuildInputs = [ qmakeHook ];

  patchPhase = ''
    substituteInPlace qmltermwidget.pro \
      --replace '$$[QT_INSTALL_QML]' "/lib/qt5/qml/"
  '';

  installFlags = [ "INSTALL_ROOT=$(out)" ];

  enableParallelBuilding = true;

  meta = {
    description = "A QML port of qtermwidget";
    homepage = "https://github.com/Swordfish90/qmltermwidget";
    license = stdenv.lib.licenses.gpl2;
    platforms = stdenv.lib.platforms.linux;
    maintainers = with stdenv.lib.maintainers; [ skeidel ];
  };
}
