#!/bin/sh

set -o nounset # (set -u) No unset variables
set -o errexit # (set -e) Exit if any statement returns non-true value

BUILD_CONFIGURATION="Release"
APPLICATIONS="ConsoleApp1 OpenTkApp"
FRAMEWORK="netcoreapp2.1"
RUNTIMES="win-x64 linux-x64 osx-x64"

# Change to directory script resides in
cd "`dirname -- "${0}"`"

# Restore dependencies and tools of all projects
dotnet restore

# Build and publish all projects for each runtime target
for runtime in $RUNTIMES; do
    dotnet publish -c $BUILD_CONFIGURATION --framework $FRAMEWORK --runtime $runtime
done

# Grab version string from Git
VERSION="$(git describe --tags --dirty)"

# Remove the string "version-" from the beginning of the $VERSION variable
VERSION=${VERSION#"version-"}

# Create compressed tar archives of published files
# TODO: Create a zip for the Windows release
# TODO: Create a Package Bundle for the MacOS release
for application in $APPLICATIONS; do
    for runtime in $RUNTIMES; do
        binDir="$application/bin/$BUILD_CONFIGURATION/$FRAMEWORK/$runtime"
        publishDir="${application}_${VERSION}_${runtime}"
        tarball="${publishDir}.tgz"
        mv "$binDir/publish/" "$binDir/$publishDir"
        tar -C "$binDir" -czf "$tarball" "$publishDir"
        rm -rf "$binDir/$publishDir"
    done
done
