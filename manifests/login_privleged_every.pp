define outset::login_privleged_every(
    $script,
    $priority = '10',
    $ensure = 'present',
    $type = 'file'
){
    require outset::setup

    if $ensure != 'present' and $ensure !='absent'{
        fail('Invalid value for ensure')
    }

    if $title !~ /^.*\.(|PY|py|sh|SH|rb|RB)$/ {
        fail('Invalid value for title. Must end in .py, .sh or .rb')
    }

    if $ensure == 'present'{
        if $type == 'file'{
            file {"/usr/local/outset/login-privleged-every/${priority}-${title}":
                source => $script,
                owner  => 0,
                group  => 0,
                mode   => '0755',
            }
        }

        if $type == 'template'{
            file {"/usr/local/outset/login-privleged-every/${priority}-${title}":
                content => $script,
                owner  => 0,
                group  => 0,
                mode   => '0755',
            }
        }
    }

    if $ensure == 'absent' {
        file {"/usr/local/outset/login-privleged-every/${priority}-${title}":
            ensure => absent,
        }
    }
}
