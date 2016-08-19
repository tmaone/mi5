#!/usr/bin/env bash

. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/util"

out "Enable MODs"
MODS=($(entries))

for mod in "${MODS[@]}"
do
  if f_exists "${MODS_DIR}/${mod}/enable"; then
    out "Applying [$mod]."
    echo . "${MODS_DIR}/${mod}/enable"
		out "MODDED=1" > "${MI5_INIT}"
  fi
done
