{ pkgs ? import <nixpkgs> { } }:

let
  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    editablePackageSources = {
      playground = ./playground;
    };
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
  };
in
myAppEnv.env.overrideAttrs (oldAttrs: {
  buildInputs = [ pkgs.poetry ];
})