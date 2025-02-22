#!/usr/bin/env bash

# Exit on failure
set -e


brew update

brew uninstall python
brew install python --universal --framework
python -v

brew install libidn
brew install ghostscript
gs -v

brew install imagemagick
compare -version

brew install xpdf
pdfinfo -v || (exit 0)

brew cask install -v basictex
# export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
export PATH=/Library/TeX/Distributions/Programs/texbin:$PATH

sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet
sudo -i tlmgr update --self --all
sudo tlmgr install            \
  collection-basic            \
  collection-bibtexextra      \
  collection-binextra         \
  collection-fontsextra       \
  collection-fontsrecommended \
  collection-fontutils        \
  collection-formatsextra     \
  collection-langenglish      \
  collection-langeuropean     \
  collection-langother        \
  collection-latex            \
  collection-latexextra       \
  collection-latexrecommended \
  collection-mathscience      \
  collection-metapost         \
  collection-pictures         \
  collection-plaingeneric     \
  collection-pstricks
