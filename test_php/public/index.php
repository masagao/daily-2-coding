<?php
use DI\Bridge\Slim\Bridge;
use Psr\Http\Message\ResponseInterface as Response;

require __DIR__ . '/../vendor/autoload.php';

$app = Bridge::create();
$app->get('/', function (Response $response) {
    $response = $response->withHeader('Content-Type', 'text/html');
    $response->getBody()->write("Hello World");
    return $response;
});
$app->run();
