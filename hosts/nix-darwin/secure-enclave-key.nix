{
  config,
  lib,
  nixSecureEnclaveKey,
  ...
}:
let
  githubKeyFile = "~/.ssh/id_enclave_github";
  sshPavKeyFile = "~/.ssh/id_enclave_ssh_pav";
in
{
  imports = [ nixSecureEnclaveKey.homeManagerModules.default ];

  programs = {
    nix-secure-enclave-key = {
      enable = true;
      identities = {
        github = {
          keyFile = githubKeyFile;
          label = "github-nix-secure-enclave-key";
          protection = "none";
          autoEnsure = true;
          github = {
            autoAdd = true;
            type = "both";
          };
        };
        pav = {
          keyFile = sshPavKeyFile;
          label = "pav-nix-secure-enclave-key";
          protection = "none";
          autoEnsure = true;
          github.autoAdd = false;
        };
      };
      signingIdentity = "github";
      signByDefault = false;
    };

    git.settings.commit.gpgSign = true;

    ssh = {
      includes = [
        "~/.orbstack/ssh/config"
        "~/.ssh/config.private"
      ];
      settings = {
        "*" = {
          IdentityFile = lib.mkForce [ ];
          SecurityKeyProvider = lib.mkForce null;
        };
        "github.com" = {
          HostName = "github.com";
          User = "git";
          IdentityFile = githubKeyFile;
          IdentitiesOnly = true;
          SecurityKeyProvider = "/usr/lib/ssh-keychain.dylib";
        };
        pav = {
          HostName = "192.168.1.155";
          User = config.home.username;
          Port = 22;
          IdentityFile = sshPavKeyFile;
          IdentitiesOnly = true;
          SecurityKeyProvider = "/usr/lib/ssh-keychain.dylib";
        };
      };
    };
  };
}
