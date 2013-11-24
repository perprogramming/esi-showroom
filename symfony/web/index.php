<?php

require_once(__DIR__ . '/../vendor/autoload.php');

$response = '<html><head></head><body>symfony ' . time() . '<esi:include src="http://legacy.esi-showroom.local:8080/" /></body></html>';

$response = new \Symfony\Component\HttpFoundation\Response($response);
$response->headers->set('Surrogate-Control', 'ESI/1.0');
$response->setTtl(10);

$response->send();