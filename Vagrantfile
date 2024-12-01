# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # monitoring
  config.vm.define "mon" do |mon|
    mon.vm.box = "spox/ubuntu-arm"
    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false
    mon.vm.network "public_network", ip: "192.168.0.21"
    # Disabling https cert check check
    config.vm.box_download_insecure=true

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    mon.vm.network "forwarded_port", guest: 9090, host: 9090
    mon.vm.network "forwarded_port", guest: 8083, host: 8083
    mon.vm.network "forwarded_port", guest: 8084, host: 8084
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    #config.vm.network "forwarded_port", guest: 51325, host: 51325, host_ip: "127.0.0.1"


    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    mon.vm.provider "vmware_desktop" do |vm|
    # Display the VirtualBox GUI when booting the machine
    vm.gui = false
 
    # Customize the amount of memory on the VM:
    vm.memory = "512"
    end

  mon.vm.provision "file", source: "./README.md", destination: "README.md"
  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  mon.vm.provision "shell", inline: <<-SHELL
    echo 'echo "Good luck"' >> /home/vagrant/.bashrc;
    sudo aa-teardown;
    SHELL
  end

  # For monitored app
  config.vm.define "app" do |app|
    app.vm.box = "spox/ubuntu-arm"
  
    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false
    app.vm.network "public_network", ip: "192.168.0.22"
    # Disabling https cert check check
    app.vm.box_download_insecure=true
  
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    app.vm.network "forwarded_port", guest: 9100, host: 9100
    app.vm.network "forwarded_port", guest: 8086, host: 8086
  
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    #app.vm.network "forwarded_port", guest: 51325, host: 51325, host_ip: "127.0.0.1"
  
    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # app.vm.network "private_network", ip: "192.168.33.10"
  
    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # app.vm.network "public_network"
  
    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    app.vm.provider "vmware_desktop" do |vm|
      # Display the VirtualBox GUI when booting the machine
      vm.gui = false
   
      # Customize the amount of memory on the VM:
      vm.memory = "512"
    end
  
    app.vm.provision "file", source: "./README.md", destination: "README.md"
    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    app.vm.provision "shell", inline: <<-SHELL
      echo 'echo "Good luck"' >> /home/vagrant/.bashrc;
      sudo aa-teardown;
      SHELL
  end
end
