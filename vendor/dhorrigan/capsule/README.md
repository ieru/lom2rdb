# Laravel 4 Package Wrapper

A simple wrapper package for the Laravel packages.  This is only to be used outside of a Laravel application.

**This has been merged with the [Illuminate\Database](https://github.com/illuminate/database), so this package is going into deprecation mode!**

## Database Usage

### Connecting

Before you can make any `Capsule\DB` calls or use any Eloquent Models, you must first make a connection using the `Capsule\Database\Connection::make` method.

    Capsule\Database\Connection::make('main', array(
        'driver'    => 'mysql',
        'host'      => 'localhost',
        'database'  => '',
        'username'  => '',
        'password'  => '',
        'collation' => 'utf8_general_ci',
        'prefix'    => '',
        'charset'    => 'utf8'
    ), true);

The `make` method has the following prototype:

    public static function make($name, array $config, $default = false)

### Using the Query Builder

You can use the Query Builder just as you would using the `Db` Facade in Laravel 4:

    Capsule\DB::table('foo')->select('*')->get()

**Note: You can `use Capsule\DB;` in your PHP files so you can simply use `DB::table('foo')->select('*')->get()` without the namespace.**

### Eloquent Models

You can extend the `Illuminate\Database\Eloquent\Model` class and use the Models as you normally would.  When `Capsule\Database\Connection::make` is called it also sets up Eloquent for you.

### Schema Builder

Capsule provides a nice `Capsule\Schema` class, which acts exactly like the `Schema` Facade in Laraval.