class trocla::config (
  $adapter = undef,
  $adapter_options = [ 'default' => '' ],
) {
  require trocla::master

# deploy default config file and link it for trocla cli lookup
  file{
    #should be
    "${settings::confdir}/troclarc.yaml":
      ensure  => present,
      content => template('trocla/troclarc.yaml.erb'),
      owner   => root,
      group   => puppet,
      mode    => 0640;
    '/etc/troclarc.yaml':
      ensure => link,
      target => "${settings::confdir}/troclarc.yaml";
  }
}
