#!/bin/bash

# Renk Tanımlamaları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Renkli Banner
echo -e "${CYAN}-------------------------------------"
echo -e " WordPress User Enumeration Tool"
echo -e "      Akif-SAYIN / DedCrowd"
echo -e "-------------------------------------${NC}"

# Kullanıcıdan site adresi iste
echo -ne "${YELLOW}Website (e.g., example.com): ${NC}"
read -r site

# Tam URL'yi oluştur
url="$site/wp-json/wp/v2/users"

# Kullanıcıları bulmak için istekte bulun
echo -e "${CYAN}Enumerating users at $url ...${NC}"
response=$(curl -sL "$url")

# Yanıt boş mu kontrol et
if [ -z "$response" ]; then
  echo -e "${RED}No response received. The site might be blocking the request or the URL is incorrect.${NC}"
  exit 1
fi

# 'slug' etiketinin değerlerini bul ve göster
echo -e "${GREEN}Found users:${NC}"
echo "$response" | grep -o '"slug":"[^"]*"' | sed 's/"slug":"\([^"]*\)"/\1/' | while read -r user; do
    echo -e "${GREEN}- ${user}${NC}"
done

