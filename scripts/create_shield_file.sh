#!/bin/bash

SUFFIX="../reference/000_tech-balance_scaled-shields.suffix"
DATA="../reference/tech-balance_shield-components.tsv"
TARGET="../tech-balance/common/component_templates/000_tech-balance_scaled-shields.txt"
PARSE_SCRIPT="./parse_shield_components.awk"

awk -f "${PARSE_SCRIPT}" "${DATA}" > "${TARGET}"

cat "${SUFFIX}" >> "${TARGET}"
