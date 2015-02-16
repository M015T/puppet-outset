define outset::login_once(
    $script,
    $priority = '10',
    $ensure = 'present'
){
    require outset::setup

    if $ensure != 'present' and $ensure !='absent'{
        fail('Invalid value for ensure')
    }

    if $title !=~ ^.*\.(|PY|py|sh|SH|rb|RB)$ {
        fail('Invalid value for title. Must end in .py, .sh or .rb')
    }
    
    if $ensure == 'present'{
        file {"/usr/local/outset/login-once/${priority}-${title}":
            source => $script,
            owner  => 0,
            group  => 0,
            mode   => '0755',
        }
    }

    if $ensure == 'absent' {
        file {"/usr/local/outset/login-once/${priority}-${title}":
            ensure => absent,
        }
    }
}