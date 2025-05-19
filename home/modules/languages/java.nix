{pkgs, ...}: {
  home.packages = [
    pkgs.jdk
  ];

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}/lib/openjdk";
  };
}
