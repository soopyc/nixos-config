self: super: {
  spotify-unwrapped = super.spotify-unwrapped.override {
    nss = super.nss_latest;
  };
}
