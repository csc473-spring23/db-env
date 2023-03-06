{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  env.SQLITE_PATH="$DEVENV_STATE/pgadmin";

  # https://devenv.sh/packages/
  packages = [ pkgs.git
    pkgs.wget
    pkgs.dbeaver
  ];

  enterShell = ''
    git --version
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  scripts.pgsetup.exec = ''
    wget https://pgexercises.com/dbfiles/clubdata.sql;
    psql -U $USER -f clubdata.sql -d postgres -x
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  services.postgres.enable = true;
  services.postgres.listen_addresses = "127.0.0.1";
}
