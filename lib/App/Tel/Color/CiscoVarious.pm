package App::Tel::Color::CiscoVarious;
use parent 'App::Tel::Color::Base';
use Term::ANSIColor;
use strict;
use warnings;

=head2 colorize

    my $output = $self->colorize($input);

colors a line of input

=cut

sub colorize {
    my ($self, $text) = @_;
    
    ######### Interfaces
    #### Speed or duplex status
   	# Duplex a-half, half or full.
    $text =~ s/(\sa-half)/colored("$1", 'yellow')/eg;
   	$text =~ s/(\shalf)/colored("$1", 'red')/eg;
    $text =~ s/(\sfull)/colored("$1", 'red')/eg;
    
    # Speed not auto
    $text =~ s/(\s1(0)+\s)/colored("$1", 'red')/eg;
    
    # Speed is only 10mpbs?
    $text =~ s/(\s(a-)10\s)/colored("$1", 'yellow')/eg;
    
    # Connected/disconnected status
    $text =~ s/(\sconnected\s)/colored("$1", 'green')/eg;
    $text =~ s/(\snotconnect\s)/colored("$1", 'yellow')/eg;
    $text =~ s/(\sdisabled\s)/colored("$1", 'blue')/eg;
    
    # Up down status
    $text =~ s/(\sadmin(istratively)? down\s+down\s)/colored("$1", 'blue')/eg;
    $text =~ s/(\s(?!admin(istratively)?) down\s+down\s)/colored("$1", 'yellow')/eg; # dont match admin
    $text =~ s/(\sup\s+up\s)/colored("$1", 'green')/eg;
    $text =~ s/(\sdeleted\s+down\s)/colored("$1", 'blue')/eg;
    
    
    # IP-addresses
    $text =~ s/(\sunassigned\s)/colored("$1", 'blue')/eg;
    
    
    ######### Running configuration stuffs
    $text =~ s/(\sspanning-tree bpdufilter enable)/colored("$1", 'red')/eg;
   	$text =~ s/(\schannel-group \d+ mode on)/colored("$1", 'red')/eg;
    
    # SNMP Community public
    $text =~ s/(.*public.*)/colored("$1", 'red')/eg;
    
    $text =~ s/(.*no service password-encryption.*)/colored("$1", 'red')/eg;
    $text =~ s/(.*enable password.*)/colored("$1", 'red')/eg;
    $text =~ s/(.*password 0 .*)/colored("$1", 'red')/eg;
    
    $text =~ s/(.*spanning-tree mode pvst.*)/colored("$1", 'red')/eg;
    $text =~ s/(.*spanning-tree priority 0.*)/colored("$1", 'red')/eg;
    
    $text =~ s/(.*transport input.+(all|telnet)*)/colored("$1", 'red')/eg;
    
    return $text;
}

1;
