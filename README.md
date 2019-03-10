# tinyram_tests
Build docker for libsnark
```
git clone https://github.com/scipr-lab/libsnark
cd libsnark
docker build -t libsnark .
```
Run a shell in the docker
```
docker run -it libsnark
```
In the shell run:
```
git clone https://github.com/udibr/tinyram_tests.git
cd tinyram_tests
git submodule update --init --recursive
./examples.sh
```
You should see printout  ends with `All clear!`
