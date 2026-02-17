#!/bin/bash

# အရောင်သတ်မှတ်ချက်များ
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN}=============================================="
echo -e "🛡️  UFW FIREWALL CONFIGURATION STARTING..."
echo -e "==============================================${NC}"

# ၁။ UFW ကို Install လုပ်ခြင်း
echo -e "\n${YELLOW}[1/4]${NC} Installing UFW..."
sudo apt install ufw -y > /dev/null 2>&1
echo -e "${GREEN}✔ UFW Installed Successfully!${NC}"

# ၂။ Ports များဖွင့်ခြင်း
echo -e "\n${YELLOW}[2/4]${NC} Configuring Firewall Rules..."

# SSH, HTTP, HTTPS
sudo ufw allow ssh > /dev/null 2>&1
echo -e "${CYAN}  → Allowed SSH (Port 22)${NC}"
sudo ufw allow 80/tcp > /dev/null 2>&1
echo -e "${CYAN}  → Allowed HTTP (Port 80)${NC}"
sudo ufw allow 443/tcp > /dev/null 2>&1
echo -e "${CYAN}  → Allowed HTTPS (Port 443)${NC}"

# Range Ports (TCP/UDP)
sudo ufw allow 1024:65535/tcp > /dev/null 2>&1
echo -e "${CYAN}  → Allowed TCP Range (1024-65535)${NC}"
sudo ufw allow 1024:65535/udp > /dev/null 2>&1
echo -e "${CYAN}  → Allowed UDP Range (1024-65535)${NC}"

# ၃။ Firewall Enable လုပ်ခြင်း
echo -e "\n${YELLOW}[3/4]${NC} Enabling Firewall..."
echo "y" | sudo ufw enable > /dev/null 2>&1
echo -e "${GREEN}✔ Firewall is now Active and Enabled on System Startup!${NC}"

# ၄။ Status ပြသခြင်း
echo -e "\n${YELLOW}[4/4]${NC} Final Firewall Status:"
echo -e "${CYAN}----------------------------------------------${NC}"
sudo ufw status numbered
echo -e "${CYAN}----------------------------------------------${NC}"

echo -e "\n${GREEN}✨ ALL DONE! YOUR SERVER IS NOW SECURED.${NC}"
echo -e "${CYAN}==============================================${NC}\n"
