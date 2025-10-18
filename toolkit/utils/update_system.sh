#!/bin/bash
# toolkit/utils/update_system.sh
# Atualiza pacotes da EC2

sudo apt update && sudo apt upgrade -y
echo "✅ Sistema atualizado!"
