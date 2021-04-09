<?php
use Twig\Environment as Twig;
use Twig\Loader\FilesystemLoader;

return [
    Twig::class => function () {
        $loader = new FilesystemLoader(__DIR__ . '/../resource/templates');
        return new Twig($loader, [
            'cache' => __DIR__ . '/../var/cache/twig',
        ]);
    },
];
