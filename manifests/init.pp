# == Class: hostname
#
# Set the hostname on a Mac
#
# === Parameters
#  [*hostname*] Hostname to use
#
# === Example
#
#   class { 'hostname':
#     hostname => 'potato'
#   }
#

class hostname (
  $hostname,
) {

  exec { 'set computername':
    command => "/usr/sbin/scutil --set ComputerName ${hostname}",
    unless  => "test `scutil --get ComputerName` == '${hostname}'"
  }

  exec { 'set hostname':
    command => "/usr/sbin/scutil --set HostName ${hostname}",
    unless  => "test `scutil --get HostName` == '${hostname}'"
  }

  exec { 'set localhostname':
    command => "/usr/sbin/scutil --set LocalHostName ${hostname}",
    unless  => "test `scutil --get LocalHostName` == '${hostname}'"
  }

}
