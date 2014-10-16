package TresSesentaNet;

use strict;
require Exporter;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

@ISA         = qw(Exporter);
@EXPORT      = qw($debug $dbhost $dbbase $dbuser $dbpass &printOID);
%EXPORT_TAGS = ( );

@EXPORT_OK   = qw();

use vars qw($debug $dbhost $dbbase $dbuser $dbpass &printOID);

$debug = 1;

$dbhost =  'localhost';
$dbbase =  'tecnica';
$dbuser =  'root';
$dbpass =  '';

sub printOID {
	my ($ses, $oid, $text) = (@_);
	my $aux = '';
	my $res = $ses->get_request(-varbindlist => [ $oid ],);
    
	if (!defined $res) {
		printf "ERROR: %s.\n", $ses->error();
	} else {
		$aux = $res->{$oid};
		print $text.$aux."\n";
	}
	return $aux;
}




END {}

1;

