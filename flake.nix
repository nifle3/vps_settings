{
  description = "A development shell with Ansible, Git, and Python 3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        ansible
        git
        python3
        # python3Packages.pip
        # python3Packages.virtualenv
      ];

      shellHook = ''
        echo "Добро пожаловать в devShell с Ansible, Git и Python 3!"
        echo "Используйте 'ansible --version', 'git --version' и 'python3 --version' для проверки."
      '';
    };
  };
}
