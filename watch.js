const chokidar = require('chokidar');
const { execSync } = require('child_process');

chokidar.watch( './meta-repository/trac.wordpress.org/templates')
.on( 'add', ( path ) => {
    console.log( 'watching ' + path );
} )
.on( 'change', ( path ) => {
  console.log( 'change in ' + path );
  execSync( 'docker-compose exec trac service apache2 reload', { stdio: 'inherit' } );
} );