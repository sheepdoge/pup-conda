#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost'
}

test::assert_output() {
  more ~/.bashrc | grep -q "~/.miniconda/bin/activate"
  more ~/.condarc | grep -q "conda-forge"
  source ~/.miniconda/bin/activate

  # Ensure using python managed by Anaconda
  python --version 2>&1 | grep -q 'Python 3'
  python --version 2>&1 | grep -q 'Anaconda'

  which ipython >/dev/null
  which sheepdoge >/dev/null

  python -c 'import requests'
}

test::check_syntax
test::run_ansible
test::assert_output
