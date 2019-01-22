#!/bin/sh

set -o nounset # (set -u) No unset variables
set -o errexit # (set -e) Exit if any statement returns non-true value

clear

cd "$(dirname -- "${0}")" # Change to directory script resides in

dotnet build --verbosity=quiet

dotnet test UnitTestProject1
