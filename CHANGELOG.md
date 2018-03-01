CHANGELOG
=========

## v0.6.3 - *2/28/2018*

- Added `sudo` when unzipping package into the install path if required _(EUID)_.
- Check to make sure dependency `unzip` is installed.
- Added `sudo` to installation instructions when linking.

## v0.6.2 - *2/28/2018*

- If the directory `/usr/local/bin` does not exist, fall back to `/usr/bin` for the install path.

## v0.6.1 - *2/22/2018*

- Added spinner animation while downloading package.

## v0.6.0 - *2/8/2018*

- Support for determining architecture *(386, amd64, arm, arm64)*.

## v0.5.0 - *2/7/2018*

**Note:** hardcoding the architecture to amd64.

- Support for Nomad.

## v0.4.0 - *2/7/2018*

**Note:** hardcoding the architecture to amd64.

- Support for determining operating systems *(Darwin, FreeBSD, Linux, NetBSD, OpenBSD, Solaris)*.

## v0.3.0 - *2/3/2018*

**Note:** hardcoding the os/architecture to darwin_amd64.

- Installation instructions set's `$HASHIPM_ROOT` environment variable. Hashipm uses this variable to resolve paths for packages and sourcing `lib/yaml.sh`.

## v0.2.0 - *1/31/2018*

**Note:** hardcoding the os/architecture to darwin_amd64.

- Initial Darwin amd64 support for Consul, Packer, Terraform, and Vault.

## v0.1.0 - *1/29/2018*

- Initial release.
