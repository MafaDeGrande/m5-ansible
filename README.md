# Task 3.3.2

## Going modular

Well as PoC was operational and fitted our case we'll implement all the things
there. So now we need to create roles for monitoring stack setup

### Stuff you should study while doing

- Ansible roles
- Prometheus
- Loki
- Grafana

### Task

Create role installing prometheus, grafana, loki on one host group so called like
`monitoring` and installing node_exporter, and telegraf to the host group
so called `monitored`. node_exporter should be monitored by prometheus
and telegraf should collect metrics to loki.

__notes:__

- As env use the VM provisioned via Vagrantfile attached to task
- Prometheus should be installed locally while grafana and loki in docker via docker-compose
- Things should be logically split up into roles
- Port binds for monitoring vm are
```ruby
mon.vm.network "forwarded_port", guest: 8082, host: 8082
mon.vm.network "forwarded_port", guest: 8083, host: 8083
mon.vm.network "forwarded_port", guest: 8084, host: 8084
```
- Port binds for app vm are
```ruby
app.vm.network "forwarded_port", guest: 8085, host: 8085
app.vm.network "forwarded_port", guest: 8086, host: 8086
```

#### Acceptance criteria

- MR is accepted by mentor
- Code is operational and executing correctly

#### Links

- [Ansible docs](https://docs.ansible.com/)
- [Prometheus docs](https://prometheus.io/docs/introduction/overview/)
- [Grafana docs](https://grafana.com/docs/)
- [Loki docs](https://grafana.com/docs/loki/latest/)
