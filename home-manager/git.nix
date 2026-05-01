{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
    };

    ignores = [
      ".DS_Store"

      ".vscode/launch.json"

      ".ruff_cache/"
      ".ty_cache/"
      ".venv/"

      "node_modules/"
    ];
  };
}
