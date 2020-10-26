IMAGE_NAME = "peru/ubuntu-20.04-server-amd64"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
        v.gui = false
    end

    config.vm.define "boundary-server" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "boundary-server"
        master.vm.provision "shell", inline: <<-SHELL
          sudo apt-get update
          sudo apt install unzip curl
          wget https://releases.hashicorp.com/boundary/0.1.1/boundary_0.1.1_linux_amd64.zip
          sudo unzip boundary_0.1.1_linux_amd64.zip -d /usr/local/bin/
          sudo chmod +x /usr/local/bin/boundary
          sudo apt install curl
          curl -fsSL https://get.docker.com -o get-docker.sh
          sh get-docker.sh
          sudo usermod -aG docker vagrant
          sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
          sudo chmod +x /usr/local/bin/docker-compose
        SHELL
    end

    config.vm.define "app-server" do |app|
        app.vm.box = IMAGE_NAME
        app.vm.network "private_network", ip: "192.168.50.11"
        app.vm.hostname = "app-server"
        app.vm.provision "shell", inline: <<-SHELL
          sudo echo "Provisioning app-server"
        SHELL
    end

    config.vm.define "db-server" do |db|
        db.vm.box = IMAGE_NAME
        db.vm.network "private_network", ip: "192.168.50.12"
        db.vm.hostname = "db-server"
        db.vm.provision "shell", inline: <<-SHELL
          sudo echo "Provisioning db-server"
        SHELL
    end
end

