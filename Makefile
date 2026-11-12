# This Makefile was only needed for development on NixOS.

run:
	echo "This Makefile was only needed for development on NixOS."

toolchain:
	arduino-cli board listall
#	arduino-cli board install rp2040:rp2040:rpipico
	rm ~/.arduino15/packages/rp2040/tools/pqt-picotool/5.0.0-9576866/picotool
	cd ~/.arduino15/packages/rp2040/tools/pqt-picotool/5.0.0-9576866/ && ln -s /nix/store/74japhvybn5d41s98fhvzdh5s1h6wz80-picotool-2.2.0-a4/bin/picotool picotool

compile:
	arduino-cli compile -b rp2040:rp2040:rpipico --export-binaries

download: compile
	echo "Hold the reset button during insertion of USB to the computer."
	echo "Then manually drag and drop the uf2 file to the new USB drive."

