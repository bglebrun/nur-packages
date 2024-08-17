{ lib
, stdenv
, fetchzip
, powershell
, unzip
}:
stdenv.mkDerivation rec {
  version = "3.20.1";
  pname = "PowerShellEditorServices";
  src = fetchzip {
    url = "https://github.com/PowerShell/${pname}/releases/download/v${version}/PowerShellEditorServices.zip";
    sha256 = "sha256-HMzW3iWjP1gWdIHnfDoBVm56Yr0QSE0HOoiqF/S6dl4=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    powershell
    unzip
  ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/PowerShellEditorServices/
    cp -r ${src}/* $out/PowerShellEditorServices
  '';

  meta = with lib; {
    description = "A common platform for PowerShell development support in any editor or application!";
    homepage = "https://github.com/PowerShell/PowerShellEditorServices";
    platforms = platforms.linux;
    license = licenses.mit;
    # maintainers = with maintainers; [bglebrun];
  };
}
