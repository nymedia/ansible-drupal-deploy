#!/usr/bin/env bash
# 
# Ensures that the container is configured for running Drupal with the standard configuration
#

set -e
set -u

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ -z "${DRUPAL_ROOT:-}" ]]; then
  export DRUPAL_ROOT="${APP_ROOT}/${DOCROOT_SUBDIR:drupal}"
fi
if [[ -z "${DRUPAL_SITE_DIR:-}" ]]; then
  export DRUPAL_SITE_DIR="${DRUPAL_ROOT}/sites/${DRUPAL_SITE:default}"
fi

sudo --preserve-env init_drupal
