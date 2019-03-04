#!/bin/sh

set -o nounset # (set -u) No unset variables
set -o errexit # (set -e) Exit if any statement returns non-true value

BUILD_CONFIGURATION="Release"
APPLICATIONS="ConsoleApp1 OpenTkApp GtkApp"
FRAMEWORK="netcoreapp2.1"
RUNTIMES="win-x64 linux-x64 osx-x64"

# Change to directory script resides in
cd "$(dirname -- "${0}")"

# Restore dependencies and tools of all projects
dotnet restore

# Grab version string from Git
VERSION="$(git describe --tags --dirty)"

# Remove the string "version-" from the beginning of the $VERSION variable
VERSION=${VERSION#"version-"}

# For each application ...
for application in $APPLICATIONS; do
    # ... and each runtime ...
    for runtime in $RUNTIMES; do
        # ... build and publish the application ...
        dotnet publish -c "$BUILD_CONFIGURATION" --framework "$FRAMEWORK" --runtime "$runtime" "$application"
    
        # ... then create a compressed tar archives of the published files
        binDir="$application/bin/$BUILD_CONFIGURATION/$FRAMEWORK/$runtime"
        publishDir="${application}_${VERSION}_${runtime}"
        tarball="${publishDir}.tgz"
        mv "$binDir/publish/" "$binDir/$publishDir"
        tar -C "$binDir" -czf "$tarball" "$publishDir"
        rm -rf "$binDir/$publishDir"
    done
done
