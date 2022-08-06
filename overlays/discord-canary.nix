self: super: {
  discord-canary = super.discord-canary.override {
    withOpenASAR = true;
    nss = super.nss_latest;
  };
}
