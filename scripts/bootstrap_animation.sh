#!/bin/bash
name=$1
mkdir generated
cd generated

source=../animation
rm -rf ${name}

flutter create \
  --org dev.krgm4d \
  ${name}

rm -rf ${name}/lib
rm -rf ${name}/test

cp -r ${source}/lib ${name}
cp -r ${source}/test ${name}
cp -r ${source}/images ${name}
cp ../analysis_options.yaml ${name}
cp ../LICENSE_FORKED ${name}/LICENSE
sed -e "s/flutter_bootstrap/${name}/g" ${source}/pubspec.yaml > ${name}/pubspec.yaml

mv ${name} ../../