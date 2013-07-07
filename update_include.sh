echo "Checking update_include script"
echo "Updating..."

if [ ! -f /home/pi/roms/gridlee.zip ];
then
    echo "downloading gridlee"
    wget http://socialcase.com/raspberrypi/gridlee.zip
    mv gridlee.zip /home/pi/roms/
fi

###pisnes
wget https://pisnes.googlecode.com/files/pisnes.zip
mkdir /home/pi/emulators/pisnes
mv pisnes.zip /home/pi/emulators/pisnes
cd /home/pi/emulators/pisnes/
unzip -o pisnes.zip
ln -s /home/pi/emulators/pisnes/roms/ /home/pi/roms/snes
cd /home/pi/pimame_installer



###mame4all
git clone https://code.google.com/p/mame4all-pi/
mkdir /home/pi/emulators/mame4all-pi/
cp mame4all-pi/mame4all_pi.zip /home/pi/emulators/mame4all-pi/
cd /home/pi/emulators/mame4all-pi/
unzip -o mame4all_pi.zip
ln -s /home/pi/emulators/mame4all-pi/roms/ /home/pi/roms/mame4all
cd /home/pi/pimame_installer
rm -rf mame4all-pi/

###dgen
#wget http://sheasilverman.com/rpi/raspbian/installer/dgen.zip
#mv dgen.zip /home/pi/emulators/dgen.zip
#cd /home/pi/emulators/
#unzip -o dgen.zip
#mkdir /home/pi/roms/genesis
#rm dgen.zip
#cd /home/pi/pimame_installer
#chmod +x /home/pi/emulators/dgen-sdl-1.32/dgen


###cavestory
#wget http://sheasilverman.com/rpi/raspbian/installer/cavestory.zip
wget https://github.com/vanfanel/cavestory_rpi/archive/master.zip
mv master.zip /home/pi/emulators/cavestory.zip
cd /home/pi/emulators/
unzip -o cavestory.zip
rm cavestory.zip
cd /home/pi/pimame_installer
cp /home/pi/pimame_installer/config_files/cs.sh /home/pi/emulators/cs.sh
chmod +x /home/pi/emulators/cs.sh
chmod +x /home/pi/emulators/cavestory_rpi-master/nx

###dispmanx
#wget http://sheasilverman.com/rpi/raspbian/installer/SDL12-kms-dispmanx.zip
#unzip -o SDL12-kms-dispmanx.zip
#cd SDL12-kms-dispmanx
#sudo make install
#cd ..
#rm SDL12-kms-dispmanx.zip
#rm -rf SDL12-kms-dispmanx/

#cd PiMAME
#git checkout beta
#cd ..
cp PiMAME/pimame_files/menu.py /home/pi/pimame_files/menu.py
cp PiMAME/.advance/advmenu-snes.rc /home/pi/.advance/advmenu-snes.rc

#http://pimame.org/forum/discussion/48/mame-settings-not-saving-in-new-installer-script-version-#Item_5 - User Cramps
sudo chown pi /home/pi/.advance
sudo chmod 770 /home/pi/.advance


##############pikeyd############
#wget http://sheasilverman.com/rpi/raspbian/installer/pikeyd.zip
#mv pikeyd.zip /home/pi/pimame_files
#cd /home/pi/pimame_files
#unzip -o pikeyd.zip
#mv pikeyd/pikeyd.conf ~/.pikeyd.conf
#if grep --quiet /home/pi/pimame_files/pikeyd /home/pi/.profile; then
#  echo "pikeyd already exists, ignoring."
#else
#  echo '/home/pi/pimame_files/pikeyd/pikeyd -d' >> /home/pi/.profile
#fi


#if sudo grep --quiet uinput /etc/modules; then
#  echo "Modules have already been added"
#else
#    sudo sh -c "echo 'uinput' >> /etc/modules"
#	sudo sh -c "echo 'i2c-dev' >> /etc/modules"
#fi

#if sudo grep --quiet '^blacklist i2c-bcm2708$' /etc/modprobe.d/raspi-blacklist.conf ; then
#    echo "Blacklisting i2c-bcm2708"
#    sudo sed -i '/blacklist i2c-bcm2708/d' /etc/modprobe.d/raspi-blacklist.conf
#    sudo sh -c "echo '#blacklist i2c-bcm2708' >> /etc/modprobe.d/raspi-blacklist.conf"
#else
#	echo "Module already blacklisted"
#fi
###########

#increment
echo "PiMAME is now version 0.7.5"

