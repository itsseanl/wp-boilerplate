#!/bin/bash
echo "Project name: "
read projName
echo "Making Project Directory"
mkdir $projName && cd $projName
echo "Initializing Lando"
lando init \
--source remote \
--remote-url https://wordpress.org/latest.tar.gz \--recipe wordpress \
--webroot . \
--name $projName
echo "slam jammin' the yml file"
echo "services:" >> .lando.yml
echo "  database:" >> .lando.yml
echo "    type: mysql" >> .lando.yml
echo "  pma:" >> .lando.yml
echo "    type: phpmyadmin" >> .lando.yml
echo "    hosts:" >> .lando.yml
echo "      - Database" >> .lando.yml
echo "re-configuring the insides"
cp -a wordpress/ .
rm -r wordpress
cd wp-content/themes/
echo "underscore it up"
git clone git@github.com:Automattic/_s.git
cd _s
rm -rf .git
echo "get gulped"
npx wpgulp

