{
  programs.beanKey = {
    enable = true;
    useBeanKeyTheme = true;

    settings = {
      conversion = {
        type_backslash = false;
        type_half_space = true;
        option_direct_full_width_input = false;
        punctuation_style = "kuten_and_toten";
      };

      zenz = {
        inference_limit = 3;
        profile = "学生";
        topic = "プログラミング";
        preference = "カタカナ優先";
      };
    };
  };
}
