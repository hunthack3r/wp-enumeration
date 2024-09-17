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
echo -e "-------------------------------------${NC}"

# Giriş bilgisini stdin'den oku
read -r input

# Eğer bir dosya verilmişse
if [ -f "$input" ]; then
    # Dosya içindeki her bir domain için işlemi gerçekleştir
    while IFS= read -r site; do
        url="$site/wp-json/wp/v2/users"
        echo -e "${CYAN}Enumerating users at $url ...${NC}"
        response=$(curl -sL "$url")

        # Yanıt boş mu kontrol et
        if [ -z "$response" ]; then
            echo -e "${RED}No response received for $site. The site might be blocking the request or the URL is incorrect.${NC}"
            continue
        fi

        # 'name' ve 'slug' etiketlerinin değerlerini bul ve göster
        echo -e "${GREEN}Found users for $site:${NC}"
        echo "$response" | grep -oP '"name":"[^"]*"|"slug":"[^"]*"' | sed -E 'N;s/"name":"([^"]*)".*"slug":"([^"]*)"/Name: \1 - Username: \2/' | while read -r user; do
            echo -e "${GREEN}- ${user}${NC}"
        done

    done < "$input"
else
    # Tek bir site için işlemi gerçekleştir
    site="$input"
    url="$site/wp-json/wp/v2/users"

    echo -e "${CYAN}Enumerating users at $url ...${NC}"
    response=$(curl -sL "$url")

    # Yanıt boş mu kontrol et
    if [ -z "$response" ]; then
        echo -e "${RED}No response received. The site might be blocking the request or the URL is incorrect.${NC}"
        exit 1
    fi

    # 'name' ve 'slug' etiketlerinin değerlerini bul ve göster
    echo -e "${GREEN}Found users:${NC}"
    echo "$response" | grep -oP '"name":"[^"]*"|"slug":"[^"]*"' | sed -E 'N;s/"name":"([^"]*)".*"slug":"([^"]*)"/Name: \1 - Username: \2/' | while read -r user; do
        echo -e "${GREEN}- ${user}${NC}"
    done
fi
