# Ethereum CUDA Miner

### Docker container for Ethereum mining with CUDA.

Simple and easy to run, if you have a Nvidia GPU and want to mine eth.

**Note:** This image builds nsfminer, which is an activily maintained <https://github.com/no-fee-ethereum-mining/nsfminer>

### Requirements
- Nvidia drivers for your GPU, you can get them here: [Nvidia drivers](http://www.nvidia.com/Download/index.aspx)
- Nvidia-docker (so docker can access your GPU) install instructions here: [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

### How to run
```
$ nvidia-docker run -it airedwin/nsfminer ARG1 ARG2 ...

# Example
$ nvidia-docker run -it airedwin/nsfminer \
-P stratum://0x123456789@us1.ethermine.org:4444
```

**Note:** `-U` is set by default

### Help
`$ nsfminer --help`
