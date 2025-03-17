<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'usuario' );

/** Database password */
define( 'DB_PASSWORD', '2121' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rk(_*sUI)k(Q3$$lr e]lu6A+vtDi5!-h,jA%t|B~x|ycZA|^84.EZdBX931vhxS');
define('SECURE_AUTH_KEY',  ';v:lY!MreJ*5i=<ai5Exv0y^u-#6WwJ|-+a>94PvZn1-Q*^xIJYp1O+-lp&(LPXn');
define('LOGGED_IN_KEY',    'g8;KzH`v-W<)0P9kmD%lU_ongL1Yk^tr!o3~SMU;]9_*6C*7);87-w&j e|v[)I?');
define('NONCE_KEY',        'hn|HU8h-!+;*. X}@Y*p(+O>N6U|nEW8H:Qf&Sl&8R&>CIo5:{YE-90N@<m)p4ZT');
define('AUTH_SALT',        'u*gkG09lSbWAb+*)&D|rj*pVjQC1T|H>x{DK|F!zu&=p>;p6|OY?y;4+Yo|rB?Ey');
define('SECURE_AUTH_SALT', '!]?VTU?+^EU%mahc+5+e-y.LPc`ph#^:F7{SJAE}0(icFqxkiKtD^:c1=$d0Z&8y');
define('LOGGED_IN_SALT',   'I+U2CQk:{/c1@=#0DUDME:Db]=e*+51a#rhGc`&.S&:S{esv-}F<oY?GiL]4:1Ji');
define('NONCE_SALT',       'rvQY9w2-[t ^7b]:V6|mj]d+1dE%l1BHmqwt9Zrt}uf?g*,TK3~CQ`cFbP)|(+/X');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>