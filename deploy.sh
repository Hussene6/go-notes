#!/bin/bash

echo "Iniciando deployment..."

#Atualizar
cd /home/appuser/go-notes
git pull origin main

#Build
go build -o go-notes .

#Reiniciar
systemctl restart go-notes.service
echo "sucesso"
