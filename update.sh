#!/bin/bash

# @brief: This script signs the ppa repo with a gpg key identified by KEYNAME (fingerprint)
#
# @source: https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html
#         https://github.com/assafmo/ppa/blob/master/update.sh

set -e
set -v

export KEYNAME=41F0EA1699A74C1E2FA41B538CF96BC3FF9DBBCE

(
    set -e
    set -v

    cd ./debian/

    # Packages & Packages.gz
    dpkg-scanpackages --multiversion . > Packages
    gzip -k -f Packages

    # Release, Release.gpg & InRelease
    apt-ftparchive release . > Release
    gpg --default-key "${KEYNAME}" -abs -o - Release > Release.gpg
    gpg --default-key "${KEYNAME}" --clearsign -o - Release > InRelease
)
