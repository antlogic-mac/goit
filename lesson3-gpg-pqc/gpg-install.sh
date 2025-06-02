#!/bin/bash
# Build and install GnuPG with the specific version, using script from https://github.com/rnpgp/rnp-ci-containers/raw/refs/heads/main/tools/tools.sh

source /opt/tools/tools.sh

build_and_install_gpg_pqc() {
  GPG_VERSION="2.5.4"
  GPG_INSTALL="/opt/gpg/pqc"
  echo "Running build_and_install_gpg version ${GPG_VERSION} (installing to ${GPG_INSTALL})"

  local gpg_build=${LOCAL_BUILDS}/gpg
  mkdir -p "${gpg_build}"
  pushd "${gpg_build}" || exit

  #                              npth      libgpg-error   libgcrypt  libassuan libksba pinentry gnupg
  _install_gpg component-git-ref npth-1.6     master         master    master   master  master  2.5.4

  popd || exit
  rm -rf "${gpg_build}"
}
