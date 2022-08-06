{ pkgs }: 
pkgs.python3.withPackages (packages: with packages; [
    pynvim
])
