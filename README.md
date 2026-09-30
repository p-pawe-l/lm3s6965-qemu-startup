# lm3s6965-qemu-startup

Minimal bare-metal startup code for an ARM Cortex-M3, written in C from scratch — no vendor SDK, no assembly, no C library. Runs on QEMU's emulated TI Stellaris **LM3S6965** evaluation board.

## Requirements

- [Arm GNU Toolchain](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads) (`arm-none-eabi-gcc`)
- QEMU (`qemu-system-arm`)

On macOS:

```sh
brew install --cask gcc-arm-embedded
brew install qemu
```

## Build and run

```sh
make          # build firmware.elf
make run      # run in QEMU (quit: Ctrl-A, then X)
make clean    # remove build output
```

## Debugging with GDB

```sh
make debug    # QEMU starts paused, GDB server on :1234
```

In another terminal:

```sh
arm-none-eabi-gdb firmware.elf -ex "target remote :1234"
(gdb) break Reset_Handler
(gdb) continue
```
