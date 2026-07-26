{ ... }:
{
  systemd.sleep.settings.Sleep = {
    AllowHibernation = false;
    AllowHybridSleep = false;
    AllowSuspend = false;
    AllowSuspendThenHibernate = false;
  };
}
