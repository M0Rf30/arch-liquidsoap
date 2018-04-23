#!/bin/sh
set -x
su -c - user "yay -S ocaml-camomile ocaml-gd4o ocaml-lablgl ocaml-ocamlsdl ocaml-pcre ocaml-result ocaml-ssl ocaml-topkg ocaml-xmlm perl-xml-dom --noconfirm && yay -U /resources/liquidsoap-1.3.3-2-x86_64.pkg.tar --noconfirm"
su -c - user "yes y | yay -Scc"
