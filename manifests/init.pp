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
    command => "/usr/sbin/scutil --set ComputerName $::fact['system_profiler']['serial_number']",
    unless  => "test `scutil --get ComputerName` == $::fact['system_profiler']['serial_number']"
  }

  exec { 'set hostname':
    command => "/usr/sbin/scutil --set HostName $::fact['system_profiler']['serial_number']",
    unless  => "test `scutil --get HostName` == $::fact['system_profiler']['serial_number']"
  }

  exec { 'set localhostname':
    command => "/usr/sbin/scutil --set LocalHostName $::fact['system_profiler']['serial_number']",
    unless  => "test `scutil --get LocalHostName` == $::fact['system_profiler']['serial_number']"
  }

}
