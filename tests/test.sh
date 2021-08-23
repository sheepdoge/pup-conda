#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost'
}

test::assert_output() {
  more ~/.bashrc | grep -q "~/.miniconda/bin"
  more ~/.condarc | grep -q "conda-forge"
}

test::check_syntax
test::run_ansible
test::assert_output
