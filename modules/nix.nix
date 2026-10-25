{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://beankey.cachix.org"
      "https://vicinae.cachix.org"
    ];
    trusted-public-keys = [
      "beankey.cachix.org-1:iE4tWJfPogk+oWopayLECdSsw+H1vqsVnMvmRPHSQ6k="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
}
