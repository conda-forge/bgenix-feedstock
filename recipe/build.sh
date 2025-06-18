#!/bin/bash

if [[ ${target_platform} == "linux-aarch64" ]]; then
  sed -i 's/std\:\:ios\:\:streampos/std\:\:streampos/' src/View.cpp
fi

./waf configure build install \
      --prefix=${PREFIX} \
      --bindir=${PREFIX}/bin \
      --libdir=${PREFIX}/lib \
      --jobs=${CPU_COUNT} \
      CFLAGS="${CFLAGS} -I${PREFIX}/include -I${PREFIX}/include/boost" \
      LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
