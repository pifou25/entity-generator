<?php

// get args from command line
$longopts = [
    'hostname:',
    'database:',
    'username:',
    'password:'
];

$params = getopt('h:d:u:p:', $longopts);
// var_dump($params);
if($params === false){
    die('Missing or bad command line parameters.');
}

include('vendor/autoload.php');

$config = new \DodoIt\EntityGenerator\Generator\Config([
    'path' =>  __DIR__ . '/entities',
    'extends' => \Examples\Pdo\Entities\Entity::class,
    'namespace' => 'Examples\Pdo\Entities'
]);

echo "connect to {$params['hostname']} {$params['database']} ...\n";
$pdo = new \PDO("mysql:dbname={$params['database']};host={$params['hostname']}", $params['username'], $params['password']);

echo "ok! Generating entities...\n";
$generatorFactory = new \DodoIt\EntityGenerator\Factory\GeneratorPdoFactory($pdo);
$generator = $generatorFactory->create($config);
$generator->generate();
echo "job done ! nb entities generated : " . count(glob('entities/*'));
