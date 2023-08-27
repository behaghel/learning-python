{ pkgs ? import <nixpkgs> { } }:

pkgs.poetry2nix.mkPoetryApplication {
  projectDir = ./.;
  overrides = pkgs.poetry2nix.overrides.withDefaults (self: super: {
    werkzeug = super.werkzeug.overridePythonAttrs (
      old: {
        buildInputs = (old.buildInputs or [ ]) ++ [
          self.flit-core
        ];
      }
    );
    flask = super.flask.overridePythonAttrs (
      old: {
        buildInputs = (old.buildInputs or [ ]) ++ [
          self.flit-core
        ];
      }
    );
  });
}