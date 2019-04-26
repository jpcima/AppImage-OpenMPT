OPENMPT_VERSION = 1.28.04.00

all: appimage

appimage: OpenMPT.yml openmpt.desktop
	ARCH=x86_64 pkg2appimage OpenMPT.yml

clean:
	rm -rf out
	rm -rf OpenMPT
	rm -f OpenMPT.yml

.PHONY: all clean

openmpt.desktop:
	gendesk -n -f --pkgname="openmpt" \
	  --pkgdesc="Audio module tracker" \
	  --name='OpenMPT' \
	  --mimetype='audio/x-mod;audio/x-s3m;audio/x-xm;audio/x-it;audio/x-mptm' \
	  --categories='Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo'

OpenMPT.yml: OpenMPT.yml.in
	sed "s/@VERSION@/${OPENMPT_VERSION}/g" $< > $@
