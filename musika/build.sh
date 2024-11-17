#!/bin/bash
set -eu -o pipefail

set -x
ocamlc -c note.ml
ocamlc -c main.ml
ocamlc -o musika *.cmo
{ set +x; } 2> /dev/null

