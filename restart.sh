#!/bin/bash

vagrant destroy -f
rm -rf .vagrant/
vagrant up
ansible all -m ping -i hosts
