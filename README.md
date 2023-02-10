# nix-on-qubes

Easily install Nix in a Qubes VM.

## Why

Qubes virtual machines are usually based on templates and make it hard to have a persistent Nix installation (surviving restarts). This is hard because Nix assumes the directory `/nix` as the place to store all nix artefacts. There does not seem to be an easy option to change the default path in Nix.

## How

`/nix` is defined as a bind-dir in the Qubes VM. The installer then installs Nix in single-user mode.

## Uninstall

There is no "uninstall" defined (yet).

## Testing

1. Create a new virtual machine in Qubes
2. Download the installation script (it is self-contained)
3. Run the installation script
4. Run `source ${HOME}/.profile` to load the environment
5. Run `nix --version` to verify that nix is installed

## Contributing

Pull Requests are preferred.

## Sources

https://www.qubes-os.org/doc/bind-dirs/

https://nixos.org/manual/nix/stable/installation/installation.html
