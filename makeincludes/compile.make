echo:
  echo "hello world"

build:
	docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app localhost/esp-open-sdk:v1 make build

flash: blinky-0x00000.bin
	$(ESPTOOL) --port $(ESPPORT) write_flash 0 blinky-0x00000.bin 0x10000 blinky-0x10000.bin
