<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'pietro' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pacciani' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'j!v*+C3P`-xv4H4oS1LJ+7I=cZZ]uT},;O9v{FsMM+WR3I(2V|.Tv.u,1Rod~_%V');
define('SECURE_AUTH_KEY',  'Nn>M^TPsO!ZZ%8?KE!&-pt7DD6>ALYZ=bvNT,]pn/c2So|yD.!X+:=5n<zoZ++KD');
define('LOGGED_IN_KEY',    'RLfbqJE0jk365+s$qbO?s^SZ2IxK0V3; t*.&3g#p=^.-W~1u3:ITiT`I?8%ju+c');
define('NONCE_KEY',        'T6^<TV.hc}>$&zfe-*rsHd1PUinv(I`vrTV_ZvE0q>3U:;y.+]CZe2+nv:*Q<;Nr');
define('AUTH_SALT',        '.r<d|sU^jbI.0LZW`zBSlpPRYXz#hF,-#+ec:d{`[-ex+^wR|hB+n3ZKm2Mh>gG8');
define('SECURE_AUTH_SALT', 'vjshv0K5$2D25+D:d^|xRr?jd]PD7~0vKgSSQ7,18n+>MkQQ+Y3IN#6D=+:|=&Xt');
define('LOGGED_IN_SALT',   '1zo)L,+$U^@<k+xaE01g-l=sdi&.>Wgc.w8~Iy7l#:30Ysy+,|K9BOO=x-[4O.!@');
define('NONCE_SALT',       'Q7;vlY+4ZUX*/:OVVC%);Z:YK+5LDS99%iD6ZdhaI0(3TpnX,CV|n}nnSs+cAl/n');

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );     


define('WP_CACHE', true);

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>