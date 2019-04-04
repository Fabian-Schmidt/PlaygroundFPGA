# Install
https://tinyfpga.com/bx/guide.html
- Install Python
```
%LOCALAPPDATA%\Programs\Python\Python36\python -m pip install --upgrade pip
```
- Install APIO and tinyprog
```
%LOCALAPPDATA%\Programs\Python\Python36\Scripts\pip install apio==0.4.0b5 tinyprog
%LOCALAPPDATA%\Programs\Python\Python36\Scripts\apio install system scons icestorm iverilog
//%LOCALAPPDATA%\Programs\Python\Python36\Scripts\apio install drivers
//%LOCALAPPDATA%\Programs\Python\Python36\Scripts\apio drivers --serial-enable
%LOCALAPPDATA%\Programs\Python\Python36\Scripts\apio system --lsserial
%LOCALAPPDATA%\Programs\Python\Python36\Scripts\tinyprog --update-bootloader
```
- Install Atom
- Install Atom package "apio-ide" and its dependencies
- template source
```https://github.com/tinyfpga/TinyFPGA-BX/archive/master.zip```


https://drom.io/icedrom/
%USERPROFILE%\.apio\packages\toolchain-icestorm\bin\yosys -q -p "synth_ice40 -blif top.blif" top.v
%USERPROFILE%\.apio\packages\toolchain-icestorm\bin\arachne-pnr -q top.blif -d 8k -P tq144:4k --post-place-blif top.post.blif
%USERPROFILE%\.apio\packages\toolchain-icestorm\bin\yosys -q -o top.post.json top.post.blif
Drop $PRJ.post.json here


%USERPROFILE%\.apio\packages\toolchain-icestorm\bin\icepll -i 16