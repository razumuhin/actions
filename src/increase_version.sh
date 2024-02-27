#!/bin/bash

# Sürüm numarasını saklayacağınız dosyanın yolu
VERSION_FILE="version.txt"

# Eğer dosya yoksa varsayılan bir sürüm numarası ata
if [ ! -f "$VERSION_FILE" ]; then
    echo "1.0.0" > "$VERSION_FILE"
fi

# Dosyadaki sürüm numarasını oku ve artır
VERSION=$(cat "$VERSION_FILE")
# Sürüm numarasını parçalara ayır (örneğin, 1.0.0 -> major=1, minor=0, patch=0)
IFS='.' read -r -a VERSION_PARTS <<< "$VERSION"
MAJOR="${VERSION_PARTS[0]}"
MINOR="${VERSION_PARTS[1]}"
PATCH="${VERSION_PARTS[2]}"
# Sürüm numarasını artır (örneğin, 1.0.0 -> 1.0.1)
NEW_VERSION="$MAJOR.$MINOR.$((PATCH + 1))"

# Yeni sürüm numarasını dosyaya yaz
echo "$NEW_VERSION" > "$VERSION_FILE"

# Yeni sürüm numarasını döndür
echo "$NEW_VERSION"
