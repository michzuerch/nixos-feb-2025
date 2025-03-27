{pkgs, ...}: {
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    gv
    biblatex-check
    latex2html
    pstoedit
    dot2tex
    xfig
  ];
}
