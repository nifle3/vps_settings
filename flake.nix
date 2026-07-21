{
  description = "A development shell with Ansible, Git, and Python 3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        ansible
      ];

      shellHook = ''
        echo "Добро пожаловать в devShell с Ansible"
        echo "Используйте 'ansible --version'"
      '';
    };
  };
}
