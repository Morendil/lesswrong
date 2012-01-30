Vagrant::Config.run do |config|

  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.forward_port( 8080, 8080)
  config.vm.network(:hostonly,"33.33.00.10")

  config.vm.provision :chef_solo do |chef|
    chef.recipe_url = "http://cloud.github.com/downloads/d0ugal/chef_recipes/cookbooks.tar.gz"
    chef.cookbooks_path = [:vm, "cookbooks"]

    chef.add_recipe "main"
    chef.add_recipe "python"
    chef.add_recipe "postgres"

    chef.json.merge!({

      :project_name => "reddit",

      :system_packages => ["python-dev","python-setuptools","memcached","libpq-dev","python-geoip"],
      :python_global_packages => [],
      :python_packages => [],

    })

  end

  config.vm.provision :shell do |shell|
    shell.inline = "cd /vagrant; sql/bootstrap_development_db.sh"
  end

  config.vm.provision :shell do |shell|
    shell.inline = "cd /vagrant/r2; sudo python setup.py develop"
  end

end
