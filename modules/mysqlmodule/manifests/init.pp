class mysqlmodule {

file_line { 'Edit my.cnf':
   path => '/etc/my.cnf',
   line => 'bind-address=0.0.0.0',
   after => 'symbolic-links=0'
   }

  class { '::mysql::server':
        root_password           => 'secret',
        remove_default_accounts => true
    }

    mysql::db { 'mydb':
        user     => 'chrystel',
        password => 'secret',
        host     => 'localhost',
        grant    => ['SELECT', 'UPDATE'],
        }

        include 'mysql::client'
        include 'mysql::bindings'
}
